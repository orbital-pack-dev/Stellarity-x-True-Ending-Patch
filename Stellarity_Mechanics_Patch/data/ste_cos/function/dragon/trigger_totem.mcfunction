# ste_cos:dragon/trigger_totem
# срабатывание тотема бессмертия у дракона

tag @s add ste_cos.totem_animating

# неуязвимость и переход в зависание
data modify entity @s Invulnerable set value 1b
data modify entity @s DragonPhase set value 5

# эффекты и звук тотема
particle totem_of_undying ~ ~2 ~ 1 1 1 0.5 100
playsound item.totem.use master @a ~ ~ ~ 1.0 1.0

# забираем потраченный тотем из руки
item replace entity @s weapon.mainhand with air

# сдвиг таймера босса
scoreboard players set @s trueEnding_bosstime 3000
