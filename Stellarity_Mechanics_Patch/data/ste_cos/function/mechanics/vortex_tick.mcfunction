# ste_cos:mechanics/vortex_tick
# логика воронки под неподвижным игроком

scoreboard players add @s ste_cos.timer 1

# удаление через четыре секунды
execute if score @s ste_cos.timer matches 80.. run kill @s

# притягивание игроков к центру
execute as @a[distance=..8,gamemode=!spectator,gamemode=!creative] at @s facing ^ ^ ^-1 run tp @s ~ ~ ~ ~ ~
execute as @a[distance=..8,gamemode=!spectator,gamemode=!creative] at @s facing entity @e[type=area_effect_cloud,tag=ste_cos_vortex,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.6

# частицы воронки
particle minecraft:portal ~ ~1 ~ 3 0 3 1 10 normal
particle minecraft:reverse_portal ~ ~1 ~ 1 0 1 0.1 5 normal

# урон и иссушение рядом с центром
execute as @a[distance=..5,gamemode=!spectator,gamemode=!creative] run damage @s 3 minecraft:magic
execute as @a[distance=..5,gamemode=!spectator,gamemode=!creative] run effect give @s minecraft:wither 2 1 true
