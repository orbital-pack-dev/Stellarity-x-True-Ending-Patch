# =====================================================================
# ste_te_patch:mechanics/anti_mace_blast
# Взрыв при посадке против булавы. Контекст: AS ender_dragon AT дракона.
# =====================================================================

tag @s add ste_te_mace_cooldown

# Спавн смертоносного AEC над порталом
summon area_effect_cloud 0 66 0 {Radius:8f,Duration:100,Particle:"minecraft:dragon_breath",Tags:["ste_te_mace_cloud"]}

# Урон сверху вниз
execute as @a[distance=..20] run damage @s 20 minecraft:mob_attack by @e[type=ender_dragon,limit=1,sort=nearest]

# Отбрасывание вверх
execute as @a[distance=..20] run data merge entity @s {Motion:[0.0,2.0,0.0]}

# Спецэффекты
particle dragon_breath 0 68 0 8 1 8 0.3 400 force
particle flash{color:[0.6, 0.0, 1.0, 1.0]} 0 68 0 0 0 0 0 1 force
particle explosion 0 66 0 3 1 3 0 15 force

# Звуки
playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] 0 68 0 10 0.7
playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..128] 0 68 0 8 1.8

# Предупреждение
title @a[distance=..64] actionbar {"text":"PORTAL IS DANGEROUS","color":"dark_purple","bold":true}
