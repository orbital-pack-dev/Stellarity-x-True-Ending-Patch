# =====================================================================
# ste_cos:phantom/init_phantoms
# ФАЗА 2. Вызывается один раз за бой (без контекста сущности).
# Выбирает случайные 2..10 кристаллов-маркеров, которым положен фантом-страж,
# и спавнит каждому ОДНОГО фантома на его орбите.
# Каждый кристалл = 1 фантом (макс 10, обычно 2..10).
# =====================================================================

scoreboard players set #phantoms_spawned ste_cos.flags 1

# Рандомное количество кристаллов-целей 2..10 (средние значения вероятнее: (2..10 + 2..10)/2)
execute store result score #r1 ste_cos.flags run random value 2..10
execute store result score #r2 ste_cos.flags run random value 2..10
scoreboard players set #two ste_cos.flags 2
scoreboard players operation #target_count ste_cos.flags = #r1 ste_cos.flags
scoreboard players operation #target_count ste_cos.flags += #r2 ste_cos.flags
scoreboard players operation #target_count ste_cos.flags /= #two ste_cos.flags

# Каждому выбранному случайному маркеру без фантома — спавн стража
execute as @e[type=armor_stand,tag=ste_cos_guard_marker,sort=random] unless entity @e[type=phantom,tag=ste_cos_guard,distance=..3,limit=1] if score #target_count ste_cos.flags matches 1.. run function ste_cos:phantom/spawn_single_guard

# Фантомы, у которых маркер умер (кристалл сломан) — чистятся в guard_move/cleanup_current
