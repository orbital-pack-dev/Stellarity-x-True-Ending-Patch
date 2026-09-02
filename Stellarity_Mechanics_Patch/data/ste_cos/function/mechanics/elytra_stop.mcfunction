# ste_cos:mechanics/elytra_stop
# поломка элитр и замедление игрока

item modify entity @s armor.chest ste_cos:break_elytra
playsound minecraft:item.shield.break player @a ~ ~ ~ 1 0.8
effect give @s minecraft:slow_falling 3 0 true
effect give @s minecraft:weakness 3 1 true
