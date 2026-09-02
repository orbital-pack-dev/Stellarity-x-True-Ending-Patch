#!/usr/bin/env python3
"""
sync_patches.py

Synchronizes shared ste_cos functions between Stellarity_Compatibility_Patch
and Stellarity_Mechanics_Patch.

Rules:
  - Mechanics is the SOURCE OF TRUTH for mechanics/ and vfx/ folders.
  - Compatibility does NOT have mechanics/ or vfx/ (they are Mechanics-exclusive).
  - All other shared files (egg/, phantom/, dragon/, portal/, crystal/, load, main_tick)
    use Compatibility as source of truth and get copied INTO Mechanics.
  - Files only in Mechanics (dragon/crystal_heal_check, dragon/trigger_totem, etc.)
    are Mechanics-exclusive and never touched by this script.

Usage:
    python sync_patches.py           # dry-run, shows what would change
    python sync_patches.py --apply   # actually sync files
    python sync_patches.py --apply --direction mech-to-compat  # sync mech-exclusive to compat (rarely needed)
"""

import argparse
import os
import shutil
import sys
from pathlib import Path

COMPAT = Path("Stellarity_Compatibility_Patch/data/ste_cos/function")
MECH   = Path("Stellarity_Mechanics_Patch/data/ste_cos/function")

# Folders that are MECHANICS-EXCLUSIVE — never copy to Compat
MECH_ONLY_DIRS = {"mechanics", "vfx"}

# Files that are MECHANICS-EXCLUSIVE — never copy to Compat  
MECH_ONLY_FILES = {
    "dragon/crystal_heal_check.mcfunction",
    "dragon/trigger_totem.mcfunction",
}


def get_files(base: Path) -> dict[str, str]:
    result = {}
    for path in base.rglob("*.mcfunction"):
        rel = str(path.relative_to(base)).replace("\\", "/")
        content = path.read_text(encoding="utf-8", errors="replace")
        content = content.replace("\r\n", "\n")
        result[rel] = content
    return result


def is_mech_exclusive(rel: str) -> bool:
    parts = rel.split("/")
    if parts[0] in MECH_ONLY_DIRS:
        return True
    if rel in MECH_ONLY_FILES:
        return True
    return False


def sync_compat_to_mech(compat_files: dict, mech_files: dict, apply: bool) -> list[str]:
    """Copy shared Compat files into Mechanics (Compat is source of truth for these)."""
    actions = []
    for rel, content in compat_files.items():
        if is_mech_exclusive(rel):
            continue  # Compat should never have mech-only files, but guard anyway
        mech_content = mech_files.get(rel)
        if mech_content is None:
            actions.append(("ADD", rel, "not in Mechanics"))
            if apply:
                dst = MECH / rel.replace("/", os.sep)
                dst.parent.mkdir(parents=True, exist_ok=True)
                dst.write_text(content, encoding="utf-8")
        elif mech_content != content:
            actions.append(("UPDATE", rel, "Compat is newer"))
            if apply:
                dst = MECH / rel.replace("/", os.sep)
                dst.write_text(content, encoding="utf-8")
        else:
            actions.append(("OK", rel, "identical"))
    return actions


def check_mech_exclusive_in_compat(compat_files: dict) -> list[str]:
    """Warn if Mechanics-exclusive files accidentally ended up in Compat."""
    warnings = []
    for rel in compat_files:
        if is_mech_exclusive(rel):
            warnings.append(("WARN", rel, "mech-exclusive file found in Compat!"))
    return warnings


def main():
    parser = argparse.ArgumentParser(description="Sync shared files between Compat and Mechanics patches.")
    parser.add_argument("--apply", action="store_true", help="Actually write files (default: dry-run only)")
    parser.add_argument("--show-ok", action="store_true", help="Also show identical files")
    args = parser.parse_args()

    mode = "APPLY" if args.apply else "DRY-RUN"
    print(f"[{mode}] Syncing shared ste_cos functions: Compat -> Mechanics")
    print(f"  Compat: {COMPAT}")
    print(f"  Mech:   {MECH}")
    print()

    compat_files = get_files(COMPAT)
    mech_files   = get_files(MECH)

    print(f"  Compat files: {len(compat_files)}")
    print(f"  Mech files:   {len(mech_files)}")
    print()

    # Warn about mech-exclusive files in Compat
    warnings = check_mech_exclusive_in_compat(compat_files)
    if warnings:
        print("WARNINGS:")
        for action, rel, reason in warnings:
            print(f"  [{action}] {rel} — {reason}")
        print()

    # Sync Compat -> Mech
    actions = sync_compat_to_mech(compat_files, mech_files, args.apply)

    counts = {"ADD": 0, "UPDATE": 0, "OK": 0}
    for action, rel, reason in actions:
        counts[action] = counts.get(action, 0) + 1
        if action == "OK" and not args.show_ok:
            continue
        symbol = {"ADD": "+", "UPDATE": "~", "OK": "="}.get(action, "?")
        print(f"  [{symbol}] {rel}  ({reason})")

    print()
    print(f"Summary: {counts['ADD']} added, {counts['UPDATE']} updated, {counts['OK']} identical")

    # Show what is Mechanics-exclusive (for info)
    mech_only = [r for r in mech_files if is_mech_exclusive(r) and r not in compat_files]
    if mech_only:
        print()
        print(f"Mechanics-exclusive files (not synced to Compat): {len(mech_only)}")
        for r in sorted(mech_only):
            print(f"  [M] {r}")

    if not args.apply and (counts["ADD"] + counts["UPDATE"]) > 0:
        print()
        print("Run with --apply to actually sync.")

    sys.exit(0)


if __name__ == "__main__":
    main()
