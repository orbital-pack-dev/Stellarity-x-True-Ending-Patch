# stellarity:entity/dragon/crystal/loop (PATCHED by ste_cos)
# Оригинал: подсчёт кристаллов, init, частицы.
# Патч: при инициализации кристалла башни — спавним interaction-щит.
scoreboard players add #crystal_count stellarity.misc 1

execute unless entity @s[tag=stellarity.end_crystal.init] run function stellarity:entity/dragon/crystal/init

# [PATCH]: Спавним interaction-щит на кристалл если его ещё нет рядом
# (interaction блокирует прямое взаимодействие с кристаллом до призыва дракона)
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon] unless entity @e[type=minecraft:interaction,tag=ste_cos_crystal_shield,distance=..2,limit=1] run summon minecraft:interaction ~ ~-1 ~ {width:3.0f,height:4.0f,response:0b,Tags:["ste_cos_crystal_shield"]}

particle soul_fire_flame ~ ~1 ~ .6 .6 .6 0.02 1 normal
particle dragon_breath ~ ~1 ~ .6 .6 .6 0.02 1 normal