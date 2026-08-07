# =====================================================================
# ste_te_patch:mechanics/royal_laser
# Ультимейт — 8 фаерболов в 8 сторон. КД 5 мин (6000 тиков).
# Вызывается каждые 100 тиков (tick 40 в main_tick).
# =====================================================================

# Счётчик КД у дракона
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] run scoreboard players add @s ste_te_m4 5

# Сбрасываем и активируем при >= 1200 (1200 * 5 = 6000 тиков) + только после фазы 2
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=ste_te_crystals_gone] if score @s ste_te_m4 matches 1200.. run scoreboard players set @s ste_te_m4 0
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=ste_te_crystals_gone] if score @s ste_te_m4 matches 0 run function ste_te_patch:mechanics/royal_laser_fire
