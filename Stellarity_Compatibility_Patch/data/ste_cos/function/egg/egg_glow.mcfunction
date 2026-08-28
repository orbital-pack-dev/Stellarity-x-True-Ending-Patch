# ste_cos:egg/egg_glow
# Яйцо дракона
# Механика боя

# Яйцо дракона
# Механика боя
scoreboard players set @s ste_cos.search_stage 0

# Механика боя
scoreboard players add @s ste_cos.flags 1

execute align xyz positioned ~0.5 ~0.05 ~0.5 run function ste_cos:egg/egg_ambient

# Механика боя
execute if score @s ste_cos.flags matches 40 align xyz positioned ~0.5 ~0.05 ~0.5 run function ste_cos:egg/egg_wave
execute if score @s ste_cos.flags matches 40.. run scoreboard players set @s ste_cos.flags 0

# Механика боя
execute if score @s ste_cos.flags matches 3 align xyz positioned ~0.5 ~0.05 ~0.5 run particle enchant ~ ~ ~ 0 0 0 1 2 force

# Механика боя
execute if score @s ste_cos.flags matches 0 align xyz positioned ~0.5 ~0.05 ~0.5 run function ste_cos:egg/egg_pulse_trigger

