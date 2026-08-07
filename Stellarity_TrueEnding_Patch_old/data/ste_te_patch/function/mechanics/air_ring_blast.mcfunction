# =====================================================================
# ste_te_patch:mechanics/air_ring_blast
# Контекст: AS ender_dragon AT дракона, in the_end.
# Наказание игроков в воздухе Y >= 85.
# =====================================================================

# Кольцо dragon_breath AT каждого воздушного игрока
execute in minecraft:the_end as @a[y=85,dy=100,distance=..100] at @s run particle dragon_breath ~ ~ ~ 5 1 5 0.2 200 force
execute in minecraft:the_end as @a[y=85,dy=100,distance=..100] at @s run particle dragon_breath ~ ~2 ~ 5 1 5 0.2 200 force
execute in minecraft:the_end as @a[y=85,dy=100,distance=..100] at @s run particle dragon_breath ~ ~-2 ~ 5 1 5 0.2 100 force

# Тьма на 5 сек
execute in minecraft:the_end as @a[y=85,dy=100,distance=..100] run effect give @s darkness 5 0 true

# Принудительный сброс скорости вниз AT игрока
execute in minecraft:the_end as @a[y=85,dy=100,distance=..100] at @s run data merge entity @s {Motion:[0.0,-1.5,0.0]}

# Звуки AT дракона
playsound minecraft:entity.ender_dragon.shoot hostile @a[distance=..256] ~ ~ ~ 5 0.5
playsound minecraft:ambient.crimson_forest.additions hostile @a[distance=..128] ~ ~ ~ 3 0.8

# Молния AT каждого игрока
execute in minecraft:the_end as @a[y=85,dy=100,distance=..100] at @s run summon lightning_bolt ~ ~ ~
