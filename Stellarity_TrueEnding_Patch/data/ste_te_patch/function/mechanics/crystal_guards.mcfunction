# =====================================================================
# ste_te_patch:mechanics/crystal_guards
# Стражи кристаллов.
# Вызывается из main_tick на тике 55.
# =====================================================================

# Инициализация (только 1 раз — нет тега ste_te_guards_spawned)
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!ste_te_guards_spawned] run tag @s add ste_te_guards_spawned
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=ste_te_guards_spawned,scores={ste_te_m8=0}] at @s run function ste_te_patch:mechanics/crystal_guards_spawn

# Помечаем что уже проинициализировали (счётчик > 0 после спавна)
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] if score @s ste_te_m8 matches 0 run scoreboard players set @s ste_te_m8 1

# Поддержание: Если у interaction нет рядом фантома-стража → удаляем заглушку
execute as @e[type=interaction,tag=ste_te_crystal_hitbox] at @s unless entity @e[type=phantom,tag=ste_te_guard,distance=..5] run kill @s
