# ste_cos:mechanics/portal_danger
# Механика боя
# Фикс портала
# Механика боя



# Dragon far from portal -> timer++
execute positioned 0 64 0 unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run scoreboard players add #wave_timer ste_cos.flags 1

# Механика боя
execute if score #wave_timer ste_cos.flags matches 60.. positioned 0 61 0 run function ste_cos:mechanics/portal_wave_start
execute if score #wave_timer ste_cos.flags matches 60.. run scoreboard players set #wave_timer ste_cos.flags 0

# Direct damage above portal center (Y 60..300), if player stands above portal while dragon is far away
execute if score #wave_timer ste_cos.flags matches 20.. positioned -5 60 -5 as @a[dx=10,dy=250,dz=10,gamemode=!spectator,gamemode=!creative] run damage @s 2 magic by @e[type=ender_dragon,limit=1]

# Dragon returned to portal -> reset timer and kill remaining waves
execute positioned 0 64 0 if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run scoreboard players set #wave_timer ste_cos.flags 0
execute positioned 0 64 0 if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..25] run kill @e[type=area_effect_cloud,tag=ste_cos_portal_wave]
