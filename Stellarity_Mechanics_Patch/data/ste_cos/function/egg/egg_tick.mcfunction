# ste_cos:egg/egg_tick
# визуальные эффекты яйца дракона на алтаре портала (без сущностей-маркеров)

execute in minecraft:the_end positioned 0 67 0 if entity @a[distance=..96] if block ~ ~ ~ minecraft:dragon_egg run function ste_cos:egg/egg_glow
