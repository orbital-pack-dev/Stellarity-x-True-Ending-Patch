# ste_cos:fresh_visual/heart_tick
# пульсация Сердца Дракона со случайным интервалом от 0.8 до 2.0 секунд (16-40 тиков)

# уменьшение кулдауна от подключения кристаллов (предотвращение наложений)
execute if score #heart_cd ste_cos.timer matches 1.. run scoreboard players remove #heart_cd ste_cos.timer 1

scoreboard players add #heart_tick ste_cos.timer 1

# непрерывное объемное ядро Сердца Дракона между ударами (видно снизу каждый тик)
particle reverse_portal 0 129 0 0.4 0.4 0.4 0.05 4 force @a
particle dragon_breath 0 129 0 0.25 0.25 0.25 0.01 2 force @a
particle dust_color_transition{from_color:[0.5,0.0,0.8],scale:1.4,to_color:[0.1,0.0,0.2]} 0 129 0 0.25 0.25 0.25 0 2 force @a

# срабатывание очередного удара сердца
execute if score #heart_cd ste_cos.timer matches 0 if score #heart_tick ste_cos.timer >= #heart_next_beat ste_cos.timer as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run function ste_cos:fresh_visual/heart_beat

# перерасчет следующего случайного интервала (16..40 тиков) только после выполнения удара
execute if score #heart_cd ste_cos.timer matches 0 if score #heart_tick ste_cos.timer >= #heart_next_beat ste_cos.timer run scoreboard players operation #heart_next_beat ste_cos.timer = #rng_ticker ste_cos.flags
execute if score #heart_cd ste_cos.timer matches 0 if score #heart_tick ste_cos.timer >= #heart_next_beat ste_cos.timer run scoreboard players add #heart_next_beat ste_cos.timer 16
execute if score #heart_cd ste_cos.timer matches 0 if score #heart_tick ste_cos.timer >= #heart_next_beat ste_cos.timer run scoreboard players set #heart_tick ste_cos.timer 0
