# =====================================================================
# ste_cos:mechanics/vortex_trigger
# AS игрока AT игрока. Запускает вихрь и сбрасывает таймер.
# Сбрасываем на 100 (5 сек cooldown) — раньше снова не сработает.
# =====================================================================

# Сброс таймера с cooldown
scoreboard players set @s ste_cos.still_timer 100

# Спавним маркер вихря (Duration=80 тиков = 4 сек)
summon area_effect_cloud ~ ~ ~ {Duration:80,Radius:0.0f,WaitTime:0,Tags:["ste_cos_vortex","ste_cos_vortex_new"]}
execute as @e[type=area_effect_cloud,tag=ste_cos_vortex_new,distance=..1,limit=1] run scoreboard players set @s ste_cos.timer 0
tag @e[type=area_effect_cloud,tag=ste_cos_vortex_new] remove ste_cos_vortex_new

# Звук входящего вихря
playsound minecraft:entity.wither.ambient hostile @a[distance=..64] ~ ~ ~ 2.0 0.5
playsound minecraft:block.respawn_anchor.charge hostile @a[distance=..64] ~ ~ ~ 2.0 0.7
