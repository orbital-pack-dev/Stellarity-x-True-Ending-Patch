# =====================================================================
# ste_te_patch:mechanics/last_stand_phase2
# Контекст: AS ender_dragon (stellarity.dragon) AT дракона, in the_end.
# Настоящая смерть — телепорт на Y=78, финальная последовательность.
# =====================================================================

tag @s add ste_te_death_triggered

# --- Телепорт строго на Y=78 над алтарём (центр The End) ---
tp @s 0 78 0

# Замораживаем Дракона (обнуляем Motion)
data merge entity @s {Motion:[0.0,0.0,0.0]}

# Снимаем все защиты
data merge entity @s {Invulnerable:0b}
tag @s remove trueEnding_inattack
data merge entity @s {NoAI:1b}

# --- Финальный визуальный взрыв ---
execute at @s run particle explosion_emitter ~ ~ ~ 0 0 0 0 3 force
execute at @s run particle flash{color:[1.0, 1.0, 1.0, 1.0]} ~ ~ ~ 0 0 0 0 5 force
execute at @s run particle dragon_breath ~ ~ ~ 15 15 15 0.8 1000 force
execute at @s run particle soul_fire_flame ~ ~ ~ 10 10 10 0.5 600 force

# --- True Ending финальная анимация ---
scoreboard players set @s trueEnding_bosstime 3081

# --- Stellarity death chain ---
tag @s add stellarity.to_portal
tag @s add stellarity.ender_dragon
data merge entity @s {Health:1f}
data modify entity @s DragonPhase set value 0

# --- Лут Stellarity ---
execute at @s run loot spawn ~ ~ ~ loot stellarity:entity/ender_dragon

# --- Финальные звуки ---
playsound minecraft:entity.ender_dragon.death hostile @a[distance=..256] ~ ~ ~ 10 0.8
playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..256] ~ ~ ~ 10 0.5
playsound minecraft:ui.toast.challenge_complete hostile @a[distance=..256] ~ ~ ~ 10 1.0

# --- Title ---
title @a[distance=..256] title {"text":"THE END","color":"dark_purple","bold":true}
title @a[distance=..256] subtitle {"text":"The Dragon has been slain!","color":"gray"}

# --- Передача Stellarity ---
function stellarity:entity/dragon/death/fly_to_portal
