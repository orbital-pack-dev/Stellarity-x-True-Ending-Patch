# ste_cos:mechanics/portal_wave_tick
# волна портала

tp @s ^ ^ ^0.45

# частицы волны
execute at @s positioned over motion_blocking positioned ~ ~0.15 ~ run particle dragon_breath ~ ~ ~ 0.15 0.05 0.15 0.02 2 normal
execute at @s positioned over motion_blocking positioned ~ ~0.15 ~ run particle dust_color_transition{from_color:[0.75,0.15,0.95],scale:1.3,to_color:[0.15,0.0,0.35]} ~ ~ ~ 0.1 0.05 0.1 0 2 normal

# урон у поверхности
execute at @s positioned over motion_blocking positioned ~-0.8 ~ ~-0.8 as @a[dx=1.6,dy=0.35,dz=1.6,gamemode=!spectator,gamemode=!creative] run damage @s 5 magic by @e[type=ender_dragon,limit=1]

# радиус волны
execute positioned 0 64 0 unless entity @s[distance=..18] run kill @s

scoreboard players add @s ste_cos.timer 1
execute if score @s ste_cos.timer matches 45.. run kill @s
