# ste_cos:fix/egg_marker_fix
# полное удаление маркеров яйца (переход на систему без маркеров)

execute in minecraft:the_end run kill @e[type=marker,tag=ste_cos_egg_tracker]
execute in minecraft:the_end positioned 0.5 67.0 0.5 run kill @e[type=marker,distance=..3,tag=!stellarity.exit_portal]

# фиксация флагов
scoreboard players set #egg_tracker_spawned ste_cos.flags 0
scoreboard players set #egg_marker_fixed ste_cos.flags 1
