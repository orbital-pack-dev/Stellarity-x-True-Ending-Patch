
# ste_cos:phantom/guard_act
# Фикс кристаллов

# Механика боя
scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# Механика боя
execute if entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run data modify entity @s NoAI set value 0b

# Механика боя
execute unless entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run data modify entity @s NoAI set value 1b
execute unless entity @a[distance=..20,gamemode=!spectator,gamemode=!creative] run function ste_cos:phantom/orbit_guard

# Фантомы-стражи
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle soul_fire_flame ~ ~0.5 ~ 0.2 0.2 0.2 0.01 5 force
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle dragon_breath ~ ~0.5 ~ 1.5 1.5 1.5 0.01 10 force

# Механика боя
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run damage @s 2 minecraft:magic
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run effect give @a[distance=..4,gamemode=!spectator,gamemode=!creative] minecraft:wither 5 1 true
