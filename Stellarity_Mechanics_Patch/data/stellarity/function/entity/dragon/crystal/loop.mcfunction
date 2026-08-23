# stellarity:entity/dragon/crystal/loop (PATCHED by ste_cos)
# Task: count crystals, init, particles.
# [PATCH] Crystals are NOT protected by interaction shield - they are always vulnerable.
scoreboard players add #crystal_count stellarity.misc 1

execute unless entity @s[tag=stellarity.end_crystal.init] run function stellarity:entity/dragon/crystal/init

particle soul_fire_flame ~ ~1 ~ .6 .6 .6 0.02 1 normal
particle dragon_breath ~ ~1 ~ .6 .6 .6 0.02 1 normal

# Heal dragon for 8 HP every second (20 тиков)
scoreboard players add @s ste_cos.timer 1
execute if score @s ste_cos.timer matches 20.. as @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..48] run function ste_cos:mechanics/crystal_heal
execute if score @s ste_cos.timer matches 20.. run scoreboard players set @s ste_cos.timer 0

# =====================================================================
# Fix invisible crystals:
# USING FORCELOAD INSTEAD OF HITBOXES!
# =====================================================================
