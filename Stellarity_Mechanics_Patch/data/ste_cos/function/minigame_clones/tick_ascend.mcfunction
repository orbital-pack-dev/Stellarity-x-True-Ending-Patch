# ste_cos:minigame_clones/tick_ascend
# плавный взлет дракона из-под земли/портала на высоту 128 (без грубого ТП)

scoreboard players add #ascend_tick ste_cos.timer 1

execute as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run tp @s ~ ~1.5 ~
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s run particle dragon_breath ~ ~ ~ 0.5 0.5 0.5 0.05 8 force

execute if score #ascend_tick ste_cos.timer matches 1 run playsound entity.ender_dragon.flap hostile @a 0 100 0 16.0 1.0
execute if score #ascend_tick ste_cos.timer matches 10 run playsound entity.ender_dragon.flap hostile @a 0 100 0 16.0 1.0
execute if score #ascend_tick ste_cos.timer matches 20 run playsound entity.ender_dragon.flap hostile @a 0 100 0 16.0 1.0
execute if score #ascend_tick ste_cos.timer matches 30 run playsound entity.ender_dragon.flap hostile @a 0 100 0 16.0 1.0
execute if score #ascend_tick ste_cos.timer matches 40 run playsound entity.ender_dragon.flap hostile @a 0 100 0 16.0 1.0

# достижение высоты 128 (или 42 тика) -> призыв копий и старт карусели
execute if score #ascend_tick ste_cos.timer matches 42.. run function ste_cos:minigame_clones/spawn_clones
