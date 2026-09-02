# ste_cos:crystal/cleanup_execute
# очистка арены

# выход если уже очищено или дракон жив
execute if score #crystal_cleaned ste_cos.flags matches 1.. run return 0
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run return 0

# удаляем лишние кристаллы
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=end_crystal,distance=..250]

execute in minecraft:the_end positioned 0 65 0 run kill @e[type=phantom,tag=ste_cos_guard,distance=..250]
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=marker,tag=ste_cos_guard_marker,distance=..250]
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=area_effect_cloud,tag=ste_cos_guard_marker,distance=..250]

scoreboard players set #crystal_cleaned ste_cos.flags 1
