# ste_cos:dragon/trigger_totem
# Механика боя

tag @s add ste_cos.totem_animating

# Фикс щита
data modify entity @s Invulnerable set value 1b
data modify entity @s DragonPhase set value 5

# Механика боя
particle totem_of_undying ~ ~2 ~ 1 1 1 0.5 100
playsound item.totem.use master @a ~ ~ ~ 1.0 1.0

# Механика боя
item replace entity @s weapon.mainhand with air

# Фаза тотема
scoreboard players set @s trueEnding_bosstime 3000
