# ste_cos:phantom/spawn_guard
# Фикс кристаллов

# Фантомы-стражи


# Increment RNG
scoreboard players add #rng_ticker ste_cos.flags 1
execute if score #rng_ticker ste_cos.flags matches 25.. run scoreboard players set #rng_ticker ste_cos.flags 0

# Фантомы-стражи
scoreboard players add #guard_id ste_cos.flags 1

# Фикс кристаллов
summon area_effect_cloud ~ ~ ~ {Duration:60000,Radius:0.0f,WaitTime:0,Tags:["ste_cos_guard_marker","ste_cos_guard_marker_new"]}
execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags

execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 0..4 run scoreboard players set @s ste_cos.orbit_y 5
execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 5..9 run scoreboard players set @s ste_cos.orbit_y 10
execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 10..14 run scoreboard players set @s ste_cos.orbit_y 15
execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 15..19 run scoreboard players set @s ste_cos.orbit_y 25
execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 20..24 run scoreboard players set @s ste_cos.orbit_y 35

scoreboard players add #rng_ticker ste_cos.flags 1
execute if score #rng_ticker ste_cos.flags matches 5.. run scoreboard players set #rng_ticker ste_cos.flags 0
execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 0 run scoreboard players set @s ste_cos.radius 4
execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 1 run scoreboard players set @s ste_cos.radius 5
execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 2 run scoreboard players set @s ste_cos.radius 6
execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 3 run scoreboard players set @s ste_cos.radius 7
execute as @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new,distance=..1,limit=1] if score #rng_ticker ste_cos.flags matches 4 run scoreboard players set @s ste_cos.radius 8

# Механика боя
tag @e[type=area_effect_cloud,tag=ste_cos_guard_marker_new] remove ste_cos_guard_marker_new

# Фикс кристаллов
execute positioned ~4 ~3 ~ run summon phantom ~ ~ ~ {Tags:["ste_cos_guard","ste_cos_guard_new"],NoAI:1b,Silent:1b,Health:20.0f,PersistenceRequired:1b}
execute as @e[type=phantom,tag=ste_cos_guard_new,distance=..7,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags
tag @e[type=phantom,tag=ste_cos_guard_new] remove ste_cos_guard_new
