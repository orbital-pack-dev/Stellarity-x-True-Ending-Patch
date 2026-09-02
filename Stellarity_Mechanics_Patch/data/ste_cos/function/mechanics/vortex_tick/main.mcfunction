# ste_cos:mechanics/vortex_tick/main
# диспетчер чар вихря на игроке

# проверка состояния полета
execute store result score @s ste_cos.flying run data get entity @s FallFlying

# полет
execute if score @s ste_cos.flying matches 1 run function ste_cos:mechanics/vortex_tick/flight

# на земле
execute if score @s ste_cos.flying matches 0 run function ste_cos:mechanics/vortex_tick/ground

# сохранение предыдущего состояния
scoreboard players operation @s ste_cos.was_flying = @s ste_cos.flying
