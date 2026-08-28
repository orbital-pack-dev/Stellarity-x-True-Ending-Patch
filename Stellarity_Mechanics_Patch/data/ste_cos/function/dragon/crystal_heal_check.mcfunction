# ste_cos:dragon/crystal_heal_check
# Called every time Dragon's health increases (ste_cos.health_diff >= 1).
# Limits frequency of healing from crystals and other sources.



# If cooldown is active, cancel healing (return old health)
execute if score @s ste_cos.heal_cd matches 1.. run scoreboard players operation @s ste_cos.health = @s ste_cos.health_old
execute if score @s ste_cos.heal_cd matches 1.. store result entity @s Health float 1 run scoreboard players get @s ste_cos.health_old

# Механика боя
execute if score @s ste_cos.heal_cd matches ..0 run scoreboard players set @s ste_cos.heal_cd 10
