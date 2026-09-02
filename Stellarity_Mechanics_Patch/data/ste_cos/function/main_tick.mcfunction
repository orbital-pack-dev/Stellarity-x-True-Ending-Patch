# ste_cos:main_tick

# Сбрасываем тег зачистки когда игрок выходит из Энда
execute as @a[tag=ste_cos_chorus_cleaned] at @s unless dimension minecraft:the_end run tag @s remove ste_cos_chorus_cleaned

# Зачищаем хорус при первом входе игрока в Энд (один раз на визит)
execute as @a[tag=!ste_cos_chorus_cleaned] at @s if dimension minecraft:the_end run function ste_cos:portal/chorus_cleaner
execute as @a[tag=!ste_cos_chorus_cleaned] at @s if dimension minecraft:the_end run tag @s add ste_cos_chorus_cleaned

# Обновляем кому виден боссбар дракона
tag @a remove ste_cos_has_dragon
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon] at @s run tag @a[distance=..400] add ste_cos_has_dragon
execute run bossbar set stellarity:ender_dragon players @a[tag=ste_cos_has_dragon]
execute run bossbar set stellarity:crystal_count players @a[tag=ste_cos_has_dragon]

# Если дракона нет — красим полоску в розовый (состояние ожидания)
execute in minecraft:the_end unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run bossbar set stellarity:ender_dragon color pink

# Блок портала: левитация при анимации возрождения дракона
execute in minecraft:overworld if entity @a run execute as @e[type=marker,tag=stellarity.end_portal_animation,tag=!ste_cos.portal_lock_spawned] at @s run summon area_effect_cloud ~ ~ ~ {Duration:520,Radius:3.0f,RadiusPerTick:0f,custom_particle:{type:"minecraft:block",block_state:"minecraft:air"},Tags:["ste_cos_portal_lock"]}
execute in minecraft:overworld if entity @a run execute as @e[type=marker,tag=stellarity.end_portal_animation,tag=!ste_cos.portal_lock_spawned] run tag @s add ste_cos.portal_lock_spawned
execute in minecraft:overworld if entity @a run execute as @e[type=area_effect_cloud,tag=ste_cos_portal_lock] at @s run effect give @a[distance=..3] levitation 1 5 true

# PortalCooldown не работает штатно, закомментировано до выяснения
# execute in minecraft:the_end as @e[type=item_display,tag=stellarity.end_portal] run data modify entity @s PortalCooldown set value 99999
# execute in minecraft:the_end as @e[type=armor_stand,tag=stellarity.end_portal_animation.eye] run data modify entity @s PortalCooldown set value 99999

# Счётчик для случайных событий (0..24)
scoreboard players add #rng_ticker ste_cos.flags 1
execute if score #rng_ticker ste_cos.flags matches 25.. run scoreboard players set #rng_ticker ste_cos.flags 0

# Всё ниже — только если в Энде есть игроки
execute in minecraft:the_end unless entity @a run return 0

# Страж неуязвимости дракона
execute in minecraft:the_end run function ste_cos:dragon/invulnerability_guard

# Фантомы-стражи
execute in minecraft:the_end run function ste_cos:phantom/guard_tick

# Система отслеживания яйца дракона
execute in minecraft:the_end run function ste_cos:egg/egg_tick

# Починка портала при первом заходе
execute in minecraft:the_end if score #portal_fix_done ste_cos.flags matches 0 run scoreboard players add #portal_fix ste_cos.timer 1
execute in minecraft:the_end if score #portal_fix ste_cos.timer matches 1..360 run function ste_cos:portal/fix_tick
execute in minecraft:the_end if score #portal_fix ste_cos.timer matches 361.. run scoreboard players set #portal_fix_done ste_cos.flags 1
