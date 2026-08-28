# Блокировка элитр
item modify entity @s armor.chest ste_cos:break_elytra

# Механика боя
playsound minecraft:item.shield.break player @a ~ ~ ~ 1 0.8

# Механика боя
effect give @s minecraft:slow_falling 3 0 true

# Механика боя
effect give @s minecraft:weakness 3 1 true
