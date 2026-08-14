# ste_fix:setup
# Эта функция загружает датапаки в правильном порядке.
# Введите в чат: /function ste_fix:setup

datapack enable "file/Stellarity" last
datapack enable "file/true_ending" after "file/Stellarity"
datapack enable "file/Stellarity_Cosmetic_Patch" first

tellraw @a {"text":"[STE-COS] Datapack load order has been successfully configured!","color":"green"}
