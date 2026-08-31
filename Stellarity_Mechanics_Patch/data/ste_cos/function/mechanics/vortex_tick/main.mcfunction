# ste_cos:mechanics/vortex_tick/main
# Вихрь

# Читаем: летит ли игрок прямо сейчас (FallFlying = 1 когда элитры активны)
execute store result score @s ste_cos.flying run data get entity @s FallFlying

# Ветка полёта
execute if score @s ste_cos.flying matches 1 run function ste_cos:mechanics/vortex_tick/flight

# Ветка земли
execute if score @s ste_cos.flying matches 0 run function ste_cos:mechanics/vortex_tick/ground

# Сохраняем состояние для определения момента взлёта
scoreboard players operation @s ste_cos.was_flying = @s ste_cos.flying
