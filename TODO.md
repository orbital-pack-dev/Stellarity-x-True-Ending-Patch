# Patch Roadmap & Notes

This document keeps track of the unified Stellarity x True Ending compatibility and overhaul patch (packaged as `Stellarity_Cosmetic_Patch`), completed fixes, and testing milestones.

## What's Done and Working

### Boss Fight & Core Mechanics

- **Unified Patch Release**: Consolidated compatibility and mechanics into a single maintained build (`Stellarity_Cosmetic_Patch.zip` and `.jar` supporting Datapacks, Fabric, Quilt, NeoForge, Forge, Paper, and Purpur on 1.21+).
- **Shielded End Crystals & Guardian Phantoms**:
  - Bound tower phantoms strictly to their revived crystals via unique `ste_cos.id`.
  - In Phase 1, each of the 10 crystals on towers gets 1 decorative phantom circling it; the crystals retain an ominous dark-purple glowing aura (`ste_cos.purple_glow`) while remaining completely normal and destructible (`Invulnerable:0b`).
  - Revived crystals in Phase 3 (`revive_crystals`) receive exactly 1 guardian phantom without duplications (strict `return 0` guards and picked marker tagging).
  - Killing a guardian phantom immediately clears `{Invulnerable:0b, Glowing:0b}` from the tower crystal with break sounds and particles; once killed, phantoms never respawn.
  - Crystal laser attack projectile overhauled: collision detection expanded to 3.8 blocks, safe obstacle clearance outside tower cages, dealing 8 magic damage.
  - Added safety guard in `crystal/loop.mcfunction` preventing unbreakable crystals if a phantom despawns or is killed from distance.
- **Totem of Undying & Final Breath Phase Separation**:
  - Resolved dragon offhand slot limitation (`ender_dragon` only supports `weapon.mainhand`).
  - Totem cutscene plays cleanly upon first fatal hit (restoring 36 HP, shaking screen, and performing ascending flight).
  - System totem feather with `death_protection` is equipped into `weapon.mainhand` at the climax of the totem ascent (tick 3090).
  - Final Breath is strictly locked until the death feather is actually consumed on lethal damage (`totem_feather_consumed`); premature 8 HP trigger removed so the dragon never drops artificially to 1 HP while the feather is intact.
- **Final Breath Ascent & Hover Arena**:
  - Replaced drifting relative teleportation with a deterministic 30-tick vertical ascent from portal level (Y=67) up to Y=79 (`~ ~12 ~`).
  - Dragon head orientation fixed (`~180 ~` model offset): dragon points its head and mouth directly at players in Survival/Adventure mode throughout the 7-second Abyss Shriek charge.
  - Overhauled Final Breath laser blast: fires a concentrated destructive beam directly along line-of-sight at the targeted player with multi-ring sonic booms, flash rays, and 16 magic damage, exploding at the target position instead of shooting straight down into the portal floor.
  - Dragon hovers at Y=79 with 1 HP for the final blow; levitation pad (`trueEnding_pad`) on the portal allows players in Survival to leap up and deliver the finishing hit.
- **Clone Carousel & Decoy Dragons**:
  - Corrected head orientation in orbit (`~90 0`) and exit flight (`~ ~ ~ ~180 ~`), ensuring clones and dragon fly forward head-first rather than tail-first.
  - Locked dragon head orientation strictly tangent to the circular orbit via center facing, eliminating uncontrollable spinning on 2nd and subsequent rounds.
  - Synchronized clone exit carriers and dragons so both clones fly away at the exact same forward velocity (`1.8` blocks/tick) into the void.
  - Homing feedback marker dynamically tracks the player's eyes and only deletes upon impact.
- **Residual Invulnerability & Complete State Reset**:
  - Disabled legacy True Ending 600-tick invulnerability loop (`a_main_final.mcfunction`).
  - Ensured `{Invulnerable: 0b}` is applied whenever End Crystals are down (`#ste_cos_crystals == 0`) and the dragon is not mid-cutscene.
  - 100% complete state and scoreboard reset on repeat battles (totem feather, final breath, clone carousel, flags, timers, and temporary markers/entities).
  - Fixed dragon egg tracker duplicate marker issue from version 1.0.0 via dedicated cleanup routine `ste_cos:fix/egg_marker_fix` and strict single-instance spawning.

### Respawn Ritual & Visuals

- **Respawn Animation Crystals & Beams**:
  - Re-aligned all crystal beam functions to height Y=98 to match Stellarity's taller tower structures.
  - Fixed tower cage auto-repair and respawn height alignment.
- **Cinematic Heart & Tornado Ritual**:
  - Dynamic dragon heart pulsing in the sky, absorbing tether rays from all 10 towers.
  - Swirling multi-layered particle tornado connecting the portal to the sky.
  - End Crystals gain vibrant purple glow aura and flash bursts during the entire revival sequence.
- **Earthquake & Island Shudder**:
  - Stellarity camera screenshake explicitly triggered for all players within 250 blocks during the ritual.
  - Island-wide seismic vibration ($\pm 0.08$ rapid horizontal jitter + end dust) shakes all island mobs and items (Endermen, Shulkers, Animals, dropped items) during progress 100..619.
- **Nuclear Blast Vortex Shockwave**:
  - At tick 590, a fast nuclear-style expanding vortex (24 markers with 5.0 blocks/tick speed and spiral rotation) sweeps across the entire island up to 220 blocks.
  - Deals 1 HP magic damage (`damage @s 1.0 magic`) to living entities in its path without killing them, creating an intense visual shockwave.
  - Vortex markers automatically vanish as soon as the dragon is summoned.

### Technical & Compatibility

- Clean pack metadata supporting 1.21 up to 1.21.9+ overlays without log warnings.
- Fixed Minecraft 1.21 syntax deprecations (`fall_distance`, particle formats, team commands).
- Full chunk cleanup and non-destructive chorus fruit removal around the main exit portal on Paper/Purpur.
- Verified 100% valid UTF-8 encoding with zero BOM bytes across all files.


### Paper Server Optimization & Exploit Fixes (1.1.0-hotfix)

- **TPS Optimization & Selector Refactor**:
  - `tether_ray_step.mcfunction`: Completely eliminated recursive `@e[type=marker,tag=ste_cos.respawn_heart]` world entity queries (which caused 14,000+ searches and consumed 60% of server ticks in profiler dumps `perf-1`/`perf-2`). Replaced with a lightweight in-memory scoreboard step counter (`#ray_step <= 15`) and `tether_ray_start.mcfunction`.
  - `earthquake_tick.mcfunction`: Removed island-wide mob jitter teleports (`tp @s ~0.08 ~ ~`) and screenshake function calls that overloaded Paper tick loop and packet handling. Replaced with ambient ground sounds and player-local dust particles.
  - `tornado_tick.mcfunction`: Constrained marker selectors with `type=marker,limit=1` to allow Paper's entity index to avoid full chunk scans.
- **Paper Screenshake Lag & Space Launch Fix**:
  - Overrode `stellarity:entity/dragon/spawn/screenshake/teleport` to prevent vertical relative teleportation.
  - Completely resolved client FPS dropping to 1, packet queue desync, and players getting launched into deep space during boss animations on Paper/Purpur servers.
- **Respawn Animation Skip Exploit Fixed**:
  - Overrode `stellarity:entity/dragon/spawn/conditions` to detect crystals placed across all valid bedrock frames around the exit portal (`distance=..8`), tagging them as `stellarity.respawn_crystal` and ensuring `stellarity.respawn_dragon` is triggered.
  - Added fail-safe detecting crystals with active beam targets: if vanilla Minecraft starts the respawn sequence, the visual ritual and custom animation automatically engage.
  - Removed old crystal summoning lines from `fix_tick.mcfunction`.
- **Dragon One-Shot Protection & Fight Stage Tracking**:
  - Added dedicated boss fight stage objective `ste_cos.stage` tracking all phases (1: Initial crystals, 2: Mid-battle, 3: Revived shielded crystals, 4: Post-crystals vulnerability, 5: Totem cutscene, 6: Final Breath, 7: Final Stand).
  - Configured totem trigger to require `#fight_stage ste_cos.stage matches 4..`, guaranteeing that the protected crystals phase is 100% complete before the totem can ever activate.
  - Adjusted lethal health threshold from 45 HP to `<= 4` HP (`matches ..4`) with Resistance II low-health buffer (`<= 20` HP) and base armor/toughness protection.
  - Enhanced `trigger_totem.mcfunction` with forced item clearance across all hand slots (`weapon.mainhand`, `weapon.offhand`, `HandItems`) on `@s` and all dragons, preventing any chance of phase duplication.

## Testing & Quality Assurance Plan

- [ ] **Survival Entry**: Verify initial End entry, portal generation, and chorus fruit clearing.
- [ ] **Phase 1-2 Combat**: Test tower climbing, phantom guardian battles, shield breaking, and crystal destruction.
- [ ] **Totem Phase**: Drop dragon HP to trigger Totem; verify clean portal ascent and sound/visual playback without premature Final Breath.
- [ ] **Final Breath Climax**: Verify smooth ascent to Y=79, 7-second charge, laser blast, portal pad levitation, and 1-hit kill.
- [ ] **Dragon Respawn**: Place 4 End Crystals on portal; observe beam alignment (Y=98), heart animation, screenshake, earthquake entity shudder, and tick 590 shockwave damage.

## Helpful Scripts

- Rebuild mod archives and datapack zip:
  `python build.py`
- Verify differences between builds:
  `python compare_datapacks.py old_pack.zip new_pack.zip --diff`
