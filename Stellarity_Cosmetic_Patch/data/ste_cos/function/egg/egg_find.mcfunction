# =====================================================================
# ste_cos:egg/egg_find
# AT маркера (яйца нет на текущем месте). Ищем блок dragon_egg в радиусе
# X±15 / Y±7 вокруг алтаря (0 66 0) и телепортируем маркер на найденное.
#
# Оптимизированный поиск через fill (в 1 тик, 77 команд).
# =====================================================================

# Сброс счетчиков
scoreboard players set #found ste_cos.flags 0

# Ищем Y (от 59 до 73)
execute store success score #found ste_cos.flags run fill -15 59 -15 15 59 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 59 ~
execute store success score #found ste_cos.flags run fill -15 60 -15 15 60 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 60 ~
execute store success score #found ste_cos.flags run fill -15 61 -15 15 61 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 61 ~
execute store success score #found ste_cos.flags run fill -15 62 -15 15 62 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 62 ~
execute store success score #found ste_cos.flags run fill -15 63 -15 15 63 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 63 ~
execute store success score #found ste_cos.flags run fill -15 64 -15 15 64 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 64 ~
execute store success score #found ste_cos.flags run fill -15 65 -15 15 65 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 65 ~
execute store success score #found ste_cos.flags run fill -15 66 -15 15 66 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 66 ~
execute store success score #found ste_cos.flags run fill -15 67 -15 15 67 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 67 ~
execute store success score #found ste_cos.flags run fill -15 68 -15 15 68 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 68 ~
execute store success score #found ste_cos.flags run fill -15 69 -15 15 69 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 69 ~
execute store success score #found ste_cos.flags run fill -15 70 -15 15 70 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 70 ~
execute store success score #found ste_cos.flags run fill -15 71 -15 15 71 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 71 ~
execute store success score #found ste_cos.flags run fill -15 72 -15 15 72 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 72 ~
execute store success score #found ste_cos.flags run fill -15 73 -15 15 73 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ 73 ~

# Теперь маркер на нужной высоте. Ищем X (от -15 до 15) в слое маркера
execute at @s store success score #found ste_cos.flags run fill -15 ~ -15 -15 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -15 ~ ~
execute at @s store success score #found ste_cos.flags run fill -14 ~ -15 -14 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -14 ~ ~
execute at @s store success score #found ste_cos.flags run fill -13 ~ -15 -13 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -13 ~ ~
execute at @s store success score #found ste_cos.flags run fill -12 ~ -15 -12 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -12 ~ ~
execute at @s store success score #found ste_cos.flags run fill -11 ~ -15 -11 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -11 ~ ~
execute at @s store success score #found ste_cos.flags run fill -10 ~ -15 -10 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -10 ~ ~
execute at @s store success score #found ste_cos.flags run fill -9 ~ -15 -9 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -9 ~ ~
execute at @s store success score #found ste_cos.flags run fill -8 ~ -15 -8 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -8 ~ ~
execute at @s store success score #found ste_cos.flags run fill -7 ~ -15 -7 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -7 ~ ~
execute at @s store success score #found ste_cos.flags run fill -6 ~ -15 -6 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -6 ~ ~
execute at @s store success score #found ste_cos.flags run fill -5 ~ -15 -5 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -5 ~ ~
execute at @s store success score #found ste_cos.flags run fill -4 ~ -15 -4 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -4 ~ ~
execute at @s store success score #found ste_cos.flags run fill -3 ~ -15 -3 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -3 ~ ~
execute at @s store success score #found ste_cos.flags run fill -2 ~ -15 -2 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -2 ~ ~
execute at @s store success score #found ste_cos.flags run fill -1 ~ -15 -1 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s -1 ~ ~
execute at @s store success score #found ste_cos.flags run fill 0 ~ -15 0 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 0 ~ ~
execute at @s store success score #found ste_cos.flags run fill 1 ~ -15 1 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 1 ~ ~
execute at @s store success score #found ste_cos.flags run fill 2 ~ -15 2 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 2 ~ ~
execute at @s store success score #found ste_cos.flags run fill 3 ~ -15 3 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 3 ~ ~
execute at @s store success score #found ste_cos.flags run fill 4 ~ -15 4 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 4 ~ ~
execute at @s store success score #found ste_cos.flags run fill 5 ~ -15 5 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 5 ~ ~
execute at @s store success score #found ste_cos.flags run fill 6 ~ -15 6 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 6 ~ ~
execute at @s store success score #found ste_cos.flags run fill 7 ~ -15 7 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 7 ~ ~
execute at @s store success score #found ste_cos.flags run fill 8 ~ -15 8 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 8 ~ ~
execute at @s store success score #found ste_cos.flags run fill 9 ~ -15 9 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 9 ~ ~
execute at @s store success score #found ste_cos.flags run fill 10 ~ -15 10 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 10 ~ ~
execute at @s store success score #found ste_cos.flags run fill 11 ~ -15 11 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 11 ~ ~
execute at @s store success score #found ste_cos.flags run fill 12 ~ -15 12 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 12 ~ ~
execute at @s store success score #found ste_cos.flags run fill 13 ~ -15 13 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 13 ~ ~
execute at @s store success score #found ste_cos.flags run fill 14 ~ -15 14 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 14 ~ ~
execute at @s store success score #found ste_cos.flags run fill 15 ~ -15 15 ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s 15 ~ ~

# Теперь ищем Z (от -15 до 15) в строке X,Y маркера
execute at @s store success score #found ste_cos.flags run fill ~ ~ -15 ~ ~ -15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -15
execute at @s store success score #found ste_cos.flags run fill ~ ~ -14 ~ ~ -14 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -14
execute at @s store success score #found ste_cos.flags run fill ~ ~ -13 ~ ~ -13 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -13
execute at @s store success score #found ste_cos.flags run fill ~ ~ -12 ~ ~ -12 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -12
execute at @s store success score #found ste_cos.flags run fill ~ ~ -11 ~ ~ -11 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -11
execute at @s store success score #found ste_cos.flags run fill ~ ~ -10 ~ ~ -10 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -10
execute at @s store success score #found ste_cos.flags run fill ~ ~ -9 ~ ~ -9 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -9
execute at @s store success score #found ste_cos.flags run fill ~ ~ -8 ~ ~ -8 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -8
execute at @s store success score #found ste_cos.flags run fill ~ ~ -7 ~ ~ -7 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -7
execute at @s store success score #found ste_cos.flags run fill ~ ~ -6 ~ ~ -6 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -6
execute at @s store success score #found ste_cos.flags run fill ~ ~ -5 ~ ~ -5 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -5
execute at @s store success score #found ste_cos.flags run fill ~ ~ -4 ~ ~ -4 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -4
execute at @s store success score #found ste_cos.flags run fill ~ ~ -3 ~ ~ -3 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -3
execute at @s store success score #found ste_cos.flags run fill ~ ~ -2 ~ ~ -2 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -2
execute at @s store success score #found ste_cos.flags run fill ~ ~ -1 ~ ~ -1 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ -1
execute at @s store success score #found ste_cos.flags run fill ~ ~ 0 ~ ~ 0 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 0
execute at @s store success score #found ste_cos.flags run fill ~ ~ 1 ~ ~ 1 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 1
execute at @s store success score #found ste_cos.flags run fill ~ ~ 2 ~ ~ 2 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 2
execute at @s store success score #found ste_cos.flags run fill ~ ~ 3 ~ ~ 3 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 3
execute at @s store success score #found ste_cos.flags run fill ~ ~ 4 ~ ~ 4 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 4
execute at @s store success score #found ste_cos.flags run fill ~ ~ 5 ~ ~ 5 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 5
execute at @s store success score #found ste_cos.flags run fill ~ ~ 6 ~ ~ 6 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 6
execute at @s store success score #found ste_cos.flags run fill ~ ~ 7 ~ ~ 7 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 7
execute at @s store success score #found ste_cos.flags run fill ~ ~ 8 ~ ~ 8 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 8
execute at @s store success score #found ste_cos.flags run fill ~ ~ 9 ~ ~ 9 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 9
execute at @s store success score #found ste_cos.flags run fill ~ ~ 10 ~ ~ 10 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 10
execute at @s store success score #found ste_cos.flags run fill ~ ~ 11 ~ ~ 11 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 11
execute at @s store success score #found ste_cos.flags run fill ~ ~ 12 ~ ~ 12 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 12
execute at @s store success score #found ste_cos.flags run fill ~ ~ 13 ~ ~ 13 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 13
execute at @s store success score #found ste_cos.flags run fill ~ ~ 14 ~ ~ 14 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 14
execute at @s store success score #found ste_cos.flags run fill ~ ~ 15 ~ ~ 15 minecraft:dragon_egg replace minecraft:dragon_egg
execute if score #found ste_cos.flags matches 1.. run tp @s ~ ~ 15

