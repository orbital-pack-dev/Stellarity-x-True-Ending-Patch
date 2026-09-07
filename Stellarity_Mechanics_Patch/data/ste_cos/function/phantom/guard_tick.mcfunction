# ste_cos:phantom/guard_tick
# тикер стражей

# очистка стражей
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=phantom,tag=ste_cos_guard]
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=area_effect_cloud,tag=ste_cos_guard_marker]

# движение стражей
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=area_effect_cloud,tag=ste_cos_guard_marker] at @s run function ste_cos:phantom/guard_move
