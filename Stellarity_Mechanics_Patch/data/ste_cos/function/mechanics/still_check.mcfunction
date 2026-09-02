# ste_cos:mechanics/still_check
# проверка неподвижности игрока

# проверка перемещения
scoreboard players add @s ste_cos.still_timer 1
execute if score @s ste_cos.walk matches 1.. run scoreboard players set @s ste_cos.still_timer 0
execute if score @s ste_cos.sprint matches 1.. run scoreboard players set @s ste_cos.still_timer 0
execute if score @s ste_cos.crouch matches 1.. run scoreboard players set @s ste_cos.still_timer 0
execute if score @s ste_cos.swim matches 1.. run scoreboard players set @s ste_cos.still_timer 0

# сброс счетчиков движения
scoreboard players reset @s ste_cos.walk
scoreboard players reset @s ste_cos.sprint
scoreboard players reset @s ste_cos.crouch
scoreboard players reset @s ste_cos.swim

# призыв вихря если игрок стоит слишком долго
execute if score @s ste_cos.still_timer matches 160.. run function ste_cos:mechanics/vortex_trigger
