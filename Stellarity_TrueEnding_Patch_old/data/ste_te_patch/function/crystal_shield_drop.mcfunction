# =====================================================================
# ste_te_patch:crystal_shield_drop
# Запускается ОДИН раз, когда уничтожены все кристаллы.
# Ставит флаг $shield_dropped=1, чтобы не спамить каждый тик.
# =====================================================================

# Одноразовость
scoreboard players set $shield_dropped ste_te_flags 1

# Кристаллы уничтожены
scoreboard players set $crystals_gone ste_te_flags 1

# Снимаем принудительный щит
tag @s remove stellarity.dragon.invulnerable
data modify entity @s Invulnerable set value 0b

# Спецэффекты и звук
execute at @s run playsound minecraft:entity.ender_dragon.ambient hostile @a[distance=..256] ~ ~ ~ 10 0.5
execute at @s run particle flash{color:[1.0, 1.0, 1.0, 1.0]} ~ ~ ~ 0 0 0 0 1 force
execute at @s run particle dragon_breath ~ ~ ~ 10 10 10 0.1 500 force

# Устанавливаем таймер боя True Ending
scoreboard players set @s trueEnding_bosstime 5000

title @a[distance=..256] title {"text":"THE SHIELD IS BROKEN","color":"dark_red","bold":true}
title @a[distance=..256] subtitle {"text":"Finish the beast!","color":"red"}
