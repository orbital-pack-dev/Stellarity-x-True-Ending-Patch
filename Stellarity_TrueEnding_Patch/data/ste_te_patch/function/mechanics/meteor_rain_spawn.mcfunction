# =====================================================================
# ste_te_patch:mechanics/meteor_rain_spawn
# Контекст: AS ender_dragon AT дракона.
# =====================================================================

tag @s add ste_te_meteor_rain_done

# Спавн 12 маркеров метеоров
summon marker ~15 ~-5 ~15 {Tags:["ste_meteor_marker"]}
summon marker ~-15 ~-5 ~15 {Tags:["ste_meteor_marker"]}
summon marker ~15 ~-5 ~-15 {Tags:["ste_meteor_marker"]}
summon marker ~-15 ~-5 ~-15 {Tags:["ste_meteor_marker"]}
summon marker ~20 ~-5 ~0 {Tags:["ste_meteor_marker"]}
summon marker ~-20 ~-5 ~0 {Tags:["ste_meteor_marker"]}
summon marker ~0 ~-5 ~20 {Tags:["ste_meteor_marker"]}
summon marker ~0 ~-5 ~-20 {Tags:["ste_meteor_marker"]}
summon marker ~8 ~-5 ~8 {Tags:["ste_meteor_marker"]}
summon marker ~-8 ~-5 ~8 {Tags:["ste_meteor_marker"]}
summon marker ~8 ~-5 ~-8 {Tags:["ste_meteor_marker"]}
summon marker ~-8 ~-5 ~-8 {Tags:["ste_meteor_marker"]}

# Инициализируем таймер маркеров
scoreboard players set @e[type=marker,tag=ste_meteor_marker] ste_te_timer 0

# Звук начала атаки
playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 0.5
playsound minecraft:entity.warden.heartbeat hostile @a[distance=..128] ~ ~ ~ 8 0.8

# Предупреждение
title @a[distance=..200] title {"text":"METEOR RAIN","color":"dark_red","bold":true}
title @a[distance=..200] subtitle {"text":"Run!","color":"red"}
