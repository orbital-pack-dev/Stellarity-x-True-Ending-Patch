# =====================================================================
# ste_cos:phantom/guard_tick
# Фантомы-стражи вокруг кристаллов (только во время боя с драконом).
#
# Простая логика, вызывается каждый тик:
#   1) Нет дракона → убить всех стражей и закончить.
#   2) Есть дракон  → у каждого живого кристалла без стража спавнить
#      маркер + фантома (AI выкл, будет кружить).
#   3) Для каждого маркера: если рядом игрок (в 20 блоках) — включить AI
#      фантому (сам атакует). Иначе — AI выкл и фантом кружит по орбите.
# =====================================================================

# -- если дракона нет — убираем всех стражей --
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=phantom,tag=ste_cos_guard]
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=marker,tag=ste_cos_guard_marker]

# -- если дракон есть: 1) спавн стражей --
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=end_crystal,nbt={ShowBottom:1b}] at @s unless entity @e[type=marker,tag=ste_cos_guard_marker,distance=..6,limit=1] run function ste_cos:phantom/spawn_guard

# -- если дракон есть: 2) орбита / агро --
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=marker,tag=ste_cos_guard_marker] at @s run function ste_cos:phantom/guard_move
