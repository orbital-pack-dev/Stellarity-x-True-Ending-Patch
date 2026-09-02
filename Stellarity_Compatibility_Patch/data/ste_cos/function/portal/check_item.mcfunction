# ste_cos:portal/check_item
# проверка предметов у портала

tag @s add ste_cos_item_checked

# удаление выпавшего яйца
execute if data entity @s Item{id:"minecraft:dragon_egg"} run kill @s

# удаление факелов
execute if data entity @s Item{id:"minecraft:torch"} run kill @s
execute if data entity @s Item{id:"minecraft:torch"} run kill @s
execute if data entity @s Item{id:"minecraft:torch"} run kill @s
execute if data entity @s Item{id:"minecraft:torch"} run kill @s
