# =====================================================================
# ste_te_patch:mechanics/fake_dive_abort
# Исполнение обманного нырка. Контекст: AS ender_dragon AT дракона.
# =====================================================================

# Прерываем нырок — пропускаем к концу фазы
scoreboard players set @s trueEnding_bosstime 1100

# Рывок вверх
tp @s ~ ~15 ~

# Ловушка из дыхания на земле
execute positioned ~ ~-15 ~ run summon area_effect_cloud ~ ~ ~ {Radius:5f,Duration:100,Particle:"minecraft:dragon_breath"}
execute positioned ~ ~-14 ~ run particle dragon_breath ~ ~ ~ 5 1 5 0.15 300 force
execute positioned ~ ~-13 ~ run particle smoke ~ ~ ~ 5 0 5 0.3 200 force

# Визуал скорости (телепорт вверх)
particle cloud ~ ~ ~ 3 3 3 0.5 100 force
particle sweep_attack ~ ~8 ~ 0.5 0.5 0.5 0.5 20 force

# Звук обманки
playsound minecraft:entity.ender_dragon.flap hostile @a[distance=..256] ~ ~ ~ 8 1.6
playsound minecraft:item.elytra.flying hostile @a[distance=..256] ~ ~ ~ 5 1.0

# Actionbar-предупреждение
title @a[distance=..200] actionbar {"text":"The Dragon has vanished!","color":"light_purple","bold":true}
