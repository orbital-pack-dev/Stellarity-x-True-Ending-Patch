# ste_cos:load
# инициализация патча совместимости

gamerule max_block_modifications 1999999999

# задачи счета
scoreboard objectives add ste_cos.flags dummy '{"text":"STE-COS Flags"}'
scoreboard objectives add ste_cos.timer dummy '{"text":"STE-COS Timer"}'
scoreboard objectives add ste_cos.egg_timer dummy '{"text":"STE-COS Egg Timer"}'
scoreboard objectives add ste_cos.search_stage dummy '{"text":"STE-COS Search Stage"}'
scoreboard objectives add ste_cos.id dummy '{"text":"STE-COS IDs"}'
scoreboard objectives add ste_cos.radius dummy '{"text":"STE-COS Orbit Radius"}'
scoreboard objectives add ste_cos.orbit_y dummy '{"text":"STE-COS Orbit Y"}'

scoreboard objectives add ste_cos.health dummy '{"text":"STE-COS Health"}'
scoreboard objectives add ste_cos.health_old dummy '{"text":"STE-COS Health Old"}'
scoreboard objectives add ste_cos.health_diff dummy '{"text":"STE-COS Health Diff"}'
scoreboard objectives add ste_cos.heal_cd dummy '{"text":"STE-COS Heal Cooldown"}'
scoreboard objectives add ste_cos.aura_tick dummy '{"text":"STE-COS Aura Tick"}'
scoreboard objectives add ste_cos.fall dummy '{"text":"STE-COS Fall Distance"}'
scoreboard objectives add ste_cos.still_timer dummy '{"text":"STE-COS Still Timer"}'
scoreboard objectives add ste_cos.flying dummy '{"text":"STE-COS Flying"}'
scoreboard objectives add ste_cos.was_flying dummy '{"text":"STE-COS Was Flying"}'
scoreboard objectives add ste_cos.walk custom:walk_one_cm
scoreboard objectives add ste_cos.sprint custom:sprint_one_cm
scoreboard objectives add ste_cos.crouch custom:crouch_one_cm
scoreboard objectives add ste_cos.swim custom:swim_one_cm

scoreboard objectives add stellarity.constants dummy

# стартовые значения
scoreboard players set $pull_timer ste_cos.flags 0
scoreboard players set #rng_ticker ste_cos.flags 0
scoreboard players set #egg_tracker_spawned ste_cos.flags 0
scoreboard players set #hundred stellarity.constants 100
scoreboard players set #three stellarity.constants 3
scoreboard objectives add stellarity.config.dragon_health dummy
execute unless score #stellarity.config stellarity.config.dragon_health matches 1.. run scoreboard players set #stellarity.config stellarity.config.dragon_health 300
scoreboard objectives add trueEnding_constants dummy
scoreboard players set 2 trueEnding_constants 2
scoreboard players set 10 trueEnding_constants 10
scoreboard players set 100 trueEnding_constants 100
scoreboard players set 1000 trueEnding_constants 1000
scoreboard players set 10000 trueEnding_constants 10000
scoreboard objectives add trueEnding_settings dummy
scoreboard players set dragonhealth trueEnding_settings 300
execute unless score #ste_cos_totem_used ste_cos.flags matches 1 run scoreboard players set #ste_cos_totem_used ste_cos.flags 0
bossbar set stellarity:ender_dragon max 300
execute unless score #portal_fix_done ste_cos.flags matches 1 run scoreboard players set #portal_fix_done ste_cos.flags 0
execute unless score #portal_fix ste_cos.timer matches 1.. run scoreboard players set #portal_fix ste_cos.timer 0

# прогрузка
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add 39 -24 87 24
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add 26 12 74 60
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -6 35 42 83
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -43 35 5 83
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -75 12 -27 60
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -87 -24 -39 24
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -75 -63 -27 -15
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -43 -84 5 -36
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -6 -84 42 -36
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add 26 -63 74 -15
execute unless score #forceloaded ste_cos.flags matches 1.. in minecraft:the_end run forceload add -24 -24 24 24
execute unless score #forceloaded ste_cos.flags matches 1.. run scoreboard players set #forceloaded ste_cos.flags 1
