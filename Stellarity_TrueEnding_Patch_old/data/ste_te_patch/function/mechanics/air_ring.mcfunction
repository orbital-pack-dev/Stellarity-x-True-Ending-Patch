# =====================================================================
# ste_te_patch:mechanics/air_ring
# =====================================================================

execute run scoreboard players add @s ste_te_m2 5
execute if score @s ste_te_m2 matches 600.. run scoreboard players set @s ste_te_m2 0

# Проверяем игроков в the_end Y >= 85
execute if score @s ste_te_m2 matches 0 at @s as @a[y=85,dy=100,distance=..150] run function ste_te_patch:mechanics/air_ring_blast
