# =====================================================================
# ste_cos:egg/egg_find
# AT маркера (яйца нет на текущем месте). Ищем блок dragon_egg в радиусе
# X±15 / Y±7 вокруг алтаря (0 66 0) и телепортируем маркер на найденное.
#
# Если найдено — маркер переезжает, и в след.тик egg_glow засветит яйцо.
# =====================================================================

# --- сетка по Y вокруг 66 ---
# Y=58
execute if block 0 58 0 minecraft:dragon_egg run tp @s 0 58 0
execute if block -6 58 0 minecraft:dragon_egg run tp @s -6 58 0
execute if block 6 58 0 minecraft:dragon_egg run tp @s 6 58 0
execute if block 0 58 -6 minecraft:dragon_egg run tp @s 0 58 -6
execute if block 0 58 6 minecraft:dragon_egg run tp @s 0 58 6

# Y=62
execute if block 0 62 0 minecraft:dragon_egg run tp @s 0 62 0
execute if block -6 62 0 minecraft:dragon_egg run tp @s -6 62 0
execute if block 6 62 0 minecraft:dragon_egg run tp @s 6 62 0
execute if block 0 62 -6 minecraft:dragon_egg run tp @s 0 62 -6
execute if block 0 62 6 minecraft:dragon_egg run tp @s 0 62 6

# Y=66 (основной алтарь)
execute if block 0 66 0 minecraft:dragon_egg run tp @s 0 66 0
execute if block -6 66 0 minecraft:dragon_egg run tp @s -6 66 0
execute if block 6 66 0 minecraft:dragon_egg run tp @s 6 66 0
execute if block 0 66 -6 minecraft:dragon_egg run tp @s 0 66 -6
execute if block 0 66 6 minecraft:dragon_egg run tp @s 0 66 6

# Y=70
execute if block 0 70 0 minecraft:dragon_egg run tp @s 0 70 0
execute if block -6 70 0 minecraft:dragon_egg run tp @s -6 70 0
execute if block 6 70 0 minecraft:dragon_egg run tp @s 6 70 0
execute if block 0 70 -6 minecraft:dragon_egg run tp @s 0 70 -6
execute if block 0 70 6 minecraft:dragon_egg run tp @s 0 70 6

# Y=74
execute if block 0 74 0 minecraft:dragon_egg run tp @s 0 74 0
execute if block -6 74 0 minecraft:dragon_egg run tp @s -6 74 0
execute if block 6 74 0 minecraft:dragon_egg run tp @s 6 74 0
execute if block 0 74 -6 minecraft:dragon_egg run tp @s 0 74 -6
execute if block 0 74 6 minecraft:dragon_egg run tp @s 0 74 6
