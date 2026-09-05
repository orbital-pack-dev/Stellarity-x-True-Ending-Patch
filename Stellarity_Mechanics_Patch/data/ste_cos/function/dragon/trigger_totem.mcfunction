# ste_cos:dragon/trigger_totem
# срабатывание тотема бессмертия у дракона

tag @s add ste_cos.totem_animating
tag @s add ste_cos.totem_used
tag @s add trueEnding_quarterhealth
tag @s add trueEnding_halfhealth

# восстановление здоровья и предотвращение гибели
attribute @s generic.max_health base set 300
attribute @s minecraft:generic.max_health base set 300
attribute @s max_health base set 300
attribute @s minecraft:max_health base set 300
data modify entity @s Health set value 100.0f
scoreboard players set @s stellarity.dragon.health 100
scoreboard players set @s stellarity.dragon.health_old 100
scoreboard players set @s ste_cos.health 100
scoreboard players set @s ste_cos.health_old 100

data modify entity @s Invulnerable set value 1b
data modify entity @s DragonPhase set value 5

# эффекты и звук тотема
particle totem_of_undying ~ ~2 ~ 1 1 1 0.5 150
playsound item.totem.use master @a ~ ~ ~ 2.0 1.0

# забираем потраченный тотем из руки
item replace entity @s weapon.mainhand with air

# сдвиг таймера босса на фазу тотема
scoreboard players set @s trueEnding_bosstime 3001
