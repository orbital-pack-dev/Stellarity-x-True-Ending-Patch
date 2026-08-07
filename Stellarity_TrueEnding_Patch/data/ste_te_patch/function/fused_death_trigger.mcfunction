# =====================================================================
# ste_te_patch:mechanics/fused_death_trigger
# Выполняется AS дракона (stellarity.dragon) в момент кульминации.
# Вызывается из win_sync.mcfunction.
# =====================================================================

# Однократный триггер
execute if entity @s[tag=ste_te_death_triggered] run return 0
tag @s add ste_te_death_triggered

# -----------------------------------------------------------------------
# ШАГ 1: КУЛЬМИНАЦИЯ — Усиленные эффекты в момент "удара в сердце"
# -----------------------------------------------------------------------

# Взрыв частиц Stellarity (dragon_breath + soul_fire_flame AT дракона)
execute at @s run particle dragon_breath ~ ~ ~ 5 5 5 0.3 500 force
execute at @s run particle soul_fire_flame ~ ~ ~ 3 3 3 0.2 300 force
execute at @s run particle flash{color:[1.0, 1.0, 1.0, 1.0]} ~ ~ ~ 0 0 0 0 3 force

# Звуки финальной кульминации
execute at @s run playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 0.6
execute at @s run playsound minecraft:block.conduit.deactivate hostile @a[distance=..256] ~ ~ ~ 10 0.8

# -----------------------------------------------------------------------
# ШАГ 2: ПЕРЕДАЧА В LAST_STAND_PHASE2 (финальная позиция + цепочка Stellarity)
# -----------------------------------------------------------------------

# Делегируем финальную смерть в last_stand_phase2
function ste_te_patch:mechanics/last_stand_phase2
