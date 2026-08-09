# =====================================================================
# ste_cos:phantom/init_spawns
# ОДИН РАЗ за фазу. Выбирает от 2 до 10 случайных кристаллов, 
# которые получат фантома-стража.
# =====================================================================

scoreboard players set #phantoms_spawned ste_cos.flags 1

# Рандомное количество от 2 до 10 с акцентом на средние значения
execute store result score #r1 ste_cos.flags run random value 2..10
execute store result score #r2 ste_cos.flags run random value 2..10
scoreboard players operation #target_count ste_cos.flags = #r1 ste_cos.flags
scoreboard players operation #target_count ste_cos.flags += #r2 ste_cos.flags
scoreboard players set #2 ste_cos.flags 2
scoreboard players operation #target_count ste_cos.flags /= #2 ste_cos.flags

# Раздаём теги случайным кристаллам (каждый получает максимум 1 фантома)
execute as @e[type=end_crystal,nbt=!{ShowBottom:0b},sort=random] if score #target_count ste_cos.flags matches 1.. run function ste_cos:phantom/mark_crystal
