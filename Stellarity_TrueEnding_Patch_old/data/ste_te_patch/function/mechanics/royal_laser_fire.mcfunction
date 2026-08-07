# =====================================================================
# ste_te_patch:mechanics/royal_laser_fire
# Контекст: AS ender_dragon AT дракона, in the_end.
# =====================================================================

# --- 8 фаерболов в 8 сторон (AT дракона). Мощность 5 (проверено в игре: 3 слабо) ---
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:5b,Motion:[1.5,0.0,0.0],acceleration_power:0.1d,Tags:["te_fireball"]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:5b,Motion:[-1.5,0.0,0.0],acceleration_power:0.1d,Tags:["te_fireball"]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:5b,Motion:[0.0,0.0,1.5],acceleration_power:0.1d,Tags:["te_fireball"]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:5b,Motion:[0.0,0.0,-1.5],acceleration_power:0.1d,Tags:["te_fireball"]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:5b,Motion:[1.1,0.0,1.1],acceleration_power:0.1d,Tags:["te_fireball"]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:5b,Motion:[-1.1,0.0,-1.1],acceleration_power:0.1d,Tags:["te_fireball"]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:5b,Motion:[1.1,0.0,-1.1],acceleration_power:0.1d,Tags:["te_fireball"]}
execute at @s run summon fireball ~ ~ ~ {ExplosionPower:5b,Motion:[-1.1,0.0,1.1],acceleration_power:0.1d,Tags:["te_fireball"]}

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
