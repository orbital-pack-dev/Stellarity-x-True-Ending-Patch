# stellarity:entity/dragon/crystal/loop (PATCHED by ste_cos)
# Оригинал: подсчёт кристаллов, init, частицы.
# Патч: при инициализации кристалла башни — спавним interaction-щит.
scoreboard players add #crystal_count stellarity.misc 1

execute unless entity @s[tag=stellarity.end_crystal.init] run function stellarity:entity/dragon/crystal/init

# [PATCH]: Защищаем кристаллы до начала боя
# Убираем спавн interaction и делаем их полностью неуязвимыми (Invulnerable:1b), пока дракона нет
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon] run data modify entity @s Invulnerable set value 1b
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon] run data modify entity @s Invulnerable set value 0b

particle soul_fire_flame ~ ~1 ~ .6 .6 .6 0.02 1 normal
particle dragon_breath ~ ~1 ~ .6 .6 .6 0.02 1 normal