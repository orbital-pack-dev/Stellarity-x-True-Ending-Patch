# ste_cos:minigame_clones/start_ascend
# начало плавного взлета дракона к 0 128 0

scoreboard players set #minigame_state ste_cos.flags 2
scoreboard players set #ascend_tick ste_cos.timer 0
tag @s remove stellarity.to_portal
data modify entity @s DragonPhase set value 3
data modify entity @s Motion set value [-0.038d, 1.508d, -0.041d]
playsound entity.ender_dragon.growl master @a[distance=..32] ~ ~ ~ 1.0 1.0
