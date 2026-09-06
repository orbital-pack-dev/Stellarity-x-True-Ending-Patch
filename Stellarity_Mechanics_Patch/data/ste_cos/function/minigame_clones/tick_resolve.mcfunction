# ste_cos:minigame_clones/tick_resolve
# поэтапный растянутый таймлайн завершения:
# 0..29 тиков: обратный снаряд летит к глазам игрока
# 30 тиков (1.5 сек): пикирует Копия 1
# 65 тиков (еще 1.75 сек): пикирует Копия 2
# 105 тиков: обе копии завершили пике и удалены
# 110 тиков: настоящий дракон отпускается к порталу
# 160 тиков (еще 2.5 сек): если был провал -> лазер!
# полное снятие тегов и разблокировка ВСЕХ атак True Ending!

scoreboard players add #minigame_resolve_timer ste_cos.timer 1

# 30 тиков: пикирует Копия 1
execute if score #minigame_resolve_timer ste_cos.timer matches 30 as @e[type=ender_dragon,tag=ste_cos.clone_1] at @s run function ste_cos:minigame_clones/clone_dive
execute if score #minigame_resolve_timer ste_cos.timer matches 30 run playsound entity.ender_dragon.growl master @a 0 85 0 2.0 1.2

# 65 тиков: пикирует Копия 2
execute if score #minigame_resolve_timer ste_cos.timer matches 65 as @e[type=ender_dragon,tag=ste_cos.clone_2] at @s run function ste_cos:minigame_clones/clone_dive
execute if score #minigame_resolve_timer ste_cos.timer matches 65 run playsound entity.ender_dragon.growl master @a 0 85 0 2.0 1.1

# 110 тиков: освобождение дракона и направление к порталу
execute if score #minigame_resolve_timer ste_cos.timer matches 110 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run tag @s add stellarity.to_portal
execute if score #minigame_resolve_timer ste_cos.timer matches 110 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run data modify entity @s DragonPhase set value 0
execute if score #minigame_resolve_timer ste_cos.timer matches 110 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 2.0 1.0

# 160 тиков (8 секунд с момента попадания): финальное разрешение
# если был провал (outcome = 2) -> атака лазером True Ending!
execute if score #minigame_resolve_timer ste_cos.timer matches 160.. if score #minigame_outcome ste_cos.flags matches 2 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] run scoreboard players set @s trueEnding_bosstime 2200
execute if score #minigame_resolve_timer ste_cos.timer matches 160.. if score #minigame_outcome ste_cos.flags matches 2 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] run data modify entity @s DragonPhase set value 3

# очистка ВСЕХ тегов атаки и разблокировка последующих атак True Ending
execute if score #minigame_resolve_timer ste_cos.timer matches 160.. run execute as @e[type=ender_dragon] run tag @s remove ste_cos.minigame_active
execute if score #minigame_resolve_timer ste_cos.timer matches 160.. run execute as @e[type=ender_dragon] run tag @s remove ste_cos.minigame_real
execute if score #minigame_resolve_timer ste_cos.timer matches 160.. run execute as @e[type=ender_dragon] run tag @s remove trueEnding_inattack
execute if score #minigame_resolve_timer ste_cos.timer matches 160.. run kill @e[type=marker,tag=ste_cos.carousel_center]
execute if score #minigame_resolve_timer ste_cos.timer matches 160.. run kill @e[type=marker,tag=ste_cos.feedback_projectile]
execute if score #minigame_resolve_timer ste_cos.timer matches 160.. run scoreboard players set #minigame_state ste_cos.flags 0
