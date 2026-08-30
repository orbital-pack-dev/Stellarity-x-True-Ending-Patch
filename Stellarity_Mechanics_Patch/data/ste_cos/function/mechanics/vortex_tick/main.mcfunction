# ste_cos:mechanics/vortex_tick/main
# Вихрь

# Механика боя
execute store result score @s ste_cos.flying run data get entity @s FallFlying

execute if score @s ste_cos.flying matches 1 run function ste_cos:mechanics/vortex_tick/flight

execute if score @s ste_cos.flying matches 0 run function ste_cos:mechanics/vortex_tick/ground

# Механика боя
scoreboard players operation @s ste_cos.was_flying = @s ste_cos.flying
