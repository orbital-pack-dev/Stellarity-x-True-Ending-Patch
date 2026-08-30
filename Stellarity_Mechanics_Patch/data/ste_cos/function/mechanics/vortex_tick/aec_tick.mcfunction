# ste_cos:mechanics/vortex_tick/aec_tick
# Механика боя

tp @s @p[predicate=ste_cos:enchantment/has_vortex]

# Механика боя
execute as @p[distance=..2,predicate=ste_cos:enchantment/has_vortex] run attribute @s minecraft:gravity base set 0.056
# 0.08 * 0.7 = 0.056

# Механика боя
execute at @s run particle minecraft:dust_color_transition{from_color:[0.500,0.500,1.000],scale:1,to_color:[0.800,0.800,1.000]} ~ ~1 ~ 0.5 0.5 0.5 0.05 3 normal
execute at @s run particle minecraft:end_rod ~ ~1 ~ 0.2 0.2 0.2 0.01 1 normal

# Механика боя
scoreboard players add @s ste_cos.timer 1

execute if score @s ste_cos.timer matches 10 as @p[distance=..2,predicate=ste_cos:enchantment/has_vortex] at @s run tp @s ^ ^ ^0.5

execute if score @s ste_cos.timer matches 20.. as @p[distance=..2] at @s positioned ^ ^ ^1 if block ~ ~ ~ #minecraft:impermeable run kill @s
execute if score @s ste_cos.timer matches 20.. as @p[distance=..2,predicate=ste_cos:enchantment/has_vortex] at @s run tp @s ^ ^ ^0.5
execute if score @s ste_cos.timer matches 20.. run scoreboard players set @s ste_cos.timer 0
