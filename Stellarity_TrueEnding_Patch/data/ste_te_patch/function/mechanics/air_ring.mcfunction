# =====================================================================
# ste_te_patch:mechanics/air_ring
# Кольцо Драконьего Дыхания при игроках Y >= 85.
# Вызывается in minecraft:the_end из main_tick каждые 5 тиков.
# =====================================================================

execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon] run scoreboard players add @s ste_te_m2 5
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon] if score @s ste_te_m2 matches 600.. run scoreboard players set @s ste_te_m2 0

# Проверяем игроков в the_end Y >= 85, AT дракона
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon] if score @s ste_te_m2 matches 0 at @s if entity @a[y=85,dy=100,distance=..100] run function ste_te_patch:mechanics/air_ring_blast
