# ste_cos:load
# Compatibility & Cosmetic Patch — initialization.

# TODO: Implement settings system (ste_settings) and safe island regeneration before release!
# function ste_settings:init

# Механика боя
gamerule max_block_modifications 1999999999

# Механика боя
scoreboard objectives add ste_cos.flags dummy '{"text":"STE-COS Flags"}'

# Фикс портала
scoreboard players set $pull_timer ste_cos.flags 0

# Фикс портала
execute unless score #portal_fix_done ste_cos.flags matches 1 run scoreboard players set #portal_fix_done ste_cos.flags 0
execute unless score #portal_fix ste_cos.timer matches 1.. run scoreboard players set #portal_fix ste_cos.timer 0

# Фантомы-стражи
scoreboard objectives add ste_cos.id dummy '{"text":"STE-COS IDs"}'

# Фикс щита
scoreboard objectives add ste_cos.health dummy '{"text":"STE-COS Health"}'
scoreboard objectives add ste_cos.max_health dummy '{"text":"STE-COS Max Health"}'
scoreboard objectives add ste_cos.health_old dummy '{"text":"STE-COS Health Old"}'
scoreboard objectives add ste_cos.health_diff dummy '{"text":"STE-COS Health Diff"}'
scoreboard objectives add ste_cos.heal_cd dummy '{"text":"STE-COS Heal Cooldown"}'
scoreboard objectives add ste_cos.fall dummy '{"text":"STE-COS Fall Distance"}'

# Яйцо дракона
scoreboard objectives add ste_cos.search_stage dummy '{"text":"STE-COS Search Stage"}'

# Фантомы-стражи
scoreboard objectives add ste_cos.radius dummy '{"text":"STE-COS Orbit Radius"}'

# Фантомы-стражи
scoreboard objectives add ste_cos.orbit_y dummy '{"text":"STE-COS Orbit Y"}'

# Механика боя
scoreboard players set #rng_ticker ste_cos.flags 0 
scoreboard objectives add ste_cos.timer dummy '{"text":"STE-COS Timer"}'
scoreboard objectives add ste_cos.still_timer dummy '{"text":"STE-COS Still Timer"}'
scoreboard objectives add ste_cos.walk custom:walk_one_cm
scoreboard objectives add ste_cos.sprint custom:sprint_one_cm
scoreboard objectives add ste_cos.crouch custom:crouch_one_cm
scoreboard objectives add ste_cos.swim custom:swim_one_cm
# Фикс кристаллов
execute unless score #forceloaded ste_cos.flags matches 1.. run execute in minecraft:the_end run forceload add -112 -112 112 112
execute unless score #forceloaded ste_cos.flags matches 1.. run scoreboard players set #forceloaded ste_cos.flags 1
