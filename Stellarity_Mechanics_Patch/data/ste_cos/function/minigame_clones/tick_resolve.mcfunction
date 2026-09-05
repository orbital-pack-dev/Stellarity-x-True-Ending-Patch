# ste_cos:minigame_clones/tick_resolve
# поэтапное завершение мини-игры:
# 0..59 тиков (3 сек): эффект попадания, копии пикируют
# 60 тиков: дракон освобождается и отпускается на портал (tag stellarity.to_portal)
# 110 тиков (еще 2.5 сек): копии исчезли; если провал -> атака лучом!

scoreboard players add #minigame_resolve_timer ste_cos.timer 1

# 3 секунды (60 тиков): освобождение дракона и направление к порталу
execute if score #minigame_resolve_timer ste_cos.timer matches 60 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run tag @s add stellarity.to_portal
execute if score #minigame_resolve_timer ste_cos.timer matches 60 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run data modify entity @s DragonPhase set value 0
execute if score #minigame_resolve_timer ste_cos.timer matches 60 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run playsound entity.ender_dragon.flap master @a[distance=..16] ~ ~ ~ 1.0 1.0

# 110 тиков (еще 2.5 секунды): финальное разрешение
# если был провал (outcome = 2) -> атака лучом!
execute if score #minigame_resolve_timer ste_cos.timer matches 110.. if score #minigame_outcome ste_cos.flags matches 2 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] run scoreboard players set @s trueEnding_bosstime 2200
execute if score #minigame_resolve_timer ste_cos.timer matches 110.. if score #minigame_outcome ste_cos.flags matches 2 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] run data modify entity @s DragonPhase set value 3

# снятие тегов мини-игры и очистка маркера центра
execute if score #minigame_resolve_timer ste_cos.timer matches 110.. run execute as @e[type=ender_dragon,tag=ste_cos.minigame_real] run tag @s remove ste_cos.minigame_active
execute if score #minigame_resolve_timer ste_cos.timer matches 110.. run execute as @e[type=ender_dragon,tag=ste_cos.minigame_real] run tag @s remove ste_cos.minigame_real
execute if score #minigame_resolve_timer ste_cos.timer matches 110.. run kill @e[type=marker,tag=ste_cos.carousel_center]
execute if score #minigame_resolve_timer ste_cos.timer matches 110.. run scoreboard players set #minigame_state ste_cos.flags 0
