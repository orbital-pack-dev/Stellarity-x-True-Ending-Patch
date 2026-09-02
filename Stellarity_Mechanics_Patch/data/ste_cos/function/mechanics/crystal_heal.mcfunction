# ste_cos:mechanics/crystal_heal
# лечение дракона от кристаллов

execute store result score @s ste_cos.health run data get entity @s Health
scoreboard players add @s ste_cos.health 4

execute if score @s ste_cos.health matches 300.. run scoreboard players set @s ste_cos.health 300
execute store result entity @s Health float 1 run scoreboard players get @s ste_cos.health

execute store result score @s stellarity.dragon.health run data get entity @s Health
execute store result score @s stellarity.dragon.health_old run data get entity @s Health
