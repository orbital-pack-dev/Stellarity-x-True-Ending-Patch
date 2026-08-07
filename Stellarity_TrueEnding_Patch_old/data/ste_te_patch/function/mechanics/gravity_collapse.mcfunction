# =====================================================================
# ste_te_patch:mechanics/gravity_collapse
# Трекинг AFK (радиус <= 2 блока за 13 сек = 260 тиков).
# Вызывается in minecraft:the_end каждые 10 тиков.
# =====================================================================

# ШАГ 1: Спавним маркер у каждого игрока в the_end (если нет рядом)
execute in minecraft:the_end as @a unless entity @e[type=marker,tag=ste_afk_anchor,distance=..2,limit=1] at @s run summon marker ~ ~ ~ {Tags:["ste_afk_anchor"]}

# ШАГ 2: Игрок в радиусе 2 от маркера → добавляем АФК тики
execute in minecraft:the_end as @a at @s if entity @e[type=marker,tag=ste_afk_anchor,distance=..2,limit=1] run scoreboard players add @s ste_te_afk_time 10

# ШАГ 3: Игрок вышел за 2 блока → сброс счётчика и перемещение маркера
execute in minecraft:the_end as @a at @s unless entity @e[type=marker,tag=ste_afk_anchor,distance=..2,limit=1] run scoreboard players set @s ste_te_afk_time 0
execute in minecraft:the_end as @a at @s unless entity @e[type=marker,tag=ste_afk_anchor,distance=..2,limit=1] run kill @e[type=marker,tag=ste_afk_anchor,distance=..30,limit=1]

# ШАГ 4: Наказание при AFK >= 260 тиков (13 сек), сброс счётчика
execute in minecraft:the_end as @a[scores={ste_te_afk_time=260..}] run scoreboard players set @s ste_te_afk_time 0
execute in minecraft:the_end as @a[scores={ste_te_afk_time=0},tag=!ste_afk_punished] at @s run function ste_te_patch:mechanics/gravity_collapse_punish
