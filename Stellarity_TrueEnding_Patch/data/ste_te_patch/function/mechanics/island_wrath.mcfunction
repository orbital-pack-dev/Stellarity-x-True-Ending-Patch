# =====================================================================
# ste_te_patch:mechanics/island_wrath
# Дракон телепортируется к рандомному кристаллу и создаёт цилиндр.
# Вызывается in minecraft:the_end из main_tick каждые 5 тиков.
# =====================================================================

execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon] run scoreboard players add @s ste_te_m11 5
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon] if score @s ste_te_m11 matches 1200.. run scoreboard players set @s ste_te_m11 0
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon] if score @s ste_te_m11 matches 0 at @s run function ste_te_patch:mechanics/island_wrath_fire
