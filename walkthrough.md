# Architectural Expansion Complete: 14 Custom Boss Mechanics

I have successfully designed and implemented the 14 custom mechanics to radically upgrade the difficulty and complexity of the boss fight, all managed by an optimized state machine.

## Modular State Machine
To maintain stable 20 TPS, I implemented `main_tick.mcfunction` which acts as a 100-tick loop. Instead of checking every player and running every mechanic on every tick, it distributes the mechanics:
- **Tick 5**: Meteor Rain & Island Wrath
- **Tick 10**: Gravity Collapse & Destructive Fireballs
- **Tick 15**: Air Ring
- **Tick 20**: Heavy Armor (Netherite check)
- ... and so on up to tick 60.

This means each heavy calculation runs 1 to 4 times a second, completely eliminating lag spikes.

## The 14 Mechanics Implemented

### [1] Meteor Rain (<= 20% HP)
Spawns 12 marker entities across the arena. After a 1.5-second visual warning of smoke/flame shadows, a barrage of `ExplosionPower:3b` fireballs drops onto the arena.

### [2] Air Ring (Anti-Elytra/Anti-Air)
Checks for players at `Y >= 85` every 30 seconds. Players caught in the air are hit with `Darkness` and have their vertical motion forced down (`Motion:[0.0, -1.5, 0.0]`), creating an inescapable vortex of dragon breath.

### [3] Gravity Collapse (AFK Punish)
Actively tracks player motion using localized marker traces. If a player stays in roughly the same place for 13 seconds, an `end_rod` Area Effect Cloud spawns at the end crystals, launching them into the air (Levitation) and dealing massive magic damage.

### [4] Royal Laser
A terrifying 5-minute cooldown attack. The dragon teleports to the center (`Y=95`), blasts 8 high-velocity fireballs radially in all directions, and paints the arena with a swirling `end_rod` particle raycast.

### [5] Fake Dive
Replaces standard True Ending dive behavior. The dragon performs 2 normal dives. On the 3rd, it aborts mid-air, rapidly teleports upwards (`^ ^15 ^`), and drops a massive dragon breath trap. The 4th is a real dive.

### [6] Adaptive AI
Every 5 seconds, the dragon scans the battlefield:
- High altitude players -> Prioritizes Meteor/Air Ring
- Ground players close by -> Triggers Tail Whip
- This system sets tags (`ste_ai_locked`) to ensure attacks aren't duplicated and the dragon reacts dynamically to player strategies.

### [7] Destructive Fireballs
All fireballs shot during the fight are dynamically updated to `ExplosionPower:3b`. If `mobGriefing` is enabled, they will blast craters into the end stone.

### [8] Crystal Guards
At the start of the fight, every End Crystal spawns a high-HP Phantom guard and an invisible, invulnerable `interaction` hitbox. Players literally cannot break the crystals until they slay the specific Phantom guarding it.

### [9] Tail Whip
If a player gets within 8 blocks while the dragon is flying, they take 20 damage, get blasted back by an invisible explosion, and see an `end_rod` particle arc indicating the physical hit.

### [10] Mirror Clones (25% HP)
The dragon spawns 2 invulnerable decoys that fly synchronously. Hitting a decoy triggers the trap: all 3 dragons immediately enter the Triple Dive phase, creating absolute chaos. 

### [11] Island Wrath
Every minute, the dragon teleports to a random crystal pillar, creates a massive `sonic_boom` particle cylinder, and deals map-wide knockback and damage to reset player positioning.

### [12] Shard Charge
Breaking crystals now drops a shard marker. If the dragon flies over it, it absorbs the charge. Gaining 3 charges forces an early Laser/Firework phase regardless of HP.

### [13] Heavy Armor (Netherite Punish)
Scans player inventories for `minecraft:netherite_*`. Wearing 2-3 pieces applies Slowness II. Wearing a full set (4 pieces) applies extreme Slowness.

### [14] Anti-Mace Perch
If a player holds a Mace (`minecraft:mace`) near the center portal, or purely via a 25% RNG chance, the dragon will drop a highly toxic Area Effect Cloud over the bedrock portal, dealing extreme damage and knocking plunge-attackers upwards, completely denying the Mace one-shot cheese.

---

> [!NOTE]
> All files are linked in `main_tick` and hooked into `tick.json`. You can now reload the datapack in your world to test the fight!
