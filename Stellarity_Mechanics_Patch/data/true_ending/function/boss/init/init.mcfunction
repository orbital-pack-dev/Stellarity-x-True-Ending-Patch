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
kill @e[type=marker,tag=ste_cos.pulse_wave_marker]
kill @e[type=marker,tag=ste_cos.carousel_center]
kill @e[type=marker,tag=ste_cos.feedback_projectile]
kill @e[type=armor_stand,tag=ste_cos.clone_exit_carrier]
kill @e[type=armor_stand,tag=ste_cos.minigame_carrier]
kill @e[type=armor_stand,tag=ste_cos.crystal_laser_projectile]
kill @e[type=ender_dragon,tag=ste_cos.clone_dragon]
scoreboard players set #clone_minigame_used ste_cos.flags 0
scoreboard players set #ste_cos_totem_used ste_cos.flags 0
scoreboard players set #final_breath_used ste_cos.flags 0
scoreboard players set #final_breath_state ste_cos.flags 0
scoreboard players set #final_breath_timer ste_cos.timer 0
scoreboard players set #minigame_state ste_cos.flags 0
scoreboard players set #minigame_resolved ste_cos.flags 0
scoreboard players set #minigame_outcome ste_cos.flags 0
scoreboard players set #carousel_active ste_cos.flags 0
scoreboard players set #carousel_timer ste_cos.timer 0
scoreboard players set #carrier_tick ste_cos.timer 0
scoreboard players set #crystal_charge_timer ste_cos.timer 0

# декоративные фантомы на кристаллах
execute in minecraft:the_end positioned 0 65 0 as @e[type=end_crystal,distance=15..400,tag=!stellarity.respawn_crystal,tag=!ste_cos_portal_fix] at @s unless entity @e[type=area_effect_cloud,tag=ste_cos_guard_marker,distance=..6,limit=1] run function ste_cos:phantom/spawn_decorative_guard
scoreboard players set @s trueEnding_bosstime 218
tag @s add trueEnding_dragon_particlechecked
