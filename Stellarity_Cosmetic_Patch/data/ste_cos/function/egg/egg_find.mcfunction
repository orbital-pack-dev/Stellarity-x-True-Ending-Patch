execute unless score @s ste_cos.search_stage matches 1 run function ste_cos:egg/egg_find_tier1
execute unless score @s ste_cos.search_stage matches 1 unless block ~ ~ ~ minecraft:dragon_egg run scoreboard players set @s ste_cos.search_stage 1
execute if score @s ste_cos.search_stage matches 1 run function ste_cos:egg/egg_find_tier2_page000
