# ste_cos:final_breath/check_trigger
# проверка условий ультимативной атаки "Финальный Вздох"

execute if score #final_breath_used ste_cos.flags matches 1 run return 0
execute unless score #ste_cos_totem_used ste_cos.flags matches 1 run return 0
execute unless score @s ste_cos.health matches 1..8 run return 0
execute if entity @s[tag=ste_cos.final_breath_active] run return 0
execute if entity @s[tag=ste_cos.minigame_active] run return 0

# если дракон подлетает к порталу (или уже в радиусе 24 блоков)
execute positioned 0 65 0 if entity @s[distance=..24] run function ste_cos:final_breath/start
execute positioned 0 65 0 unless entity @s[distance=..24] run tag @s add stellarity.to_portal
