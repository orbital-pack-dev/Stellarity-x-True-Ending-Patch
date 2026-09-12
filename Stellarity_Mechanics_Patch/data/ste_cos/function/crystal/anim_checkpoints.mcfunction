# ste_cos:crystal/anim_checkpoints
# валидация кристаллов на 4 кардинальных позициях и оркестратор призыва

# сброс тегов главных кристаллов перед проверкой
tag @e[type=end_crystal,tag=ste_cos_anim_glav_crystal] remove ste_cos_anim_glav_crystal

# удаление предыдущих маркеров чекпоинтов
kill @e[type=marker,tag=ste_cos_checkpoint_marker]
kill @e[type=marker,tag=ste_cos_anim_orchestrator]

# призыв 4 чекпоинт-маркеров на постаментах портала
summon marker 4 62 0 {Tags:["ste_cos_checkpoint_marker"]}
summon marker 0 62 4 {Tags:["ste_cos_checkpoint_marker"]}
summon marker -4 62 0 {Tags:["ste_cos_checkpoint_marker"]}
summon marker 0 62 -4 {Tags:["ste_cos_checkpoint_marker"]}

# каждый маркер проверяет кристалл на своей позиции (distance=..1.5), помечает его тегом ste_cos_anim_glav_crystal и самоуничтожается
execute as @e[type=marker,tag=ste_cos_checkpoint_marker] at @s as @e[type=end_crystal,distance=..1.5,limit=1] run tag @s add ste_cos_anim_glav_crystal
execute as @e[type=marker,tag=ste_cos_checkpoint_marker] at @s if entity @e[type=end_crystal,distance=..1.5] run kill @s

# очистка оставшихся маркеров если кристалл отсутствовал
kill @e[type=marker,tag=ste_cos_checkpoint_marker]

# призыв 5-го маркера: anim_orcestrator на 0 67 0
summon marker 0 67 0 {Tags:["ste_cos_anim_orchestrator"]}

# подсчет ровно ли 4 кристалла помечены тегом ste_cos_anim_glav_crystal
scoreboard players set #glav_crystals ste_cos.flags 0
execute as @e[type=marker,tag=ste_cos_anim_orchestrator] at @s store result score #glav_crystals ste_cos.flags if entity @e[type=end_crystal,tag=ste_cos_anim_glav_crystal]

# если ровно 4: валидация пройдена, помечаем для ритуала
execute if score #glav_crystals ste_cos.flags matches 4 as @e[type=end_crystal,tag=ste_cos_anim_glav_crystal] run tag @s add stellarity.respawn_crystal
execute if score #glav_crystals ste_cos.flags matches 4 run scoreboard players set #respawn_crystal_count stellarity.misc 4
execute if score #glav_crystals ste_cos.flags matches 4 run scoreboard players set #total_crystal_count stellarity.misc 4

# зачистка всех посторонних кристаллов в радиусе 256 блоков до старта боя (деспавн через ste_cos:crystal/despawn_one)
execute if score #glav_crystals ste_cos.flags matches 4 in minecraft:the_end positioned 0 65 0 as @e[type=end_crystal,distance=5..256,tag=!ste_cos_anim_glav_crystal,tag=!stellarity.respawn_crystal,tag=!stellarity.new_crystal] at @s run function ste_cos:crystal/despawn_one

# если кристаллов не 4: отмена ритуала и сброс счетчиков
execute unless score #glav_crystals ste_cos.flags matches 4 run scoreboard players set #respawn_crystal_count stellarity.misc 0
execute unless score #glav_crystals ste_cos.flags matches 4 run scoreboard players set #total_crystal_count stellarity.misc 0
execute unless score #glav_crystals ste_cos.flags matches 4 as @e[type=end_crystal,tag=stellarity.respawn_crystal] run tag @s remove stellarity.respawn_crystal
execute unless score #glav_crystals ste_cos.flags matches 4 as @e[type=end_crystal,tag=ste_cos_anim_glav_crystal] run tag @s remove ste_cos_anim_glav_crystal

# удаление оркестратора
kill @e[type=marker,tag=ste_cos_anim_orchestrator]
