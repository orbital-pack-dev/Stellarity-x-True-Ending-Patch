# =====================================================================
# ste_te_patch:mechanics/gravity_collapse_punish
# Контекст: AS игрока AT игрока, in the_end.
# =====================================================================

tag @s add ste_afk_punished

# AEC прямо под ногами игрока (dragon_breath — без ванильного ovrworld-партикла)
summon area_effect_cloud ~ ~ ~ {Radius:3f,Duration:80,custom_particle:{type:"minecraft:dragon_breath"},Tags:["ste_grav_cloud"]}


# Визуал
particle reverse_portal ~ ~ ~ 3 1 3 0.3 200 force
particle soul_fire_flame ~ ~1 ~ 2 2 2 0.5 100 force

# Звук
playsound minecraft:entity.warden.heartbeat hostile @s ~ ~ ~ 5 0.5

# Урон и левитация
damage @s 10 minecraft:magic
effect give @s levitation 1 5 true

# Сброс тега → игрок снова может получить наказание через 13 сек
scoreboard players set @s ste_te_afk_time -60
tag @s remove ste_afk_punished
