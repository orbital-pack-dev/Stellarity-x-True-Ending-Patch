# stellarity:entity/dragon/spawn/summon
# появление дракона с фиолетовым космическим взрывом

execute unless score #stellarity.config stellarity.config.dragon_health matches 1.. run scoreboard players set #stellarity.config stellarity.config.dragon_health 300
scoreboard players set #stellarity.config stellarity.config.dragon_health 300
scoreboard players set 1000 trueEnding_constants 1000
scoreboard players set dragonhealth trueEnding_settings 300

summon ender_dragon ~ ~ ~ {DragonPhase:0,Tags:["stellarity.ender_dragon","smithed.entity","smithed.strict","ste_cos_initialized"],Health:300f,attributes:[{id:"minecraft:max_health",base:300.0},{id:"armor",base:8d},{id:"armor_toughness",base:4d},{id:"knockback_resistance",base:1d},{id:"follow_range",base:80d}]}
summon marker ~ ~ ~ {Tags:["stellarity.dragon_marker","stellarity.marker","smithed.entity","smithed.strict"]}
scoreboard players set #clone_minigame_used ste_cos.flags 0
scoreboard players set #ste_cos_totem_used ste_cos.flags 0
scoreboard players set #final_breath_used ste_cos.flags 0
scoreboard players set #final_breath_state ste_cos.flags 0
scoreboard players set #minigame_state ste_cos.flags 0
item replace entity @e[type=ender_dragon,tag=stellarity.ender_dragon] weapon.mainhand with totem_of_undying
item replace entity @e[type=ender_dragon,tag=stellarity.ender_dragon] weapon.offhand with air

execute if score #stellarity.config stellarity.config.boss_status_messages matches 1 run tellraw @a ["\n",{"translate":"entity.stellarity.dragon.spawn","with":[{"translate":"entity.minecraft.ender_dragon"}],"color":"#AF4BFF"},"\n"]

# космический взрыв с фиолетовыми вспышками
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

# звуки дракона, вардена, иллюзора и аметиста без молний и визера
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
