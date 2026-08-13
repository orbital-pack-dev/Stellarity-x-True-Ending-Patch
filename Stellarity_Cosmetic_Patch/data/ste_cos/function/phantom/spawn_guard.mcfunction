# =====================================================================
# ste_cos:phantom/spawn_guard
# Спавн стража на башне (AS end_crystal AT кристалла).
#
# Маркер спавнится на кристалле (с рандомной высотой от 0.5 до 3.5 блоков).
# Фантом-страж спавнится в стороне (4 блока от маркера),
# который со временем перемещается на орбиту фантомом (радиус орбиты рандом).
# =====================================================================

# Обновляем тикер-счётчик RNG
scoreboard players add #rng_ticker ste_cos.flags 1
execute if score #rng_ticker ste_cos.flags matches 25.. run scoreboard players set #rng_ticker ste_cos.flags 0

# Выдаём следующий ID стражу
scoreboard players add #guard_id ste_cos.flags 1

# Спавним маркер на кристалле
summon marker ~ ~ ~ {Tags:["ste_cos_guard_marker","ste_cos_guard_marker_new"]}
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags

# --- Рандомная высота орбиты (5 вариантов через rng % 5) ---
# matches 0,5,10,15,20 → orbit_y 5,10,15,25,35 (= 0.5, 1.0, 1.5, 2.5, 3.5 блоков)
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 0 run scoreboard players set @s ste_cos.orbit_y 5
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 1 run scoreboard players set @s ste_cos.orbit_y 10
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 2 run scoreboard players set @s ste_cos.orbit_y 15
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 3 run scoreboard players set @s ste_cos.orbit_y 25
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 4 run scoreboard players set @s ste_cos.orbit_y 35

# --- Рандомный радиус орбиты 4..8 (5 вариантов, чередуем через rng+1 % 5) ---
scoreboard players add #rng_ticker ste_cos.flags 1
execute if score #rng_ticker ste_cos.flags matches 5.. run scoreboard players set #rng_ticker ste_cos.flags 0
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 0 run scoreboard players set @s ste_cos.radius 4
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 1 run scoreboard players set @s ste_cos.radius 5
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 2 run scoreboard players set @s ste_cos.radius 6
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 3 run scoreboard players set @s ste_cos.radius 7
execute as @e[type=marker,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 4 run scoreboard players set @s ste_cos.radius 8

# Убираем temp-тег
tag @e[type=marker,tag=ste_cos_guard_marker_new] remove ste_cos_guard_marker_new

# Фантом-страж на 4 блока в сторону от кристалла, 3 блока выше
execute positioned ~4 ~3 ~ run summon phantom ~ ~ ~ {Tags:["ste_cos_guard","ste_cos_guard_new"],NoAI:1b,Silent:1b,Health:20.0f,PersistenceRequired:1b}
execute as @e[type=phantom,tag=ste_cos_guard_new,distance=..6,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags
tag @e[type=phantom,tag=ste_cos_guard_new] remove ste_cos_guard_new