# ste_cos:portal/check_item
# удаление предметов у портала

tag @s add ste_cos_item_checked
execute if data entity @s Item{id:"minecraft:dragon_egg"} run kill @s
execute if data entity @s Item{id:"minecraft:torch"} run kill @s
