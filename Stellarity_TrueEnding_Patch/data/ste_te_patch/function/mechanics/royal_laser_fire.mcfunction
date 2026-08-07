# =====================================================================
# ste_te_patch:mechanics/royal_laser_fire
# Контекст: AS ender_dragon AT дракона, in the_end.
# =====================================================================

# Телепортируемся в центр арены
tp @s 0 95 0

# --- 8 фаерболов в 8 сторон (AT дракона, т.е. 0 95 0 после ТП) ---
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:3b,power:[1.5,0.0,0.0]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:3b,power:[-1.5,0.0,0.0]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:3b,power:[0.0,0.0,1.5]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:3b,power:[0.0,0.0,-1.5]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:3b,power:[1.1,0.0,1.1]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:3b,power:[-1.1,0.0,-1.1]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:3b,power:[1.1,0.0,-1.1]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:3b,power:[-1.1,0.0,1.1]}

# --- Кольцо end_rod AT дракона ---
execute at @s run particle end_rod ~ ~ ~ 10 0.5 10 0.8 600 force
execute at @s run particle end_rod ~ ~-2 ~ 12 0.3 12 0.6 400 force

# --- Вспышка ---
execute at @s run particle flash{color:[1.0, 0.4, 0.0, 1.0]} ~ ~ ~ 0 0 0 0 1 force

# --- Звуки ---
execute at @s run playsound minecraft:entity.ender_dragon.shoot hostile @a[distance=..256] ~ ~ ~ 10 0.1
execute at @s run playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..256] ~ ~ ~ 8 0.7
execute at @s run playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 1.2

title @a[distance=..200] actionbar {"text":"ROYAL LASER","color":"gold","bold":true}
