# =====================================================================
# ste_cos:mechanics/vortex_trigger
# AS игрока AT игрока. Запускает вихрь и сбрасывает таймер.
# Сбрасываем на 100 (5 сек cooldown) — раньше снова не сработает.
# =====================================================================

# Сброс таймера с cooldown
scoreboard players set @s ste_cos.still_timer 100

# Спавним маркер вихря (Duration=80 тиков = 4 сек)
summon marker ~ ~ ~ {Tags:["ste_cos_vortex","ste_cos_vortex_new"],data:{duration:80}}
execute as @e[type=marker,tag=ste_cos_vortex_new,distance=..1,limit=1] run scoreboard players set @s ste_cos.timer 80
tag @e[type=marker,tag=ste_cos_vortex_new] remove ste_cos_vortex_new

# Звук входящего вихря
playsound minecraft:entity.wither.ambient hostile @a[distance=..64] ~ ~ ~ 2.0 0.5
playsound minecraft:block.respawn_anchor.charge hostile @a[distance=..64] ~ ~ ~ 2.0 0.7

# Первая волна частиц-предупреждение
particle minecraft:dragon_breath ~ ~1 ~ 3 3 3 0.05 80 force @a[distance=..64]
