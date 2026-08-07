# =====================================================================
# ste_te_patch:mechanics/shard_charge_spawn
# Спавн маркера-осколка при смерти кристалла.
# Спавним в the_end относительно рандомного игрока на арене.
# =====================================================================

# Спавним маркер у случайного игрока в the_end
execute as @a[sort=random,limit=1] at @s run summon marker ~ ~ ~ {Tags:["ste_crystal_shard_tmp"]}

# Разбрасываем маркеры по арене ОТНОСИТЕЛЬНО позиции игрока
# через локальный вектор ^ (вперёд/влево/вверх) и случайную дистанцию
execute as @a[sort=random,limit=1] at @s positioned ^1 ^ ^ run tp @e[type=marker,tag=ste_crystal_shard_tmp] ^ ^ ~3
execute as @a[sort=random,limit=1] at @s positioned ^-1 ^ ^ run tp @e[type=marker,tag=ste_crystal_shard_tmp] ^ ^ ~-3
execute as @a[sort=random,limit=1] at @s positioned ^0 ^ ^ run tp @e[type=marker,tag=ste_crystal_shard_tmp] ^ ^ ~6

# Гарантируем, что маркер на высоте арены (~70) и не в стене
execute as @e[type=marker,tag=ste_crystal_shard_tmp] at @s run tp @s ~ 70 ~

tag @e[type=marker,tag=ste_crystal_shard_tmp] add ste_crystal_shard
tag @e[type=marker,tag=ste_crystal_shard_tmp] remove ste_crystal_shard_tmp
