# =====================================================================
# ste_te_patch:mechanics/air_ring_blast
# Вызывается из air_ring.mcfunction когда есть цели в воздухе.
# Контекст: AS ender_dragon AT дракона.
# =====================================================================

# Кольцо из dragon_breath вокруг всех воздушных игроков
execute at @a[distance=..100,y=85,dy=100] run particle dragon_breath ~ ~ ~ 5 1 5 0.2 200 force
execute at @a[distance=..100,y=85,dy=100] run particle dragon_breath ~ ~2 ~ 5 1 5 0.2 200 force
execute at @a[distance=..100,y=85,dy=100] run particle dragon_breath ~ ~-2 ~ 5 1 5 0.2 100 force

# Тьма на 5 сек
effect give @a[distance=..100,y=85,dy=100] darkness 5 0 true

# Принудительный сброс скорости (тянем вниз)
execute as @a[distance=..100,y=85,dy=100] run data merge entity @s {Motion:[0.0,-1.5,0.0]}

# Звуки
playsound minecraft:entity.ender_dragon.shoot hostile @a[distance=..256] ~ ~ ~ 5 0.5
playsound minecraft:ambient.crimson_forest.additions hostile @a[distance=..128] ~ ~ ~ 3 0.8

# Визуальное предупреждение — молния рядом
execute at @a[distance=..100,y=85,dy=100] run summon lightning_bolt ~ ~ ~
