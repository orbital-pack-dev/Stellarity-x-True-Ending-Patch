# ste_cos:dragon/crystal_heal_check
# ограничение лечения от кристаллов после их уничтожения

scoreboard objectives add ste_cos.health dummy
scoreboard objectives add ste_cos.health_old dummy
scoreboard objectives add ste_cos.heal_cd dummy

# если кристаллы живы, лечение не откатывается
execute if score #ste_cos_crystals ste_cos.flags matches 1.. run return 0
execute if score #crystal_count stellarity.misc matches 1.. run return 0

# откат лечения если кд активен (только когда кристаллы уничтожены и здоровье старое >= 2)
execute if score @s ste_cos.health_old matches 2.. if score @s ste_cos.heal_cd matches 1.. run scoreboard players operation @s ste_cos.health = @s ste_cos.health_old
execute if score @s ste_cos.health_old matches 2.. if score @s ste_cos.heal_cd matches 1.. store result entity @s Health float 1 run scoreboard players get @s ste_cos.health_old

# запуск кд лечения
execute if score @s ste_cos.heal_cd matches ..0 run scoreboard players set @s ste_cos.heal_cd 10
