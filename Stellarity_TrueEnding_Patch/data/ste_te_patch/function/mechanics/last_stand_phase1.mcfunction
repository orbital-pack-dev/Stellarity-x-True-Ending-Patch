# =====================================================================
# ste_te_patch:mechanics/last_stand_phase1
# =====================================================================

# Ставим флаг $dead=1
scoreboard players set $dead ste_te_flags 1

# Восстанавливаем HP (LastStand pool)
data modify entity @s Health set value 40.0f
effect give @s resistance 10 255 true

# Запустить true_ending:boss/a_main
scoreboard players set @s trueEnding_bosstime 3000
function true_ending:boss/a_main

# --- Визуальный взрыв Last Stand ---
execute at @s run particle flash{color:[1.0, 0.0, 0.0, 1.0]} ~ ~ ~ 0 0 0 0 5 force
execute at @s run particle explosion_emitter ~ ~ ~ 0 0 0 0 1 force
execute at @s run particle dragon_breath ~ ~ ~ 10 10 10 0.5 600 force
execute at @s run particle soul_fire_flame ~ ~ ~ 8 8 8 0.4 400 force
execute at @s run particle reverse_portal ~ ~ ~ 6 6 6 0.3 300 force

# --- Звуки ---
execute at @s run playsound minecraft:entity.ender_dragon.death hostile @a[distance=..256] ~ ~ ~ 10 1.2
execute at @s run playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..256] ~ ~ ~ 10 0.6
execute at @s run playsound minecraft:block.conduit.deactivate hostile @a[distance=..256] ~ ~ ~ 10 0.8
execute at @s run playsound minecraft:entity.warden.heartbeat hostile @a[distance=..256] ~ ~ ~ 8 0.5

# --- Объявляем Last Stand ---
title @a[distance=..256] title {"text":"LAST STAND","color":"dark_red","bold":true}
title @a[distance=..256] subtitle {"text":"The Dragon refuses to fall!","color":"red"}
