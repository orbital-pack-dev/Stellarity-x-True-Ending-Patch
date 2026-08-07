# =====================================================================
# ste_te_patch:mechanics/fake_dive
# Обманный нырок. Каждый 3-й нырок — уход вверх.
# Вызывается из main_tick на тике 60.
# =====================================================================

# Отслеживаем ВХОД в фазу dive (bosstime 1001 = первый тик нырка)
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!ste_dive_counted] if score @s trueEnding_bosstime matches 1001 run scoreboard players add @s ste_te_dive_count 1
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!ste_dive_counted] if score @s trueEnding_bosstime matches 1001 run tag @s add ste_dive_counted

# Снимаем тег после выхода из фазы dive
execute as @e[type=ender_dragon,tag=ste_dive_counted] unless score @s trueEnding_bosstime matches 1001..1100 run tag @s remove ste_dive_counted

# На 3-м нырке при bosstime 1060 → ОБМАНКА
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] if score @s ste_te_dive_count matches 3 if score @s trueEnding_bosstime matches 1060 run function ste_te_patch:mechanics/fake_dive_abort

# Сброс счётчика после 4-го нырка
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] if score @s ste_te_dive_count matches 4.. run scoreboard players set @s ste_te_dive_count 0
