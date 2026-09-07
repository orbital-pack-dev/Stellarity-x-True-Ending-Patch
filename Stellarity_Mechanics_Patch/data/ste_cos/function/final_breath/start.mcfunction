# ste_cos:final_breath/start
# старт взлета

scoreboard players set #final_breath_state ste_cos.flags 2
scoreboard players set #fb_ascend_tick ste_cos.timer 0

tag @s remove stellarity.to_portal
tag @s remove ste_cos.final_breath_guided
tag @s add ste_cos.final_breath_ascending
tag @s add ste_cos.final_breath_active
tag @s add trueEnding_inattack
tag @s add stellarity.at_portal

# слабость игрокам
effect give @a weakness 8 10 true

# неуязвимость
attribute @s minecraft:armor base set 1000
attribute @s minecraft:armor_toughness base set 1000
data modify entity @s Invulnerable set value 1b

# фаза парения
data modify entity @s DragonPhase set value 10
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]

# звуки
playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 0.8
playsound entity.warden.heartbeat master @a ~ ~ ~ 64.0 0.5
playsound block.amethyst_block.resonate master @a ~ ~ ~ 64.0 0.5
