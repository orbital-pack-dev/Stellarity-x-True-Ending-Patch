# =====================================================================
# OVERRIDE: true_ending:boss/a_main
# =====================================================================

# Условное снятие неуязвимости только когда уничтожены все кристаллы
execute if score $crystals_gone ste_te_flags matches 1 run data modify entity @s Invulnerable set value 0b
