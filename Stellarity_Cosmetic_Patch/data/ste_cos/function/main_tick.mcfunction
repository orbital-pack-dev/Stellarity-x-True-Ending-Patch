# =====================================================================
# ste_cos:main_tick
# Вызывается каждый тик. Запускает аддон-логику патча.
# =====================================================================

# Пункт 1 — Неуязвимость дракона, пока живы кристаллы
execute in minecraft:the_end run function ste_cos:dragon/invulnerability_guard

# Пункт 2 — Фантомы-стражи у живых кристаллов
execute in minecraft:the_end run function ste_cos:phantom/guard_tick

# Фича A — очистка хоруса возле портала (раз в ~5 сек)
scoreboard players add $portal_timer ste_cos.flags 1
execute if score $portal_timer ste_cos.flags matches 100.. run scoreboard players set $portal_timer ste_cos.flags 0
execute in minecraft:the_end if score $portal_timer ste_cos.flags matches 0 run function ste_cos:portal/chorus_cleaner

# Фича C — яйцо дракона (сканирование + маркер/частицы)
execute in minecraft:the_end run function ste_cos:egg/egg_tick
