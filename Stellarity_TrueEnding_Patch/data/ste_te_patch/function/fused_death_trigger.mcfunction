# =====================================================================
# fused_death_trigger.mcfunction
# Выполняется AS дракона в момент кульминации (TE финальный удар + low HP).
# Контекст: выполняется только ОДИН РАЗ (флаг ste_te_death_triggered).
# =====================================================================

# Однократный триггер
execute if entity @s[tag=ste_te_death_triggered] run return 0
tag @s add ste_te_death_triggered

# -----------------------------------------------------------------------
# ШАГ 1: КУЛЬМИНАЦИЯ — Усиленные эффекты в момент "удара в сердце"
# (TE уже воспроизводит heartbeat + flash в bosstime 3081)
# Мы добавляем Stellarity-стиль частицы для слияния визуалов
# -----------------------------------------------------------------------

# Взрыв частиц Stellarity (dragon_breath + soul_fire_flame от всех кристаллов)
particle dragon_breath ~ ~ ~ 5 5 5 0.3 500 force @a[distance=..256]
particle soul_fire_flame ~ ~ ~ 3 3 3 0.2 300 force @a[distance=..256]
particle flash{color:[1.0, 1.0, 1.0, 1.0]} ~ ~ ~ 0 0 0 0 3 force @a[distance=..256]

# Звуки финальной кульминации (поверх TE звуков)
playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 0.6
playsound minecraft:block.conduit.deactivate hostile @a[distance=..256] ~ ~ ~ 10 0.8

# ---------- BUG FIX #5: ВЫСОТА И ВЫПАДЕНИЕ ЛУТА ----------
# Телепортируем на +8 по Y, чтобы Дракон висел точно над кастомным алтарем
tp @s ~ ~8 ~

# Спавним кастомный лут Stellarity (Элитры, Меч) прямо над алтарем в момент "Удара в сердце"
loot spawn ~ ~ ~ loot stellarity:entity/ender_dragon

# -----------------------------------------------------------------------
# ШАГ 2: ПЕРЕДАЧА В STELLARITY DEATH SEQUENCE
# Снимаем TE-бессмертие и передаём управление Stellarity
# -----------------------------------------------------------------------

# Снять TE-бессмертие (чтобы дракон мог умереть)
data modify entity @s Invulnerable set value 0b
tag @s remove trueEnding_inattack

# Снять TE-NoAI (если был включён во время totem фазы)
data modify entity @s NoAI set value 0b

# Принудительно обнулить HP → Stellarity увидит health 0..1 в следующем тике
# и запустит death/fly_to_portal
data merge entity @s {Health:1f}

# Установить DragonPhase:0 (свободный полёт), чтобы дракон начал лететь к порталу
data modify entity @s DragonPhase set value 0

# Пометить тег, что Stellarity теперь ведёт смерть
tag @s add stellarity.to_portal
tag @s add stellarity.ender_dragon

# Запустить Stellarity death цепочку немедленно
function stellarity:entity/dragon/death/fly_to_portal
