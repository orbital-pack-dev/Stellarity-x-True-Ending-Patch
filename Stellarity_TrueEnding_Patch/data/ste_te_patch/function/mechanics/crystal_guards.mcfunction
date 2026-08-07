# =====================================================================
# ste_te_patch:mechanics/crystal_guards
# Кристальные стражи. Фантомы респавнятся у живых кристаллов.
# Вызывается in minecraft:the_end из main_tick на тике 55.
# =====================================================================

# Принудительный (пере)спавн: у каждого кристалла без живого стража спавним нового
execute in minecraft:the_end as @e[type=end_crystal] at @s unless entity @e[type=phantom,tag=ste_te_guard,distance=..4,limit=1] run summon phantom ~ ~2 ~ {Tags:["ste_te_guard"],Health:20.0f,Silent:0b}

# Пока хоть один страж жив → дракон неуязвим (resist 255)
execute in minecraft:the_end if entity @e[type=phantom,tag=ste_te_guard] as @e[type=ender_dragon,tag=stellarity.dragon] run effect give @s resistance 5 255 true

# Партиклы стражей AT стража
execute in minecraft:the_end as @e[type=phantom,tag=ste_te_guard] at @s run particle soul_fire_flame ~ ~1 ~ 0.5 0.5 0.5 0.1 3 force
