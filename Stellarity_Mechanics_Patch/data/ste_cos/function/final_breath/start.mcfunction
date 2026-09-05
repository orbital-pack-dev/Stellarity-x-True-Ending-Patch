# ste_cos:final_breath/start
# старт ультимативной атаки: взлет над порталом в 0 90 0 и включение абсолютной защиты

scoreboard players set #final_breath_used ste_cos.flags 1
scoreboard players set #final_breath_timer ste_cos.timer 0
tag @s add ste_cos.final_breath_active
tag @s add trueEnding_inattack
tag @s remove stellarity.to_portal

# взлет над порталом
data modify entity @s DragonPhase set value 3
tp @s 0 90 0

# абсолютная неуязвимость на время зарядки (НЕЛЬЗЯ УДАРИТЬ!)
attribute @s minecraft:armor base set 1000
attribute @s minecraft:armor_toughness base set 1000
data modify entity @s Invulnerable set value 1b

# начальный глубокий звук
playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 0.8
playsound block.respawn_anchor.charge master @a ~ ~ ~ 64.0 0.6
