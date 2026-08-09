# =====================================================================
# ste_cos:phantom/spawn_guard
# Спавнит стражей у текущего кристалла (AS end_crystal AT кристалла).
# =====================================================================

scoreboard players set #2 ste_cos.flags 2

# Рандомное количество от 2 до 10 с акцентом на средние значения (5-7)
execute store result score #r1 ste_cos.flags run random value 2..10
execute store result score #r2 ste_cos.flags run random value 2..10
scoreboard players operation #phantom_count ste_cos.flags = #r1 ste_cos.flags
scoreboard players operation #phantom_count ste_cos.flags += #r2 ste_cos.flags
scoreboard players operation #phantom_count ste_cos.flags /= #2 ste_cos.flags

# Запуск цикла
execute if score #phantom_count ste_cos.flags matches 1.. run function ste_cos:phantom/spawn_single_guard
