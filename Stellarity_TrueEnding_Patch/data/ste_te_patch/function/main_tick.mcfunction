# =====================================================================
# ste_te_patch:main_tick
# Главный таймер-стейт-машина для 14 механик патча.
# Разгружает сервер, распределяя проверки по тикам (1..100).
# =====================================================================

scoreboard players add Global ste_te_timer 1
execute if score Global ste_te_timer matches 100.. run scoreboard players set Global ste_te_timer 0

# TICK 5: Метеоритный дождь, Островной гнев
execute if score Global ste_te_timer matches 5 run function ste_te_patch:mechanics/meteor_rain
execute if score Global ste_te_timer matches 5 run function ste_te_patch:mechanics/island_wrath

# TICK 10: Гравитационный коллапс (AFK-чек) и Разрушаемые фаерболы
execute if score Global ste_te_timer matches 10 run function ste_te_patch:mechanics/gravity_collapse
execute if score Global ste_te_timer matches 10 run function ste_te_patch:mechanics/destructive_fireballs

# TICK 15: Кольцо драконьего дыхания Y>85
execute if score Global ste_te_timer matches 15 run function ste_te_patch:mechanics/air_ring

# TICK 20: Тяжелая броня (Проверка Незерита)
execute if score Global ste_te_timer matches 20 run function ste_te_patch:mechanics/heavy_armor

# TICK 25: Мини-кольцо против булавы (Посадка)
execute if score Global ste_te_timer matches 25 run function ste_te_patch:mechanics/anti_mace_perch

# TICK 30: Хвост-кнут
execute if score Global ste_te_timer matches 30 run function ste_te_patch:mechanics/tail_whip

# TICK 35: Адаптивный ИИ (Оценка приоритетов)
execute if score Global ste_te_timer matches 35 run function ste_te_patch:mechanics/adaptive_ai

# TICK 40: Королевская атака
execute if score Global ste_te_timer matches 40 run function ste_te_patch:mechanics/royal_laser

# TICK 45: Осколки (Shard Charge)
execute if score Global ste_te_timer matches 45 run function ste_te_patch:mechanics/shard_charge

# TICK 50: Зеркальные фантомы
execute if score Global ste_te_timer matches 50 run function ste_te_patch:mechanics/mirror_clones

# TICK 55: Кристальные стражи
execute if score Global ste_te_timer matches 55 run function ste_te_patch:mechanics/crystal_guards

# TICK 60: Фейк-нырок (Логика подхвата)
execute if score Global ste_te_timer matches 60 run function ste_te_patch:mechanics/fake_dive
