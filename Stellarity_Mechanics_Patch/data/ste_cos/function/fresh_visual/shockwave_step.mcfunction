# ste_cos:fresh_visual/shockwave_step
# шаг распространения ударной волны строго в верхней горизонтальной плоскости (без падения вниз)

scoreboard players add @s trueEnding_count 1

# движение вперед строго по горизонтали
tp @s ^ ^ ^1.5

# частицы ударной волны с нулевой гравитацией (не падают вниз на землю)
particle dust_color_transition{from_color:[0.85,0.15,1.0],scale:1.8,to_color:[0.25,0.0,0.5]} ~ ~ ~ 0.05 0.05 0.05 0 2 force @a[distance=..256]
particle dust{color:[0.9,0.2,1.0],scale:1.3} ~ ~ ~ 0.08 0.05 0.08 0 2 force @a[distance=..256]

# редкие искры и стержни без гравитации
execute if predicate true_ending:chance/20_percent run particle electric_spark ~ ~ ~ 0.1 0.1 0.1 0.02 1 force @a[distance=..256]
execute if predicate true_ending:chance/20_percent run particle end_rod ~ ~ ~ 0.05 0.05 0.05 0.01 1 force @a[distance=..256]
execute if predicate true_ending:chance/10_percent run particle witch ~ ~ ~ 0.05 0.05 0.05 0 1 force @a[distance=..256]

# завершение волны по времени жизни (40 тиков ~ 60 блоков радиуса)
execute if score @s trueEnding_count matches 40.. run kill @s
