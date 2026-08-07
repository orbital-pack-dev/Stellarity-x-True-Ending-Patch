# =====================================================================
# ste_te_patch:mechanics/royal_laser_fire
# Исполнение атаки. Контекст: AS ender_dragon AT дракона.
# =====================================================================

# Телепортируемся в центр арены
tp @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,limit=1] 0 95 0

# --- 8 фаерболов в 8 сторон --- (N,S,E,W,NE,NW,SE,SW)
execute positioned 0 95 0 run summon fireball ~ ~ ~ {ExplosionPower:3b,Motion:[1.5,-0.3,0.0]}
execute positioned 0 95 0 run summon fireball ~ ~ ~ {ExplosionPower:3b,Motion:[-1.5,-0.3,0.0]}
execute positioned 0 95 0 run summon fireball ~ ~ ~ {ExplosionPower:3b,Motion:[0.0,-0.3,1.5]}
execute positioned 0 95 0 run summon fireball ~ ~ ~ {ExplosionPower:3b,Motion:[0.0,-0.3,-1.5]}
execute positioned 0 95 0 run summon fireball ~ ~ ~ {ExplosionPower:3b,Motion:[1.1,-0.3,1.1]}
execute positioned 0 95 0 run summon fireball ~ ~ ~ {ExplosionPower:3b,Motion:[-1.1,-0.3,-1.1]}
execute positioned 0 95 0 run summon fireball ~ ~ ~ {ExplosionPower:3b,Motion:[1.1,-0.3,-1.1]}
execute positioned 0 95 0 run summon fireball ~ ~ ~ {ExplosionPower:3b,Motion:[-1.1,-0.3,1.1]}

# --- Кольцо end_rod (имитация луча) ---
execute positioned 0 95 0 run particle end_rod ~ ~ ~ 10 0.5 10 0.8 600 force
execute positioned 0 93 0 run particle end_rod ~ ~ ~ 12 0.3 12 0.6 400 force

# --- Вспышка ---
execute positioned 0 95 0 run particle flash{color:[1.0, 0.4, 0.0, 1.0]} ~ ~ ~ 0 0 0 0 1 force

# --- Звуки ---
playsound minecraft:entity.ender_dragon.shoot hostile @a[distance=..256] 0 95 0 10 0.1
playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..256] 0 95 0 8 0.7
playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] 0 95 0 10 1.2

# --- Title-предупреждение ---
title @a[distance=..200] actionbar {"text":"ROYAL LASER","color":"gold","bold":true}
