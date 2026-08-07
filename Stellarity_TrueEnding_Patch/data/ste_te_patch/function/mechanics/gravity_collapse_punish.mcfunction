# =====================================================================
# ste_te_patch:mechanics/gravity_collapse_punish
# Срабатывает при достижении AFK порога.
# Контекст: AS игрока AT игрока.
# =====================================================================

# Тег для исключения двойного срабатывания
tag @s add ste_afk_punished

# Спавн area_effect_cloud прямо под ногами
summon area_effect_cloud ~ ~ ~ {Radius:3f,Duration:80,Particle:"minecraft:end_rod",Tags:["ste_grav_cloud"]}

# Визуальное предупреждение (чёрная дыра)
particle reverse_portal ~ ~ ~ 3 1 3 0.3 200 force
particle soul_fire_flame ~ ~1 ~ 2 2 2 0.5 100 force

# Звук тревоги
playsound minecraft:entity.warden.heartbeat hostile @s ~ ~ ~ 5 0.5

# Задержка наказания через AEC (Duration=80 → ~4 сек)
# Сам AEC при истечении нанесёт урон через следующий тик crystal_guards

# Немедленный урон и Левитация через 2 сек (40 тиков через schedule невозможен, делаем через AEC)
damage @s 10 minecraft:magic
effect give @s levitation 1 5 true

# Сброс тега через небольшую задержку (через скорборд)
scoreboard players set @s ste_te_afk_time -60
