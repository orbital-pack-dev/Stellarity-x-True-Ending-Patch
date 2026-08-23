# ste_cos:dragon/trigger_totem
# Вручную активирует эффект тотема для Дракона Края, так как Paper/Vanilla не позволяют ему это делать.

# 1. Помечаем, что тотем использован
tag @s add ste_cos.totem_used

# 2. Выставляем 36 HP
data modify entity @s Health set value 36.0f

# 3. Меняем фазу с 10 (Смерть) на 0 (Обычный полет)
data modify entity @s DragonPhase set value 0

# 4. Эффекты тотема (Частицы и звук)
particle totem_of_undying ~ ~2 ~ 1 1 1 0.5 100
playsound item.totem.use master @a ~ ~ ~ 1.0 1.0

# 5. Убираем тотем из руки (чтобы не выпал)
item replace entity @s weapon.mainhand with air

# 6. Запускаем фазу тотема из True Ending
scoreboard players set @s trueEnding_bosstime 3000
