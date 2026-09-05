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
execute in minecraft:the_end as @e[type=marker,tag=ste_cos.crystal_laser_projectile] at @s run function ste_cos:crystal/laser_projectile_tick

# мини-игра иллюзорных драконов
execute in minecraft:the_end if score #minigame_state ste_cos.flags matches 1.. run function ste_cos:minigame_clones/tick
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_cos.clones_diving] at @s run function ste_cos:minigame_clones/clone_dive_tick

# ультимативная атака Финальный Вздох
execute in minecraft:the_end if score #final_breath_state ste_cos.flags matches 1.. run function ste_cos:final_breath/tick
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_cos.portal_lock_final] at @s positioned 0 65 0 unless entity @s[distance=..35] run tag @s add stellarity.to_portal

# механики усложненного боя
execute in minecraft:the_end run function ste_cos:mechanics/tick
execute as @a[predicate=ste_cos:enchantment/has_vortex] at @s run function ste_cos:mechanics/vortex_tick/main
