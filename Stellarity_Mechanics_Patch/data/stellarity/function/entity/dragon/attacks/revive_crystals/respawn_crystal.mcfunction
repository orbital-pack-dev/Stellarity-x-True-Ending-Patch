# =====================================================================
# OVERRIDE: stellarity:entity/dragon/attacks/revive_crystals/respawn_crystal
# Косметический Патч — фикс "кристаллы спавнятся друг в друге".
#
# Оригинал всегда спавнил end_crystal в точке маркера. Если два маркера
# (или уже живой кристалл) совпадают на одной башне — получалось 2-3
# кристалла в одном блоке, что делало их тривиальными для ломания.
#
# Фикс: спавним кристалл ТОЛЬКО если в радиусе 3 блоков нет другого
# end_crystal. Иначе пропускаем (repeat_5 выберет другой маркер).
#
# @s здесь = выбранный маркер stellarity.crystal (как в оригинале).
# =====================================================================

# Спавним только если позиция свободна (нет end_crystal рядом)
execute unless entity @e[type=end_crystal,distance=..3] at @s run summon end_crystal ~ ~ ~ {ShowBottom:1b,Tags:["stellarity.new_crystal","stellarity.end_crystal","smithed.entity"]}

# Партиклы ВСЕГДА (даже если пропущен спавн — чтобы не было "тихого" сбоя)
execute at @s run particle explosion_emitter ~ ~ ~ 0 0 0 0 1 force
execute at @s run particle dragon_breath ~ ~ ~ 0 0 0 1 50 force

# Волновой эффект (оригинал)
function stellarity:entity/dragon/attacks/revive_crystals/wave
