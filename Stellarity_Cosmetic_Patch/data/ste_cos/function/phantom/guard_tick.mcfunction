# =====================================================================
# ste_cos:phantom/guard_tick
# Фантомы-стражи вокруг кристаллов (только во время боя с драконом).
# Вызывается каждый тик.
# =====================================================================

# -- нет дракона → сбросить флаг и убрать всех стражей --
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=phantom,tag=ste_cos_guard]
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=armor_stand,tag=ste_cos_guard_marker]
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run scoreboard players set #phantoms_spawned ste_cos.flags 0

# -- есть дракон: инициализация спавна (ОДИН РАЗ ЗА БОЙ) --
# Инициализация запускается, когда спавнятся кристаллы Stellarity
execute in minecraft:the_end positioned 0 65 0 if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] if entity @e[type=end_crystal,distance=..400,nbt={ShowBottom:1b}] if score #phantoms_spawned ste_cos.flags matches 0 run function ste_cos:phantom/init_spawns

# -- есть дракон: спавн маркеров и фантомов для выбранных башен --
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=end_crystal,tag=ste_cos_needs_phantom] at @s run function ste_cos:phantom/spawn_single_guard

# -- есть дракон: управление каждым стражем --
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=armor_stand,tag=ste_cos_guard_marker] at @s run function ste_cos:phantom/guard_move
