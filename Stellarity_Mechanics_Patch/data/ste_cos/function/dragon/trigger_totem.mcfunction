# ste_cos:dragon/trigger_totem
# Вручную активирует эффект тотема для Дракона Края, так как Paper/Vanilla не позволяют ему это делать.

# 1. Помечаем, что тотем находится в процессе анимации
tag @s add ste_cos.totem_animating

# 2. Даем неуязвимость и переводим в фазу посадки
data modify entity @s Invulnerable set value 1b
data modify entity @s DragonPhase set value 5

# 3. Эффекты тотема (Частицы и звук)
particle totem_of_undying ~ ~2 ~ 1 1 1 0.5 100
playsound item.totem.use master @a ~ ~ ~ 1.0 1.0

# 4. Убираем тотем из руки (чтобы не выпал)
item replace entity @s weapon.mainhand with air

# 5. Запускаем фазу тотема из True Ending
scoreboard players set @s trueEnding_bosstime 3000
