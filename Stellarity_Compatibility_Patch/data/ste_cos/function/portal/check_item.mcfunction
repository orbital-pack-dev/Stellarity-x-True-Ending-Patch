# ste_cos:portal/check_item
# Фикс портала

tag @s add ste_cos_item_checked

# Яйцо дракона
execute if data entity @s Item{id:"minecraft:dragon_egg"} run kill @s

# Механика боя
execute if data entity @s Item{id:"minecraft:torch"} run kill @s
