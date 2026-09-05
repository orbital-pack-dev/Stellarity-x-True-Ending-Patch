# ste_cos:minigame_clones/tick_ascend
# плавный взлет дракона из-под земли/портала на высоту 128 (без грубого ТП)

scoreboard players add #ascend_tick ste_cos.timer 1

execute as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run particle dragon_breath ~ ~ ~ 0.5 0.5 0.5 0.05 8 force

execute if score #ascend_tick ste_cos.timer matches 1 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0
execute if score #ascend_tick ste_cos.timer matches 10 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0
execute if score #ascend_tick ste_cos.timer matches 20 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0

# достижение высоты 65 или 25 тиков -> призыв копий и старт карусели
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s if entity @s[y=65,dy=40] run function ste_cos:minigame_clones/spawn_clones
execute if score #ascend_tick ste_cos.timer matches 25.. run function ste_cos:minigame_clones/spawn_clones
