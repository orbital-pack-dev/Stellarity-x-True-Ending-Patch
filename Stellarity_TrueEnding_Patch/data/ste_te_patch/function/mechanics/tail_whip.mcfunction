# =====================================================================
# ste_te_patch:mechanics/tail_whip
# Удар хвостом при игроке ближе 8 блоков.
# КД 30 сек — через ste_te_m9 у дракона.
# =====================================================================

# Счётчик КД
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] run scoreboard players add @s ste_te_m9 5

# Сброс КД
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] if score @s ste_te_m9 matches 120.. run scoreboard players set @s ste_te_m9 0

# Активация: 0 тик + игрок рядом + дракон не на портале
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] if score @s ste_te_m9 matches 0 at @s unless block ~ ~-1 ~ bedrock if entity @a[distance=..8] run function ste_te_patch:mechanics/tail_whip_blast
