# =====================================================================
# ste_te_patch:mechanics/island_wrath
# Дракон телепортируется к рандомному кристаллу и создаёт цилиндр.
# Вызывается из main_tick на тике 5 (раз в 1 мин).
# =====================================================================

execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] run scoreboard players add @s ste_te_m11 5
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] if score @s ste_te_m11 matches 240.. run scoreboard players set @s ste_te_m11 0
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] if score @s ste_te_m11 matches 0 run function ste_te_patch:mechanics/island_wrath_fire
