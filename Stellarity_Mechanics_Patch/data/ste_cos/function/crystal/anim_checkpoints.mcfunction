# ste_cos:crystal/anim_checkpoints
# валидация кристаллов на 4 кардинальных позициях (без создания маркеров)

# сброс тегов главных кристаллов перед проверкой
tag @e[type=end_crystal,tag=ste_cos_anim_glav_crystal] remove ste_cos_anim_glav_crystal

# прямая проверка кристаллов на 4 постаментах портала (без сущностей-маркеров)
execute in minecraft:the_end positioned 4 62 0 as @e[type=end_crystal,distance=..1.5,limit=1] run tag @s add ste_cos_anim_glav_crystal
execute in minecraft:the_end positioned 0 62 4 as @e[type=end_crystal,distance=..1.5,limit=1] run tag @s add ste_cos_anim_glav_crystal
execute in minecraft:the_end positioned -4 62 0 as @e[type=end_crystal,distance=..1.5,limit=1] run tag @s add ste_cos_anim_glav_crystal
execute in minecraft:the_end positioned 0 62 -4 as @e[type=end_crystal,distance=..1.5,limit=1] run tag @s add ste_cos_anim_glav_crystal

# подсчет ровно ли 4 кристалла помечены тегом ste_cos_anim_glav_crystal
scoreboard players set #glav_crystals ste_cos.flags 0
execute in minecraft:the_end store result score #glav_crystals ste_cos.flags if entity @e[type=end_crystal,tag=ste_cos_anim_glav_crystal]

# если ровно 4: валидация пройдена, помечаем для ритуала
execute if score #glav_crystals ste_cos.flags matches 4 as @e[type=end_crystal,tag=ste_cos_anim_glav_crystal] run tag @s add stellarity.respawn_crystal
execute if score #glav_crystals ste_cos.flags matches 4 run scoreboard players set #respawn_crystal_count stellarity.misc 4
execute if score #glav_crystals ste_cos.flags matches 4 run scoreboard players set #total_crystal_count stellarity.misc 4

# зачистка всех посторонних кристаллов в радиусе 256 блоков до старта боя (деспавн через ste_cos:crystal/despawn_one)
execute if score #glav_crystals ste_cos.flags matches 4 in minecraft:the_end positioned 0 62 0 as @e[type=end_crystal,distance=0.1..256,tag=!ste_cos_anim_glav_crystal,tag=!stellarity.respawn_crystal,tag=!stellarity.new_crystal] at @s run function ste_cos:crystal/despawn_one

# если кристаллов не 4: отмена ритуала и сброс счетчиков
execute unless score #glav_crystals ste_cos.flags matches 4 run scoreboard players set #respawn_crystal_count stellarity.misc 0
execute unless score #glav_crystals ste_cos.flags matches 4 run scoreboard players set #total_crystal_count stellarity.misc 0
execute unless score #glav_crystals ste_cos.flags matches 4 as @e[type=end_crystal,tag=stellarity.respawn_crystal] run tag @s remove stellarity.respawn_crystal
execute unless score #glav_crystals ste_cos.flags matches 4 as @e[type=end_crystal,tag=ste_cos_anim_glav_crystal] run tag @s remove ste_cos_anim_glav_crystal
