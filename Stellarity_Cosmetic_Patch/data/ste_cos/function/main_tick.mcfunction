# =====================================================================
# ste_cos:main_tick
# Вызывается каждый тик. Запускает аддон-логику патча.
# =====================================================================

# Пункт 1 — Неуязвимость дракона, пока живы кристаллы
execute in minecraft:the_end run function ste_cos:dragon/invulnerability_guard

# Пункт 2 — Фантомы-стражи у живых кристаллов
execute in minecraft:the_end run function ste_cos:phantom/guard_tick

# Фича C — яйцо дракона (сканирование + маркер/частицы)
execute in minecraft:the_end run function ste_cos:egg/egg_tick

# Фича A — хорус: аккуратный дроп+уборка маркером (постоянно, медленно)
execute in minecraft:the_end run function ste_cos:portal/chorus_tick

# Быстрый bulk-сброс хоруса раз в 30 сек (600 тиков) — разгружает мир
scoreboard players add $pull_timer ste_cos.flags 1
execute if score $pull_timer ste_cos.flags matches 600.. run scoreboard players set $pull_timer ste_cos.flags 0
execute in minecraft:the_end if score $pull_timer ste_cos.flags matches 0 run function ste_cos:portal/chorus_cleaner
