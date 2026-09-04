# ste_cos:fresh_visual/heart_absorb_init
# запуск плавного всасывания Сердца и рукавов частиц в появившегося Дракона

# выключение торнадо, волн и привязок кристаллов
kill @e[type=marker,tag=ste_cos.tornado_marker]
kill @e[type=marker,tag=ste_cos.shockwave]
kill @e[type=marker,tag=ste_cos.tether_head]
tag @e[type=end_crystal] remove ste_cos.tether_connected

# перевод Сердца в режим плавного перемещения в Дракона
tag @e[type=marker,tag=ste_cos.respawn_heart] add ste_cos.heart_absorbing

# создание 4 рукавов частиц вокруг Сердца для кинематографичного всасывания
execute as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run summon marker ~1.5 ~ ~ {Tags:["ste_cos.absorb_tendril","ste_cos.visual_marker"]}
execute as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run summon marker ~-1.5 ~ ~ {Tags:["ste_cos.absorb_tendril","ste_cos.visual_marker"]}
execute as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run summon marker ~ ~ ~1.5 {Tags:["ste_cos.absorb_tendril","ste_cos.visual_marker"]}
execute as @e[type=marker,tag=ste_cos.respawn_heart,limit=1] at @s run summon marker ~ ~ ~-1.5 {Tags:["ste_cos.absorb_tendril","ste_cos.visual_marker"]}

scoreboard players set #absorb_time ste_cos.timer 0
