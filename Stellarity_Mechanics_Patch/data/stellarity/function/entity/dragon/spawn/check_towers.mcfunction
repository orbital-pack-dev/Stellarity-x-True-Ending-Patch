# stellarity:entity/dragon/spawn/check_towers
# проверка целостности всех 10 кристаллов на башнях во время анимации возрождения

scoreboard players set #tower_broken ste_cos.flags 0

# Башня 1 (63 101 0)
execute positioned 63 101 0 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal 63 101 0 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned 63 101 0 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# Башня 2 (50 122 36)
execute positioned 50 122 36 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal 50 122 36 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned 50 122 36 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# Башня 3 (18 95 59, с клеткой)
execute positioned 18 95 59 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal 18 95 59 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned 18 95 59 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run function stellarity:entity/dragon/spawn/repair_cage
execute positioned 18 95 59 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# Башня 4 (-19 107 59)
execute positioned -19 107 59 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal -19 107 59 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned -19 107 59 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# Башня 5 (-51 106 36)
execute positioned -51 106 36 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal -51 106 36 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned -51 106 36 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# Башня 6 (-63 94 0, с клеткой)
execute positioned -63 94 0 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal -63 94 0 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned -63 94 0 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run function stellarity:entity/dragon/spawn/repair_cage
execute positioned -63 94 0 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# Башня 7 (-51 101 -39)
execute positioned -51 101 -39 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal -51 101 -39 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned -51 101 -39 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# Башня 8 (-19 97 -60, с клеткой)
execute positioned -19 97 -60 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal -19 97 -60 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned -19 97 -60 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run function stellarity:entity/dragon/spawn/repair_cage
execute positioned -19 97 -60 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# Башня 9 (18 88 -60)
execute positioned 18 88 -60 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal 18 88 -60 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned 18 88 -60 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# Башня 10 (50 96 -39, с клеткой)
execute positioned 50 96 -39 unless entity @e[type=minecraft:end_crystal,distance=..3] run summon minecraft:end_crystal 50 96 -39 {ShowBottom:1b,Glowing:1b,Invulnerable:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute positioned 50 96 -39 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run function stellarity:entity/dragon/spawn/repair_cage
execute positioned 50 96 -39 as @e[type=minecraft:end_crystal,distance=..2,tag=stellarity.new_crystal] run scoreboard players set #tower_broken ste_cos.flags 1

# Запуск связывания и замены для всех восстановленных кристаллов
execute as @e[type=minecraft:end_crystal,tag=stellarity.new_crystal] at @s run function stellarity:entity/dragon/spawn/replace_crystal
