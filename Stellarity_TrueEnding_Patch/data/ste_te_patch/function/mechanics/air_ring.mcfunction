# =====================================================================
# ste_te_patch:mechanics/air_ring
# Кольцо Драконьего Дыхания. Каждые 30 сек (120 циклов по main_tick).
# =====================================================================

# Тик-счётчик у дракона (добавляем 5 за каждый вызов из main_tick)
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] run scoreboard players add @s ste_te_m2 5

# Когда счётчик >= 120 (600 тиков / 5 = 120 циклов) → срабатывает атака
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] if score @s ste_te_m2 matches 120.. run scoreboard players set @s ste_te_m2 0

# Проверяем игроков Y >= 85
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] if score @s ste_te_m2 matches 0 at @s if entity @a[distance=..100,y=85,dy=100] run function ste_te_patch:mechanics/air_ring_blast
