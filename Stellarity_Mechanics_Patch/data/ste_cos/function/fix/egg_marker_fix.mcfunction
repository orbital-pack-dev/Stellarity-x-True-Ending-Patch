# ste_cos:fix/egg_marker_fix
# фикс дублирования маркеров яйца из версии 1.0.0

# удаление дубликатов маркеров
kill @e[type=marker,tag=ste_cos_egg_tracker]

# призыв ровно одного трекера яйца
execute in minecraft:the_end run summon marker 0 67 0 {Tags:["ste_cos_egg_tracker"]}

# фиксация флагов
scoreboard players set #egg_tracker_spawned ste_cos.flags 1
scoreboard players set #egg_marker_fixed ste_cos.flags 1
