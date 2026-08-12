# =====================================================================
# ste_cos:main_tick
# Вызывается каждый тик.
# =====================================================================

# П.4 — Неуязвимость/щит дракона (до фикс in the_end)
execute in minecraft:the_end run function ste_cos:dragon/invulnerability_guard

# П.5 — Фантомы-стражи кристаллов (по одному на каждый маркер)
execute in minecraft:the_end run function ste_cos:phantom/guard_tick

# П.3 — Яйцо дракона (частицы, только когда яйцо реально существует)
execute in minecraft:the_end run function ste_cos:egg/egg_tick

# П.1 — Уборка хоруса около портала (раз ~30 сек + при заходе в Энд)
scoreboard players add $pull_timer ste_cos.flags 1
execute if score $pull_timer ste_cos.flags matches 600.. run scoreboard players set $pull_timer ste_cos.flags 0
execute in minecraft:the_end if score $pull_timer ste_cos.flags matches 0 run function ste_cos:portal/chorus_cleaner

# Автоуборка при заходе игрока в Энд
execute as @a at @s if dimension minecraft:the_end unless entity @s[tag=ste_cos_chorus_cleaned] run function ste_cos:portal/chorus_cleaner
execute as @a at @s if dimension minecraft:the_end unless entity @s[tag=ste_cos_chorus_cleaned] run tag @s add ste_cos_chorus_cleaned
execute as @a at @s unless dimension minecraft:the_end if entity @s[tag=ste_cos_chorus_cleaned] run tag @s remove ste_cos_chorus_cleaned

# =====================================================================
# П.4 — Боссбар фикс: проверяем от лица Игроков. 
# Если в радиусе 400 блоков от игрока Дракона нету, то убираем его из боссбара.
tag @a remove ste_cos_has_dragon
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon] at @s run tag @a[distance=..400] add ste_cos_has_dragon
execute run bossbar set stellarity:ender_dragon players @a[tag=ste_cos_has_dragon]
execute run bossbar set stellarity:crystal_count players @a[tag=ste_cos_has_dragon]

# Возвращаем цвет по умолчанию если дракона нет
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run bossbar set stellarity:ender_dragon color pink
# =====================================================================

# =====================================================================
# П.9 — Убираем interaction-щиты когда дракон призван (в бою игрок должен ломать кристаллы)
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=minecraft:interaction,tag=ste_cos_crystal_shield]
# =====================================================================

# =====================================================================
# П.6 — Анти-краш: дыхание дракона
# Если >40 облаков area_effect_cloud у портала (радиус 32) — убиваем самые старые
execute in minecraft:the_end positioned 0 64 0 if entity @e[type=area_effect_cloud,distance=..32,limit=41] run kill @e[type=area_effect_cloud,distance=..32,sort=furthest,limit=15]
# =====================================================================

# =====================================================================
# П.7 — Отменено: Оки-Края больше не убиваются.
# =====================================================================

# RNG-тикер (инкремент каждый тик для разнообразия random в spawn_guard)
scoreboard players add #rng_ticker ste_cos.flags 1
execute if score #rng_ticker ste_cos.flags matches 25.. run scoreboard players set #rng_ticker ste_cos.flags 0