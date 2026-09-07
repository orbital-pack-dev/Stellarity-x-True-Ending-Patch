# ste_cos:crystal/beam_cleaner
# очистка кристаллов

# проверка дракона
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=smithed.entity,limit=1] run scoreboard players set #crystal_despawn_timer ste_cos.timer 0
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=smithed.entity,limit=1] as @e[type=end_crystal,nbt={beam_target:[I;0,65,0]}] run data remove entity @s beam_target
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=smithed.entity,limit=1] run return 0

# проверка призыва
execute if entity @e[type=marker,tag=stellarity.respawn_dragon] run return 0
execute if entity @e[type=end_crystal,tag=stellarity.respawn_crystal] run return 0
execute if entity @e[type=marker,tag=stellarity.portal_deactivated.spawn_dragon] run return 0

# проверка башен
execute in minecraft:the_end positioned 0 65 0 unless entity @e[type=end_crystal,distance=15..300,limit=1] run scoreboard players set #crystal_despawn_timer ste_cos.timer 0
execute in minecraft:the_end positioned 0 65 0 unless entity @e[type=end_crystal,distance=15..300,limit=1] run return 0

# лучи на портал
execute in minecraft:the_end positioned 0 65 0 as @e[type=end_crystal,distance=15..300] unless data entity @s {beam_target:[I;0,65,0]} run data modify entity @s beam_target set value [I;0,65,0]

# таймер очистки
scoreboard players add #crystal_despawn_timer ste_cos.timer 1
execute if score #crystal_despawn_timer ste_cos.timer matches 15.. run scoreboard players set #crystal_despawn_timer ste_cos.timer 0
execute if score #crystal_despawn_timer ste_cos.timer matches 0 in minecraft:the_end positioned 0 65 0 as @e[type=end_crystal,distance=15..300,limit=1,sort=random] at @s run function ste_cos:crystal/despawn_one
