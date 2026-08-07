# =====================================================================
# ste_te_patch:main_tick
# Главный таймер-стейт-машина для 14 механик патча.
# Все механики запускаются строго в the_end через единый entry-point.
# =====================================================================

scoreboard players add Global ste_te_timer 1
execute if score Global ste_te_timer matches 100.. run scoreboard players set Global ste_te_timer 0

# Инициализация стражей (один раз)
execute in minecraft:the_end if score $guards_spawned ste_te_flags matches 0 run function ste_te_patch:mechanics/crystal_guards_spawn
execute in minecraft:the_end if score $guards_spawned ste_te_flags matches 0 run scoreboard players set $guards_spawned ste_te_flags 1

# TICK 5: Метеоритный дождь, Островной гнев
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 5 run function ste_te_patch:mechanics/meteor_rain
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 5 run function ste_te_patch:mechanics/island_wrath

# TICK 10: Гравитационный коллапс (AFK-чек) и Разрушаемые фаерболы
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 10 run function ste_te_patch:mechanics/gravity_collapse
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 10 run function ste_te_patch:mechanics/destructive_fireballs

# TICK 15: Кольцо драконьего дыхания Y>85
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 15 run function ste_te_patch:mechanics/air_ring

# TICK 20: Тяжелая броня (Проверка Незерита)
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 20 run function ste_te_patch:mechanics/heavy_armor

# TICK 25: Мини-кольцо против булавы (Посадка)
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 25 run function ste_te_patch:mechanics/anti_mace_perch

# TICK 30: Хвост-кнут
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 30 run function ste_te_patch:mechanics/tail_whip

# TICK 35: Адаптивный ИИ (Оценка приоритетов)
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 35 run function ste_te_patch:mechanics/adaptive_ai

# TICK 40: Королевская атака
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 40 run function ste_te_patch:mechanics/royal_laser

# TICK 45: Осколки (Shard Charge)
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 45 run function ste_te_patch:mechanics/shard_charge

# TICK 50: Зеркальные клоны
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 50 run function ste_te_patch:mechanics/mirror_clones

# TICK 55: Кристальные стражи
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 55 run function ste_te_patch:mechanics/crystal_guards

# TICK 60: Фейк-нырок (Логика подхвата)
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 60 run function ste_te_patch:mechanics/fake_dive

# TICK 65: Last Stand (Двойная смерть)
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score Global ste_te_timer matches 65 run function ste_te_patch:mechanics/last_stand
