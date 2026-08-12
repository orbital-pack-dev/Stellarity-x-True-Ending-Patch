# ste_cos:dragon/shield_tick
# AS дракон. Вызывается каждый тик пока живы кристаллы.
#
# Стратегия (двойная защита):
#   1. Invulnerable:1b - ставим после TE (наш пак загружается позже)
#   2. Откат HP - сохраняем HP до удара, восстанавливаем если упало
#      Это защищает от любых механик обхода Invulnerable (урон через
#      data modify, эффекты мгновенного урона и т.д.)

# Ставим флаг щита
tag @s add ste_cos_shielded

# Ставим Invulnerable:1b (TE ставит 0b в своём тике, мы ставим 1b после)
data modify entity @s Invulnerable set value 1b

# Сохраняем текущий HP в ste_cos.health (x10 для точности)
execute store result score @s ste_cos.health run data get entity @s Health 10

# Если HP упало ниже сохранённого значения - восстанавливаем до 300
# (ste_cos.health_safe = 3000 = 300 HP * 10)
execute if score @s ste_cos.health matches ..2999 run data modify entity @s Health set value 300f

# Визуальные эффекты щита (таймер)
function ste_cos:dragon/invulnerability_heal