# =====================================================================
# ste_cos:main_tick
# Вызывается каждый тик. Запускает аддон-логику патча.
# =====================================================================

# Пункт 1 — Неуязвимость дракона, пока живы кристаллы
execute in minecraft:the_end run function ste_cos:dragon/invulnerability_guard

# Пункт 2 — Фантомы-стражи у живых кристаллов
execute in minecraft:the_end run function ste_cos:phantom/guard_tick
