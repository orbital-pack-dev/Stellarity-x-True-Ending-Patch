# ste_cos:phantom/guard_tick
# тикер фантомов-стражей

# очистка стражей
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=phantom,tag=ste_cos_guard]
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=area_effect_cloud,tag=ste_cos_guard_marker]

# призыв стража на кристалле
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] positioned 0 65 0 as @e[type=end_crystal,distance=15..400,tag=!stellarity.respawn_crystal,tag=!ste_cos_portal_fix,limit=1,sort=random] at @s unless entity @e[type=area_effect_cloud,tag=ste_cos_guard_marker,distance=..6,limit=1] run function ste_cos:phantom/spawn_guard

# движение стражей
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=area_effect_cloud,tag=ste_cos_guard_marker] at @s run function ste_cos:phantom/guard_move
