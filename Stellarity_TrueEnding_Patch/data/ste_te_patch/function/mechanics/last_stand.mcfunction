# =====================================================================
# ste_te_patch:mechanics/last_stand
# ДВОЙНАЯ СМЕРТЬ — новая фишка:
#   Фаза 1: первое падение до 0 HP → восстанавливаем, начинаем Last Stand
#   Фаза 2: HP снова падает до 0 при флаге → финальная смерть
# Контекст: вызывается in minecraft:the_end из main_tick.
# =====================================================================

execute store result score @s temp_health run data get entity @s Health 1

# --- ФАЗА 1: Первое "убийство" дракона ---
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=!ste_te_death_triggered] at @s if score $dead ste_te_flags matches 0 if score @s temp_health matches ..1 run function ste_te_patch:mechanics/last_stand_phase1

# --- ФАЗА 2: Реальная смерть ---
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=!ste_te_death_triggered] at @s if score $dead ste_te_flags matches 1 if score @s temp_health matches ..1 run function ste_te_patch:mechanics/last_stand_phase2
