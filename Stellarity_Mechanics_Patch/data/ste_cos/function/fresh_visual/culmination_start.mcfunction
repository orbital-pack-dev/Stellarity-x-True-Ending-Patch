# ste_cos:fresh_visual/culmination_start
# кульминация возрождения: за 2 секунды до появления дракона

# полное затихание звуков
stopsound @a

# отдаление камеры игроков
execute as @a run attribute @s minecraft:camera_distance base set 255

# затемнение / заполнение экрана фиолетовой пеленой без частиц сквида и стража
execute as @a at @s run particle flash{color:[0.85,0.25,1.0,1.0]} ~ ~1 ~ 0 0 0 0 1 force
execute as @a at @s run particle dust{color:[0.12,0.0,0.22],scale:4.0} ^ ^ ^1 0.1 0.1 0.1 0 45 force

# глубокий вибрирующий звук нарастающей бездны
playsound block.respawn_anchor.deplete ambient @a 0 129 0 32.0 0.5
