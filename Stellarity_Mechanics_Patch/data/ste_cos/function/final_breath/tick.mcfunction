# ste_cos:final_breath/tick
# цикл финального вздоха

# полет к порталу
execute if score #final_breath_state ste_cos.flags matches 1 as @e[type=ender_dragon,tag=ste_cos.final_breath_guided,limit=1] at @s positioned 0 67 0 if entity @s[distance=..16] run function ste_cos:final_breath/start

# подъем дракона
execute if score #final_breath_state ste_cos.flags matches 2 run function ste_cos:final_breath/tick_ascend

# зарядка вздоха
execute if score #final_breath_state ste_cos.flags matches 3 run function ste_cos:final_breath/tick_charge
