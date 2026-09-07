# stellarity:entity/dragon/spawn/check_towers
# проверка кристаллов

scoreboard players set #tower_broken ste_cos.flags 0

# башня 1
execute positioned 63 101 0 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal 63 101 0 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned 63 101 0 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# башня 2
execute positioned 50 122 36 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal 50 122 36 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned 50 122 36 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# башня 3
execute positioned 18 95 59 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal 18 95 59 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned 18 95 59 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run function stellarity:entity/dragon/spawn/repair_cage
execute positioned 18 95 59 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# башня 4
execute positioned -19 107 59 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal -19 107 59 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned -19 107 59 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# башня 5
execute positioned -51 106 36 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal -51 106 36 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned -51 106 36 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# башня 6
execute positioned -63 94 0 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal -63 94 0 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned -63 94 0 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run function stellarity:entity/dragon/spawn/repair_cage
execute positioned -63 94 0 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# башня 7
execute positioned -51 101 -39 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal -51 101 -39 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned -51 101 -39 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# башня 8
execute positioned -19 97 -60 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal -19 97 -60 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned -19 97 -60 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run function stellarity:entity/dragon/spawn/repair_cage
execute positioned -19 97 -60 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# башня 9
execute positioned 18 88 -60 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal 18 88 -60 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned 18 88 -60 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# башня 10
execute positioned 50 96 -39 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal 50 96 -39 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned 50 96 -39 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run function stellarity:entity/dragon/spawn/repair_cage
execute positioned 50 96 -39 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# связывание
execute as @e[type=minecraft:end_crystal,tag=stellarity.new_crystal] at @s run function stellarity:entity/dragon/spawn/replace_crystal
