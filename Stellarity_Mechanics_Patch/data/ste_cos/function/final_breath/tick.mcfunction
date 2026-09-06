# ste_cos:final_breath/tick
# главный цикл ультимативной атаки "Финальный Вздох"

# Состояние 1: Дракон летит к порталу на собственных крыльях (БЕЗ ТП)
# Когда подлетает в радиус 16 блоков от 0 65 0 — начинается анимированный взлет
execute if score #final_breath_state ste_cos.flags matches 1 as @e[type=ender_dragon,tag=ste_cos.final_breath_guided,limit=1] at @s positioned 0 65 0 if entity @s[distance=..16] run function ste_cos:final_breath/start

# Состояние 2: Плавный взлет дракона от портала к высоте 90
execute if score #final_breath_state ste_cos.flags matches 2 run function ste_cos:final_breath/tick_ascend

# Состояние 3: 7-секундная кинематографичная зарядка на высоте 90 и залп
execute if score #final_breath_state ste_cos.flags matches 3 run function ste_cos:final_breath/tick_charge
