scoreboard players add #egg_wave ste_cos.flags 1
execute rotated ~40 0 run particle end_rod ^ ^0.5 ^ ^ ^ ^10000000000000 0.000000000000006 0 force @a[distance=..64]
execute unless score #egg_wave ste_cos.flags matches 9.. rotated ~40 ~ run function ste_cos:egg/egg_wave
execute if score #egg_wave ste_cos.flags matches 9.. run scoreboard players reset #egg_wave ste_cos.flags
