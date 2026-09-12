# анимация
scoreboard players add @s stellarity.dragon.respawn_animation_progress 1

# отмена
execute unless score #respawn_crystal_count stellarity.misc matches 4 run function stellarity:entity/dragon/spawn/cancel
execute if score @s stellarity.dragon.respawn_animation_progress matches 1 run scoreboard players set #ste_cos_totem_used ste_cos.flags 0
execute if score @s stellarity.dragon.respawn_animation_progress matches 1 run scoreboard players set #stellarity.config stellarity.config.enable_dragon_screenshake 1
execute if score @s stellarity.dragon.respawn_animation_progress matches 1 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/respawn_crystal/prepare_for_anim
execute if score @s stellarity.dragon.respawn_animation_progress matches 1 in minecraft:the_end positioned 0 62 0 as @e[type=end_crystal,distance=0.1..256,tag=!ste_cos_anim_glav_crystal,tag=!stellarity.respawn_crystal,tag=!stellarity.new_crystal] at @s run function ste_cos:crystal/despawn_one
execute if score @s stellarity.dragon.respawn_animation_progress matches 1 as @a[distance=..32] at @s run playsound minecraft:entity.blaze.shoot block @s ~ ~ ~ 0.33 0.9
execute if score @s stellarity.dragon.respawn_animation_progress matches 1 as @a[distance=..32] at @s run playsound minecraft:entity.blaze.shoot block @s ~ ~ ~ 0.33 0.7

execute if score @s stellarity.dragon.respawn_animation_progress matches 100 run function stellarity:entity/dragon/spawn/proper_start

# землетрясение
execute if score @s stellarity.dragon.respawn_animation_progress matches 100..619 in minecraft:the_end positioned 0 65 0 run function ste_cos:fresh_visual/earthquake_tick

# частицы
execute if score @s stellarity.dragon.respawn_animation_progress matches ..600 run particle enchant 0 63 0 0 0 0 10 5 normal
execute if score @s stellarity.dragon.respawn_animation_progress matches ..600 run particle portal 0 63 0 0 0 0 10 5 normal

# лучи кристаллов
execute if score @s stellarity.dragon.respawn_animation_progress matches 130 run function ste_cos:fresh_visual/heart_spawn
execute if score @s stellarity.dragon.respawn_animation_progress matches 130 run function ste_cos:fresh_visual/shockwave_init
execute if score @s stellarity.dragon.respawn_animation_progress matches 130..619 run function ste_cos:fresh_visual/heart_tick
execute if score @s stellarity.dragon.respawn_animation_progress matches 140..580 run function ste_cos:fresh_visual/tornado_tick
execute if score @s stellarity.dragon.respawn_animation_progress matches 230..579 run function ste_cos:fresh_visual/tether_ray_draw
execute if score @s stellarity.dragon.respawn_animation_progress matches 1..619 as @e[type=minecraft:end_crystal] at @s run function ste_cos:fresh_visual/crystal_anim_aura

execute if score @s stellarity.dragon.respawn_animation_progress matches 130 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/0
execute if score @s stellarity.dragon.respawn_animation_progress matches 200 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/1
execute if score @s stellarity.dragon.respawn_animation_progress matches 230 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/2
execute if score @s stellarity.dragon.respawn_animation_progress matches 260 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/3
execute if score @s stellarity.dragon.respawn_animation_progress matches 290 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/4
execute if score @s stellarity.dragon.respawn_animation_progress matches 320 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/5
execute if score @s stellarity.dragon.respawn_animation_progress matches 350 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/6
execute if score @s stellarity.dragon.respawn_animation_progress matches 380 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/7
execute if score @s stellarity.dragon.respawn_animation_progress matches 410 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/8
execute if score @s stellarity.dragon.respawn_animation_progress matches 440 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/9
execute if score @s stellarity.dragon.respawn_animation_progress matches 470 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/10
execute if score @s stellarity.dragon.respawn_animation_progress matches 500 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run function stellarity:entity/dragon/spawn/crystal_beam/0

# расстановка кристаллов
execute if score @s stellarity.dragon.respawn_animation_progress matches 230 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run summon minecraft:end_crystal 63 101 0 {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute if score @s stellarity.dragon.respawn_animation_progress matches 260 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run summon minecraft:end_crystal 50 122 36 {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute if score @s stellarity.dragon.respawn_animation_progress matches 290 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run summon minecraft:end_crystal 18 95 59 {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute if score @s stellarity.dragon.respawn_animation_progress matches 320 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run summon minecraft:end_crystal -19 107 59 {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute if score @s stellarity.dragon.respawn_animation_progress matches 350 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run summon minecraft:end_crystal -51 106 36 {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute if score @s stellarity.dragon.respawn_animation_progress matches 380 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run summon minecraft:end_crystal -63 94 0 {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute if score @s stellarity.dragon.respawn_animation_progress matches 410 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run summon minecraft:end_crystal -51 101 -39 {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute if score @s stellarity.dragon.respawn_animation_progress matches 440 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run summon minecraft:end_crystal -19 97 -60 {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute if score @s stellarity.dragon.respawn_animation_progress matches 470 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run summon minecraft:end_crystal 18 88 -60 {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}
execute if score @s stellarity.dragon.respawn_animation_progress matches 500 as @e[type=minecraft:end_crystal,distance=..5,tag=stellarity.respawn_crystal] run summon minecraft:end_crystal 50 96 -39 {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal"],beam_target:[I;0,98,0]}

# клетки кристаллов
execute if score @s stellarity.dragon.respawn_animation_progress matches 290 positioned 18 94 59 run function stellarity:entity/dragon/spawn/repair_cage
execute if score @s stellarity.dragon.respawn_animation_progress matches 380 positioned -63 93 0 run function stellarity:entity/dragon/spawn/repair_cage
execute if score @s stellarity.dragon.respawn_animation_progress matches 440 positioned -19 96 -60 run function stellarity:entity/dragon/spawn/repair_cage
execute if score @s stellarity.dragon.respawn_animation_progress matches 500 positioned 50 95 -39 run function stellarity:entity/dragon/spawn/repair_cage

# замена кристаллов
execute as @e[type=minecraft:end_crystal,tag=stellarity.new_crystal] at @s run function stellarity:entity/dragon/spawn/replace_crystal

# проверка башен
execute if score @s stellarity.dragon.respawn_animation_progress matches 510 run execute as @e[type=minecraft:end_crystal] run data merge entity @s {Invulnerable:1b}

execute if score @s stellarity.dragon.respawn_animation_progress matches 515 run function stellarity:entity/dragon/spawn/check_towers
execute if score @s stellarity.dragon.respawn_animation_progress matches 515 if score #tower_broken ste_cos.flags matches 1 run scoreboard players add #tower_retry_count ste_cos.flags 1
execute if score @s stellarity.dragon.respawn_animation_progress matches 515 if score #tower_broken ste_cos.flags matches 1 if score #tower_retry_count ste_cos.flags matches ..3 run playsound minecraft:block.amethyst_block.resonate block @a 0 98 0 64.0 0.6
execute if score @s stellarity.dragon.respawn_animation_progress matches 515 if score #tower_broken ste_cos.flags matches 1 if score #tower_retry_count ste_cos.flags matches ..3 run scoreboard players set @s stellarity.dragon.respawn_animation_progress 490

execute if score @s stellarity.dragon.respawn_animation_progress matches 550 run function stellarity:entity/dragon/spawn/check_towers
execute if score @s stellarity.dragon.respawn_animation_progress matches 550 if score #tower_broken ste_cos.flags matches 1 run scoreboard players add #tower_retry_count ste_cos.flags 1
execute if score @s stellarity.dragon.respawn_animation_progress matches 550 if score #tower_broken ste_cos.flags matches 1 if score #tower_retry_count ste_cos.flags matches ..3 run playsound minecraft:block.amethyst_block.resonate block @a 0 98 0 64.0 0.6
execute if score @s stellarity.dragon.respawn_animation_progress matches 550 if score #tower_broken ste_cos.flags matches 1 if score #tower_retry_count ste_cos.flags matches ..3 run scoreboard players set @s stellarity.dragon.respawn_animation_progress 490

execute if score @s stellarity.dragon.respawn_animation_progress matches 585 run function stellarity:entity/dragon/spawn/check_towers
execute if score @s stellarity.dragon.respawn_animation_progress matches 585 if score #tower_broken ste_cos.flags matches 1 run scoreboard players add #tower_retry_count ste_cos.flags 1
execute if score @s stellarity.dragon.respawn_animation_progress matches 585 if score #tower_broken ste_cos.flags matches 1 if score #tower_retry_count ste_cos.flags matches ..3 run playsound minecraft:block.amethyst_block.resonate block @a 0 98 0 64.0 0.6
execute if score @s stellarity.dragon.respawn_animation_progress matches 585 if score #tower_broken ste_cos.flags matches 1 if score #tower_retry_count ste_cos.flags matches ..3 run scoreboard players set @s stellarity.dragon.respawn_animation_progress 490

# луч портала
execute if score @s stellarity.dragon.respawn_animation_progress matches 531 run playsound minecraft:entity.warden.sonic_charge block @a ~ ~ ~ 64.0 0.50
execute if score @s stellarity.dragon.respawn_animation_progress matches 590 run setblock 0 63 0 end_gateway
execute if score @s stellarity.dragon.respawn_animation_progress matches 590 positioned 0 66 0 run function stellarity:entity/dragon/spawn/beam/shoot
execute if score @s stellarity.dragon.respawn_animation_progress matches 590 in minecraft:the_end positioned 0 65 0 run function ste_cos:fresh_visual/portal_crystals_pulse_start
execute as @e[type=marker,tag=stellarity.dragon_respawn.beam] at @s run function stellarity:entity/dragon/spawn/beam/loop

# световые импульсы
execute if score @s stellarity.dragon.respawn_animation_progress matches 120 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 150 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 180 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 210 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 240 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 270 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 290 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 310 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 330 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 350 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 370 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 390 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 410 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 425 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 440 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 455 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 470 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 485 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 500 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 510 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 520 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 530 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 540 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 545 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 550 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 555 run function stellarity:entity/dragon/spawn/pulse
execute if score @s stellarity.dragon.respawn_animation_progress matches 560 run function stellarity:entity/dragon/spawn/pulse

# кульминация
execute if score @s stellarity.dragon.respawn_animation_progress matches 580 run function ste_cos:fresh_visual/culmination_start
execute if score @s stellarity.dragon.respawn_animation_progress matches 600 run function ste_cos:fresh_visual/culmination_warp

execute if score @s stellarity.dragon.respawn_animation_progress matches 620 run function ste_cos:fresh_visual/culmination_roar
execute if score @s stellarity.dragon.respawn_animation_progress matches 620 run function stellarity:entity/dragon/spawn/respawn_finish
