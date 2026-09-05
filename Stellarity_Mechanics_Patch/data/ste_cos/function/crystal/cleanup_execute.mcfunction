# ste_cos:crystal/cleanup_execute
# очистка кристаллов на пустой арене

# прерывание если уже очищено
execute if score #crystal_cleaned ste_cos.flags matches 1.. run return 0

# прерывание если настоящий дракон уже жив
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=smithed.entity,limit=1] run return 0

# гарантированное удаление ванильного дракона и ванильного портала если они все еще есть
execute in minecraft:the_end as @e[type=ender_dragon,tag=!smithed.entity] run function stellarity:entity/dragon/butcher/kill

# прерывание если идет призыв дракона
execute in minecraft:the_end if entity @e[type=marker,tag=stellarity.respawn_dragon] run return 0
execute in minecraft:the_end if entity @e[type=end_crystal,tag=stellarity.respawn_crystal] run return 0
execute in minecraft:the_end if entity @e[type=marker,tag=stellarity.portal_deactivated.spawn_dragon] run return 0

# удаление лишних кристаллов и стражей на пустой арене
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=end_crystal,distance=..250]
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=phantom,tag=ste_cos_guard,distance=..250]
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=marker,tag=ste_cos_guard_marker,distance=..250]

# отметка об очистке
scoreboard players set #crystal_cleaned ste_cos.flags 1
