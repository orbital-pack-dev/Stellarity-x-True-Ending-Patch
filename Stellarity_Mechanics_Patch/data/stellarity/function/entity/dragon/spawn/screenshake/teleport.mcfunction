# stellarity:entity/dragon/spawn/screenshake/teleport
# безопасная тряска экрана без улетания в космос и без лагов на Paper

execute if entity @s[nbt={abilities:{flying:1b}}] run return 0

scoreboard players add #screenshake_tick ste_cos.timer 1
execute if score #screenshake_tick ste_cos.timer matches 2.. run scoreboard players set #screenshake_tick ste_cos.timer 0

execute if score #screenshake_tick ste_cos.timer matches 1 run tp @s ~ ~0.015 ~
execute if score #screenshake_tick ste_cos.timer matches 0 run tp @s ~ ~-0.015 ~
