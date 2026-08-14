execute store result score @s ste_cos.health run data get entity @s Health
scoreboard players add @s ste_cos.health 8
execute store result entity @s Health float 1 run scoreboard players get @s ste_cos.health
