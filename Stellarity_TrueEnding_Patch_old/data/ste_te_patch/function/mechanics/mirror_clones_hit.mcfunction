# =====================================================================
# ste_te_patch:mechanics/mirror_clones_hit
# Клон убит → все переходят в Triple Dive.
# Контекст: AS убитого клона.
# =====================================================================

# Взрыв иллюзии
execute at @s run particle explosion ~ ~ ~ 3 3 3 0.5 20 force
execute at @s run particle reverse_portal ~ ~ ~ 5 5 5 0.5 100 force

playsound minecraft:entity.ender_dragon.death hostile @a[distance=..256] ~ ~ ~ 5 0.5

# Переводим ВСЕХ драконов в Triple Dive
execute as @e[type=ender_dragon] run scoreboard players set @s trueEnding_bosstime 1001

# Удаляем этого клона
kill @s

title @a[distance=..200] actionbar {"text":"Clone destroyed! Brace yourselves!","color":"red","bold":true}
