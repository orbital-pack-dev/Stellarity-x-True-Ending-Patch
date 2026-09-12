# ste_cos:egg/egg_pulse_trigger

execute if score #egg_pulse_id ste_cos.flags matches 0 run function ste_cos:egg/egg_pulse_bright
execute if score #egg_pulse_id ste_cos.flags matches 1 run function ste_cos:egg/egg_pulse_dark

# шаг
scoreboard players add #egg_pulse_id ste_cos.flags 1
execute if score #egg_pulse_id ste_cos.flags matches 2.. run scoreboard players set #egg_pulse_id ste_cos.flags 0
