# ste_cos:egg/egg_glow
# эффекты вокруг яйца

scoreboard players set @s ste_cos.search_stage 0
scoreboard players add @s ste_cos.flags 1

# постоянный фоновый звук и частицы
execute align xyz positioned ~0.5 ~0.05 ~0.5 run function ste_cos:egg/egg_ambient

# волна каждые сорок тиков
execute if score @s ste_cos.flags matches 40 align xyz positioned ~0.5 ~0.05 ~0.5 run function ste_cos:egg/egg_wave
execute if score @s ste_cos.flags matches 40.. run scoreboard players set @s ste_cos.flags 0

# редкие искры чар
execute if score @s ste_cos.flags matches 3 align xyz positioned ~0.5 ~0.05 ~0.5 run particle enchant ~ ~ ~ 0 0 0 1 2 force

# импульс света
execute if score @s ste_cos.flags matches 0 align xyz positioned ~0.5 ~0.05 ~0.5 run function ste_cos:egg/egg_pulse_trigger
