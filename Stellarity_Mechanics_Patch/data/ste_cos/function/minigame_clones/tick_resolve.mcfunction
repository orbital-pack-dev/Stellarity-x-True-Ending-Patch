# ste_cos:minigame_clones/tick_resolve
# завершение мини-игры иллюзорных драконов

scoreboard players add #minigame_resolve_timer ste_cos.timer 1

# ==========================================
# СЦЕНАРИЙ 1: ПРАВИЛЬНЫЙ ВЫБОР (УСПЕХ)
# ==========================================
# 40 тиков: настоящий дракон отпускается к порталу и возвращается в бой
execute if score #minigame_outcome ste_cos.flags matches 1 if score #minigame_resolve_timer ste_cos.timer matches 40 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run tag @s add stellarity.to_portal
execute if score #minigame_outcome ste_cos.flags matches 1 if score #minigame_resolve_timer ste_cos.timer matches 40 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run data modify entity @s DragonPhase set value 0
execute if score #minigame_outcome ste_cos.flags matches 1 if score #minigame_resolve_timer ste_cos.timer matches 40 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 2.0 1.0
execute if score #minigame_outcome ste_cos.flags matches 1 if score #minigame_resolve_timer ste_cos.timer matches 40 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run tag @s remove trueEnding_inattack
execute if score #minigame_outcome ste_cos.flags matches 1 if score #minigame_resolve_timer ste_cos.timer matches 40 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run tag @s remove ste_cos.minigame_real
execute if score #minigame_outcome ste_cos.flags matches 1 if score #minigame_resolve_timer ste_cos.timer matches 40 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run tag @s remove ste_cos.minigame_active

# 80 тиков: завершение состояния мини-игры
execute if score #minigame_outcome ste_cos.flags matches 1 if score #minigame_resolve_timer ste_cos.timer matches 80.. run kill @e[type=marker,tag=ste_cos.carousel_center]
execute if score #minigame_outcome ste_cos.flags matches 1 if score #minigame_resolve_timer ste_cos.timer matches 80.. run kill @e[type=marker,tag=ste_cos.feedback_projectile]
execute if score #minigame_outcome ste_cos.flags matches 1 if score #minigame_resolve_timer ste_cos.timer matches 80.. run scoreboard players set #minigame_state ste_cos.flags 0

# ==========================================
# СЦЕНАРИЙ 2: НЕПРАВИЛЬНЫЙ ВЫБОР / ТАЙМАУТ (ПРОВАЛ)
# ==========================================
# 10 тиков: обе копии пикируют со своих позиций орбиты с частицами засасывания
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 10 as @e[type=ender_dragon,tag=ste_cos.clone_1] at @s run function ste_cos:minigame_clones/clone_dive
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 10 as @e[type=ender_dragon,tag=ste_cos.clone_2] at @s run function ste_cos:minigame_clones/clone_dive
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 10 run playsound entity.ender_dragon.growl master @a 0 85 0 2.0 1.2

# 50 тиков: настоящий дракон начинает лазерную атаку True Ending
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 50 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] run scoreboard players set @s trueEnding_bosstime 2200
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 50 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] run data modify entity @s DragonPhase set value 3
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 50 run execute as @e[type=ender_dragon] run tag @s remove ste_cos.minigame_active
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 50 run execute as @e[type=ender_dragon] run tag @s remove ste_cos.minigame_real
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 50 run execute as @e[type=ender_dragon] run tag @s remove trueEnding_inattack
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 50 run kill @e[type=marker,tag=ste_cos.carousel_center]
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 50 run kill @e[type=marker,tag=ste_cos.feedback_projectile]
execute if score #minigame_outcome ste_cos.flags matches 2 if score #minigame_resolve_timer ste_cos.timer matches 50 run scoreboard players set #minigame_state ste_cos.flags 0
