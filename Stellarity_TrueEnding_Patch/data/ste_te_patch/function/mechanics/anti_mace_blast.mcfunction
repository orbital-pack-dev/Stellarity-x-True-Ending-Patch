# =====================================================================
# ste_te_patch:mechanics/anti_mace_blast
# Взрыв при посадке против булавы. Контекст: AS ender_dragon AT дракона.
# =====================================================================

tag @s add ste_te_mace_cooldown

# AEC над Драконом (не на оверворлд 0,66,0 — а AT дракона ~4 блока выше)
execute at @s run summon area_effect_cloud ~ ~4 ~ {Radius:8f,Duration:100,Particle:"minecraft:dragon_breath",Tags:["ste_te_mace_cloud"]}

# Урон игрокам рядом с Драконом
execute at @s as @a[distance=..20] run damage @s 20 minecraft:mob_attack by @e[type=ender_dragon,tag=stellarity.dragon,limit=1,sort=nearest]

# Отбрасывание вверх
execute at @s as @a[distance=..20] run data merge entity @s {Motion:[0.0,2.0,0.0]}

# Спецэффекты AT дракона (dragon_breath, не overworld-партикл)
execute at @s run particle dragon_breath ~ ~4 ~ 8 1 8 0.3 400 force
execute at @s run particle flash{color:[0.6, 0.0, 1.0, 1.0]} ~ ~4 ~ 0 0 0 0 1 force
execute at @s run particle explosion ~ ~2 ~ 3 1 3 0 15 force

# Звуки
execute at @s run playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 0.7
execute at @s run playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..128] ~ ~ ~ 8 1.8

title @a[distance=..64] actionbar {"text":"PORTAL IS DANGEROUS","color":"dark_purple","bold":true}
