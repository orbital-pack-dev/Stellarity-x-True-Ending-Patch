# ste_cos:dragon/crystal_heal_check
# ограничение лечения от кристаллов

# откат лечения если кд активен (только когда кристаллы уничтожены)
execute unless score #ste_cos_crystals ste_cos.flags matches 1.. if score @s ste_cos.health_old matches 1.. if score @s ste_cos.heal_cd matches 1.. run scoreboard players operation @s ste_cos.health = @s ste_cos.health_old
execute unless score #ste_cos_crystals ste_cos.flags matches 1.. if score @s ste_cos.health_old matches 1.. if score @s ste_cos.heal_cd matches 1.. store result entity @s Health float 1 run scoreboard players get @s ste_cos.health_old

# запуск кд лечения
execute if score @s ste_cos.heal_cd matches ..0 run scoreboard players set @s ste_cos.heal_cd 10
