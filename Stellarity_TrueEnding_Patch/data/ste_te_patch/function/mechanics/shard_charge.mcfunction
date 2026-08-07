# =====================================================================
# ste_te_patch:mechanics/shard_charge
# Поглощение осколков кристаллов Драконом.
# Вызывается из main_tick на тике 45.
# =====================================================================

# Трекаем падение счётчика кристаллов (кристалл сломан)
execute if score #crystal_count stellarity.misc < #crystal_old ste_te_misc run function ste_te_patch:mechanics/shard_charge_spawn

# Обновляем "старое" значение
scoreboard players operation #crystal_old ste_te_misc = #crystal_count stellarity.misc

# Партиклы активных шардов
execute as @e[type=marker,tag=ste_crystal_shard] at @s run particle end_rod ~ ~ ~ 0.5 0.5 0.5 0 2 force
execute as @e[type=marker,tag=ste_crystal_shard] at @s run particle dripping_obsidian_tear ~ ~1 ~ 0.3 0.3 0.3 0 1 force

# Поглощение дракоом
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] at @s if entity @e[type=marker,tag=ste_crystal_shard,distance=..8] run function ste_te_patch:mechanics/shard_charge_absorb
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] if score @s ste_te_charges matches 3.. run function ste_te_patch:mechanics/shard_charge_trigger
