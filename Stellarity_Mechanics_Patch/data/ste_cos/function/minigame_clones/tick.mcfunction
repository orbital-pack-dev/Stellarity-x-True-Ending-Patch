# ste_cos:minigame_clones/tick
# главный цикл мини-игры "Иллюзорные Драконы"

# Состояние 1: Дракон направляется к Порталу (0 67 0)
# Строгая проверка шагов: подхват армор-стендом происходит ТОЛЬКО когда дракон долетел до портала 0 67 0 (distance=..8)
# Если дракон пролетает мимо 28 85 0 до посещения портала, мини-игра НЕ запускается!
execute if score #minigame_state ste_cos.flags matches 1 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s positioned 0 67 0 if entity @s[distance=..8] run function ste_cos:minigame_clones/start_carrier

# Состояние 2: Плавный взлет армор-стенда с драконом по C-кривой от (0, 67, 0) до (28, 85, 0)
execute if score #minigame_state ste_cos.flags matches 2 run function ste_cos:minigame_clones/tick_carrier

# Состояние 3: Поэтапный спавн копий (active=0) или карусель трех драконов (active=1)
execute if score #minigame_state ste_cos.flags matches 3 if score #carousel_active ste_cos.flags matches 0 run function ste_cos:minigame_clones/tick_summon_stage
execute if score #minigame_state ste_cos.flags matches 3 if score #carousel_active ste_cos.flags matches 1 run function ste_cos:minigame_clones/tick_carousel

# Состояние 4: Растянутое завершение (снаряд в глаза игрока -> пике копии 1 -> пике копии 2 -> освобождение дракона -> лазер)
execute if score #minigame_state ste_cos.flags matches 4 run function ste_cos:minigame_clones/tick_resolve
