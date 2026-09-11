# ste_cos:load
# инициализация патча совместимости

gamerule max_block_modifications 1999999999
team add ste_cos.purple_glow
team modify ste_cos.purple_glow color dark_purple
team add ste_cos.cyan_glow
team modify ste_cos.cyan_glow color dark_aqua
team add ste_cos.anim_crystal
team modify ste_cos.anim_crystal color light_purple
team modify ste_cos.anim_crystal collisionRule never

# задачи счета
scoreboard objectives add ste_cos.stage dummy '{"text":"STE-COS Stage"}'
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
scoreboard objectives add ste_cos.laser_timer dummy '{"text":"STE-COS Laser Timer"}'
scoreboard objectives add ste_cos.aura_init dummy '{"text":"STE-COS Aura Init"}'
scoreboard objectives add ste_cos.dive_timer dummy '{"text":"STE-COS Dive Timer"}'
scoreboard objectives add ste_cos.age dummy '{"text":"STE-COS Age"}'
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
scoreboard players set #fight_stage ste_cos.stage 0
scoreboard players set $pull_timer ste_cos.flags 0
scoreboard players set #rng_ticker ste_cos.flags 0
execute unless score #egg_marker_fixed ste_cos.flags matches 1 run function ste_cos:fix/egg_marker_fix
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
scoreboard objectives add gm_cam_client dummy
scoreboard objectives add stellarity.config.enable_dragon_screenshake dummy
scoreboard objectives add stellarity.config.boss_status_messages dummy
scoreboard objectives add stellarity.dragon.ball_of_blight_cooldown dummy
scoreboard objectives add stellarity.dragon.health dummy
scoreboard objectives add stellarity.dragon.health_old dummy
scoreboard objectives add stellarity.dragon.health_percent dummy
scoreboard objectives add stellarity.dragon.perch_cooldown dummy
scoreboard objectives add stellarity.dragon.respawn_animation_progress dummy
scoreboard objectives add stellarity.dragon.shulker_hell dummy
scoreboard objectives add stellarity.dragon.time_chainfiring dummy
scoreboard objectives add stellarity.dragon.times_killed dummy
scoreboard objectives add stellarity.misc dummy
scoreboard objectives add stellarity.misc2 dummy
scoreboard objectives add trueEnding_bosstime dummy
scoreboard objectives add trueEnding_bosstime2 dummy
scoreboard objectives add trueEnding_clock dummy
scoreboard objectives add trueEnding_count dummy
scoreboard objectives add trueEnding_health_extra dummy
scoreboard objectives add trueEnding_health_extra_max dummy
scoreboard objectives add trueEnding_health_max dummy
scoreboard objectives add trueEnding_health_percent dummy
scoreboard objectives add trueEnding_music dummy
scoreboard objectives add trueEnding_storage dummy
scoreboard objectives add trueEnding_y dummy
scoreboard objectives add trueEnding_dragonphase dummy
execute unless score #ste_cos_totem_used ste_cos.flags matches 1 run scoreboard players set #ste_cos_totem_used ste_cos.flags 0
execute unless score #clone_minigame_used ste_cos.flags matches 1 run scoreboard players set #clone_minigame_used ste_cos.flags 0
execute unless score #final_breath_used ste_cos.flags matches 1 run scoreboard players set #final_breath_used ste_cos.flags 0
scoreboard players set #tower_retry_count ste_cos.flags 0
scoreboard players set #minigame_state ste_cos.flags 0
scoreboard players set #final_breath_state ste_cos.flags 0
scoreboard players set #minigame_resolve_timer ste_cos.timer 0
scoreboard players set #minigame_outcome ste_cos.flags 0
scoreboard players set #crystal_charge_timer ste_cos.timer 0
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
