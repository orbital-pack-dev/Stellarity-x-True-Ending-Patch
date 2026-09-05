# true_ending:boss/phase_totem
# фаза тотема бессмертия

tag @s add trueEnding_inattack

execute if score @s trueEnding_bosstime matches 3001 run kill @e[type=marker,tag=trueEnding_shockwave]
execute if score @s trueEnding_bosstime matches 3001 run data modify entity @s Invulnerable set value 1b
execute if score @s trueEnding_bosstime matches 3001.. run data modify entity @s DragonPhase set value 5
execute if score @s trueEnding_bosstime matches 3001..3030 run tp @s ~ ~.5 ~
execute if score @s trueEnding_bosstime matches 3031..3040 run tp @s ~ ~.25 ~

execute if score @s trueEnding_bosstime matches 3050..3059 run tp @s ~ ~ ~ ~20 ~
execute if score @s trueEnding_bosstime matches 3060..3069 run tp @s ~ ~ ~ ~10 ~

execute if score @s trueEnding_bosstime matches 3001 run tp @s 0 67 0

# звуки и частицы перед ударом
execute if score @s trueEnding_bosstime matches 3060.. run execute if predicate true_ending:chance/8_percent run playsound minecraft:ambient.basalt_deltas.mood hostile @a[distance=..128] ~ ~ ~ 6 1.2
execute if score @s trueEnding_bosstime matches 3060.. run execute if predicate true_ending:chance/8_percent run playsound minecraft:ambient.warped_forest.additions hostile @a[distance=..128] ~ ~ ~ 6 .5
execute if score @s trueEnding_bosstime matches 3060 run function true_ending:boss/phase_totem_growl
execute if score @s trueEnding_bosstime matches 3060.. run particle dragon_breath ~ ~1.5 ~ 0 0 0 .1 3 force @a[distance=..64]
execute if score @s trueEnding_bosstime matches 3060.. run particle dragon_breath ~ ~1.5 ~ 0 0 0 .2 3 force @a[distance=..64]

execute if score @s trueEnding_bosstime matches 3080 positioned 0 100 0 run function true_ending:boss/shockwave/summon_pad

execute if score @s trueEnding_bosstime matches 3081 run particle flash ~ ~2 ~ 0 0 0 0 3 force @a
execute if score @s trueEnding_bosstime matches 3081 run particle flash ~ ~2 ~ 0 0 0 0 2 force @a
execute if score @s trueEnding_bosstime matches 3081 run particle reverse_portal ~ ~2 ~ 3 3 3 0.2 60 force @a
execute if score @s trueEnding_bosstime matches 3081 run playsound entity.warden.heartbeat hostile @a ~ ~ ~ 64.0 0.55
execute if score @s trueEnding_bosstime matches 3081 run playsound block.amethyst_block.resonate hostile @a ~ ~ ~ 64.0 0.5

execute at @s run tp @s 0 ~ 0

# завершение взлета дракона с портала (без дублирования тотема)
execute if score @s trueEnding_bosstime matches 3090 if score @s ste_cos.health matches ..99 run data modify entity @s Health set value 100.0f
execute if score @s trueEnding_bosstime matches 3090 if score @s ste_cos.health matches ..99 run scoreboard players set @s stellarity.dragon.health 100
execute if score @s trueEnding_bosstime matches 3090 if score @s ste_cos.health matches ..99 run scoreboard players set @s stellarity.dragon.health_old 100
execute if score @s trueEnding_bosstime matches 3090 if score @s ste_cos.health matches ..99 run scoreboard players set @s ste_cos.health 100
execute if score @s trueEnding_bosstime matches 3090 if score @s ste_cos.health matches ..99 run scoreboard players set @s ste_cos.health_old 100
execute if score @s trueEnding_bosstime matches 3090 run data modify entity @s DragonPhase set value 0
execute if score @s trueEnding_bosstime matches 3090 if score #ste_cos_crystals ste_cos.flags matches 0 run data modify entity @s Invulnerable set value 0b
execute if score @s trueEnding_bosstime matches 3090 run tag @s remove trueEnding_inattack
execute if score @s trueEnding_bosstime matches 3090 run tag @s remove ste_cos.totem_animating
execute if score @s trueEnding_bosstime matches 3090 run tag @s remove stellarity.to_portal
execute if score @s trueEnding_bosstime matches 3090 run tag @s remove stellarity.at_portal
execute if score @s trueEnding_bosstime matches 3090 run tag @s remove stellarity.portal_activated
execute if score @s trueEnding_bosstime matches 3090 run tag @s add ste_cos.totem_used
execute if score @s trueEnding_bosstime matches 3090 run scoreboard players set #ste_cos_totem_used ste_cos.flags 1
execute if score @s trueEnding_bosstime matches 3090 run item replace entity @s weapon.mainhand with air
execute if score @s trueEnding_bosstime matches 3090 run item replace entity @s weapon.offhand with air

# экранная тряска
execute if score @s trueEnding_bosstime matches 3090 run tag @a add stellarity.dragon.screenshake

# звуки взлета и ярости дракона (громкость 64+)
execute if score @s trueEnding_bosstime matches 3090 run playsound entity.warden.heartbeat master @a ~ ~ ~ 64.0 0.6
execute if score @s trueEnding_bosstime matches 3090 run playsound entity.warden.sonic_boom master @a ~ ~ ~ 64.0 0.7
execute if score @s trueEnding_bosstime matches 3090 run playsound block.amethyst_block.resonate master @a ~ ~ ~ 64.0 0.5
execute if score @s trueEnding_bosstime matches 3090 run playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 0.75
execute if score @s trueEnding_bosstime matches 3090 run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 0.8

# вспышка и частицы взлета дракона
particle flash ~ ~2 ~ 0 0 0 0 2 force @a
particle flash ~ ~2 ~ 0 0 0 0 2 force @a
execute if score @s trueEnding_bosstime matches 3090 run particle sonic_boom ~ ~2 ~ 0 0 0 0 3 force @a
execute if score @s trueEnding_bosstime matches 3090 run particle dragon_breath ~ ~2 ~ 3 2 3 0.2 120 force @a
execute if score @s trueEnding_bosstime matches 3090 run particle dust_color_transition{from_color:[1.0,0.85,0.2],scale:3.5,to_color:[0.55,0.0,0.85]} ~ ~2 ~ 4 3 4 0.25 180 force @a
execute if score @s trueEnding_bosstime matches 3090 run particle end_rod ~ ~2 ~ 3 3 3 0.3 80 force @a
execute if score @s trueEnding_bosstime matches 3090 run particle electric_spark ~ ~2 ~ 4 3 4 0.35 90 force @a
execute if score @s trueEnding_bosstime matches 3090 run scoreboard players set @s trueEnding_bosstime 0

# зацикливание до выполнения
execute if score @s trueEnding_bosstime matches 3095.. run scoreboard players set @s trueEnding_bosstime 3090
