# =====================================================================
# ste_te_patch:mechanics/adaptive_ai
# =====================================================================

# Сброс lock-флага между атаками
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=ste_ai_locked] if score @s trueEnding_bosstime matches 200..250 run tag @s remove ste_ai_locked

# 1. Игрок высоко в воздухе (Y >= 80)
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=!ste_ai_locked] at @s if entity @a[y=80,dy=100,distance=..150] run tag @s add ste_ai_air_threat
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=!ste_ai_locked] if entity @a[y=80,dy=100,distance=..150] run tag @s add ste_ai_locked

# 2. Игрок ближе 8 блоков → Хвост-Кнут
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=!ste_ai_locked] at @s if entity @a[distance=..8] run tag @s add ste_ai_close_threat
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=!ste_ai_locked] at @s if entity @a[distance=..8] run tag @s add ste_ai_locked

# Реагируем на close_threat
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=ste_ai_close_threat] at @s run function ste_te_patch:mechanics/tail_whip_blast
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run tag @s remove ste_ai_close_threat
