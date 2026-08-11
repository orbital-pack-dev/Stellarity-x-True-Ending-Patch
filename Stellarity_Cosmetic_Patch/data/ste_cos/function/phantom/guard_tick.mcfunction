# =====================================================================
# ste_cos:phantom/guard_tick
# Фантомы-стражи вокруг кристаллов (только во время боя с драконом).
# Вызывается каждый тик.
#
# СХЕМА:
#   Фаза 1 — поставить МАРКЕР на КАЖДЫЙ живой кристалл (макс 10).
#            Маркер привязан к кристаллу и не имеет фантома.
#   Фаза 2 — случайным 2..10 маркерам (у которых ещё нет фантома)
#            спавнить фантома-стража с рандомной высотой орбиты (0.5–3.5)
#            и рандомным размахом орбиты (4–8).
#   Фаза 3 — управление орбитой/агро/частицами/удалением.
# =====================================================================

# -- нет дракона → убрать всех стражей, маркеры, сбросить флаги --
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=phantom,tag=ste_cos_guard]
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=armor_stand,tag=ste_cos_guard_marker]
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run scoreboard players set #markers_ready ste_cos.flags 0
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run scoreboard players set #phantoms_spawned ste_cos.flags 0

# -- есть дракон:
#    ФАЗА 1: маркер на КАЖДЫЙ кристалл (один раз за бой) --
execute in minecraft:the_end positioned 0 65 0 if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] if entity @e[type=end_crystal,distance=..400,nbt={ShowBottom:1b}] if score #markers_ready ste_cos.flags matches 0 run function ste_cos:phantom/place_markers

#    ФАЗА 2: случайным 2..10 маркерам без фантома добавить стража (один раз) --
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] if score #markers_ready ste_cos.flags matches 1 if score #phantoms_spawned ste_cos.flags matches 0 run function ste_cos:phantom/init_phantoms

#    ФАЗА 3: дополнение — маркер без фантома, если фантом умер (переодически)
#    управление каждым стражем + орбита --
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=armor_stand,tag=ste_cos_guard_marker] at @s run function ste_cos:phantom/guard_move
