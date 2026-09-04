# ste_cos:fresh_visual/heart_level_up
# усиление Сердца Дракона при подключении кристалла с башни

scoreboard players add #heart_stage ste_cos.flags 1

# кулдаун 25 тиков для обычного сердцебиения (предотвращение одновременного наложения)
scoreboard players set #heart_cd ste_cos.timer 25
scoreboard players set #heart_tick ste_cos.timer 0

# фиолетовая вспышка при подключении кристалла
execute as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run particle flash{color:-4980481} ~ ~ ~ 0 0 0 0 1 force @a
execute as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run particle electric_spark ~ ~ ~ 1.5 1.5 1.5 0.1 35 force @a
execute as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run particle dust_color_transition{from_color:[0.9,0.2,1.0],scale:2.5,to_color:[0.2,0.0,0.5]} ~ ~ ~ 1.0 1.0 1.0 0.1 30 force @a

# громкие звуки перезвона и магии (слышны на всем острове)
execute as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run playsound block.amethyst_block.chime hostile @a ~ ~ ~ 32.0 1.2
execute as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run playsound entity.illusioner.mirror_move hostile @a ~ ~ ~ 32.0 1.05
