# ste_cos:mechanics/tick
# цикл механик боя

# проверка неподвижности игроков
execute if entity @e[type=ender_dragon,tag=!trueEnding_mirrordragon,limit=1] as @e[type=ender_dragon,tag=!trueEnding_mirrordragon,limit=1] at @s as @a[distance=..400,gamemode=survival] run function ste_cos:mechanics/still_check
execute if entity @e[type=ender_dragon,tag=!trueEnding_mirrordragon,limit=1] as @e[type=ender_dragon,tag=!trueEnding_mirrordragon,limit=1] at @s as @a[distance=..400,gamemode=adventure] run function ste_cos:mechanics/still_check

# удаление вихря после боя
execute unless entity @e[type=ender_dragon,tag=!trueEnding_mirrordragon,limit=1] run kill @e[type=area_effect_cloud,tag=ste_cos_vortex]

# обновление активных вихрей
execute if entity @e[type=area_effect_cloud,tag=ste_cos_vortex,limit=1] as @e[type=area_effect_cloud,tag=ste_cos_vortex] at @s run function ste_cos:mechanics/vortex_tick

# запрет полета на элитрах
execute if entity @e[type=ender_dragon,tag=!trueEnding_mirrordragon,limit=1] run function ste_cos:mechanics/elytra_disable

# слабость на игроков во время боя
execute as @e[type=ender_dragon,tag=!trueEnding_mirrordragon,limit=1] at @s run effect give @a[distance=..400,gamemode=survival] weakness 2 0 true

# опасность у портала
execute if entity @e[type=ender_dragon,tag=!trueEnding_mirrordragon,limit=1] run function ste_cos:mechanics/portal_danger
execute as @e[type=area_effect_cloud,tag=ste_cos_portal_wave] at @s run function ste_cos:mechanics/portal_wave_tick

# очистка волн после гибели дракона
execute unless entity @e[type=ender_dragon,tag=!trueEnding_mirrordragon,limit=1] run scoreboard players set #wave_timer ste_cos.flags 0
execute unless entity @e[type=ender_dragon,tag=!trueEnding_mirrordragon,limit=1] run kill @e[type=area_effect_cloud,tag=ste_cos_portal_wave]
