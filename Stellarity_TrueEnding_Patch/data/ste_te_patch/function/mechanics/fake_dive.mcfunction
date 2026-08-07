# =====================================================================
# ste_te_patch:mechanics/fake_dive
# =====================================================================

execute run scoreboard players add @s ste_te_m12 5
execute if score @s ste_te_m12 matches 1200.. run scoreboard players set @s ste_te_m12 0

# Если летит (Phase 0/1/2/3), меняем цель
execute if score @s ste_te_m12 matches 0 run function ste_te_patch:mechanics/fake_dive_trigger
