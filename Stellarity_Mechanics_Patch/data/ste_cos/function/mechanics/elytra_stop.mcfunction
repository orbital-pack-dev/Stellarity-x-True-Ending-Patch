# 1. Ломаем элитру в слоте нагрудника до 1 прочности (используя наш модификатор)
item modify entity @s armor.chest ste_cos:break_elytra

# 2. Воспроизводим звук поломки брони для эффекта
playsound minecraft:item.shield.break player @a ~ ~ ~ 1 0.8

# 3. Накладываем медленное падение на пару секунд, чтобы игрок не разбился насмерть при падении
effect give @s minecraft:slow_falling 3 0 true

# 4. Накладываем слабость
effect give @s minecraft:weakness 3 1 true
