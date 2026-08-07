# Architectural Expansion: 14 New Mechanics

This plan details the addition of 14 custom mechanics to the Stellarity x True Ending Dragon Boss Fight, orchestrated by a highly efficient, modular state machine to preserve TPS.

## User Review Required
> [!IMPORTANT]
> This is a massive expansion that fundamentally changes the difficulty and flow of the boss fight. The mechanics introduce anti-cheese systems (anti-mace, anti-AFK, anti-air), new phases, and highly destructive elements. 

## Open Questions
> [!WARNING]
> 1. **Destructive Fireballs:** Should Gast Fireballs destroy *all* End Stone, or should we limit it to specific areas to avoid completely destroying the main portal/altar? (Currently planning standard explosion with `ExplosionPower:3b` and `gamerule mobGriefing true`).
> 2. **Gravity Collapse:** For tracking AFK players (>13s), do you want a strict position check (X/Y/Z delta = 0), or a small radius (e.g., player hasn't moved more than 2 blocks)?
> 3. **Island Wrath:** Finding a "random place" on the island. Should the dragon randomly pick one of the 10 crystal pillars to land on, or just a random coordinate in a 40-block radius?

## Proposed Architecture

To maintain 20 TPS, we will implement a global `ste_te_timer` (0-100 ticks) in a new `main_tick` loop. Instead of checking every player every tick, heavy operations are distributed across specific ticks (e.g., AFK check on tick 10, Armor check on tick 20, AI evaluation on tick 50).

### Core Tick Infrastructure
#### [NEW] [main_tick.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/main_tick.mcfunction)
- Controls a rolling 1-100 tick counter.
- Evaluates phase transitions and triggers the modular mechanic files at specific intervals.
- Hooked into `tick.json`.

#### [MODIFY] [load.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/load.mcfunction)
- Add new scoreboards: `ste_te_timer`, `ste_te_afk_time`, `ste_te_dive_count`, `ste_te_charges`, etc.

---

### Mechanics Modules (in `mechanics/` folder)

#### [NEW] [meteor_rain.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/meteor_rain.mcfunction)
- Triggered once when HP <= 20%.
- Spawns a marker array, creates shadow particles, and drops `fireball` entities from the sky.

#### [NEW] [air_ring.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/air_ring.mcfunction)
- Triggered every 30s. Targets `@a[y=85..]`.
- Creates `dragon_breath` ring, applies Darkness, modifies `Motion` to pull players down.

#### [NEW] [gravity_collapse.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/gravity_collapse.mcfunction)
- AFK punishment system. If AFK score > 13s, spawns `area_effect_cloud` at pillars doing damage and Levitation.

#### [NEW] [royal_laser.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/royal_laser.mcfunction)
- 5-min cooldown after Phase 2. Summons 8 fireballs radially and casts an `end_rod` sweeping beam.

#### [NEW] [fake_dive.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/fake_dive.mcfunction)
- Hooks into TE's dive logic. On the 3rd dive in the cycle, dragon teleports `^ ^15 ^` instead of crashing, leaving a dragon breath trap.

#### [NEW] [adaptive_ai.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/adaptive_ai.mcfunction)
- Runs every 100 ticks (5s). Scans player states.
- Applies tags to the dragon to queue specific counter-attacks (Meteor, Tail Whip, Mirror Clones).
- Includes logic to prevent back-to-back duplicate attacks.

#### [NEW] [destructive_fireballs.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/destructive_fireballs.mcfunction)
- Modifies naturally spawning or boss-fired fireballs to have `ExplosionPower:3b`.

#### [NEW] [crystal_guards.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/crystal_guards.mcfunction)
- On boss spawn, creates a Phantom (`Size:3`, 20HP) and an `interaction` hitbox at each crystal.
- `interaction` blocks hits until the Phantom dies.

#### [NEW] [tail_whip.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/tail_whip.mcfunction)
- Close-range punish. Uses `end_rod` particles and `tp` manipulation or high `ExplosionPower:0b` creepers to simulate 15-block knockback.

#### [NEW] [mirror_clones.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/mirror_clones.mcfunction)
- Triggers at 25% HP. Summons 2 decoy dragons mimicking motion. If a decoy is hit, immediately transitions all dragons into the TE Triple Dive phase.

#### [NEW] [island_wrath.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/island_wrath.mcfunction)
- Teleports dragon to a randomized arena point. Spawns particle cylinder. Deals map-wide knockback and damage.

#### [NEW] [shard_charge.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/shard_charge.mcfunction)
- Tracks crystal destruction, leaves a marker. Dragon collision with marker gives a `$charges` score. >=3 charges triggers early Laser phase.

#### [NEW] [heavy_armor.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/heavy_armor.mcfunction)
- Scans `Inventory[{id:"minecraft:netherite_*"}]`. Applies dynamic `Slowness` based on piece count.

#### [NEW] [anti_mace_perch.mcfunction](file:///c:/Users/1/Documents/GitHub/Stellarity-x-True-Ending-Patch/Stellarity_TrueEnding_Patch/data/ste_te_patch/function/mechanics/anti_mace_perch.mcfunction)
- Triggers when Dragon enters perch state. Scans for Mace in player hands. Drops high-damage upward-knockback AEC over the portal to deny plunge attacks.

## Verification Plan

### Automated/Manual Verification
- I will write the code for all 14 files and link them in the tick loop.
- We will need to verify syntax across all 14 files, especially handling `interaction` entities and complex `data merge` commands.
- You will need to manually load the datapack in-game and spawn the dragon to test if the TPS drops and if mechanics trigger at the correct thresholds.
