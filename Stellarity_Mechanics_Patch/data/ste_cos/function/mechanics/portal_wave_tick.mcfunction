# Механика боя
tp @s ^ ^ ^0.5

# Механика боя
execute at @s positioned over motion_blocking run particle dragon_breath ~ ~ ~ .2 .2 .2 0.05 3 normal
execute at @s positioned over motion_blocking run particle dust_color_transition{from_color:[0.6,0.0,0.9],scale:1.2,to_color:[0.1,0.0,0.2]} ~ ~1 ~ .1 10 .1 0 4 normal

# Механика боя
execute at @s positioned over motion_blocking positioned ~-1.5 ~ ~-1.5 as @a[dx=3,dy=250,dz=3,gamemode=!spectator,gamemode=!creative] run damage @s 6 magic by @e[type=ender_dragon,limit=1]

# Механика боя
scoreboard players add @s ste_cos.timer 1

# Механика боя
execute if score @s ste_cos.timer matches 42.. run kill @s
