# stellarity:entity/dragon/spawn/summon
# спавн дракона

execute unless score #stellarity.config stellarity.config.dragon_health matches 1.. run scoreboard players set #stellarity.config stellarity.config.dragon_health 300
scoreboard players set #stellarity.config stellarity.config.dragon_health 300
scoreboard players set 1000 trueEnding_constants 1000
scoreboard players set dragonhealth trueEnding_settings 300

summon ender_dragon ~ ~ ~ {DragonPhase:0,Tags:["stellarity.ender_dragon","smithed.entity","smithed.strict","ste_cos_initialized"],Health:300f,attributes:[{id:"minecraft:max_health",base:300.0},{id:"armor",base:12d},{id:"armor_toughness",base:8d},{id:"knockback_resistance",base:1d},{id:"follow_range",base:80d}]}
summon marker ~ ~ ~ {Tags:["stellarity.dragon_marker","stellarity.marker","smithed.entity","smithed.strict"]}
scoreboard players set #clone_minigame_used ste_cos.flags 0
scoreboard players set #tower_retry_count ste_cos.flags 0
scoreboard players set #fight_stage ste_cos.stage 1
scoreboard players set #ste_cos_totem_used ste_cos.flags 0
scoreboard players set #final_breath_used ste_cos.flags 0
scoreboard players set #final_breath_state ste_cos.flags 0
scoreboard players set #final_breath_timer ste_cos.timer 0
scoreboard players set #minigame_state ste_cos.flags 0
scoreboard players set #minigame_resolved ste_cos.flags 0
scoreboard players set #minigame_outcome ste_cos.flags 0
scoreboard players set #minigame_timer ste_cos.timer 0
scoreboard players set #minigame_resolve_timer ste_cos.timer 0
scoreboard players set #carousel_active ste_cos.flags 0
scoreboard players set #carousel_timer ste_cos.timer 0
scoreboard players set #carousel_flap ste_cos.timer 0
scoreboard players set #carrier_tick ste_cos.timer 0
scoreboard players set #crystal_charge_timer ste_cos.timer 0
scoreboard players set #shockwave_count ste_cos.timer 0

# очистка временных сущностей
kill @e[type=marker,tag=ste_cos.pulse_wave_marker]
kill @e[type=marker,tag=ste_cos.carousel_center]
kill @e[type=marker,tag=ste_cos.feedback_projectile]
kill @e[type=armor_stand,tag=ste_cos.clone_exit_carrier]
kill @e[type=armor_stand,tag=ste_cos.minigame_carrier]
kill @e[type=armor_stand,tag=ste_cos.crystal_laser_projectile]
kill @e[type=ender_dragon,tag=ste_cos.clone_dragon]
kill @e[type=phantom,tag=ste_cos_guard]
kill @e[type=area_effect_cloud,tag=ste_cos_guard_marker]

# кристаллы первой фазы (разрушаемые, с темно-фиолетовым свечением)
execute in minecraft:the_end as @e[type=end_crystal] run tag @s remove ste_cos.shielded_crystal
execute in minecraft:the_end as @e[type=end_crystal] run tag @s add ste_cos.phase1_crystal
execute in minecraft:the_end as @e[type=end_crystal] run data merge entity @s {Invulnerable:0b,Glowing:1b}
execute in minecraft:the_end as @e[type=end_crystal] run team join ste_cos.purple_glow @s

# декоративные фантомы на 10 кристаллах
execute in minecraft:the_end positioned 0 65 0 as @e[type=end_crystal,distance=15..400,tag=!stellarity.respawn_crystal,tag=!ste_cos_portal_fix] at @s unless entity @e[type=area_effect_cloud,tag=ste_cos_guard_marker,distance=..6,limit=1] run function ste_cos:phantom/spawn_decorative_guard

item replace entity @e[type=ender_dragon,tag=stellarity.ender_dragon] weapon.mainhand with totem_of_undying
item replace entity @e[type=ender_dragon,tag=stellarity.ender_dragon] weapon.offhand with air

execute if score #stellarity.config stellarity.config.boss_status_messages matches 1 run tellraw @a ["\n",{"translate":"entity.stellarity.dragon.spawn","with":[{"translate":"entity.minecraft.ender_dragon"}],"color":"#AF4BFF"},"\n"]

# взрыв
particle minecraft:explosion_emitter ~ ~ ~ 3 3 3 1 10 force
particle sonic_boom ~ ~ ~ 0 0 0 0 2 force @a
particle flash{color:[0.90,0.25,1.0,1.0]} ~ ~ ~ 0 0 0 0 2 force @a
particle flash{color:[0.55,0.05,0.85,1.0]} ~ ~ ~ 0 0 0 0 1 force @a
particle dust_color_transition{from_color:[1.0,0.3,1.0],scale:4.0,to_color:[0.15,0.0,0.4]} ~ ~ ~ 3 3 3 0.4 200 force @a
particle minecraft:cloud ~ ~ ~ 0 0 0 1 200 force
particle minecraft:dragon_breath ~ ~ ~ 0 0 0 1 100 force
particle end_rod ~ ~ ~ 2 2 2 0.3 100 force
particle electric_spark ~ ~ ~ 2 2 2 0.2 80 force

function stellarity:entity/dragon/spawn/spiral

# звуки
playsound minecraft:entity.ender_dragon.growl hostile @a[distance=0..] ~ ~ ~ 10 0.7
playsound minecraft:entity.warden.sonic_boom hostile @a[distance=0..] ~ ~ ~ 10 0.75
playsound minecraft:block.amethyst_block.resonate hostile @a[distance=0..] ~ ~ ~ 10 0.5
playsound minecraft:entity.generic.explode hostile @a[distance=0..] ~ ~ ~ 10 0.6
playsound minecraft:entity.illusioner.cast_spell hostile @a[distance=0..] ~ ~ ~ 10 0.8

execute as @e[type=ender_dragon,tag=stellarity.ender_dragon] run attribute @s minecraft:max_health base set 300
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon] run effect give @s instant_health 1 255 true
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon] run data modify entity @s Health set value 300f

scoreboard players set @e[type=ender_dragon,tag=stellarity.ender_dragon] stellarity.dragon.health 300
scoreboard players set @e[type=ender_dragon,tag=stellarity.ender_dragon] stellarity.dragon.health_old 300
scoreboard players set @e[type=ender_dragon,tag=stellarity.ender_dragon] ste_cos.health 300
scoreboard players set @e[type=ender_dragon,tag=stellarity.ender_dragon] ste_cos.health_old 300

bossbar set stellarity:ender_dragon max 300
bossbar set stellarity:ender_dragon value 300

team join stellarity.dragon.pacify_others @e[type=minecraft:ender_dragon,tag=stellarity.ender_dragon]

execute as @a run function stellarity:entity/dragon/music/reset
