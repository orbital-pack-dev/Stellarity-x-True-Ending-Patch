# ste_cos:mechanics/vortex_tick
# Механика боя

execute if score @s ste_cos.timer matches 0 run function ste_cos:vfx/dragon_vortex/frame_0
execute if score @s ste_cos.timer matches 4 run function ste_cos:vfx/dragon_vortex/frame_4
execute if score @s ste_cos.timer matches 8 run function ste_cos:vfx/dragon_vortex/frame_8
execute if score @s ste_cos.timer matches 12 run function ste_cos:vfx/dragon_vortex/frame_12
execute if score @s ste_cos.timer matches 16 run function ste_cos:vfx/dragon_vortex/frame_16
execute if score @s ste_cos.timer matches 20 run function ste_cos:vfx/dragon_vortex/frame_20
execute if score @s ste_cos.timer matches 24 run function ste_cos:vfx/dragon_vortex/frame_24
execute if score @s ste_cos.timer matches 28 run function ste_cos:vfx/dragon_vortex/frame_28
execute if score @s ste_cos.timer matches 32 run function ste_cos:vfx/dragon_vortex/frame_32
execute if score @s ste_cos.timer matches 36 run function ste_cos:vfx/dragon_vortex/frame_36
execute if score @s ste_cos.timer matches 40 run function ste_cos:vfx/dragon_vortex/frame_40
execute if score @s ste_cos.timer matches 44 run function ste_cos:vfx/dragon_vortex/frame_44
execute if score @s ste_cos.timer matches 48 run function ste_cos:vfx/dragon_vortex/frame_48
execute if score @s ste_cos.timer matches 52 run function ste_cos:vfx/dragon_vortex/frame_52
execute if score @s ste_cos.timer matches 56 run function ste_cos:vfx/dragon_vortex/frame_56
execute if score @s ste_cos.timer matches 60 run function ste_cos:vfx/dragon_vortex/frame_60
execute if score @s ste_cos.timer matches 64 run function ste_cos:vfx/dragon_vortex/frame_64
execute if score @s ste_cos.timer matches 68 run function ste_cos:vfx/dragon_vortex/frame_68
execute if score @s ste_cos.timer matches 72 run function ste_cos:vfx/dragon_vortex/frame_72
execute if score @s ste_cos.timer matches 76 run function ste_cos:vfx/dragon_vortex/frame_76

# Механика боя
scoreboard players add @s ste_cos.timer 1

# Механика боя
execute if score @s ste_cos.timer matches 80.. run kill @s

# Механика боя

execute as @a[distance=..8,gamemode=!spectator,gamemode=!creative] at @s facing ^ ^ ^-1 run tp @s ~ ~ ~ ~ ~

# Механика боя
execute as @a[distance=..8,gamemode=!spectator,gamemode=!creative] at @s facing entity @e[type=area_effect_cloud,tag=ste_cos_vortex,limit=1,sort=nearest] eyes run tp @s ^ ^ ^0.6

# Механика боя
particle minecraft:portal ~ ~1 ~ 3 0 3 1 10 normal
particle minecraft:reverse_portal ~ ~1 ~ 1 0 1 0.1 5 normal

# Механика боя
execute as @a[distance=..5,gamemode=!spectator,gamemode=!creative] run damage @s 3 minecraft:magic
execute as @a[distance=..5,gamemode=!spectator,gamemode=!creative] run effect give @s minecraft:wither 2 1 true
