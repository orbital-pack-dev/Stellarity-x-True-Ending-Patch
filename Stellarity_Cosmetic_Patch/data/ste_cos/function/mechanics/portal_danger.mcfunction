# =====================================================================
# ste_cos:mechanics/portal_danger
# Вызывается если дракон жив.
# Если дракон дальше 25 блоков от портала (0 64 0) — спавним
# облако Драконьего Дыхания прямо на портале.
# Duration=3 (обновляем каждый тик пока условие выполняется).
# Когда дракон прилетает — перестаём обновлять и облако исчезает.
# =====================================================================

# Дракон далеко от портала → спавним/обновляем облако
execute positioned 0 64 0 unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run function ste_cos:mechanics/portal_danger_spawn

# Дракон вернулся к порталу → убиваем облако
execute positioned 0 64 0 if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run kill @e[type=area_effect_cloud,tag=ste_cos_portal_danger]
