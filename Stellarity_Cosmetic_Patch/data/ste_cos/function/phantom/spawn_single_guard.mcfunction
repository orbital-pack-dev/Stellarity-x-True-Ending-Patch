# =====================================================================
# ste_cos:phantom/spawn_single_guard
# ФАЗА 2 (as armor_stand-marker at маркер).
# Спавнит ОДНОГО фантома-стража в позиции маркера.
# Фантом получает тот же id (ste_cos.id), что и маркер — орбита/частицы
# работают с ним через совпадение id (orbit_guard поставит его на круг).
# =====================================================================

# Уменьшаем число целей (этот кристалл получил стража)
scoreboard players remove #target_count ste_cos.flags 1

# Сохраняем id маркера во временную переменную
scoreboard players operation #spawn_id ste_cos.flags = @s ste_cos.id

# Фантом-страж в позиции маркера (NoAI, 50 hp, не деспавнится)
summon phantom ~ ~ ~ {Tags:["ste_cos_guard"],NoAI:1b,Silent:1b,Health:50.0f,attributes:[{id:"max_health",base:50.0}],PersistenceRequired:1b}

# Фантому — тот же id, что у маркера (созданный только что)
execute as @e[type=phantom,tag=ste_cos_guard,distance=..2,limit=1] run scoreboard players operation @s ste_cos.id = #spawn_id ste_cos.flags
