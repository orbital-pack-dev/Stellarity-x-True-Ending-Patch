# ste_cos:crystal/cleanup_execute
# очистка кристаллов

# проверка статуса
execute if score #crystal_cleaned ste_cos.flags matches 1.. run return 0

# проверка дракона
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=smithed.entity,limit=1] run return 0

# удаление ванильного дракона
execute in minecraft:the_end as @e[type=ender_dragon,tag=!smithed.entity] run function stellarity:entity/dragon/butcher/kill

# проверка призыва
execute in minecraft:the_end if entity @e[type=marker,tag=stellarity.respawn_dragon] run return 0
execute in minecraft:the_end if entity @e[type=end_crystal,tag=stellarity.respawn_crystal] run return 0
execute in minecraft:the_end if entity @e[type=marker,tag=stellarity.portal_deactivated.spawn_dragon] run return 0

# удаление кристаллов
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=end_crystal,distance=..250]
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=phantom,tag=ste_cos_guard,distance=..250]
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=marker,tag=ste_cos_guard_marker,distance=..250]

# статус
scoreboard players set #crystal_cleaned ste_cos.flags 1
