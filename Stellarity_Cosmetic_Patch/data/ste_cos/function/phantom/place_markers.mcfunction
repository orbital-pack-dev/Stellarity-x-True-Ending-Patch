# =====================================================================
# ste_cos:phantom/place_markers
# ФАЗА 1. Вызывается один раз за бой (без контекста сущности).
# Ставит отдельный маркер armor_stand на КАЖДЫЙ живой кристалл арены.
#
# NOTE: вызывается из guard_tick только когда есть дракон и кристаллы.
# =====================================================================

# Отметить, что маркеры уже расставляются (чтобы не дублировать каждый тик)
scoreboard players set #markers_ready ste_cos.flags 1

# Для каждого кристалла без маркера — поставить маркер
execute positioned 0 65 0 as @e[type=end_crystal,distance=..400,nbt={ShowBottom:1b}] at @s unless entity @e[type=armor_stand,tag=ste_cos_guard_marker,distance=..3,limit=1] run function ste_cos:phantom/make_marker
