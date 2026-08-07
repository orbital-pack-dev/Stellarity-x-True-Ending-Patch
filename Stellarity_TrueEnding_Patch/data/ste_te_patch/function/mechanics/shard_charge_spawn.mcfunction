# =====================================================================
# ste_te_patch:mechanics/shard_charge_spawn
# Спавн маркера-осколка при смерти кристалла.
# Спавним в the_end относительно рандомного игрока на арене.
# =====================================================================

# Спавним маркер у случайного игрока в the_end
execute as @a[sort=random,limit=1] at @s run summon marker ~ ~ ~ {Tags:["ste_crystal_shard_tmp"]}

# Разбрасываем по арене относительно текущей позиции игрока
execute as @a[sort=random,limit=1] at @s run spreadplayers ~ ~ 5 30 false @e[type=marker,tag=ste_crystal_shard_tmp]

tag @e[type=marker,tag=ste_crystal_shard_tmp] add ste_crystal_shard
tag @e[type=marker,tag=ste_crystal_shard_tmp] remove ste_crystal_shard_tmp
