# =====================================================================
# ste_te_patch:mechanics/adaptive_ai
# Адаптивный ИИ. Вызывается каждые 100 тиков из main_tick.
# Сканирует игроков и ставит теги приоритета атак.
# =====================================================================

# --- Разлок (сброс lock-флага между атаками) ---
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=ste_ai_locked] if score @s trueEnding_bosstime matches 200..250 run tag @s remove ste_ai_locked

# --- Пока нет активной атаки ---

# 1. Если кто-то высоко в воздухе (Y >= 80) → ставим тег "air_threat"
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!ste_ai_locked] if entity @a[distance=..150,y=80,dy=100] run tag @s add ste_ai_air_threat
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!ste_ai_locked] if entity @a[distance=..150,y=80,dy=100] run tag @s add ste_ai_locked

# 2. Игрок ближе 8 блоков И нет другой угрозы → Хвост-Кнут
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!ste_ai_locked] at @s if entity @a[distance=..8] run tag @s add ste_ai_close_threat
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!ste_ai_locked] at @s if entity @a[distance=..8] run tag @s add ste_ai_locked
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=ste_ai_close_threat] at @s run function ste_te_patch:mechanics/tail_whip
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] run tag @s remove ste_ai_close_threat
