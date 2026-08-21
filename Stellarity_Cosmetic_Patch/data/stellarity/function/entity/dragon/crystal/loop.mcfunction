# stellarity:entity/dragon/crystal/loop (PATCHED by ste_cos)
# Задача: посчитать кристаллы, init, частицы.
# [PATCH] Кристаллы НЕ защищены interaction-щитом — они уязвимы всегда.
scoreboard players add #crystal_count stellarity.misc 1

execute unless entity @s[tag=stellarity.end_crystal.init] run function stellarity:entity/dragon/crystal/init

particle soul_fire_flame ~ ~1 ~ .6 .6 .6 0.02 1 normal
particle dragon_breath ~ ~1 ~ .6 .6 .6 0.02 1 normal

# Лечение Дракона на 8 HP каждую секунду (20 тиков)
scoreboard players add @s ste_cos.timer 1
execute if score @s ste_cos.timer matches 20.. as @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..32] run function ste_cos:mechanics/crystal_heal
execute if score @s ste_cos.timer matches 20.. run scoreboard players set @s ste_cos.timer 0

# =====================================================================
# Фикс "невидимых" кристаллов:
# ИСПОЛЬЗУЕТСЯ FORCELOAD ВМЕСТО ХИТБОКСОВ!
# =====================================================================
