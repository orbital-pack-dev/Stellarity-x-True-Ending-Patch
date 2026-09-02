# ste_cos:portal/fix_tick
# починка центрального портала

# вспомогательные кристаллы на первом тике
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal 4 62 0 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal -4 62 0 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal 0 62 4 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal 0 62 -4 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}

# удаление кристаллов и факелов через шесть секунд
execute if score #portal_fix ste_cos.timer matches 120 run kill @e[type=end_crystal,tag=ste_cos_portal_fix]
execute if score #portal_fix ste_cos.timer matches 120 positioned 0 65 0 run fill ~-4 ~-2 ~-4 ~4 ~4 ~4 air replace torch
execute if score #portal_fix ste_cos.timer matches 120 positioned 0 65 0 run fill ~-4 ~-2 ~-4 ~4 ~4 ~4 air replace wall_torch

# проверка лежащих предметов пока идет починка
execute if score #portal_fix ste_cos.timer matches 1..360 positioned 0 64 0 as @e[type=item,distance=..150,tag=!ste_cos_item_checked] run function ste_cos:portal/check_item
