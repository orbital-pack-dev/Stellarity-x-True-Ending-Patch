# =====================================================================
# ste_te_patch:mechanics/tail_whip
# =====================================================================

execute run scoreboard players add @s ste_te_m6 5
execute if score @s ste_te_m6 matches 200.. run scoreboard players set @s ste_te_m6 0

# Проверяем игроков сзади (грубо: радиус 10, но не спереди)
execute if score @s ste_te_m6 matches 0 at @s if entity @a[distance=..10] run function ste_te_patch:mechanics/tail_whip_blast
