# ste_cos:fresh_visual/heart_tick
# пульсация Сердца Дракона со случайным интервалом от 0.8 до 2.0 секунд (16-40 тиков)

# уменьшение кулдауна от подключения кристаллов (предотвращение наложений)
execute if score #heart_cd ste_cos.timer matches 1.. run scoreboard players remove #heart_cd ste_cos.timer 1

scoreboard players add #heart_tick ste_cos.timer 1

# срабатывание очередного удара сердца
execute if score #heart_cd ste_cos.timer matches 0 if score #heart_tick ste_cos.timer >= #heart_next_beat ste_cos.timer as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run function ste_cos:fresh_visual/heart_beat

# перерасчет следующего случайного интервала (16..40 тиков) при достижении порога
execute if score #heart_tick ste_cos.timer >= #heart_next_beat ste_cos.timer run scoreboard players set #heart_tick ste_cos.timer 0
execute if score #heart_tick ste_cos.timer matches 0 run scoreboard players operation #heart_next_beat ste_cos.timer = #rng_ticker ste_cos.flags
execute if score #heart_tick ste_cos.timer matches 0 run scoreboard players add #heart_next_beat ste_cos.timer 16
