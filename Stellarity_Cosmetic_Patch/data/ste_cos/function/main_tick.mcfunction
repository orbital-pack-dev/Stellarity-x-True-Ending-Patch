# =====================================================================
# ste_cos:main_tick
# Вызывается каждый тик.
# =====================================================================

# Автоуборка тега при выходе из Энда
execute as @a[tag=ste_cos_chorus_cleaned] at @s unless dimension minecraft:the_end run tag @s remove ste_cos_chorus_cleaned

# =====================================================================
# П.4 — Боссбар фикс: проверяем от лица Игроков.
tag @a remove ste_cos_has_dragon
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon] at @s run tag @a[distance=..400] add ste_cos_has_dragon
execute run bossbar set stellarity:ender_dragon players @a[tag=ste_cos_has_dragon]
execute run bossbar set stellarity:crystal_count players @a[tag=ste_cos_has_dragon]

# Возвращаем цвет по умолчанию если дракона нет
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run bossbar set stellarity:ender_dragon color pink
# =====================================================================

# =====================================================================
# П.5 — Блокировка Портала Энда (через AEC с тегом ste_cos_portal_lock)
# Отбрасывает игроков (левитация) пока Энд генерируется.
# Автоматический спавн, когда Stellarity запускает анимацию открытия портала.
# AEC исчезнет сам через 26 секунд (Duration: 520).
# =====================================================================
execute in minecraft:overworld as @e[type=marker,tag=stellarity.end_portal_animation,tag=!ste_cos.portal_lock_spawned] at @s run summon area_effect_cloud ~ ~ ~ {Duration:520,Radius:6f,Tags:["ste_cos_portal_lock"]}
execute in minecraft:overworld as @e[type=marker,tag=stellarity.end_portal_animation,tag=!ste_cos.portal_lock_spawned] run tag @s add ste_cos.portal_lock_spawned

execute in minecraft:overworld as @e[type=area_effect_cloud,tag=ste_cos_portal_lock] at @s run effect give @a[distance=..6] levitation 1 5 true

# RNG-тикер (инкремент каждый тик для разнообразия random в spawn_guard)
scoreboard players add #rng_ticker ste_cos.flags 1
execute if score #rng_ticker ste_cos.flags matches 25.. run scoreboard players set #rng_ticker ste_cos.flags 0

# =====================================================================
# П.6 — Оптимизация (ВЫХОД ЕСЛИ В ЭНДЕ НИКОГО НЕТ)
# Все следующие функции выполняются только если кто-то есть в Энде.
# =====================================================================
execute in minecraft:the_end unless entity @a run return 0

# П.4 — Неуязвимость/щит дракона
execute in minecraft:the_end run function ste_cos:dragon/invulnerability_guard

# П.5 — Фантомы-стражи кристаллов
execute in minecraft:the_end run function ste_cos:phantom/guard_tick

# П.3 — Яйцо дракона
execute in minecraft:the_end run function ste_cos:egg/egg_tick

# П.1 — Уборка хоруса около портала (раз ~30 сек + при заходе в Энд)
scoreboard players add $pull_timer ste_cos.flags 1
execute if score $pull_timer ste_cos.flags matches 600.. run scoreboard players set $pull_timer ste_cos.flags 0
execute in minecraft:the_end if score $pull_timer ste_cos.flags matches 0 run function ste_cos:portal/chorus_cleaner
execute as @a[tag=!ste_cos_chorus_cleaned] at @s if dimension minecraft:the_end run function ste_cos:portal/chorus_cleaner
execute as @a[tag=!ste_cos_chorus_cleaned] at @s if dimension minecraft:the_end run tag @s add ste_cos_chorus_cleaned

# П.8 — Механики боя
execute in minecraft:the_end run function ste_cos:mechanics/tick



