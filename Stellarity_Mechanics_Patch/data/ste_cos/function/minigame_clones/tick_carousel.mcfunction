# ste_cos:minigame_clones/tick_carousel
# синхронное движение 3 драконов по кругу (R=28) вокруг 0 128 0

scoreboard players add #carousel_timer ste_cos.timer 1

# вращение центрального маркера карусели
execute as @e[type=marker,tag=ste_cos.carousel_center] at @s run tp @s ~ ~ ~ ~2.5 0

# синхронная расстановка драконов с интервалом 120 градусов (дистанция между драконами ~48 блоков)
execute as @e[type=marker,tag=ste_cos.carousel_center] at @s rotated ~ 0 run tp @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] ^ ^ ^28 ~90 0
execute as @e[type=marker,tag=ste_cos.carousel_center] at @s rotated ~120 0 run tp @e[type=ender_dragon,tag=ste_cos.clone_1,limit=1] ^ ^ ^28 ~90 0
execute as @e[type=marker,tag=ste_cos.carousel_center] at @s rotated ~240 0 run tp @e[type=ender_dragon,tag=ste_cos.clone_2,limit=1] ^ ^ ^28 ~90 0

# звуки взмахов крыльев
execute if score #carousel_timer ste_cos.timer matches 10 25 40 55 70 85 100 115 130 145 160 175 190 205 220 235 250 265 280 295 310 325 340 355 370 385 run playsound entity.ender_dragon.flap hostile @a 0 128 0 32.0 1.0

# шлейфы частиц (оригинал: светлый пепел ash, копии: темная пыль dust)
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s run particle ash ~ ~ ~ 0.8 0.4 0.8 0.01 14 force
execute as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s run particle dust{color:[0.08,0.02,0.12],scale:1.8} ~ ~ ~ 0.8 0.4 0.8 0.01 14 force

# детекция урона через HurtTime (точно по рекомендации пользователя)
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] if data entity @s {HurtTime:10s} run function ste_cos:minigame_clones/success
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] if data entity @s {HurtTime:9s} run function ste_cos:minigame_clones/success
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] if data entity @s {HurtTime:10s} run function ste_cos:minigame_clones/fail
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] if data entity @s {HurtTime:9s} run function ste_cos:minigame_clones/fail

# дополнительная проверка попадания снарядов в радиусе 5.5 блоков (стрелы, трезубцы, снежки)
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s if entity @e[type=arrow,distance=..5.5] run function ste_cos:minigame_clones/success
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s if entity @e[type=spectral_arrow,distance=..5.5] run function ste_cos:minigame_clones/success
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s if entity @e[type=thrown_trident,distance=..5.5] run function ste_cos:minigame_clones/success
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.minigame_real] at @s if entity @e[type=snowball,distance=..5.5] run function ste_cos:minigame_clones/success

execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s if entity @e[type=arrow,distance=..5.5] run function ste_cos:minigame_clones/fail
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s if entity @e[type=spectral_arrow,distance=..5.5] run function ste_cos:minigame_clones/fail
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s if entity @e[type=thrown_trident,distance=..5.5] run function ste_cos:minigame_clones/fail
execute if score #minigame_resolved ste_cos.flags matches 0 as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s if entity @e[type=snowball,distance=..5.5] run function ste_cos:minigame_clones/fail

# таймаут: если за 20 секунд игрок не выстрелил ни в кого — провал
execute if score #carousel_timer ste_cos.timer matches 400.. run function ste_cos:minigame_clones/fail
