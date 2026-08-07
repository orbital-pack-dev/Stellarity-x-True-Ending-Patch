# =====================================================================
# ste_te_patch:mechanics/tail_whip_blast
# Удар хвостом — эффекты и урон. Контекст: AS ender_dragon AT дракона.
# =====================================================================

# Урон игрокам в радиусе 8
execute as @a[distance=..8] run damage @s 20 minecraft:mob_attack by @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,limit=1,sort=nearest]

# Отбрасывание (через боковой Motion)
execute as @a[distance=..8] at @s run data merge entity @s {Motion:[1.5,0.8,1.5]}

# Дуга end_rod партиклов (хвост Дракона)
particle end_rod ~ ~1 ~ 4 0.5 4 0.2 120 force
particle sweep_attack ~ ~1 ~ 3 0 3 0.5 30 force
particle crit ~ ~1 ~ 4 0.5 4 0.3 50 force

# Хлопок крыльями
playsound minecraft:entity.ender_dragon.flap hostile @a[distance=..256] ~ ~ ~ 8 0.5
playsound minecraft:entity.warden.tendril_clicks hostile @a[distance=..64] ~ ~ ~ 5 0.4

# Actionbar
title @a[distance=..64] actionbar {"text":"Tail Whip!","color":"red","bold":true}
