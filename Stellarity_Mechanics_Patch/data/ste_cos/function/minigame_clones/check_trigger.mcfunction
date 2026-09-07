# ste_cos:minigame_clones/check_trigger
# проверка условий

execute if score #clone_minigame_used ste_cos.flags matches 1 run return 0
execute if score #ste_cos_crystals ste_cos.flags matches 1.. run return 0
execute if entity @s[tag=trueEnding_inattack] run return 0
execute if entity @s[tag=ste_cos.minigame_active] run return 0
execute if entity @s[tag=ste_cos.final_breath_active] run return 0
execute if score @s stellarity.dragon.health_percent matches 71.. run return 0
execute if score @s ste_cos.health matches 211.. run return 0

# запуск мини-игры
scoreboard players set #clone_minigame_used ste_cos.flags 1
scoreboard players set #minigame_state ste_cos.flags 1
tag @s add ste_cos.minigame_active
tag @s add ste_cos.minigame_real
tag @s add trueEnding_inattack
tag @s remove stellarity.at_portal
tag @s add stellarity.to_portal
data modify entity @s DragonPhase set value 2
playsound entity.ender_dragon.growl master @a ~ ~ ~ 32.0 0.85
