# ste_cos:phantom/guard_killed
# страж убит

# снятие щита
execute as @e[type=end_crystal,distance=..6] run tag @s remove ste_cos.shielded_crystal
execute as @e[type=end_crystal,distance=..6] run data merge entity @s {Invulnerable:0b,Glowing:0b}
execute as @e[type=end_crystal,distance=..6] run team leave @s

# эффекты
particle flash{color:[0.3,0.85,1.0,1.0]} ~ ~1.5 ~ 0 0 0 0 2 force @a
particle dust_color_transition{from_color:[0.3,0.85,1.0],scale:2.0,to_color:[0.1,0.0,0.3]} ~ ~1.5 ~ 0.5 0.5 0.5 0.1 30 force @a
playsound block.amethyst_block.break master @a ~ ~ ~ 16.0 0.8
playsound entity.item.break master @a ~ ~ ~ 16.0 1.2

# удаление маркера
kill @s
