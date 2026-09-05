# ste_cos:final_breath/tick_charge
# 7-секундная (140 тиков) кинематографичная зарядка сокрушительного удара на высоте 90
# дракон парит над порталом, небо пульсирует тьмой, бьют звуковые волны и виден столб частиц

scoreboard players add #final_breath_timer ste_cos.timer 1

# плавное вращение на месте в воздухе над порталом (БЕЗ грубого ТП)
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run tp @s ~ ~ ~ ~3.5 0

# 1. Заметный вертикальный космический столб от портала к дракону (виден всем игрокам с земли)
particle dust_color_transition{from_color:[0.85,0.1,1.0],scale:2.5,to_color:[0.15,0.0,0.4]} 0 66 0 0.4 12 0.4 0.05 35 force @a
particle reverse_portal 0 78 0 0.8 12 0.8 0.04 25 force @a
particle end_rod 0 75 0 0.2 12 0.2 0.02 10 force @a

# 2. Колоссальное втягивание космической материи в пасть дракона
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle reverse_portal ~ ~ ~ 5.0 3.0 5.0 0.15 45 force @a
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle dust_color_transition{from_color:[1.0,0.25,1.0],scale:3.0,to_color:[0.15,0.0,0.4]} ~ ~ ~ 3.5 2.5 3.5 0.1 30 force @a
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle electric_spark ~ ~ ~ 3 2 3 0.08 20 force @a
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle dragon_breath ~ ~ ~ 2 1 2 0.04 15 force @a

# 3. Звуки нарастающего сердцебиения Вардена и аметистового резонанса (без warden roar!)
# 0..40 тиков (каждые 20 тиков, питч 0.50)
execute if score #final_breath_timer ste_cos.timer matches 1 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 1 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 1 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 20 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 20 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 20 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 40 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 40 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.50
execute if score #final_breath_timer ste_cos.timer matches 40 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

# 41..80 тиков (каждые 14 тиков, питч 0.62)
execute if score #final_breath_timer ste_cos.timer matches 54 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.62
execute if score #final_breath_timer ste_cos.timer matches 54 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.60
execute if score #final_breath_timer ste_cos.timer matches 54 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 68 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.62
execute if score #final_breath_timer ste_cos.timer matches 68 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.60
execute if score #final_breath_timer ste_cos.timer matches 68 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 80 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.62
execute if score #final_breath_timer ste_cos.timer matches 80 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.60
execute if score #final_breath_timer ste_cos.timer matches 80 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

# 81..110 тиков (каждые 8 тиков, питч 0.75)
execute if score #final_breath_timer ste_cos.timer matches 88 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.75
execute if score #final_breath_timer ste_cos.timer matches 88 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.75
execute if score #final_breath_timer ste_cos.timer matches 88 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 96 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.75
execute if score #final_breath_timer ste_cos.timer matches 96 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.75
execute if score #final_breath_timer ste_cos.timer matches 96 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 104 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.75
execute if score #final_breath_timer ste_cos.timer matches 104 run playsound block.amethyst_block.resonate hostile @a 0 90 0 100.0 0.75
execute if score #final_breath_timer ste_cos.timer matches 104 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

# 111..139 тиков (каждые 4 тика, питч 0.95 — бешеный пульс перед взрывом)
execute if score #final_breath_timer ste_cos.timer matches 112 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.95
execute if score #final_breath_timer ste_cos.timer matches 112 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 116 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.95
execute if score #final_breath_timer ste_cos.timer matches 116 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 120 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.95
execute if score #final_breath_timer ste_cos.timer matches 120 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 124 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.95
execute if score #final_breath_timer ste_cos.timer matches 124 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 128 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.95
execute if score #final_breath_timer ste_cos.timer matches 128 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 132 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.95
execute if score #final_breath_timer ste_cos.timer matches 132 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

execute if score #final_breath_timer ste_cos.timer matches 136 run playsound entity.warden.heartbeat hostile @a 0 90 0 100.0 0.95
execute if score #final_breath_timer ste_cos.timer matches 136 as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a

# 140 тиков (7.0 сек): ЗАЛП ФИНАЛЬНОГО ВЗДОХА!
execute if score #final_breath_timer ste_cos.timer matches 140.. as @e[type=ender_dragon,tag=ste_cos.final_breath_active,limit=1] at @s run function ste_cos:final_breath/blast
