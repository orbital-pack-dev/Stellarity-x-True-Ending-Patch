# ste_cos:final_breath/tick
# 7-секундная (140 тиков) кинематографичная зарядка сокрушительного удара

scoreboard players add #final_breath_timer ste_cos.timer 1

# плавное вращение в воздухе над порталом и распыление дыхания
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run tp @s 0 90 0 ~4 0
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle dragon_breath ~ ~ ~ 1.5 0.5 1.5 0.04 10 force

# втягивание космической материи в пасть (обратные частицы reverse_portal и градиенты)
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle reverse_portal ~ ~ ~ 3.5 2.5 3.5 0.1 40 force
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle dust_color_transition{from_color:[1.0,0.25,1.0],scale:2.5,to_color:[0.15,0.0,0.4]} ~ ~ ~ 2 1.5 2 0.08 25 force
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle electric_spark ~ ~ ~ 2 1.5 2 0.08 15 force

# звуки нарастающего сердцебиения Вардена и аметистового резонанса (без warden roar!)
# 0..40 тиков (каждые 20 тиков, питч 0.50)
execute if score #final_breath_timer ste_cos.timer matches 1 20 40 run playsound entity.warden.heartbeat hostile @a 0 90 0 64.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 1 20 40 run playsound block.amethyst_block.resonate hostile @a 0 90 0 64.0 0.50

# 41..80 тиков (каждые 14 тиков, питч 0.62)
execute if score #final_breath_timer ste_cos.timer matches 54 68 80 run playsound entity.warden.heartbeat hostile @a 0 90 0 64.0 0.62
execute if score #final_breath_timer ste_cos.timer matches 54 68 80 run playsound block.amethyst_block.resonate hostile @a 0 90 0 64.0 0.60

# 81..110 тиков (каждые 8 тиков, питч 0.75)
execute if score #final_breath_timer ste_cos.timer matches 88 96 104 run playsound entity.warden.heartbeat hostile @a 0 90 0 64.0 0.75
execute if score #final_breath_timer ste_cos.timer matches 88 96 104 run playsound block.amethyst_block.resonate hostile @a 0 90 0 64.0 0.75

# 111..139 тиков (каждые 4 тика, питч 0.95 — бешеный пульс перед взрывом)
execute if score #final_breath_timer ste_cos.timer matches 112 116 120 124 128 132 136 run playsound entity.warden.heartbeat hostile @a 0 90 0 64.0 0.95

# 140 тиков (7.0 сек): ЗАЛП ФИНАЛЬНОГО ВЗДОХА!
execute if score #final_breath_timer ste_cos.timer matches 140.. as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:final_breath/blast
