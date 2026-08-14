# =====================================================================
# ste_cos:mechanics/still_check
# Вызывается AS игрока (survival/adventure) в the_end.
# Отслеживает неподвижность: 13 сек (260 тиков) → вихрь.
# Проверяет: OnGround=1b + не в воздухе.
# =====================================================================

# Только если игрок стоит на блоке (OnGround)
execute unless data entity @s {OnGround:1b} run scoreboard players set @s ste_cos.still_timer 0
execute unless data entity @s {OnGround:1b} run scoreboard players operation @s ste_cos.pos_x = @s ste_cos.pos_x
execute if data entity @s {OnGround:1b} run function ste_cos:mechanics/still_ground_check
