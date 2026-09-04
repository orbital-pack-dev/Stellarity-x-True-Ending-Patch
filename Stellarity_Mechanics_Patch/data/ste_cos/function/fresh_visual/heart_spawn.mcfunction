# ste_cos:fresh_visual/heart_spawn
# призыв Сердца Дракона в точке 0 129 0 (изначально маленькое, без вспышки flash)

kill @e[type=marker,tag=ste_cos.respawn_heart]

summon marker 0 129 0 {Tags:["ste_cos.respawn_heart","ste_cos.visual_marker"]}

scoreboard players set #heart_stage ste_cos.flags 0
scoreboard players set #heart_tick ste_cos.timer 0

# начальный интервал удара сердца (случайный от 16 до 40 тиков)
scoreboard players operation #heart_next_beat ste_cos.timer = #rng_ticker ste_cos.flags
scoreboard players add #heart_next_beat ste_cos.timer 16

# начальное маленькое ядро частиц без flash
particle dust{color:[0.65,0.05,0.85],scale:0.9} 0 129 0 0.1 0.1 0.1 0 10 force @a
particle dust_color_transition{from_color:[0.7,0.1,0.9],scale:1.0,to_color:[0.1,0.0,0.3]} 0 129 0 0.15 0.15 0.15 0.02 12 force @a

# приглушенный глубокий первый стук
playsound entity.warden.heartbeat hostile @a 0 129 0 32.0 0.65
