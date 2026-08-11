# =====================================================================
# ste_cos:phantom/place_markers
# ФАЗА 1. Вызывается один раз за бой (без контекста сущности).
# Ставит отдельный маркер armor_stand на КАЖДЫЙ боевой кристалл арены.
#
# ФИЛЬТР: только кристаллы-столбы (тег stellarity.new_crystal ИЛИ
# дистанция от центра арены > 20). Это исключает кристаллы ПРИЗЫВА
# у портала (0,0), чтобы фантомы не лезли на портал.
# =====================================================================

# Отметить, что маркеры уже расставляются
scoreboard players set #markers_ready ste_cos.flags 1

# Для каждого боевого кристалла арены без маркера — поставить маркер
execute positioned 0 65 0 as @e[type=end_crystal,distance=..400,tag=stellarity.new_crystal] at @s unless entity @e[type=armor_stand,tag=ste_cos_guard_marker,distance=..3,limit=1] run function ste_cos:phantom/make_marker

# Запасной фильтр: если кристаллы не имеют stellarity.new_crystal, но стоят далеко (>25 от центра) — тоже считаем боевыми
execute positioned 0 65 0 as @e[type=end_crystal,distance=25..400,nbt={ShowBottom:1b}] at @s unless entity @e[type=armor_stand,tag=ste_cos_guard_marker,distance=..3,limit=1] run function ste_cos:phantom/make_marker
