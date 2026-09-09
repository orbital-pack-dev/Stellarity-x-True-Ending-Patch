# stellarity:entity/dragon/crystal/loop
# цикл кристалла

scoreboard players add #crystal_count stellarity.misc 1

execute unless entity @s[tag=stellarity.end_crystal.init] run function stellarity:entity/dragon/crystal/init

# смещение таймера
execute unless score @s ste_cos.aura_init matches 1 run scoreboard players add #crystal_phase ste_cos.flags 7
execute unless score @s ste_cos.aura_init matches 1 run scoreboard players operation @s ste_cos.aura_tick = #crystal_phase ste_cos.flags
execute unless score @s ste_cos.aura_init matches 1 run scoreboard players set @s ste_cos.aura_init 1

# аура кристалла
scoreboard players add @s ste_cos.aura_tick 1
execute if score @s ste_cos.aura_tick matches 28.. run scoreboard players set @s ste_cos.aura_tick 0
execute unless entity @s[tag=ste_cos.shielded_crystal] if score @s ste_cos.aura_tick matches 0 run function ste_cos:fresh_visual/crystal_aura
execute if entity @s[tag=ste_cos.shielded_crystal] if score @s ste_cos.aura_tick matches 0 run function ste_cos:fresh_visual/shielded_crystal_aura

# защищенный кристалл (возрожденные кристаллы)
execute if entity @s[tag=ste_cos.shielded_crystal] unless entity @e[type=area_effect_cloud,tag=ste_cos_guard_marker,distance=..6] run tag @s remove ste_cos.shielded_crystal
execute if entity @s[tag=ste_cos.shielded_crystal] run team join ste_cos.cyan_glow @s
execute if entity @s[tag=ste_cos.shielded_crystal] run data modify entity @s Glowing set value 1b
execute if entity @s[tag=ste_cos.shielded_crystal] run data modify entity @s Invulnerable set value 1b

# кристаллы первой фазы (темно-фиолетовое свечение, уязвимые)
execute if entity @s[tag=ste_cos.phase1_crystal] run team join ste_cos.purple_glow @s
execute if entity @s[tag=ste_cos.phase1_crystal] run data modify entity @s Glowing set value 1b
execute if entity @s[tag=ste_cos.phase1_crystal] run data modify entity @s Invulnerable set value 0b

# обычный кристалл без эффектов
execute unless entity @s[tag=ste_cos.shielded_crystal] unless entity @s[tag=ste_cos.phase1_crystal] run data modify entity @s Invulnerable set value 0b
execute unless entity @s[tag=ste_cos.shielded_crystal] unless entity @s[tag=ste_cos.phase1_crystal] run data modify entity @s Glowing set value 0b
execute unless entity @s[tag=ste_cos.shielded_crystal] unless entity @s[tag=ste_cos.phase1_crystal] run team leave @s

execute if entity @s[tag=ste_cos.shielded_crystal] run function ste_cos:crystal/shielded_crystal_tick

# частицы
execute if score @s ste_cos.aura_tick matches 4 run particle portal ~ ~1.2 ~ 0.3 0.3 0.3 0.05 2 force @a[distance=..96]
execute if score @s ste_cos.aura_tick matches 8 run particle portal ~ ~1.2 ~ 0.3 0.3 0.3 0.05 2 force @a[distance=..96]
execute if score @s ste_cos.aura_tick matches 12 run particle portal ~ ~1.2 ~ 0.3 0.3 0.3 0.05 2 force @a[distance=..96]
execute if score @s ste_cos.aura_tick matches 16 run particle portal ~ ~1.2 ~ 0.3 0.3 0.3 0.05 2 force @a[distance=..96]
execute if score @s ste_cos.aura_tick matches 20 run particle portal ~ ~1.2 ~ 0.3 0.3 0.3 0.05 2 force @a[distance=..96]
execute if score @s ste_cos.aura_tick matches 24 run particle portal ~ ~1.2 ~ 0.3 0.3 0.3 0.05 2 force @a[distance=..96]

execute if score @s ste_cos.aura_tick matches 4 run particle dust_color_transition{from_color:[0.4,0.85,1.0],scale:0.9,to_color:[0.7,0.1,0.9]} ~ ~1.2 ~ 0.2 0.25 0.2 0.01 2 force @a[distance=..96]
execute if score @s ste_cos.aura_tick matches 8 run particle dust_color_transition{from_color:[0.4,0.85,1.0],scale:0.9,to_color:[0.7,0.1,0.9]} ~ ~1.2 ~ 0.2 0.25 0.2 0.01 2 force @a[distance=..96]
execute if score @s ste_cos.aura_tick matches 12 run particle dust_color_transition{from_color:[0.4,0.85,1.0],scale:0.9,to_color:[0.7,0.1,0.9]} ~ ~1.2 ~ 0.2 0.25 0.2 0.01 2 force @a[distance=..96]
execute if score @s ste_cos.aura_tick matches 16 run particle dust_color_transition{from_color:[0.4,0.85,1.0],scale:0.9,to_color:[0.7,0.1,0.9]} ~ ~1.2 ~ 0.2 0.25 0.2 0.01 2 force @a[distance=..96]
execute if score @s ste_cos.aura_tick matches 20 run particle dust_color_transition{from_color:[0.4,0.85,1.0],scale:0.9,to_color:[0.7,0.1,0.9]} ~ ~1.2 ~ 0.2 0.25 0.2 0.01 2 force @a[distance=..96]
execute if score @s ste_cos.aura_tick matches 24 run particle dust_color_transition{from_color:[0.4,0.85,1.0],scale:0.9,to_color:[0.7,0.1,0.9]} ~ ~1.2 ~ 0.2 0.25 0.2 0.01 2 force @a[distance=..96]

# лечение дракона
scoreboard players add @s ste_cos.timer 1
execute if score @s ste_cos.timer matches 20.. as @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..24] run function ste_cos:mechanics/crystal_heal
execute if score @s ste_cos.timer matches 20.. run scoreboard players set @s ste_cos.timer 0
