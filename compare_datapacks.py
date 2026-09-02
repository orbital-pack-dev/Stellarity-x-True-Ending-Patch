#!/usr/bin/env python3
"""
compare_datapacks.py

Compares two datapacks (zip archives or directories) and shows what changed.
Supports filtering by namespace and file extension.

Usage:
    python compare_datapacks.py <old> <new> [options]

Examples:
    python compare_datapacks.py Stellarity-5.9.0.zip Stellarity-6.0.0-beta.zip
    python compare_datapacks.py old_patch/ new_patch/ --namespace ste_cos
    python compare_datapacks.py old.zip new.zip --ext mcfunction --diff
    python compare_datapacks.py old.zip new.zip --namespace stellarity --diff --context 3
"""

import argparse
import difflib
import os
import sys
import zipfile
from pathlib import Path


def load_from_zip(zip_path, ext_filter):
    files = {}
    with zipfile.ZipFile(zip_path, "r") as zf:
        for name in zf.namelist():
            if name.endswith("/"):
                continue
            if ext_filter and not any(name.endswith("." + e) for e in ext_filter):
                continue
            parts = name.split("/", 1)
            rel = parts[1] if len(parts) > 1 else parts[0]
            try:
                content = zf.read(name).decode("utf-8", errors="replace")
                content = content.replace("\r\n", "\n")
                files[rel] = content
            except Exception as e:
                print("  [warn] could not read {}: {}".format(name, e), file=sys.stderr)
    return files


def load_from_dir(dir_path, ext_filter):
    files = {}
    base = Path(dir_path)
    for path in base.rglob("*"):
        if not path.is_file():
            continue
        if ext_filter and path.suffix.lstrip(".") not in ext_filter:
            continue
        rel = str(path.relative_to(base)).replace("\\", "/")
        try:
            content = path.read_text(encoding="utf-8", errors="replace")
            content = content.replace("\r\n", "\n")
            files[rel] = content
        except Exception as e:
            print("  [warn] could not read {}: {}".format(path, e), file=sys.stderr)
    return files


def load_pack(path, ext_filter):
    if os.path.isdir(path):
        return load_from_dir(path, ext_filter)
    elif path.endswith(".zip"):
        return load_from_zip(path, ext_filter)
    else:
        print("Error: {} is not a directory or .zip file".format(path), file=sys.stderr)
        sys.exit(1)


def filter_by_namespace(files, namespace):
    if not namespace:
        return files
    prefix = "data/" + namespace + "/"
    return {k: v for k, v in files.items() if k.startswith(prefix)}


def compare(old, new, show_diff, context):
    old_keys = set(old.keys())
    new_keys = set(new.keys())
    added   = sorted(new_keys - old_keys)
    deleted = sorted(old_keys - new_keys)
    common  = old_keys & new_keys
    changed = sorted(k for k in common if old[k] != new[k])
    identical = len(common) - len(changed)

    print()
    print("=" * 60)
    print("  Added:     {}".format(len(added)))
    print("  Deleted:   {}".format(len(deleted)))
    print("  Changed:   {}".format(len(changed)))
    print("  Identical: {}".format(identical))
    print("=" * 60)
    print()

    if added:
        print("[ ADDED ]")
        for f in added:
            print("  + {}  ({} lines)".format(f, new[f].count("\n") + 1))
        print()

    if deleted:
        print("[ DELETED ]")
        for f in deleted:
            print("  - {}  ({} lines)".format(f, old[f].count("\n") + 1))
        print()

    if changed:
        print("[ CHANGED ]")
        for f in changed:
            old_lines = old[f].splitlines(keepends=True)
            new_lines = new[f].splitlines(keepends=True)
            diff_lines = list(difflib.unified_diff(
                old_lines, new_lines,
                fromfile="old/" + f,
                tofile="new/" + f,
                n=context
            ))
            cnt = sum(1 for line in diff_lines
                      if line.startswith(("+", "-")) and not line.startswith(("+++", "---")))
            print("  ~ {}  ({} changed lines)".format(f, cnt))
            if show_diff:
                print()
                for line in diff_lines:
                    if line.startswith("+") and not line.startswith("+++"):
                        print("\033[32m" + line + "\033[0m", end="")
                    elif line.startswith("-") and not line.startswith("---"):
                        print("\033[31m" + line + "\033[0m", end="")
                    elif line.startswith("@@"):
                        print("\033[36m" + line + "\033[0m", end="")
                    else:
                        print(line, end="")
                print()
        print()

    return len(added), len(deleted), len(changed)


def main():
    parser = argparse.ArgumentParser(
        description="Compare two datapacks and show code changes.",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    parser.add_argument("old", help="Old version: path to .zip or directory")
    parser.add_argument("new", help="New version: path to .zip or directory")
    parser.add_argument("--namespace", "-n", default=None,
                        help="Filter by namespace (e.g. stellarity, ste_cos, true_ending)")
    parser.add_argument("--ext", "-e", nargs="+", default=["mcfunction", "json"],
                        help="File extensions to compare (default: mcfunction json)")
    parser.add_argument("--diff", "-d", action="store_true",
                        help="Show full unified diff for changed files")
    parser.add_argument("--context", "-c", type=int, default=2,
                        help="Lines of context in diff (default: 2)")
    parser.add_argument("--output", "-o", default=None,
                        help="Save output to file")
    args = parser.parse_args()

    print("Old: " + args.old)
    old_files = load_pack(args.old, args.ext)
    print("  Files: {}".format(len(old_files)))

    print("New: " + args.new)
    new_files = load_pack(args.new, args.ext)
    print("  Files: {}".format(len(new_files)))

    if args.namespace:
        print("Namespace filter: " + args.namespace)
        old_files = filter_by_namespace(old_files, args.namespace)
        new_files = filter_by_namespace(new_files, args.namespace)
        print("  After filter: {} / {}".format(len(old_files), len(new_files)))

    if args.output:
        import io
        buf = io.StringIO()
        old_stdout = sys.stdout
        sys.stdout = buf

    added, deleted, changed = compare(old_files, new_files, args.diff, args.context)

    if args.output:
        result = buf.getvalue()
        sys.stdout = old_stdout
        print(result)
        Path(args.output).write_text(result, encoding="utf-8")
        print("Saved to: " + args.output)

    sys.exit(0 if (added + deleted + changed) == 0 else 1)


if __name__ == "__main__":
    main()
