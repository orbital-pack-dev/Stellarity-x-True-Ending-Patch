# ste_cos:egg/egg_glow
# вокруг яйца (маркерлесс анимация)

scoreboard players add #egg_glow ste_cos.flags 1

execute align xyz positioned ~0.5 ~0.05 ~0.5 run function ste_cos:egg/egg_ambient

execute if score #egg_glow ste_cos.flags matches 40 align xyz positioned ~0.5 ~0.05 ~0.5 run function ste_cos:egg/egg_wave
execute if score #egg_glow ste_cos.flags matches 40.. run scoreboard players set #egg_glow ste_cos.flags 0

execute if score #egg_glow ste_cos.flags matches 3 align xyz positioned ~0.5 ~0.05 ~0.5 run particle enchant ~ ~ ~ 0 0 0 1 2 force

execute if score #egg_glow ste_cos.flags matches 0 align xyz positioned ~0.5 ~0.05 ~0.5 run function ste_cos:egg/egg_pulse_trigger
