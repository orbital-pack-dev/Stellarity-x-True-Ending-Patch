# ste_cos:phantom/guard_move
# проверка кристалла

# удаление стража если кристалл разрушен
execute unless entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/cleanup_current

# действие стража если кристалл цел
execute if entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/guard_act
