# =====================================================================
# ste_cos:phantom/guard_tick
# Пункт 2. Фантомы-стражи вокруг живых кристаллов края.
#
# Стражи работают ТОЛЬКО во время боя с драконом (есть stellarity.ender_dragon).
# Пока дракона нет — все стражи зачищаются (не спавнятся у восстанавливаемых
# башен до начала боя).
#
# Вызывается каждый тик из main_tick (контекст уже in the_end).
# =====================================================================

# ---- Если дракон есть — спавн/обработка стражей ----
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:phantom/guard_active

# ---- Если дракона нет — чистим всех стражей (не спавнить до боя) ----
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:phantom/guard_cleanup_all
