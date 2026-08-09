# ste_cos:egg/egg_glow
# Запускается каждый тик если маркер стоит на Яйце Дракона.
# Позиция: центр блока.

# Сброс состояния поиска — на случай если мы нашли яйцо через tier2
# (там search_stage не обнуляется на месте, чтобы не плодить лишние ветвления в page-файлах)
scoreboard players set @s ste_cos.search_stage 0

# Добавляем таймер на маркер, если его нет
scoreboard players add @s ste_cos.flags 1

# --- Непрерывные частицы (каждый тик): орбита из 2 мотов вместо box-jitter ---
execute positioned ~0.5 ~0.5 ~0.5 run function ste_cos:egg/egg_ambient

# Волны и вспышки (оркестрация)
execute if score @s ste_cos.flags matches 40 positioned ~0.5 ~0.5 ~0.5 run function ste_cos:egg/egg_wave
execute if score @s ste_cos.flags matches 40.. run scoreboard players set @s ste_cos.flags 0

# Редкие искры Enchant
execute if score @s ste_cos.flags matches 3 positioned ~0.5 ~0.5 ~0.5 run particle enchant ~ ~ ~ 0 0 0 1 2 force

# Оркестратор пульса
# ВАЖНО: раньше здесь не было "positioned ~0.5 ~0.5 ~0.5" — pulse_bright/pulse_dark
# строились относительно позиции МАРКЕРА, а не центра блока, и вся геометрия
# (спираль + кольцо) была смещена на пол-блока по всем трём осям.
execute if score @s ste_cos.flags matches 0 positioned ~0.5 ~0.5 ~0.5 run function ste_cos:egg/egg_pulse_trigger
