# ste_cos:main_tick

# сброс
execute as @a[tag=ste_cos_chorus_cleaned] at @s unless dimension minecraft:the_end run tag @s remove ste_cos_chorus_cleaned

# зачистка
execute as @a[tag=!ste_cos_chorus_cleaned] at @s if dimension minecraft:the_end run function ste_cos:portal/chorus_cleaner
execute as @a[tag=!ste_cos_chorus_cleaned] at @s if dimension minecraft:the_end run tag @s add ste_cos_chorus_cleaned

# подсчет кристаллов на столбах арены
scoreboard players set #ste_cos_crystals ste_cos.flags 0
execute in minecraft:the_end positioned 0 65 0 as @e[type=end_crystal,distance=15..400,tag=!stellarity.respawn_crystal,tag=!ste_cos_portal_fix] run scoreboard players add #ste_cos_crystals ste_cos.flags 1

# игроки на острове Края
tag @a remove ste_cos_has_dragon
execute in minecraft:the_end positioned 0 65 0 as @a[distance=..500] run tag @s add ste_cos_has_dragon

# обновление данных шкалы кристаллов
execute store result bossbar stellarity:crystal_count value run scoreboard players get #ste_cos_crystals ste_cos.flags
bossbar set stellarity:crystal_count name [{"translate":"bossbar.stellarity.crystals_left","color":"#4C0081","with":[{"score":{"name": "#ste_cos_crystals","objective": "ste_cos.flags"},"color":"#620081"}]}]

# видимость полосы дракона
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon] run bossbar set stellarity:ender_dragon players @a[tag=ste_cos_has_dragon]
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon] run bossbar set stellarity:ender_dragon players

# видимость полосы кристаллов (видна только пока есть кристаллы на арене)
execute if score #ste_cos_crystals ste_cos.flags matches 1.. run bossbar set stellarity:crystal_count players @a[tag=ste_cos_has_dragon]
execute if score #ste_cos_crystals ste_cos.flags matches 1.. run bossbar set stellarity:crystal_count visible true
execute unless score #ste_cos_crystals ste_cos.flags matches 1.. run bossbar set stellarity:crystal_count players
execute unless score #ste_cos_crystals ste_cos.flags matches 1.. run bossbar set stellarity:crystal_count visible false

# цвет полосы дракона: БЕЛЫЙ пока живы кристаллы, РОЗОВЫЙ когда кристаллы уничтожены
execute if score #ste_cos_crystals ste_cos.flags matches 1.. run bossbar set stellarity:ender_dragon color white
execute unless score #ste_cos_crystals ste_cos.flags matches 1.. run bossbar set stellarity:ender_dragon color pink

execute in minecraft:overworld if entity @a run execute as @e[type=marker,tag=stellarity.end_portal_animation,tag=!ste_cos.portal_lock_spawned] at @s run summon area_effect_cloud ~ ~ ~ {Duration:520,Radius:3.0f,RadiusPerTick:0f,custom_particle:{type:"minecraft:block",block_state:"minecraft:air"},Tags:["ste_cos_portal_lock"]}
execute in minecraft:overworld if entity @a run execute as @e[type=marker,tag=stellarity.end_portal_animation,tag=!ste_cos.portal_lock_spawned] run tag @s add ste_cos.portal_lock_spawned
execute in minecraft:overworld if entity @a run execute as @e[type=area_effect_cloud,tag=ste_cos_portal_lock] at @s run effect give @a[distance=..3] levitation 2 6 true

# random
scoreboard players add #rng_ticker ste_cos.flags 1
execute if score #rng_ticker ste_cos.flags matches 25.. run scoreboard players set #rng_ticker ste_cos.flags 0

# нет игроков
execute in minecraft:the_end unless entity @a run return 0

# лучи кристаллов на 0 67 0 и поочередное исчезновение без дракона
execute in minecraft:the_end run function ste_cos:crystal/beam_cleaner

# щит
execute in minecraft:the_end run function ste_cos:dragon/invulnerability_guard

# стражи кристаллов
execute in minecraft:the_end run function ste_cos:phantom/guard_tick

# яйцо
execute in minecraft:the_end run function ste_cos:egg/egg_tick

# починка портала
execute in minecraft:the_end if score #portal_fix_done ste_cos.flags matches 0 run scoreboard players add #portal_fix ste_cos.timer 1
execute in minecraft:the_end if score #portal_fix ste_cos.timer matches 1..360 run function ste_cos:portal/fix_tick
execute in minecraft:the_end if score #portal_fix ste_cos.timer matches 361.. run scoreboard players set #portal_fix_done ste_cos.flags 1

# визуальные эффекты возрождения дракона
execute in minecraft:the_end as @e[type=marker,tag=ste_cos.shockwave] at @s run function ste_cos:fresh_visual/shockwave_step
execute in minecraft:the_end as @e[type=marker,tag=ste_cos.tether_head] at @s run function ste_cos:fresh_visual/tether_head_step
execute in minecraft:the_end if entity @e[type=marker,tag=ste_cos.heart_absorbing,limit=1] run scoreboard players add #absorb_time ste_cos.timer 1
execute in minecraft:the_end as @e[type=marker,tag=ste_cos.heart_absorbing] at @s run function ste_cos:fresh_visual/heart_absorb_step
execute in minecraft:the_end as @e[type=marker,tag=ste_cos.absorb_tendril] at @s run function ste_cos:fresh_visual/heart_absorb_step
execute in minecraft:the_end as @e[type=armor_stand,tag=ste_cos.crystal_laser_projectile] at @s run function ste_cos:crystal/laser_projectile_tick
execute in minecraft:the_end as @e[type=end_crystal] if data entity @s beam_target unless data entity @s beam_target[2] run data remove entity @s beam_target

# общий таймер заряда кристаллов Фазы-3 (цикл 110 тиков = 5.5 секунд)
execute in minecraft:the_end if entity @e[type=end_crystal,tag=ste_cos.shielded_crystal,limit=1] run scoreboard players add #crystal_charge_timer ste_cos.timer 1
execute in minecraft:the_end if score #crystal_charge_timer ste_cos.timer matches 85 as @e[type=end_crystal,tag=ste_cos.shielded_crystal] at @s if entity @p[distance=..48,gamemode=!creative,gamemode=!spectator] run playsound block.respawn_anchor.charge hostile @a[distance=..48] ~ ~1.8 ~ 1.0 0.9
execute in minecraft:the_end if score #crystal_charge_timer ste_cos.timer matches 95 as @e[type=end_crystal,tag=ste_cos.shielded_crystal] at @s if entity @p[distance=..48,gamemode=!creative,gamemode=!spectator] run playsound block.respawn_anchor.charge hostile @a[distance=..48] ~ ~1.8 ~ 1.0 1.1
execute in minecraft:the_end if score #crystal_charge_timer ste_cos.timer matches 85..109 as @e[type=end_crystal,tag=ste_cos.shielded_crystal] at @s if entity @p[distance=..48,gamemode=!creative,gamemode=!spectator] run particle dust_color_transition{from_color:[0.3,0.9,1.0],scale:1.4,to_color:[0.85,0.1,1.0]} ~ ~1.8 ~ 0.2 0.2 0.2 0.05 2 force
execute in minecraft:the_end if score #crystal_charge_timer ste_cos.timer matches 110.. as @e[type=end_crystal,tag=ste_cos.shielded_crystal] at @s if entity @p[distance=..48,gamemode=!creative,gamemode=!spectator] run function ste_cos:crystal/shielded_crystal_fire
execute in minecraft:the_end if score #crystal_charge_timer ste_cos.timer matches 110.. run scoreboard players set #crystal_charge_timer ste_cos.timer 0

# мини-игра иллюзорных драконов
execute in minecraft:the_end if score #minigame_state ste_cos.flags matches 1.. run function ste_cos:minigame_clones/tick
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_cos.clones_diving] at @s run function ste_cos:minigame_clones/clone_dive_tick
execute in minecraft:the_end as @e[type=marker,tag=ste_cos.feedback_projectile] at @s run function ste_cos:minigame_clones/feedback_projectile_step

# ультимативная атака Финальный Вздох
execute in minecraft:the_end if score #final_breath_state ste_cos.flags matches 1.. run function ste_cos:final_breath/tick

# удержание дракона на портале после финального вздоха (финальная стойка до смерти)
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_cos.final_stand] run tag @s add trueEnding_inattack
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_cos.final_stand] run scoreboard players set @s trueEnding_bosstime 0
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_cos.final_stand] at @s positioned 0 65 0 unless entity @s[distance=..20] run tag @s add stellarity.to_portal
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_cos.final_stand] at @s positioned 0 65 0 unless entity @s[distance=..20] run data modify entity @s DragonPhase set value 2
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_cos.final_stand] at @s positioned 0 65 0 if entity @s[distance=..20] run data modify entity @s DragonPhase set value 4

# механики усложненного боя
execute in minecraft:the_end run function ste_cos:mechanics/tick
execute as @a[predicate=ste_cos:enchantment/has_vortex] at @s run function ste_cos:mechanics/vortex_tick/main
