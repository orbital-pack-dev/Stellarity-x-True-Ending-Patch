# ste_cos:load
# Совместимостный патч — инициализация.

# Увеличиваем лимит блоков на команду (нужен для fill при зачистке арены)
gamerule max_block_modifications 1999999999

# Скорборды
scoreboard objectives add ste_cos.flags dummy '{"text":"STE-COS Flags"}'
scoreboard objectives add ste_cos.timer dummy '{"text":"STE-COS Timer"}'
scoreboard objectives add ste_cos.egg_timer dummy '{"text":"STE-COS Egg Timer"}'
scoreboard objectives add ste_cos.search_stage dummy '{"text":"STE-COS Search Stage"}'
scoreboard objectives add ste_cos.id dummy '{"text":"STE-COS IDs"}'
scoreboard objectives add ste_cos.radius dummy '{"text":"STE-COS Orbit Radius"}'
scoreboard objectives add ste_cos.orbit_y dummy '{"text":"STE-COS Orbit Y"}'

# Стартовые значения флагов
scoreboard players set $pull_timer ste_cos.flags 0
scoreboard players set #rng_ticker ste_cos.flags 0
scoreboard players set #egg_tracker_spawned ste_cos.flags 0
execute unless score #portal_fix_done ste_cos.flags matches 1 run scoreboard players set #portal_fix_done ste_cos.flags 0
execute unless score #portal_fix ste_cos.timer matches 1.. run scoreboard players set #portal_fix ste_cos.timer 0

# Форслоад 10 башен с кристаллами + центр острова.
# Каждый forceload охватывает 24 блока во все стороны от башни (1 чанк с запасом).
# Делается один раз за сессию (флаг #forceloaded).
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add 39 -24 87 24
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add 26 12 74 60
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -6 35 42 83
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -43 35 5 83
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -75 12 -27 60
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -87 -24 -39 24
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -75 -63 -27 -15
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -43 -84 5 -36
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -6 -84 42 -36
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add 26 -63 74 -15
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -24 -24 24 24
execute unless score #forceloaded ste_cos.flags matches 1.. run scoreboard players set #forceloaded ste_cos.flags 1
