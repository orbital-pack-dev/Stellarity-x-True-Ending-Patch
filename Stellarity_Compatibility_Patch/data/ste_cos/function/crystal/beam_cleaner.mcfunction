# ste_cos:crystal/beam_cleaner
# если дракона нет, кристаллы светят лучом на 0 67 0 и исчезают по очереди

# прерывание если дракон жив
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run scoreboard players set #crystal_despawn_timer ste_cos.timer 0
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=end_crystal,nbt={beam_target:[I;0,67,0]}] run data remove entity @s beam_target
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run return 0

# прерывание если идет призыв дракона
execute if entity @e[type=marker,tag=stellarity.respawn_dragon] run return 0
execute if entity @e[type=end_crystal,tag=stellarity.respawn_crystal] run return 0
execute if entity @e[type=marker,tag=stellarity.portal_deactivated.spawn_dragon] run return 0

# прерывание если кристаллов на арене нет
execute unless entity @e[type=end_crystal,nbt={ShowBottom:1b},distance=..300,limit=1] run scoreboard players set #crystal_despawn_timer ste_cos.timer 0
execute unless entity @e[type=end_crystal,nbt={ShowBottom:1b},distance=..300,limit=1] run return 0

# наведение лучей всех кристаллов на 0 67 0
execute as @e[type=end_crystal,nbt={ShowBottom:1b},distance=..300] unless data entity @s {beam_target:[I;0,67,0]} run data modify entity @s beam_target set value [I;0,67,0]

# таймер поочередного исчезновения кристаллов (каждые 20 тиков = 1 сек)
scoreboard players add #crystal_despawn_timer ste_cos.timer 1
execute if score #crystal_despawn_timer ste_cos.timer matches 20.. run scoreboard players set #crystal_despawn_timer ste_cos.timer 0
execute if score #crystal_despawn_timer ste_cos.timer matches 0 as @e[type=end_crystal,nbt={ShowBottom:1b},distance=..300,limit=1,sort=random] at @s run function ste_cos:crystal/despawn_one
