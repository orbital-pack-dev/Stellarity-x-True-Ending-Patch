# ste_cos:final_breath/totem_feather_consumed
# срабатывание тотема пера

tag @s remove ste_cos.has_death_feather

# перенос к порталу
tp @s 0 67 0 0 0
data modify entity @s DragonPhase set value 10
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
data modify entity @s Invulnerable set value 1b

tag @s add trueEnding_inattack
tag @s add ste_cos.final_breath_active
tag @s add ste_cos.final_breath_ascending
tag @s remove stellarity.to_portal
tag @s remove ste_cos.final_breath_guided

scoreboard players set @s trueEnding_bosstime 0
scoreboard players set #final_breath_used ste_cos.flags 1
scoreboard players set #final_breath_state ste_cos.flags 2
scoreboard players set #fb_ascend_tick ste_cos.timer 0

# здоровье 1 ХП
scoreboard players set @s ste_cos.health 1
scoreboard players set @s ste_cos.health_old 1
scoreboard players set @s stellarity.dragon.health 1
scoreboard players set @s stellarity.dragon.health_old 1
bossbar set stellarity:ender_dragon value 1

# слабость игрокам
effect give @a weakness 8 10 true

# звуки фазы
playsound entity.ender_dragon.growl master @a 0 67 0 64.0 0.8
playsound entity.warden.heartbeat master @a 0 67 0 64.0 0.5
playsound block.amethyst_block.resonate master @a 0 67 0 64.0 0.5
