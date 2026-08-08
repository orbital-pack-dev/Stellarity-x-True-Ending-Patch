# =====================================================================
# ste_cos:main_tick
# Вызывается каждый тик.
# =====================================================================

# Пункт 1 — Неуязвимость дракона, пока живы кристаллы
execute in minecraft:the_end run function ste_cos:dragon/invulnerability_guard

# Пункт 2 — Фантомы-стражи вокруг кристаллов (во время боя)
execute in minecraft:the_end run function ste_cos:phantom/guard_tick

# Фича C — яйцо дракона (маркер + частицы)
execute in minecraft:the_end run function ste_cos:egg/egg_tick

# Фича A — уборка хоруса возле портала (раз в ~30 сек)
scoreboard players add $pull_timer ste_cos.flags 1
execute if score $pull_timer ste_cos.flags matches 600.. run scoreboard players set $pull_timer ste_cos.flags 0
execute in minecraft:the_end if score $pull_timer ste_cos.flags matches 0 run function ste_cos:portal/chorus_cleaner
