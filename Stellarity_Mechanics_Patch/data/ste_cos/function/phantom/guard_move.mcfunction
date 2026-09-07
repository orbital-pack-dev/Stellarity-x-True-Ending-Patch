# ste_cos:phantom/guard_move
# проверка стража

# кристалл разрушен
execute unless entity @e[type=end_crystal,distance=..6,limit=1] run function ste_cos:phantom/cleanup_current

# проверка фантома по ID
scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id
scoreboard players set #guard_alive ste_cos.flags 0
execute as @e[type=phantom,tag=ste_cos_guard] if score @s ste_cos.id = #current_id ste_cos.flags run scoreboard players set #guard_alive ste_cos.flags 1

# страж убит
execute if score #guard_alive ste_cos.flags matches 0 run function ste_cos:phantom/guard_killed

# действие стража
execute if entity @e[type=end_crystal,distance=..6,limit=1] if score #guard_alive ste_cos.flags matches 1 run function ste_cos:phantom/guard_act
