# =====================================================================
# ste_cos:mechanics/crystal_heal
# Called once per second by living crystals.
# =====================================================================



execute store result score @s ste_cos.health run data get entity @s Health
scoreboard players add @s ste_cos.health 4

# Ограничиваем лечение до 300хп (хардкап)
execute if score @s ste_cos.health matches 300.. run scoreboard players set @s ste_cos.health 300

# Применяем здоровье
execute store result entity @s Health float 1 run scoreboard players get @s ste_cos.health

# Синхронизируем со Stellarity, чтобы он не считал лечение за урон или что-то еще
execute store result score @s stellarity.dragon.health run data get entity @s Health
execute store result score @s stellarity.dragon.health_old run data get entity @s Health
