# инициализация параметров босса
particle dragon_breath ~ ~ ~ 0 0 0 1 140 force @a[distance=..256]
particle dragon_breath ~ ~ ~ 0 0 0 2 140 force @a[distance=..256]
execute unless score #ste_cos_totem_used ste_cos.flags matches 1 run item replace entity @s weapon.mainhand with totem_of_undying
execute if score #ste_cos_totem_used ste_cos.flags matches 1 run item replace entity @s weapon.mainhand with air
tag @s remove trueEnding_inattack
scoreboard players reset @s trueEnding_health_extra
scoreboard players reset @s trueEnding_health_extra_max
scoreboard players set 1000 trueEnding_constants 1000
scoreboard players set dragonhealth trueEnding_settings 300
attribute @s minecraft:max_health base set 300
effect give @s instant_health 1 255 true

# шкала при среднем здоровье
data modify entity @s Health set value 300f

# сохранение максимального здоровья
scoreboard players set @s trueEnding_health_max 300

# совместимость со сбросом
scoreboard objectives add refresh_maxhealth dummy
scoreboard players set @s refresh_maxhealth 300
tag @s add refresh_entity_exists
attribute @s knockback_resistance base set 300
kill @e[type=marker,tag=trueEnding_endspike]
kill @e[type=phantom,tag=trueEnding_guardphantom]
execute positioned 42 110 0 run function true_ending:boss/phantom/summon_marker
execute positioned 33 110 -25 run function true_ending:boss/phantom/summon_marker
execute positioned 12 110 -40 run function true_ending:boss/phantom/summon_marker
execute positioned -13 110 -40 run function true_ending:boss/phantom/summon_marker
execute positioned -34 110 -25 run function true_ending:boss/phantom/summon_marker
execute positioned -42 110 -1 run function true_ending:boss/phantom/summon_marker
execute positioned -34 110 24 run function true_ending:boss/phantom/summon_marker
execute positioned -13 110 39 run function true_ending:boss/phantom/summon_marker
execute positioned 12 110 39 run function true_ending:boss/phantom/summon_marker
execute positioned 33 110 24 run function true_ending:boss/phantom/summon_marker
scoreboard players set @s trueEnding_bosstime 218
tag @s add trueEnding_dragon_particlechecked
