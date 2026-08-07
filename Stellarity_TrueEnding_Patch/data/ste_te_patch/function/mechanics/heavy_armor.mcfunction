# =====================================================================
# ste_te_patch:mechanics/heavy_armor
# Замедление за Незерит. Вызывается каждые 20 тиков.
# =====================================================================

# Сброс счётчика для всех игроков арены
scoreboard players set @a[distance=..256] ste_te_armor_check 0

# Проверяем каждый слот брони через nbt
execute as @a[distance=..256] if data entity @s {Inventory:[{Slot:103b,id:"minecraft:netherite_helmet"}]} run scoreboard players add @s ste_te_armor_check 1
execute as @a[distance=..256] if data entity @s {Inventory:[{Slot:102b,id:"minecraft:netherite_chestplate"}]} run scoreboard players add @s ste_te_armor_check 1
execute as @a[distance=..256] if data entity @s {Inventory:[{Slot:101b,id:"minecraft:netherite_leggings"}]} run scoreboard players add @s ste_te_armor_check 1
execute as @a[distance=..256] if data entity @s {Inventory:[{Slot:100b,id:"minecraft:netherite_boots"}]} run scoreboard players add @s ste_te_armor_check 1

# 2-3 части: Slowness I
execute as @a[distance=..256,scores={ste_te_armor_check=2..3}] run effect give @s slowness 2 0 true

# 4 части (полный комплект): Slowness II
execute as @a[distance=..256,scores={ste_te_armor_check=4}] run effect give @s slowness 2 1 true
