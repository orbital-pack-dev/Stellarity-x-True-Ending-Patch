# ste_cos:minigame_clones/start_ascend
# начало плавного взлета дракона к 0 128 0

scoreboard players set #minigame_state ste_cos.flags 2
scoreboard players set #ascend_tick ste_cos.timer 0
tag @s remove stellarity.to_portal
data modify entity @s DragonPhase set value 5
playsound entity.ender_dragon.growl master @a ~ ~ ~ 32.0 1.0
