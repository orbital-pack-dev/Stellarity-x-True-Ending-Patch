# =====================================================================
# ste_cos:mechanics/still_ground_check
# AS игрока, OnGround=1b. Сравниваем текущую X/Z с прошлым тиком.
# =====================================================================

# Получаем текущую X (с точностью до 1 блока)
execute store result score #tx ste_cos.flags run data get entity @s Pos[0] 1
execute store result score #tz ste_cos.flags run data get entity @s Pos[2] 1

# Если X или Z изменились — сбрасываем таймер
execute unless score @s ste_cos.pos_x = #tx ste_cos.flags run scoreboard players set @s ste_cos.still_timer 0
execute unless score @s ste_cos.pos_z = #tz ste_cos.flags run scoreboard players set @s ste_cos.still_timer 0

# Если НЕ изменились — увеличиваем таймер
execute if score @s ste_cos.pos_x = #tx ste_cos.flags if score @s ste_cos.pos_z = #tz ste_cos.flags run scoreboard players add @s ste_cos.still_timer 1

# Обновляем сохранённую позицию
scoreboard players operation @s ste_cos.pos_x = #tx ste_cos.flags
scoreboard players operation @s ste_cos.pos_z = #tz ste_cos.flags

# Если стоит 260 тиков (13 сек) — вихрь! (но не чаще чем раз в 5 сек после)
execute if score @s ste_cos.still_timer matches 260 run function ste_cos:mechanics/vortex_trigger
