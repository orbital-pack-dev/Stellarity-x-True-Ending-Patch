# ste_cos:phantom/guard_move
# проверка стража

# кристалл разрушен
execute unless entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/cleanup_current

# страж убит
execute unless entity @e[type=phantom,tag=ste_cos_guard,distance=..40] run function ste_cos:phantom/guard_killed

# действие стража
execute if entity @e[type=end_crystal,distance=..6,limit=1] if entity @e[type=phantom,tag=ste_cos_guard,distance=..40] run function ste_cos:phantom/guard_act
