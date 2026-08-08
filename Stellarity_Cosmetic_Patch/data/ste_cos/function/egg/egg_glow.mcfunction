# ste_cos:egg/egg_glow
# Запускается каждый тик если маркер стоит на Яйце Дракона.
# Позиция: центр блока.

# Добавляем таймер на маркер, если его нет
scoreboard players add @s ste_cos.flags 1

# --- Непрерывные частицы (каждый тик) ---
# Базовое фиолетовое свечение внутри яйца
execute positioned ~0.5 ~0.2 ~0.5 run particle minecraft:dust_color_transition{from_color:[0.3,0.0,0.5],scale:0.7,to_color:[0.6,0.1,0.7]} ~ ~ ~ 0.1 0.2 0.1 0.01 2 force
execute positioned ~0.5 ~0.5 ~0.5 run particle minecraft:end_rod ~ ~ ~ 0.2 0.2 0.2 0.011 1 force

# Волны и вспышки (оркестрация)
execute if score @s ste_cos.flags matches 40 run function ste_cos:egg/egg_wave
execute if score @s ste_cos.flags matches 40.. run scoreboard players set @s ste_cos.flags 0

# Редкие искры Enchant
execute if score @s ste_cos.flags matches 3 positioned ~0.5 ~0.5 ~0.5 run particle enchant ~ ~ ~ 0 0 0 1 2 force

# Оркестратор пульса
execute if score @s ste_cos.flags matches 0 run function ste_cos:egg/egg_pulse_trigger
