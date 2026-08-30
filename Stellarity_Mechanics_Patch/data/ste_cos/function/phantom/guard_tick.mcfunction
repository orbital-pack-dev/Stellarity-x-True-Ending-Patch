# ste_cos:phantom/guard_tick
# Фантомы-стражи

# Механика боя
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=phantom,tag=ste_cos_guard]
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=area_effect_cloud,tag=ste_cos_guard_marker]

# Фантомы-стражи
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=end_crystal,nbt=!{ShowBottom:0b},limit=1,sort=random] at @s unless entity @e[type=area_effect_cloud,tag=ste_cos_guard_marker,distance=..6,limit=1] run function ste_cos:phantom/spawn_guard

# Механика боя
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=area_effect_cloud,tag=ste_cos_guard_marker] at @s run function ste_cos:phantom/guard_move
