# =====================================================================
# ste_te_patch:mechanics/gravity_collapse
# Трекинг AFK (радиус <= 2 блока за 13 сек = 260 тиков).
# Вызывается каждые 10 тиков (tick 10 в main_tick).
# =====================================================================

# ШАГ 1: Спавним позиционный маркер у каждого игрока (если его нет)
execute as @a[distance=..150] at @s unless entity @e[type=marker,tag=ste_afk_anchor,distance=..2,limit=1] run summon marker ~ ~ ~ {Tags:["ste_afk_anchor"]}

# ШАГ 2: Если игрок остался в радиусе 2 блоков от старого маркера — добавляем АФК тики
execute as @a[distance=..150] at @s if entity @e[type=marker,tag=ste_afk_anchor,distance=..2,limit=1] run scoreboard players add @s ste_te_afk_time 10

# ШАГ 3: Если игрок вышел за 2 блока — сбрасываем счётчик и перемещаем маркер
execute as @a[distance=..150] at @s unless entity @e[type=marker,tag=ste_afk_anchor,distance=..2,limit=1] run scoreboard players set @s ste_te_afk_time 0
execute as @a[distance=..150] at @s unless entity @e[type=marker,tag=ste_afk_anchor,distance=..2,limit=1] run kill @e[type=marker,tag=ste_afk_anchor,distance=..30,limit=1]

# ШАГ 4: Наказание при AFK >= 260 тиков (13 сек)
execute as @a[scores={ste_te_afk_time=260..}] at @s run scoreboard players set @s ste_te_afk_time 0
execute as @a[scores={ste_te_afk_time=0},tag=!ste_afk_punished] at @s run function ste_te_patch:mechanics/gravity_collapse_punish
