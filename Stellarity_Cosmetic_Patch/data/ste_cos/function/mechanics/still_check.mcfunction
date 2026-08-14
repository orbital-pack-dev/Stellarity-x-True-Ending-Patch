# =====================================================================
# ste_cos:mechanics/still_check
# Вызывается AS игрока (survival/adventure) в the_end.
# Отслеживает неподвижность: 13 сек (260 тиков) → вихрь.
# Проверяет движение с помощью скорбордов.
# =====================================================================

# Вычисляем сумму движений
scoreboard players operation @s ste_cos.walk += @s ste_cos.sprint
scoreboard players operation @s ste_cos.walk += @s ste_cos.crouch
scoreboard players operation @s ste_cos.walk += @s ste_cos.swim
scoreboard players operation @s ste_cos.walk += @s ste_cos.fall

# Игрок неподвижен, если сумма 0 и он на земле
execute if score @s ste_cos.walk matches 0 if data entity @s {OnGround:1b} run scoreboard players add @s ste_cos.still_timer 1
execute unless score @s ste_cos.walk matches 0 run scoreboard players set @s ste_cos.still_timer 0
execute unless data entity @s {OnGround:1b} run scoreboard players set @s ste_cos.still_timer 0

# Сброс для следующего тика
scoreboard players set @s ste_cos.walk 0
scoreboard players set @s ste_cos.sprint 0
scoreboard players set @s ste_cos.crouch 0
scoreboard players set @s ste_cos.swim 0
scoreboard players set @s ste_cos.fall 0

# Если простоял 13 сек (260 тиков) - запускаем вихрь
execute if score @s ste_cos.still_timer matches 260.. at @s run function ste_cos:mechanics/vortex_trigger
