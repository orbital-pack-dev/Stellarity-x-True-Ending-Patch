# ste_cos:fresh_visual/heart_spawn
# призыв Сердца Дракона в точке 0 129 0 (изначально маленькое, без вспышки flash)

kill @e[type=marker,tag=ste_cos.respawn_heart]

summon marker 0 129 0 {Tags:["ste_cos.respawn_heart","ste_cos.visual_marker"]}

scoreboard players set #heart_stage ste_cos.flags 0
scoreboard players set #heart_tick ste_cos.timer 0
scoreboard players set #heart_cd ste_cos.timer 0

# начальный интервал удара сердца (случайный от 16 до 40 тиков)
scoreboard players operation #heart_next_beat ste_cos.timer = #rng_ticker ste_cos.flags
scoreboard players add #heart_next_beat ste_cos.timer 16

# начальное объемное ядро Сердца Дракона (заметно игрокам с земли)
particle dust_color_transition{from_color:[0.65,0.05,0.95],scale:2.5,to_color:[0.15,0.0,0.35]} 0 129 0 0.8 0.8 0.8 0.05 30 force @a
particle dragon_breath 0 129 0 0.5 0.5 0.5 0.02 18 force @a
particle reverse_portal 0 129 0 1.2 1.2 1.2 0.08 30 force @a
particle end_rod 0 129 0 0.6 0.6 0.6 0.03 10 force @a

# глубокий первый резонирующий стук сердца на весь остров
playsound entity.warden.heartbeat hostile @a 0 129 0 64.0 0.55
playsound block.amethyst_block.resonate hostile @a 0 129 0 64.0 0.50
