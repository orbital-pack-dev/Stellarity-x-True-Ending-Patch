# =====================================================================
# ste_te_patch:mechanics/meteor_rain
# Метеоритный дождь при HP <= 20%.
# Вызывается: execute in minecraft:the_end ... из main_tick
# =====================================================================

# Триггер (однократно). trueEnding_health_percent <= 200
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,tag=!ste_te_meteor_rain_done] if score @s trueEnding_health_percent matches ..200 at @s run function ste_te_patch:mechanics/meteor_rain_spawn

# Обработка каждого маркера метеора (каждые 5 тиков)
execute in minecraft:the_end as @e[type=marker,tag=ste_meteor_marker] run scoreboard players add @s ste_te_m_timer 5
execute in minecraft:the_end as @e[type=marker,tag=ste_meteor_marker] at @s run particle large_smoke ~ ~ ~ 1 0 1 0 10 force
execute in minecraft:the_end as @e[type=marker,tag=ste_meteor_marker] at @s run particle flame ~ ~ ~ 1 0 1 0 5 force
execute in minecraft:the_end as @e[type=marker,tag=ste_meteor_marker] if score @s ste_te_m_timer matches 30.. at @s run summon fireball ~ ~40 ~ {ExplosionPower:3b,power:[0.0,-1.0,0.0]}
execute in minecraft:the_end as @e[type=marker,tag=ste_meteor_marker] if score @s ste_te_m_timer matches 30.. at @s run particle flash{color:[1.0, 0.5, 0.0, 1.0]} ~ ~ ~ 0 0 0 0 1 force
execute in minecraft:the_end as @e[type=marker,tag=ste_meteor_marker] if score @s ste_te_m_timer matches 50.. run kill @s
