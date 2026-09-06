# ste_cos:crystal/laser_projectile_tick
# полет лазерного маркера и наведение луча кристалла

tp @s ^ ^ ^2.4

# след частиц луча
particle dust{color:[0.85,0.20,1.0],scale:1.8} ~ ~ ~ 0.1 0.1 0.1 0 3 force
particle electric_spark ~ ~ ~ 0.1 0.1 0.1 0.05 2 force
particle dust_color_transition{from_color:[0.3,0.85,1.0],scale:1.4,to_color:[0.75,0.1,0.95]} ~ ~ ~ 0.1 0.1 0.1 0 2 force

# синхронизация beam_target конкретного кристалла по уникальному ID
scoreboard players operation #current_laser_id ste_cos.flags = @s ste_cos.id
execute store result score #beam_x ste_cos.flags run data get entity @s Pos[0]
execute store result score #beam_y ste_cos.flags run data get entity @s Pos[1]
execute store result score #beam_z ste_cos.flags run data get entity @s Pos[2]
execute as @e[type=end_crystal,tag=ste_cos.shielded_crystal] if score @s ste_cos.id = #current_laser_id ste_cos.flags unless data entity @s beam_target[2] run data modify entity @s beam_target set value [I;0,0,0]
execute as @e[type=end_crystal,tag=ste_cos.shielded_crystal] if score @s ste_cos.id = #current_laser_id ste_cos.flags store result entity @s beam_target[0] int 1 run scoreboard players get #beam_x ste_cos.flags
execute as @e[type=end_crystal,tag=ste_cos.shielded_crystal] if score @s ste_cos.id = #current_laser_id ste_cos.flags store result entity @s beam_target[1] int 1 run scoreboard players get #beam_y ste_cos.flags
execute as @e[type=end_crystal,tag=ste_cos.shielded_crystal] if score @s ste_cos.id = #current_laser_id ste_cos.flags store result entity @s beam_target[2] int 1 run scoreboard players get #beam_z ste_cos.flags

# проверка попадания в игрока (гарантированный магический урон 10 ед.)
execute as @a[distance=..2.5,gamemode=!creative,gamemode=!spectator] at @s run damage @s 10 magic
execute if entity @a[distance=..2.5,gamemode=!creative,gamemode=!spectator] run function ste_cos:crystal/laser_projectile_hit
execute if entity @a[distance=..2.5,gamemode=!creative,gamemode=!spectator] run return 1

# сброс таргейта если ближайший игрок ушел слишком далеко от луча (более 36 блоков)
execute unless entity @a[distance=..36,gamemode=!creative,gamemode=!spectator] run function ste_cos:crystal/laser_projectile_hit
execute unless entity @a[distance=..36,gamemode=!creative,gamemode=!spectator] run return 1

# проверка столкновения со сплошными блоками (включая башни из обсидиана)
execute unless block ~ ~ ~ #ste_cos:obsidian_filter run function ste_cos:crystal/laser_projectile_hit
execute unless block ~ ~ ~ #ste_cos:obsidian_filter run return 1

# ограничение жизни: не более 1.75 секунды (35 тиков)
scoreboard players add @s ste_cos.timer 1
execute if score @s ste_cos.timer matches 35.. run function ste_cos:crystal/laser_projectile_hit
