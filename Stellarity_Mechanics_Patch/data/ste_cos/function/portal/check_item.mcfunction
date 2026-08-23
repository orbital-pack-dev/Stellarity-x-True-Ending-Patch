# ste_cos:portal/check_item
# Оптимизированная проверка предметов для фикса портала. Запускается только один раз для каждого предмета.

tag @s add ste_cos_item_checked

# Яйцо Дракона
execute if data entity @s Item{id:"minecraft:dragon_egg"} run kill @s

# Факел
execute if data entity @s Item{id:"minecraft:torch"} run kill @s
