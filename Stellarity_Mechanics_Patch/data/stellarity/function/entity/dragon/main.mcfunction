# логика поведения дракона
execute if entity @s[tag=trueEnding_mirrordragon] run return 0
execute if entity @s[tag=ste_cos.clone_dragon] run return 0
scoreboard players reset #crystal_count stellarity.misc
execute in minecraft:the_end positioned 0 65 0 as @e[type=end_crystal,distance=15..400,tag=!stellarity.respawn_crystal,tag=!ste_cos_portal_fix] at @s run function stellarity:entity/dragon/crystal/loop
execute if score #crystal_count stellarity.misc matches 1.. run function stellarity:entity/dragon/crystal/update_bossbar
execute unless score #crystal_count stellarity.misc matches 1.. run function stellarity:entity/dragon/crystal/hide_bossbar
execute at @s run tp @e[type=marker,tag=stellarity.dragon_marker] ~ ~ ~
execute store result score @s stellarity.dragon.health run data get entity @s Health 1
execute store result score #max stellarity.misc run attribute @s minecraft:max_health get
execute unless score #max stellarity.misc matches 1.. run scoreboard players set #max stellarity.misc 300
execute if score #max stellarity.misc matches 301.. run scoreboard players set #max stellarity.misc 300
scoreboard players operation @s stellarity.dragon.health_percent = @s stellarity.dragon.health
scoreboard players operation @s stellarity.dragon.health_percent *= #hundred stellarity.constants
scoreboard players operation @s stellarity.dragon.health_percent /= #max stellarity.misc
execute store result bossbar stellarity:ender_dragon max run scoreboard players get #max stellarity.misc
execute store result bossbar stellarity:ender_dragon value run scoreboard players get @s stellarity.dragon.health
execute store result score #int_health stellarity.misc run data get entity @s Health 1
execute unless score @s stellarity.dragon.health_old matches 1.. run scoreboard players operation @s stellarity.dragon.health_old = #int_health stellarity.misc
scoreboard players operation @s stellarity.dragon.health_old = #int_health stellarity.misc

# музыка битвы
execute if entity @s[tag=!stellarity.to_portal,tag=!stellarity.at_portal] run function stellarity:entity/dragon/music/tick

# фазы поведения дракона
execute store result score @s stellarity.misc run data get entity @s DragonPhase
execute unless score @s[tag=!stellarity.at_portal] stellarity.misc matches 5..7 run function stellarity:entity/dragon/trail

# отключена принудительная смена фазы чтобы не ломать фазы True Ending

# отключение обычных атак во время мини-игры, финального вздоха, финальной стойки и при смерти
execute unless entity @s[tag=ste_cos.minigame_active] unless entity @s[tag=ste_cos.final_breath_active] unless entity @s[tag=ste_cos.final_stand] unless entity @s[tag=stellarity.at_portal] unless score @s stellarity.dragon.health matches ..1 if score @s stellarity.misc matches 5 run function stellarity:entity/dragon/attacks/roar_breath/main
execute unless score @s stellarity.dragon.shulker_hell matches 4 as @e[type=dragon_fireball] at @s run function stellarity:entity/dragon/attacks/fireball/summon
execute if score @s stellarity.dragon.shulker_hell matches 4 as @e[type=dragon_fireball] at @s run function stellarity:entity/dragon/attacks/shulker_hell/trigger
execute unless entity @s[tag=ste_cos.minigame_active] unless entity @s[tag=ste_cos.final_breath_active] unless entity @s[tag=ste_cos.final_stand] unless entity @s[tag=stellarity.at_portal] unless score @s stellarity.dragon.health matches ..1 if score @s[tag=!stellarity.at_portal,scores={stellarity.dragon.health_percent=..99}] stellarity.misc matches 4 run function stellarity:entity/dragon/attacks/take_off/main
execute unless entity @s[tag=ste_cos.minigame_active] unless entity @s[tag=ste_cos.final_breath_active] unless entity @s[tag=ste_cos.final_stand] unless entity @s[tag=stellarity.at_portal] unless score @s stellarity.dragon.health matches ..1 if score @s[scores={stellarity.dragon.perch_cooldown=1..}] stellarity.misc matches 2..3 run data modify entity @s DragonPhase set value 0
execute if score @s stellarity.dragon.time_chainfiring matches 1.. run function stellarity:entity/dragon/attacks/chainfire/tickdown
execute unless entity @s[tag=ste_cos.minigame_active] unless entity @s[tag=ste_cos.final_breath_active] unless entity @s[tag=ste_cos.final_stand] unless entity @s[tag=stellarity.at_portal] unless score @s stellarity.dragon.health matches ..1 unless score @s[scores={stellarity.dragon.health_percent=..50,stellarity.misc=0..1}] stellarity.dragon.ball_of_blight_cooldown matches 1.. run function stellarity:entity/dragon/attacks/ball_of_blight/cast

# откат атак
scoreboard players remove @s[scores={stellarity.dragon.perch_cooldown=1..}] stellarity.dragon.perch_cooldown 1
scoreboard players remove @s[scores={stellarity.dragon.ball_of_blight_cooldown=1..}] stellarity.dragon.ball_of_blight_cooldown 1

# возрождение кристаллов при четверти здоровья
execute if score @s[tag=!stellarity.dragon.respawned_crystals] stellarity.dragon.health_percent matches ..25 run function stellarity:entity/dragon/attacks/revive_crystals/initiate

# стук сердца при низком здоровье
execute if score @s stellarity.dragon.health_percent matches ..25 run function stellarity:entity/dragon/heartbeat/main

# полет к порталу при гибели (только после уничтожения всех кристаллов)
execute unless score #crystal_count stellarity.misc matches 1.. unless score #ste_cos_crystals ste_cos.flags matches 1.. if score @s[tag=!stellarity.at_portal] stellarity.dragon.health matches 0..1 run function stellarity:entity/dragon/death/fly_to_portal
execute unless score #crystal_count stellarity.misc matches 1.. unless score #ste_cos_crystals ste_cos.flags matches 1.. if score @s stellarity.dragon.health matches 0..1 if score @s[tag=stellarity.to_portal] stellarity.misc matches 5..7 run tag @s add stellarity.at_portal
execute unless score #crystal_count stellarity.misc matches 1.. unless score #ste_cos_crystals ste_cos.flags matches 1.. if entity @s[tag=stellarity.at_portal] run function stellarity:entity/dragon/death/at_portal_loop

execute as @e[type=shulker,tag=stellarity.dragon_shulker] at @s run particle witch ~ ~0.2 ~ 0.4 0.4 0.4 0.04 1 normal
execute as @e[type=shulker_bullet,tag=stellarity.dragon_bullet] at @s run function stellarity:entity/dragon/attacks/shulker_hell/loop_as_bullet

team join stellarity.dragon.pacify_others @e[type=enderman,predicate=stellarity:location/dragons_den/in_main_area]
