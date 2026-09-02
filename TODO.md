# Patch Roadmap & Notes

This document keeps track of where we are with the Stellarity x True Ending compatibility and mechanics patches, what has already been fixed, and what we want to tackle next.

## What's Done and Working

- Fixed the chorus fruit cleanup around the main exit portal so it runs smoothly just once when a player enters the End, without spamming destructive fills or tearing down the bedrock structure.
- Replaced the huge 14,000-line dragon egg search with a clean 19-page dispatcher that checks blocks in small 800-block slices with cooldowns, saving server tick time.
- Brought pack metadata up to date with modern 1.21 standards (pack format 118, overlay support for 1.21.9+, and clean MCMeta files).
- Slimmed down forceloaded chunks from a massive 196-chunk square to 11 targeted points covering the 10 obsidian towers and the central fountain.
- Upgraded entity tags and NBT keys to 1.21 snake_case rules, such as switching FallDistance to fall_distance and using custom_particle components.
- Integrated True Ending's native guarding phantoms directly into the Compatibility patch. Markers now target Stellarity's exact 10 pillar coordinates at height 115, and cage height checks accommodate Stellarity's taller 4-block iron cages so phantoms orbit caged towers and dive-bomb the bars when hit.
- Overhauled the dragon vortex visual effects in the Mechanics patch. Instead of a rigid, rectangular wireframe cylinder, it now swirls as a dynamic, cone-shaped tornado with dragon breath, witch sparkles, portal suction streaks, and ascending spiral end rods.
- Restored missing vortex frame triggers in vortex_tick so the full 4-second animation plays as intended.
- Audited all files against Stellarity 6.0.0-beta and True Ending 1.1.4d. We restored full animation sequences (all 11 crystal beams and screenshake) while preserving custom pillar heights, and removed 100% identical files to prevent accidental upstream overrides.
- Wrote sync_patches.py to effortlessly synchronize shared ste_cos logic between Compatibility and Mechanics while respecting Mechanics-exclusive features.

## What We're Working On Next

- Dragon Wings custom item ID: waiting on the Stellarity team for the custom item component ID so we can properly stop vortex flight on custom wings rather than standard elytra alone.
- Settings system (ste_settings): building an in-game configuration menu alongside safe island regeneration when a new fight begins.
- Checking portal cooldown mechanics: verifying whether PortalCooldown still functions reliably on item displays and armor stands in Minecraft 1.21.x.
- Looking into damage cooldowns on phantom attacks and evaluating macro support for cleaner orbital math.

## Future Ideas

- Gather feedback and bug reports from Modrinth users playing both mods together.
- Add a lightweight GitHub Actions workflow to verify that Compatibility and Mechanics packs remain in sync on every push.

## Helpful Scripts

- Check differences between two patch versions or archives:
  python compare_datapacks.py old_pack.zip new_pack.zip --diff

- Synchronize shared code from Compatibility to Mechanics:
  python sync_patches.py --apply
