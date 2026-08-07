# =====================================================================
# ste_te_patch:mechanics/heavy_armor
# Замедление за Незерит в the_end. Вызывается каждые 5 тиков.
# =====================================================================

# Сброс счётчика для игроков в the_end
execute in minecraft:the_end as @a run scoreboard players set @s ste_te_armor_check 0

# Проверяем слоты брони
execute in minecraft:the_end as @a if data entity @s {Inventory:[{Slot:103b,id:"minecraft:netherite_helmet"}]} run scoreboard players add @s ste_te_armor_check 1
execute in minecraft:the_end as @a if data entity @s {Inventory:[{Slot:102b,id:"minecraft:netherite_chestplate"}]} run scoreboard players add @s ste_te_armor_check 1
execute in minecraft:the_end as @a if data entity @s {Inventory:[{Slot:101b,id:"minecraft:netherite_leggings"}]} run scoreboard players add @s ste_te_armor_check 1
execute in minecraft:the_end as @a if data entity @s {Inventory:[{Slot:100b,id:"minecraft:netherite_boots"}]} run scoreboard players add @s ste_te_armor_check 1

# 2-3 части: Slowness I
execute in minecraft:the_end as @a[scores={ste_te_armor_check=2..3}] run effect give @s slowness 2 0 true

# 4 части (полный комплект): Slowness II
execute in minecraft:the_end as @a[scores={ste_te_armor_check=4}] run effect give @s slowness 2 1 true
