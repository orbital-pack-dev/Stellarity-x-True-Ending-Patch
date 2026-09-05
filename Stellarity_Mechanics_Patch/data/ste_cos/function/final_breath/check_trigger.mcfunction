# ste_cos:final_breath/check_trigger
# проверка условий ультимативной атаки "Финальный Вздох"

execute if score #final_breath_used ste_cos.flags matches 1 run return 0
execute unless score #ste_cos_totem_used ste_cos.flags matches 1 run return 0
execute unless score @s ste_cos.health matches 1..8 run return 0
execute if entity @s[tag=ste_cos.final_breath_active] run return 0
execute if entity @s[tag=ste_cos.final_breath_guided] run return 0
execute if entity @s[tag=ste_cos.final_breath_ascending] run return 0
execute if entity @s[tag=ste_cos.minigame_active] run return 0

# запуск фазы: дракон направляется к порталу на собственных крыльях (БЕЗ ТЕЛЕПОРТАЦИИ!)
scoreboard players set #final_breath_used ste_cos.flags 1
scoreboard players set #final_breath_state ste_cos.flags 1
tag @s add ste_cos.final_breath_guided
tag @s add stellarity.to_portal
data modify entity @s DragonPhase set value 3
playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 0.8
