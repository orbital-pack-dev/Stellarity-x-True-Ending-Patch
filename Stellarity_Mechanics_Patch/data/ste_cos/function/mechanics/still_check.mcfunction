# ste_cos:mechanics/still_check
# Механика боя
# Вихрь
# Механика боя

scoreboard players operation @s ste_cos.walk += @s ste_cos.sprint
scoreboard players operation @s ste_cos.walk += @s ste_cos.crouch
scoreboard players operation @s ste_cos.walk += @s ste_cos.swim
scoreboard players operation @s ste_cos.walk += @s ste_cos.fall

# Механика боя
execute if score @s ste_cos.walk matches 0 if data entity @s {OnGround:1b} run scoreboard players add @s ste_cos.still_timer 1
execute unless score @s ste_cos.walk matches 0 run scoreboard players set @s ste_cos.still_timer 0
execute unless data entity @s {OnGround:1b} run scoreboard players set @s ste_cos.still_timer 0

# Механика боя
scoreboard players set @s ste_cos.walk 0
scoreboard players set @s ste_cos.sprint 0
scoreboard players set @s ste_cos.crouch 0
scoreboard players set @s ste_cos.swim 0
scoreboard players set @s ste_cos.fall 0

# Вихрь
execute if score @s ste_cos.still_timer matches 260.. at @s run function ste_cos:mechanics/vortex_trigger
