# =====================================================================
# ste_cos:main_tick
# Вызывается каждый тик.
# =====================================================================

# П.4 — неуязвимость дракона, пока живы кристаллы (доп. защита, кроме a_main)
execute in minecraft:the_end run function ste_cos:dragon/invulnerability_guard

# П.5 — фантомы-стражи вокруг кристаллов (во время боя)
execute in minecraft:the_end run function ste_cos:phantom/guard_tick

# П.3 — яйцо дракона (подсветка, только когда яйцо есть)
execute in minecraft:the_end run function ste_cos:egg/egg_tick

# П.1 — уборка хоруса возле портала (раз в ~30 сек)
scoreboard players add $pull_timer ste_cos.flags 1
execute if score $pull_timer ste_cos.flags matches 600.. run scoreboard players set $pull_timer ste_cos.flags 0
execute in minecraft:the_end if score $pull_timer ste_cos.flags matches 0 run function ste_cos:portal/chorus_cleaner
