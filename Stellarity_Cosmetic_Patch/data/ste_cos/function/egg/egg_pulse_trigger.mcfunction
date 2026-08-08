# ste_cos:egg/egg_pulse_trigger
# Переключает фазу и вызывает нужный пульс

execute if score @s ste_cos.id matches 0 run function ste_cos:egg/egg_pulse_bright
execute if score @s ste_cos.id matches 1 run function ste_cos:egg/egg_pulse_dark

# Переключаем 0 -> 1 -> 0
scoreboard players add @s ste_cos.id 1
execute if score @s ste_cos.id matches 2.. run scoreboard players set @s ste_cos.id 0
