
# ste_cos:phantom/guard_move
# Фантомы-стражи

execute unless entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/cleanup_current

# Фантомы-стражи
execute if entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/guard_act
