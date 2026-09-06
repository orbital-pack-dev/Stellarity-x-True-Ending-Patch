# ste_cos:minigame_clones/arrive_carrier
# прибытие в точку 28 85 0, спешивание дракона и переход к поэтапному призыву копий

execute as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] run ride @s dismount
kill @e[type=armor_stand,tag=ste_cos.minigame_carrier]

scoreboard players set #minigame_state ste_cos.flags 3
scoreboard players set #summon_stage_timer ste_cos.timer 0
scoreboard players set #carousel_active ste_cos.flags 0
scoreboard players set #carousel_timer ste_cos.timer 0
scoreboard players set #minigame_resolved ste_cos.flags 0

# создание центрального маркера карусели в 0 85 0 (угол -90 для старта в 28 85 0)
kill @e[type=marker,tag=ste_cos.carousel_center]
summon marker 0 85 0 {Rotation:[-90.0f,0.0f],Tags:["ste_cos.carousel_center"]}

playsound entity.ender_dragon.flap master @a 28 85 0 2.0 1.0
particle flash{color:[0.75,0.15,0.95,1.0]} 28 85 0 0 0 0 0 1 force
