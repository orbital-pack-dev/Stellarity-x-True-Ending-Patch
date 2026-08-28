# ste_cos:portal/fix_tick
# Механика боя

# Фикс кристаллов
# Фикс портала
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal 4 62 0 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal -4 62 0 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal 0 62 4 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal 0 62 -4 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}

# Фикс кристаллов
execute if score #portal_fix ste_cos.timer matches 120 run kill @e[type=end_crystal,tag=ste_cos_portal_fix]

# Яйцо дракона
# Механика боя
execute if score #portal_fix ste_cos.timer matches 1..360 positioned 0 64 0 as @e[type=item,distance=..150,tag=!ste_cos_item_checked] run function ste_cos:portal/check_item
