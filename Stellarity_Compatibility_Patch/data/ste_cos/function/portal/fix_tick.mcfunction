# ste_cos:portal/fix_tick
# починка портала

# вспомогательные кристаллы на высоте портала 61
execute if score #portal_fix ste_cos.timer matches 1 in minecraft:the_end run summon end_crystal 4 61 0 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 in minecraft:the_end run summon end_crystal -4 61 0 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 in minecraft:the_end run summon end_crystal 0 61 4 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 in minecraft:the_end run summon end_crystal 0 61 -4 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}

# удаление кристаллов и факелов
execute if score #portal_fix ste_cos.timer matches 120 in minecraft:the_end run kill @e[type=end_crystal,tag=ste_cos_portal_fix]
execute if score #portal_fix ste_cos.timer matches 120 in minecraft:the_end positioned 0 61 0 run fill ~-4 ~-2 ~-4 ~4 ~4 ~4 air replace torch
execute if score #portal_fix ste_cos.timer matches 120 in minecraft:the_end positioned 0 61 0 run fill ~-4 ~-2 ~-4 ~4 ~4 ~4 air replace wall_torch
execute if score #portal_fix ste_cos.timer matches 120 in minecraft:the_end positioned 0 61 0 run fill ~-4 ~-2 ~-4 ~4 ~4 ~4 air replace dragon_egg

# спавн маркера портала строго на высоте 61 только если его нет
execute if score #portal_fix ste_cos.timer matches 125 in minecraft:the_end unless entity @e[type=marker,tag=stellarity.exit_portal] run summon marker 0 61 0 {Tags:["stellarity.exit_portal","stellarity.portal_deactivated","stellarity.marker","smithed.entity","smithed.strict"],CustomName:{"text":"Exit Portal"}}

# проверка предметов
execute if score #portal_fix ste_cos.timer matches 1..360 in minecraft:the_end positioned 0 61 0 as @e[type=item,distance=..150,tag=!ste_cos_item_checked] run function ste_cos:portal/check_item

# завершение
execute if score #portal_fix ste_cos.timer matches 360 in minecraft:the_end run scoreboard players set #portal_fix_done ste_cos.flags 1
