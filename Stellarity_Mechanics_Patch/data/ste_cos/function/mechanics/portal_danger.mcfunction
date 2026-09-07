# ste_cos:mechanics/portal_danger
# таймер волн

execute positioned 0 64 0 unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run scoreboard players add #wave_timer ste_cos.flags 1

execute if score #wave_timer ste_cos.flags matches 75.. positioned 0 64 0 run function ste_cos:mechanics/portal_wave_start
execute if score #wave_timer ste_cos.flags matches 75.. run scoreboard players set #wave_timer ste_cos.flags 0

# урон на чаше
execute positioned 0 64 0 as @a[distance=..3.2,dy=2,gamemode=!spectator,gamemode=!creative] run damage @s 2 magic by @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1]

execute positioned 0 64 0 if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run scoreboard players set #wave_timer ste_cos.flags 0
execute positioned 0 64 0 if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run kill @e[type=area_effect_cloud,tag=ste_cos_portal_wave]
