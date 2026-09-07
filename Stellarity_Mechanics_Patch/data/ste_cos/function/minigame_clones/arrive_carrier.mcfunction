# ste_cos:minigame_clones/arrive_carrier
# прибытие носителя

execute as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] run ride @s dismount
kill @e[type=armor_stand,tag=ste_cos.minigame_carrier]

scoreboard players set #minigame_state ste_cos.flags 3
scoreboard players set #carousel_active ste_cos.flags 1
scoreboard players set #carousel_timer ste_cos.timer 0
scoreboard players set #minigame_resolved ste_cos.flags 0

# центр карусели
kill @e[type=marker,tag=ste_cos.carousel_center]
summon marker 0 85 0 {Rotation:[-90.0f,0.0f],Tags:["ste_cos.carousel_center"]}

# призыв копий
function ste_cos:minigame_clones/summon_clone_1
function ste_cos:minigame_clones/summon_clone_2

playsound entity.ender_dragon.growl master @a 0 85 0 3.0 1.0
playsound entity.illusioner.cast_spell master @a 28 85 0 2.0 1.0
particle flash{color:[0.75,0.15,0.95,1.0]} 28 85 0 0 0 0 0 1 force
