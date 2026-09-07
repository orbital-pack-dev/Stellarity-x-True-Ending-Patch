# ste_cos:minigame_clones/tick_carousel
# карусель клонов

scoreboard players add #carousel_timer ste_cos.timer 1

# вращение центра
execute as @e[type=marker,tag=ste_cos.carousel_center] at @s run tp @s ~ ~ ~ ~2.5 0

# расстановка драконов
execute as @e[type=marker,tag=ste_cos.carousel_center] at @s rotated ~ 0 run tp @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] ^ ^ ^28
execute as @e[type=marker,tag=ste_cos.carousel_center] at @s rotated ~120 0 run tp @e[type=ender_dragon,tag=ste_cos.clone_1,limit=1] ^ ^ ^28
execute as @e[type=marker,tag=ste_cos.carousel_center] at @s rotated ~240 0 run tp @e[type=ender_dragon,tag=ste_cos.clone_2,limit=1] ^ ^ ^28

# ориентация голов по касательной
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s facing 0 85 0 run tp @s ~ ~ ~ ~-90 0
execute as @e[type=ender_dragon,tag=ste_cos.clone_1,limit=1] at @s facing 0 85 0 run tp @s ~ ~ ~ ~-90 0
execute as @e[type=ender_dragon,tag=ste_cos.clone_2,limit=1] at @s facing 0 85 0 run tp @s ~ ~ ~ ~-90 0

# звуки крыльев
scoreboard players add #carousel_flap ste_cos.timer 1
execute if score #carousel_flap ste_cos.timer matches 15.. run playsound entity.ender_dragon.flap hostile @a 0 85 0 16.0 1.0
execute if score #carousel_flap ste_cos.timer matches 15.. run scoreboard players set #carousel_flap ste_cos.timer 0

# ауры драконов
# оригинал
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s run particle flash{color:[0.95,0.45,1.0,1.0]} ~ ~1 ~ 0 0 0 0 1 force
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s run particle end_rod ~ ~1 ~ 0.8 0.4 0.8 0.03 4 force
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s run particle dust_color_transition{from_color:[0.95,0.5,1.0],scale:1.6,to_color:[0.6,0.1,0.8]} ~ ~1 ~ 0.8 0.4 0.8 0.02 6 force

# копии
execute as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s run particle flash{color:[0.68,0.15,0.85,1.0]} ~ ~1 ~ 0 0 0 0 1 force
execute as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s run particle dragon_breath ~ ~1 ~ 0.8 0.4 0.8 0.03 6 force
execute as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s run particle dust_color_transition{from_color:[0.5,0.05,0.7],scale:1.6,to_color:[0.15,0.0,0.3]} ~ ~1 ~ 0.8 0.4 0.8 0.02 6 force

# проверка урона
# провал
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] if data entity @s {HurtTime:10s} run function ste_cos:minigame_clones/fail
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] if data entity @s {HurtTime:9s} run function ste_cos:minigame_clones/fail

# успех
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] if data entity @s {HurtTime:10s} run function ste_cos:minigame_clones/success
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] if data entity @s {HurtTime:9s} run function ste_cos:minigame_clones/success

# снаряды
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s if entity @e[type=arrow,distance=..4.0] run function ste_cos:minigame_clones/fail
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s if entity @e[type=spectral_arrow,distance=..4.0] run function ste_cos:minigame_clones/fail
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s if entity @e[type=trident,distance=..4.0] run function ste_cos:minigame_clones/fail
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s if entity @e[type=snowball,distance=..4.0] run function ste_cos:minigame_clones/fail

execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s if entity @e[type=arrow,distance=..4.0] run function ste_cos:minigame_clones/success
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s if entity @e[type=spectral_arrow,distance=..4.0] run function ste_cos:minigame_clones/success
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s if entity @e[type=trident,distance=..4.0] run function ste_cos:minigame_clones/success
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s if entity @e[type=snowball,distance=..4.0] run function ste_cos:minigame_clones/success

# таймаут
execute if score #carousel_timer ste_cos.timer matches 1600.. run function ste_cos:minigame_clones/fail
