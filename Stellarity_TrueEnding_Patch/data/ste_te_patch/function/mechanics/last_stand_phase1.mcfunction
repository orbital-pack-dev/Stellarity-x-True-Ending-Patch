# =====================================================================
# ste_te_patch:mechanics/last_stand_phase1
# Контекст: AS ender_dragon (stellarity.dragon) AT дракона, in the_end.
# Первое "убийство" — даём дракону 40 HP и запускаем Ultimate.
# =====================================================================

# Ставим флаг — больше сюда не войдём
tag @s add ste_te_last_stand

# Восстанавливаем HP (LastStand pool)
data merge entity @s {Health:40f}

# Полная неуязвимость пока идёт Last Stand
data merge entity @s {Invulnerable:1b}

# --- Визуальный взрыв Last Stand ---
execute at @s run particle flash{color:[1.0, 0.0, 0.0, 1.0]} ~ ~ ~ 0 0 0 0 5 force
execute at @s run particle explosion_emitter ~ ~ ~ 0 0 0 0 1 force
execute at @s run particle dragon_breath ~ ~ ~ 10 10 10 0.5 600 force
execute at @s run particle soul_fire_flame ~ ~ ~ 8 8 8 0.4 400 force
execute at @s run particle reverse_portal ~ ~ ~ 6 6 6 0.3 300 force

# --- Fireworks в стиле True Ending ultimate ---
execute at @s run summon firework_rocket ~ ~5 ~ {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:large_ball,colors:[I;16711680,16711680],fade_colors:[I;16711680]}],flight_duration:1}}}}
execute at @s run summon firework_rocket ~5 ~5 ~5 {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:star,colors:[I;16711680,16777215],fade_colors:[I;16744192]}],flight_duration:1}}}}
execute at @s run summon firework_rocket ~-5 ~5 ~-5 {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:burst,colors:[I;11141120,16711680],fade_colors:[I;6684672]}],flight_duration:1}}}}

# --- Звуки ---
playsound minecraft:entity.ender_dragon.death hostile @a[distance=..256] ~ ~ ~ 10 1.2
playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..256] ~ ~ ~ 10 0.6
playsound minecraft:block.conduit.deactivate hostile @a[distance=..256] ~ ~ ~ 10 0.8
playsound minecraft:entity.warden.heartbeat hostile @a[distance=..256] ~ ~ ~ 8 0.5

# --- Снимаем неуязвимость через 10 тиков (делаем через scoreboard, т.к. нет schedule) ---
# Сбросим Invulnerable в следующей фазе при hp снова <= 1f

# --- Объявляем Last Stand ---
title @a[distance=..256] title {"text":"LAST STAND","color":"dark_red","bold":true}
title @a[distance=..256] subtitle {"text":"The Dragon refuses to fall!","color":"red"}

# --- Снимаем неуязвимость сразу (игрок должен добить) ---
# Ждём 5 сек (100 тиков) через таймер
scoreboard players set @s ste_te_laststand_cd 0
