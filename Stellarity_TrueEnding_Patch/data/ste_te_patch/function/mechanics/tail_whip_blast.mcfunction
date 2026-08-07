# =====================================================================
# ste_te_patch:mechanics/tail_whip_blast
# Контекст: AS ender_dragon AT дракона, in the_end.
# =====================================================================

# Урон игрокам в радиусе 8 AT дракона
execute at @s as @a[distance=..8] run damage @s 20 minecraft:mob_attack by @e[type=ender_dragon,tag=stellarity.dragon,limit=1,sort=nearest]

# Отбрасывание AT игрока
execute at @s as @a[distance=..8] at @s run data merge entity @s {Motion:[1.5,0.8,1.5]}

# Дуга end_rod партиклов AT дракона
execute at @s run particle end_rod ~ ~1 ~ 4 0.5 4 0.2 120 force
execute at @s run particle sweep_attack ~ ~1 ~ 3 0 3 0.5 30 force
execute at @s run particle crit ~ ~1 ~ 4 0.5 4 0.3 50 force

# Звуки
execute at @s run playsound minecraft:entity.ender_dragon.flap hostile @a[distance=..256] ~ ~ ~ 8 0.5
execute at @s run playsound minecraft:entity.warden.tendril_clicks hostile @a[distance=..64] ~ ~ ~ 5 0.4

title @a[distance=..64] actionbar {"text":"Tail Whip!","color":"red","bold":true}
