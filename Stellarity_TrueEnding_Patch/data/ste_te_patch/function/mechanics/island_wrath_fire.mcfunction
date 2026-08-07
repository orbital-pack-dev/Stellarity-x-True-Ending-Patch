# =====================================================================
# ste_te_patch:mechanics/island_wrath_fire
# Контекст: AS ender_dragon AT дракона, in the_end.
# =====================================================================

# Телепорт к рандомному кристальному столбу
execute in minecraft:the_end as @e[type=end_crystal,sort=random,limit=1] at @s run tp @e[type=ender_dragon,tag=stellarity.dragon,limit=1] ~ 75 ~

# Взрыв партиклов (AT дракона после ТП)
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,limit=1] at @s run particle sonic_boom ~ ~ ~ 20 15 20 0 200 force
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,limit=1] at @s run particle dragon_breath ~ ~ ~ 15 10 15 0.5 300 force
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,limit=1] at @s run particle flash{color:[0.4, 0.0, 1.0, 1.0]} ~ ~ ~ 0 0 0 0 1 force

# Урон игрокам в радиусе 30 от дракона
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,limit=1] at @s as @a[distance=..30] run damage @s 15 minecraft:mob_attack by @e[type=ender_dragon,tag=stellarity.dragon,limit=1,sort=nearest]

# Отбрасывание
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,limit=1] at @s as @a[distance=..30] run data merge entity @s {Motion:[2.0,1.0,2.0]}

# Звуки
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,limit=1] at @s run playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 0.6
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,limit=1] at @s run playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..256] ~ ~ ~ 8 0.9

title @a[distance=..256] title {"text":"ISLAND WRATH","color":"dark_purple","bold":true}
title @a[distance=..256] subtitle {"text":"The Dragon descends!","color":"gray"}
