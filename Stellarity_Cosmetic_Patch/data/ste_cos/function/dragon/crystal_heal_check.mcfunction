# ste_cos:dragon/crystal_heal_check
# Вызывается каждый раз, когда здоровье Дракона увеличивается (ste_cos.health_diff >= 1).
# Ограничивает частоту лечения от кристаллов (и других источников).

# Если кулдаун еще активен, отменяем лечение (возвращаем старое здоровье)
execute if score @s ste_cos.heal_cd matches 1.. run scoreboard players operation @s ste_cos.health = @s ste_cos.health_old
execute if score @s ste_cos.heal_cd matches 1.. store result entity @s Health float 1 run scoreboard players get @s ste_cos.health_old

# Если кулдауна нет, разрешаем лечение и запускаем кулдаун на 10 тиков (0.5 сек). 
# Это значит, что дракон сможет восстанавливать здоровье не чаще 1 раза в 0.5 секунд.
execute if score @s ste_cos.heal_cd matches ..0 run scoreboard players set @s ste_cos.heal_cd 10
