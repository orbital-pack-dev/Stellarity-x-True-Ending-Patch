# =====================================================================
# ste_te_patch:mechanics/last_stand
# ДВОЙНАЯ СМЕРТЬ — новая фишка:
#   Фаза 1: первое падение до 0 HP → восстанавливаем, начинаем Last Stand
#   Фаза 2: HP снова падает до 0 при флаге → финальная смерть
# Контекст: вызывается in minecraft:the_end из main_tick.
# =====================================================================

# --- ФАЗА 1: Первое "убийство" дракона ---
# Если здоровье <= 1f и флага last_stand ещё нет
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,tag=!ste_te_last_stand,tag=!ste_te_death_triggered] if data entity @s {Health:1f} run function ste_te_patch:mechanics/last_stand_phase1

# --- ФАЗА 2: Реальная смерть ---
# HP снова <= 1f, флаг last_stand ЕСТЬ — запускаем финальную последовательность
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,tag=ste_te_last_stand,tag=!ste_te_death_triggered] if data entity @s {Health:1f} run function ste_te_patch:mechanics/last_stand_phase2
