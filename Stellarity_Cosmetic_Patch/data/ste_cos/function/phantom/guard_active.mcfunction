# =====================================================================
# ste_cos:phantom/guard_active
# AS? нет — вызывается без as/at из guard_tick. Активная фаза боя.
#
#   1) Спавн маркеров-стражей у живых кристаллов без стража.
#   2) Орбита / агро для существующих стражей.
# =====================================================================

# Спавн маркеров-стражей у живых кристаллов без стража
execute as @e[type=end_crystal,distance=..200,nbt={ShowBottom:1b}] at @s unless entity @e[type=marker,tag=ste_cos_guard_marker,distance=..6,limit=1] run function ste_cos:phantom/spawn_guard

# Орбита / агро для существующих стражей
execute as @e[type=marker,tag=ste_cos_guard_marker] at @s run function ste_cos:phantom/guard_marker_tick
