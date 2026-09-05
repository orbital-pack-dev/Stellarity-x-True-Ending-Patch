# ste_cos:fresh_visual/shards/tick
# Обновление вращения осколков раз в 12 тиков и независимой пульсации каждого осколка

# 1. Продвижение таймера орбиты
scoreboard players add #shard_orbit_timer ste_cos.timer 1
execute if score #shard_orbit_timer ste_cos.timer matches 12.. run function ste_cos:fresh_visual/shards/orbit_step

# 2. Независимые таймеры пульсации каждого из 8 осколков (0.7 - 2.3 сек = 14 - 46 тиков)
# Осколок 0
scoreboard players add #shard_0_timer ste_cos.timer 1
execute if score #shard_0_timer ste_cos.timer >= #shard_0_target ste_cos.timer run scoreboard players set #shard_0_timer ste_cos.timer 0
execute if score #shard_0_timer ste_cos.timer matches 0 store result score #shard_0_target ste_cos.timer run random value 14..46
execute if score #shard_0_timer ste_cos.timer matches 0 store result score #shard_0_scale ste_cos.flags run random value 0..4

# Осколок 1
scoreboard players add #shard_1_timer ste_cos.timer 1
execute if score #shard_1_timer ste_cos.timer >= #shard_1_target ste_cos.timer run scoreboard players set #shard_1_timer ste_cos.timer 0
execute if score #shard_1_timer ste_cos.timer matches 0 store result score #shard_1_target ste_cos.timer run random value 14..46
execute if score #shard_1_timer ste_cos.timer matches 0 store result score #shard_1_scale ste_cos.flags run random value 0..4

# Осколок 2
scoreboard players add #shard_2_timer ste_cos.timer 1
execute if score #shard_2_timer ste_cos.timer >= #shard_2_target ste_cos.timer run scoreboard players set #shard_2_timer ste_cos.timer 0
execute if score #shard_2_timer ste_cos.timer matches 0 store result score #shard_2_target ste_cos.timer run random value 14..46
execute if score #shard_2_timer ste_cos.timer matches 0 store result score #shard_2_scale ste_cos.flags run random value 0..4

# Осколок 3
scoreboard players add #shard_3_timer ste_cos.timer 1
execute if score #shard_3_timer ste_cos.timer >= #shard_3_target ste_cos.timer run scoreboard players set #shard_3_timer ste_cos.timer 0
execute if score #shard_3_timer ste_cos.timer matches 0 store result score #shard_3_target ste_cos.timer run random value 14..46
execute if score #shard_3_timer ste_cos.timer matches 0 store result score #shard_3_scale ste_cos.flags run random value 0..4

# Осколок 4
scoreboard players add #shard_4_timer ste_cos.timer 1
execute if score #shard_4_timer ste_cos.timer >= #shard_4_target ste_cos.timer run scoreboard players set #shard_4_timer ste_cos.timer 0
execute if score #shard_4_timer ste_cos.timer matches 0 store result score #shard_4_target ste_cos.timer run random value 14..46
execute if score #shard_4_timer ste_cos.timer matches 0 store result score #shard_4_scale ste_cos.flags run random value 0..4

# Осколок 5
scoreboard players add #shard_5_timer ste_cos.timer 1
execute if score #shard_5_timer ste_cos.timer >= #shard_5_target ste_cos.timer run scoreboard players set #shard_5_timer ste_cos.timer 0
execute if score #shard_5_timer ste_cos.timer matches 0 store result score #shard_5_target ste_cos.timer run random value 14..46
execute if score #shard_5_timer ste_cos.timer matches 0 store result score #shard_5_scale ste_cos.flags run random value 0..4

# Осколок 6
scoreboard players add #shard_6_timer ste_cos.timer 1
execute if score #shard_6_timer ste_cos.timer >= #shard_6_target ste_cos.timer run scoreboard players set #shard_6_timer ste_cos.timer 0
execute if score #shard_6_timer ste_cos.timer matches 0 store result score #shard_6_target ste_cos.timer run random value 14..46
execute if score #shard_6_timer ste_cos.timer matches 0 store result score #shard_6_scale ste_cos.flags run random value 0..4

# Осколок 7
scoreboard players add #shard_7_timer ste_cos.timer 1
execute if score #shard_7_timer ste_cos.timer >= #shard_7_target ste_cos.timer run scoreboard players set #shard_7_timer ste_cos.timer 0
execute if score #shard_7_timer ste_cos.timer matches 0 store result score #shard_7_target ste_cos.timer run random value 14..46
execute if score #shard_7_timer ste_cos.timer matches 0 store result score #shard_7_scale ste_cos.flags run random value 0..4
