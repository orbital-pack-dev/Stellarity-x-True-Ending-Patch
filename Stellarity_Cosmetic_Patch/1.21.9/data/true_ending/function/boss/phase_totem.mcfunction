# =====================================================================
# OVERRIDE: true_ending:boss/phase_totem (Косметический Патч)
# Оригинал: tru.e-ending-1.1.4d/.../phase_totem.mcfunction
#
# ИЗМЕНЕНИЕ (Пункт 4):
#   Присмертная посадка дракона на центральный портал.
#   Оригинал: positioned over motion_blocking run tp @s ~ ~2 ~
#     (дракон садится ~на 2 блока выше бедрока портала)
#   Новое:    positioned over motion_blocking run tp @s ~ ~14 ~
#     (поднято на 12 выше → ~12-14 блоков над порталом в присмертной фазе)
#
# Вся остальная логика фазы totem сохранена без изменений.
# =====================================================================

tag @s add trueEnding_inattack

execute if score @s trueEnding_bosstime matches 3001 run kill @e[type=marker,tag=trueEnding_shockwave]
execute if score @s trueEnding_bosstime matches 3001 run data modify entity @s Invulnerable set value 1b
execute if score @s trueEnding_bosstime matches 3001.. run data modify entity @s DragonPhase set value 5
execute if score @s trueEnding_bosstime matches 3001..3030 at @s run tp @s 0 ~.5 0
execute if score @s trueEnding_bosstime matches 3031..3040 run tp @s ~ ~.25 ~


execute if score @s trueEnding_bosstime matches 3050..3059 run tp @s ~ ~ ~ ~20 ~
execute if score @s trueEnding_bosstime matches 3060..3069 run tp @s ~ ~ ~ ~10 ~

execute if score @s trueEnding_bosstime matches 3001 run tp @s 0 80 0

#AAAAAA THE FINAL HIT OMG
execute if score @s trueEnding_bosstime matches 3060.. run execute if predicate true_ending:chance/8_percent run playsound minecraft:ambient.basalt_deltas.mood hostile @a[distance=..128] ~ ~ ~ 6 1.2
execute if score @s trueEnding_bosstime matches 3060.. run execute if predicate true_ending:chance/8_percent run playsound minecraft:ambient.warped_forest.additions hostile @a[distance=..128] ~ ~ ~ 6 .5
execute if score @s trueEnding_bosstime matches 3060 run function true_ending:boss/phase_totem_growl
execute if score @s trueEnding_bosstime matches 3060.. run particle dragon_breath ~ ~1.5 ~ 0 0 0 .1 3 force @a[distance=..64]
execute if score @s trueEnding_bosstime matches 3060.. run particle dragon_breath ~ ~1.5 ~ 0 0 0 .2 3 force @a[distance=..64]

execute if score @s trueEnding_bosstime matches 3080 positioned 0 100 0 run function true_ending:boss/shockwave/summon_pad

execute if score @s trueEnding_bosstime matches 3081 run particle flash{color:[0.6, 0.0, 1.0, 1.0]} ~ ~ ~ 0 0 0 0 5 force @a[distance=..128]
execute if score @s trueEnding_bosstime matches 3081 run playsound entity.warden.heartbeat hostile @a[distance=..128] ~ ~ ~ 6 2
execute if score @s trueEnding_bosstime matches 3081 run playsound entity.warden.heartbeat hostile @a[distance=..128] ~ ~ ~ 6 2
execute if score @s trueEnding_bosstime matches 3081 run playsound entity.warden.heartbeat hostile @a[distance=..64] ~ ~ ~ 6 1.2
execute if score @s trueEnding_bosstime matches 3081 run playsound entity.warden.heartbeat hostile @a[distance=..128] ~ ~ ~ 6 .8
execute if score @s trueEnding_bosstime matches 3101 run scoreboard players set @s trueEnding_bosstime 3080

execute at @s run tp @s 0 ~ 0
