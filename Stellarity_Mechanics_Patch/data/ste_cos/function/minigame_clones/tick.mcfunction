# ste_cos:minigame_clones/tick
# главный цикл мини-игры "Иллюзорные Драконы"

# Состояние 1: Дракон летит к порталу
execute if score #minigame_state ste_cos.flags matches 1 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s positioned 0 65 0 if entity @s[distance=..12] run function ste_cos:minigame_clones/start_ascend

# Состояние 2: Плавный взлет дракона на высоту 65
execute if score #minigame_state ste_cos.flags matches 2 run function ste_cos:minigame_clones/tick_ascend

# Состояние 3: Карусель трех драконов
execute if score #minigame_state ste_cos.flags matches 3 run function ste_cos:minigame_clones/tick_carousel

# Состояние 4: Поэтапное завершение (вылет к порталу и отложенная атака)
execute if score #minigame_state ste_cos.flags matches 4 run function ste_cos:minigame_clones/tick_resolve
