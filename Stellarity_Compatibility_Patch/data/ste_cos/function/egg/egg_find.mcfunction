# ste_cos:egg/egg_find
# поиск яйца дракона

execute if score @s ste_cos.search_stage matches 0 run function ste_cos:egg/egg_find_page_0
execute if score @s ste_cos.search_stage matches 1 run function ste_cos:egg/egg_find_page_1
execute if score @s ste_cos.search_stage matches 2 run function ste_cos:egg/egg_find_page_2
execute if score @s ste_cos.search_stage matches 3 run function ste_cos:egg/egg_find_page_3
execute if score @s ste_cos.search_stage matches 4 run function ste_cos:egg/egg_find_page_4
execute if score @s ste_cos.search_stage matches 5 run function ste_cos:egg/egg_find_page_5
execute if score @s ste_cos.search_stage matches 6 run function ste_cos:egg/egg_find_page_6
execute if score @s ste_cos.search_stage matches 7 run function ste_cos:egg/egg_find_page_7
execute if score @s ste_cos.search_stage matches 8 run function ste_cos:egg/egg_find_page_8
execute if score @s ste_cos.search_stage matches 9 run function ste_cos:egg/egg_find_page_9
execute if score @s ste_cos.search_stage matches 10 run function ste_cos:egg/egg_find_page_10
execute if score @s ste_cos.search_stage matches 11 run function ste_cos:egg/egg_find_page_11
execute if score @s ste_cos.search_stage matches 12 run function ste_cos:egg/egg_find_page_12
execute if score @s ste_cos.search_stage matches 13 run function ste_cos:egg/egg_find_page_13
execute if score @s ste_cos.search_stage matches 14 run function ste_cos:egg/egg_find_page_14
execute if score @s ste_cos.search_stage matches 15 run function ste_cos:egg/egg_find_page_15
execute if score @s ste_cos.search_stage matches 16 run function ste_cos:egg/egg_find_page_16
execute if score @s ste_cos.search_stage matches 17 run function ste_cos:egg/egg_find_page_17
execute if score @s ste_cos.search_stage matches 18 run function ste_cos:egg/egg_find_page_18

scoreboard players add @s ste_cos.search_stage 1
execute if score @s ste_cos.search_stage matches 19.. run scoreboard players set @s ste_cos.search_stage 0
