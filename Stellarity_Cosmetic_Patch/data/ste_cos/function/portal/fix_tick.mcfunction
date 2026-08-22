# ste_cos:portal/fix_tick
# Вызывается первые 18 секунд (360 тиков) после первого входа игроков в Энд.

# Тик 1: Спавн кристаллов на местах оригинального ванильного портала, чтобы запустить процесс воскрешения дракона. 
# Этот ванильный процесс автоматически уничтожит лишний портал и освободит место для алтаря Stellarity.
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal 4 62 0 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal -4 62 0 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal 0 62 4 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}
execute if score #portal_fix ste_cos.timer matches 1 run summon end_crystal 0 62 -4 {ShowBottom:0b,Tags:["ste_cos_portal_fix"]}

# Тик 120 (через 6 секунд): Удаляем кристаллы, отменяя воскрешение
execute if score #portal_fix ste_cos.timer matches 120 run kill @e[type=end_crystal,tag=ste_cos_portal_fix]

# Тики 1..360 (18 секунд): Уничтожаем выпавшее яйцо и факелы, которые ломаются от генерации дефолт портала
execute if score #portal_fix ste_cos.timer matches 1..360 positioned 0 64 0 run kill @e[type=item,distance=..150,nbt={Item:{id:"minecraft:dragon_egg"}}]
execute if score #portal_fix ste_cos.timer matches 1..360 positioned 0 64 0 run kill @e[type=item,distance=..150,nbt={Item:{id:"minecraft:torch"}}]
