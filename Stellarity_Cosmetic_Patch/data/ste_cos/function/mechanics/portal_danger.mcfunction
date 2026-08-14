# =====================================================================
# ste_cos:mechanics/portal_danger
# Вызывается если дракон жив.
# Если дракон дальше 25 блоков от портала — увеличиваем таймер
# Каждые 3 сек (60 тиков) пускаем волну от центра (0 61 0).
# Если дракон возвращается — всё отменяем.
# =====================================================================

# Дракон далеко от портала → таймер++
execute positioned 0 64 0 unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run scoreboard players add #wave_timer ste_cos.flags 1

# Пускаем волну
execute if score #wave_timer ste_cos.flags matches 60.. positioned 0 61 0 run function ste_cos:mechanics/portal_wave_start
execute if score #wave_timer ste_cos.flags matches 60.. run scoreboard players set #wave_timer ste_cos.flags 0

# Дракон вернулся к порталу → сбрасываем таймер и убиваем остатки волны
execute positioned 0 64 0 if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run scoreboard players set #wave_timer ste_cos.flags 0
execute positioned 0 64 0 if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run kill @e[type=marker,tag=ste_cos_portal_wave]
