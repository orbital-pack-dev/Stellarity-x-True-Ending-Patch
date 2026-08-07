# =====================================================================
# ste_te_patch:mechanics/fake_dive_abort
# Исполнение обманного нырка. Контекст: AS ender_dragon AT дракона, in the_end.
# =====================================================================

# Прерываем нырок
scoreboard players set @s trueEnding_bosstime 1100

# Рывок вверх AT дракона
tp @s ~ ~15 ~

# Ловушка из дыхания: area_effect_cloud с dragon_breath AT дракона (было ~-15)
execute at @s positioned ~ ~-15 ~ run summon area_effect_cloud ~ ~ ~ {Radius:5f,Duration:100,Particle:"minecraft:dragon_breath"}
execute at @s positioned ~ ~-14 ~ run particle dragon_breath ~ ~ ~ 5 1 5 0.15 300 force
execute at @s positioned ~ ~-13 ~ run particle smoke ~ ~ ~ 5 0 5 0.3 200 force

# Визуал скорости AT дракона (новая позиция после ТП)
execute at @s run particle cloud ~ ~ ~ 3 3 3 0.5 100 force
execute at @s run particle sweep_attack ~ ~-8 ~ 0.5 0.5 0.5 0.5 20 force

# Звук обманки
execute at @s run playsound minecraft:entity.ender_dragon.flap hostile @a[distance=..256] ~ ~ ~ 8 1.6
execute at @s run playsound minecraft:item.elytra.flying hostile @a[distance=..256] ~ ~ ~ 5 1.0

title @a[distance=..200] actionbar {"text":"The Dragon has vanished!","color":"light_purple","bold":true}
