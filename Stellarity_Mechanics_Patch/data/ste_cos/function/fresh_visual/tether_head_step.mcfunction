# ste_cos:fresh_visual/tether_head_step
# шаг полета снаряда луча от кристалла к Сердцу Дракона

# движение строго в точку 0 129 0 со скоростью ~3.5 блока за тик
execute facing 0 129 0 run tp @s ^ ^ ^3.5

# густые электрические искры (эффект мощного электрического тока)
particle electric_spark ~ ~ ~ 0.25 0.25 0.25 0.08 10 force @a[distance=..256]
particle dust{color:[0.85,0.2,1.0],scale:1.4} ~ ~ ~ 0.1 0.1 0.1 0 2 force @a[distance=..256]
particle witch ~ ~ ~ 0.15 0.15 0.15 0 2 force @a[distance=..256]

# проверка достижения центральной точки Сердца Дракона (0 129 0)
execute positioned 0 129 0 if entity @s[distance=..4.5] run function ste_cos:fresh_visual/tether_head_arrive
