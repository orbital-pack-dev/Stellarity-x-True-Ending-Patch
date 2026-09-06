# ste_cos:final_breath/tick_charge
# 7-секундная (140 тиков) кинематографичная зарядка сокрушительного удара на высоте 90 ("Abyss Shriek")
# нарастающее сердцебиение Вардена, кольца ударных волн, засасывание материи в пасть, нарастающая тьма

scoreboard players add #final_breath_timer ste_cos.timer 1

# плавное вращение на месте в воздухе над порталом
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] run data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run tp @s ~ ~ ~ ~3.5 0

# поддержание слабости на игроках на время зарядки
execute if score #final_breath_timer ste_cos.timer matches 1..135 run effect give @a weakness 2 10 true

# колоссальное втягивание космической материи в пасть дракона (без столбов частиц)
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s positioned ^ ^1.2 ^2.5 run particle reverse_portal ~ ~ ~ 4.5 3.0 4.5 0.16 40 force @a
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s positioned ^ ^1.2 ^2.5 run particle dust_color_transition{from_color:[0.75,0.15,0.95],scale:2.4,to_color:[0.15,0.0,0.35]} ~ ~ ~ 3.5 2.0 3.5 0.08 25 force @a
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s positioned ^ ^1.2 ^2.5 run particle dragon_breath ~ ~ ~ 2.0 1.2 2.0 0.04 15 force @a

# хаотичные вспышки flash, темнеющие и ускоряющиеся со временем
execute if score #final_breath_timer ste_cos.timer matches 1..40 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle flash{color:[0.90,0.35,1.0,1.0]} ~ ~1 ~ 0 0 0 0 1 force @a
execute if score #final_breath_timer ste_cos.timer matches 41..80 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle flash{color:[0.70,0.15,0.90,1.0]} ~ ~1 ~ 0 0 0 0 1 force @a
execute if score #final_breath_timer ste_cos.timer matches 81..120 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle flash{color:[0.45,0.05,0.65,1.0]} ~ ~1 ~ 0 0 0 0 1 force @a
execute if score #final_breath_timer ste_cos.timer matches 121..135 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle flash{color:[0.22,0.0,0.38,1.0]} ~ ~1 ~ 0 0 0 0 2 force @a

# ----------------------------------------------------
# Нарастающие удары сердца Вардена + кольца ударных волн
# ----------------------------------------------------
# 1..40 тиков: редкие удары (каждые 20 тиков, питч 0.50)
execute if score #final_breath_timer ste_cos.timer matches 1 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 1 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 1 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:fresh_visual/shockwave_spawn_markers

execute if score #final_breath_timer ste_cos.timer matches 20 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 20 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 20 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:fresh_visual/shockwave_spawn_markers

execute if score #final_breath_timer ste_cos.timer matches 40 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 40 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 40 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:fresh_visual/shockwave_spawn_markers

# 41..80 тиков: средний темп (каждые 14 тиков, питч 0.62)
execute if score #final_breath_timer ste_cos.timer matches 54 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.62
execute if score #final_breath_timer ste_cos.timer matches 54 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.60
execute if score #final_breath_timer ste_cos.timer matches 54 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:fresh_visual/shockwave_spawn_markers

execute if score #final_breath_timer ste_cos.timer matches 68 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.62
execute if score #final_breath_timer ste_cos.timer matches 68 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.60
execute if score #final_breath_timer ste_cos.timer matches 68 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:fresh_visual/shockwave_spawn_markers

execute if score #final_breath_timer ste_cos.timer matches 80 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.65
execute if score #final_breath_timer ste_cos.timer matches 80 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.65
execute if score #final_breath_timer ste_cos.timer matches 80 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:fresh_visual/shockwave_spawn_markers

# 81..110 тиков: учащенный темп (каждые 8 тиков, питч 0.78)
execute if score #final_breath_timer ste_cos.timer matches 88 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.78
execute if score #final_breath_timer ste_cos.timer matches 88 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.75
execute if score #final_breath_timer ste_cos.timer matches 88 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:fresh_visual/shockwave_spawn_markers

execute if score #final_breath_timer ste_cos.timer matches 96 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.78
execute if score #final_breath_timer ste_cos.timer matches 96 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:fresh_visual/shockwave_spawn_markers

execute if score #final_breath_timer ste_cos.timer matches 104 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.82
execute if score #final_breath_timer ste_cos.timer matches 104 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:fresh_visual/shockwave_spawn_markers

# 111..135 тиков: бешеный пульс (каждые 4 тика, питч 0.95)
execute if score #final_breath_timer ste_cos.timer matches 112 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.95
execute if score #final_breath_timer ste_cos.timer matches 112 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:fresh_visual/shockwave_spawn_markers

execute if score #final_breath_timer ste_cos.timer matches 116 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.95
execute if score #final_breath_timer ste_cos.timer matches 120 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.98
execute if score #final_breath_timer ste_cos.timer matches 124 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 1.02
execute if score #final_breath_timer ste_cos.timer matches 128 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 1.05
execute if score #final_breath_timer ste_cos.timer matches 132 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 1.10
execute if score #final_breath_timer ste_cos.timer matches 135 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 1.15

# 136..139 тиков: КУЛЬМИНАЦИЯ — МЕРТВАЯ ТИШИНА и наложение Тьмы на игроков (1 сек)
execute if score #final_breath_timer ste_cos.timer matches 137 run effect give @a darkness 2 0 true

# 140 тиков (7.0 сек): СОКРУШИТЕЛЬНЫЙ ЗАЛП ФИНАЛЬНОГО ВЗДОХА!
execute if score #final_breath_timer ste_cos.timer matches 140.. as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:final_breath/blast
