# Patch Roadmap & Notes

This document keeps track of the unified Stellarity x True Ending compatibility and overhaul patch (packaged as `Stellarity_Cosmetic_Patch`), completed fixes, and testing milestones.

## What's Done and Working

### Boss Fight & Core Mechanics

- **Unified Patch Release**: Consolidated compatibility and mechanics into a single maintained build (`Stellarity_Cosmetic_Patch.zip` and `.jar` supporting Datapacks, Fabric, Quilt, NeoForge, Forge, Paper, and Purpur on 1.21+).
- **Shielded End Crystals & Guardian Phantoms**:
  - Bound tower phantoms strictly to their revived crystals via unique `ste_cos.id`.
  - Crystals in Phase 1 start completely normal and destructible. Phantoms only guard revived crystals in Phase 3 (`revive_crystals`) without infinite respawn loops.
  - Killing a guardian phantom immediately clears `{Invulnerable:0b, Glowing:0b}` from the tower crystal with break sounds and particles; once killed, phantoms never respawn.
  - Added safety guard in `crystal/loop.mcfunction` preventing unbreakable crystals if a phantom despawns or is killed from distance.
- **Totem of Undying & Final Breath Phase Separation**:
  - Resolved dragon offhand slot limitation (`ender_dragon` only supports `weapon.mainhand`).
  - Totem cutscene plays cleanly upon first fatal hit (restoring 36 HP, shaking screen, and performing ascending flight).
  - System totem feather with `death_protection` is equipped into `weapon.mainhand` at the climax of the totem ascent (tick 3090).
  - Isolated Final Breath transition so it triggers only after the totem phase has fully completed.
- **Final Breath Ascent & Hover Arena**:
  - Replaced drifting relative teleportation with a deterministic 30-tick vertical ascent from portal level (Y=67) up to Y=79 (`~ ~12 ~`).
  - During the 7-second Abyss Shriek charge, the dragon remains locked at `0 79 0` with cosmic matter suction and Warden heartbeat buildup.
  - Overhauled Final Breath laser blast with multi-ring sonic booms, flash rays, and 16 magic damage.
  - Dragon hovers at Y=79 with 1 HP for the final blow; levitation pad (`trueEnding_pad`) on the portal allows players in Survival to leap up and deliver the finishing hit.
- **Residual Invulnerability Fix**:
  - Disabled legacy True Ending 600-tick invulnerability loop (`a_main_final.mcfunction`).
  - Ensured `{Invulnerable: 0b}` is applied whenever End Crystals are down (`#ste_cos_crystals == 0`) and the dragon is not mid-cutscene.
- **Crystal Laser Defense & Deflection**:
  - Fixed projectile deflection logic: tridents and arrows reflect away with positive vertical trajectory, avoiding crystal self-damage.
  - Added audio spam cooldowns and grounded trident tag cleanup.

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
- **Culmination 360° Shockwave Pulse**:
  - At tick 590, an expanding 72-radial (every 5°) circular shockwave radiates outward up to 210 blocks across the entire island, dealing 3.5 magic damage to players and living entities.

### Technical & Compatibility

- Clean pack metadata supporting 1.21 up to 1.21.9+ overlays without log warnings.
- Fixed Minecraft 1.21 syntax deprecations (`fall_distance`, particle formats, team commands).
- Full chunk cleanup and non-destructive chorus fruit removal around the main exit portal on Paper/Purpur.
- Verified 100% valid UTF-8 encoding with zero BOM bytes across all files.

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
