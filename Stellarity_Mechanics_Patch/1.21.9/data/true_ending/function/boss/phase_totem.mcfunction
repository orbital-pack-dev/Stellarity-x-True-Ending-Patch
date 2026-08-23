# =====================================================================
# OVERRIDE: true_ending:boss/phase_totem (Косметический Патч)
# Фаза Тотема Дракона: призыв волн на портале, рык, затем воскрешение
# =====================================================================

tag @s add trueEnding_inattack

execute if score @s trueEnding_bosstime matches 3001 run kill @e[type=marker,tag=trueEnding_shockwave]
execute if score @s trueEnding_bosstime matches 3001 run data modify entity @s Invulnerable set value 1b
execute if score @s trueEnding_bosstime matches 3001.. run data modify entity @s DragonPhase set value 5
execute if score @s trueEnding_bosstime matches 3001..3030 run tp @s ~ ~.5 ~
execute if score @s trueEnding_bosstime matches 3031..3040 run tp @s ~ ~.25 ~

execute if score @s trueEnding_bosstime matches 3050..3059 run tp @s ~ ~ ~ ~20 ~
execute if score @s trueEnding_bosstime matches 3060..3069 run tp @s ~ ~ ~ ~10 ~

execute if score @s trueEnding_bosstime matches 3001 run tp @s 0 67 0

# AAAAAA THE FINAL HIT OMG
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

execute at @s run tp @s 0 ~ 0

# =====================================================================
# Воскрешение Тотемом на 3090 тике
# =====================================================================
execute if score @s trueEnding_bosstime matches 3090 run data modify entity @s Health set value 36.0f
execute if score @s trueEnding_bosstime matches 3090 run data modify entity @s DragonPhase set value 0
execute if score @s trueEnding_bosstime matches 3090 run data modify entity @s Invulnerable set value 0b
execute if score @s trueEnding_bosstime matches 3090 run tag @s remove trueEnding_inattack
execute if score @s trueEnding_bosstime matches 3090 run tag @s remove ste_cos.totem_animating
execute if score @s trueEnding_bosstime matches 3090 run tag @s add ste_cos.totem_used
execute if score @s trueEnding_bosstime matches 3090 run item replace entity @s weapon.mainhand with air
execute if score @s trueEnding_bosstime matches 3090 run particle totem_of_undying ~ ~2 ~ 1 1 1 0.5 150
execute if score @s trueEnding_bosstime matches 3090 run playsound item.totem.use master @a ~ ~ ~ 1.0 1.0
execute if score @s trueEnding_bosstime matches 3090 run scoreboard players set @s trueEnding_bosstime 0

# Защита от зацикливания, если тики пропущены
execute if score @s trueEnding_bosstime matches 3095.. run scoreboard players set @s trueEnding_bosstime 3090
