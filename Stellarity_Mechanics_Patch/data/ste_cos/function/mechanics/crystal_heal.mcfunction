# ste_cos:mechanics/crystal_heal
# исцеление дракона

scoreboard objectives add ste_cos.health dummy
scoreboard objectives add ste_cos.health_old dummy

execute store result score @s ste_cos.health run data get entity @s Health 1
execute unless score @s ste_cos.health matches 2.. run return 0

scoreboard players add @s ste_cos.health 4

# лимит 300
scoreboard players set #ste_cos_maxhp ste_cos.flags 300
execute if score @s ste_cos.health > #ste_cos_maxhp ste_cos.flags run scoreboard players operation @s ste_cos.health = #ste_cos_maxhp ste_cos.flags

# запись здоровья
execute if score @s ste_cos.health matches 2.. store result entity @s Health float 1 run scoreboard players get @s ste_cos.health

execute store result score @s stellarity.dragon.health run data get entity @s Health 1
execute store result score @s stellarity.dragon.health_old run data get entity @s Health 1
execute store result score @s ste_cos.health_old run data get entity @s Health 1
