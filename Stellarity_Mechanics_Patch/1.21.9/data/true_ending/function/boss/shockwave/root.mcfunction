# true_ending:boss/shockwave/root
scoreboard players add @s trueEnding_count 1
particle dragon_breath ~ ~ ~ 0.25 0.2 0.25 0.02 3 force @a[distance=..256]
particle dust_color_transition{from_color:[0.85,0.25,1.0],scale:1.4,to_color:[0.4,0.0,0.6]} ~ ~ ~ 0.2 0.2 0.2 0.02 2 force @a[distance=..256]

execute unless score @s trueEnding_count matches 40.. at @s if predicate true_ending:chance/50_percent run tp @s ^ ^ ^.7
execute if score @s trueEnding_count matches 40.. at @s facing 0 80 0 run tp @s ^.6 ^ ^ ~90 0

execute unless score @s trueEnding_count matches 40.. at @s run tp @s ~ ~ ~ ~1 ~
execute unless score @s trueEnding_count matches 40.. if predicate true_ending:chance/50_percent at @s run tp @s ~ ~.2 ~
execute unless score @s trueEnding_count matches 40.. if predicate true_ending:chance/50_percent at @s run tp @s ~ ~-.2 ~

execute unless entity @e[distance=..256,type=ender_dragon] run kill @s
