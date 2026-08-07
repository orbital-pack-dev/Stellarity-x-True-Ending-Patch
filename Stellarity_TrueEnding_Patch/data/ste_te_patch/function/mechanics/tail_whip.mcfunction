# =====================================================================
# ste_te_patch:mechanics/tail_whip
# Удар хвостом при игроке ближе 8 блоков.
# Вызывается in minecraft:the_end из main_tick на тике 30.
# =====================================================================

execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon] run scoreboard players add @s ste_te_m9 5
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon] if score @s ste_te_m9 matches 600.. run scoreboard players set @s ste_te_m9 0

# Активация: игрок рядом + дракон НЕ на портале (не DragonPhase:5)
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon] if score @s ste_te_m9 matches 0 at @s unless data entity @s {DragonPhase:5} if entity @a[distance=..8] run function ste_te_patch:mechanics/tail_whip_blast
