# ste_cos:mechanics/crystal_heal
# проверка регенерации кристаллов

# запись текущего здоровья
execute store result score @s ste_cos.health run data get entity @s Health 1

# расчет разницы здоровья
scoreboard players operation @s ste_cos.health_diff = @s ste_cos.health
scoreboard players operation @s ste_cos.health_diff -= @s ste_cos.health_old

# проверка восстановления здоровья
execute if score @s ste_cos.health_diff matches 1.. run function ste_cos:dragon/crystal_heal_check

# обновление предыдущего здоровья
scoreboard players operation @s ste_cos.health_old = @s ste_cos.health
