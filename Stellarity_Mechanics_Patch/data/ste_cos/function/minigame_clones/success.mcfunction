# ste_cos:minigame_clones/success
# игрок угадал настоящего дракона!

execute if score #minigame_resolved ste_cos.flags matches 1 run return 0
scoreboard players set #minigame_resolved ste_cos.flags 1
scoreboard players set #minigame_state ste_cos.flags 0

# золотисто-жёлтая и фиолетовая вспышка успеха
particle flash{color:[1.0,0.85,0.15,1.0]} ~ ~2 ~ 0 0 0 0 2 force @a
particle dust{color:[1.0,0.85,0.2],scale:2.5} ~ ~2 ~ 2 2 2 0.2 100 force @a
particle dust_color_transition{from_color:[1.0,0.85,0.2],scale:2.5,to_color:[0.7,0.1,0.95]} ~ ~2 ~ 2 2 2 0.2 80 force @a
particle crit ~ ~2 ~ 2 2 2 0.5 80 force @a

# звуки критического удара и гармонии
playsound entity.player.attack.crit master @a ~ ~ ~ 64.0 1.2
playsound block.amethyst_block.chime master @a ~ ~ ~ 64.0 1.4
playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 1.0

# копии уходят в пике вниз
execute as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s run function ste_cos:minigame_clones/clone_dive

# оригинал выходит из карусели и возвращается в нормальный полет
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real] run data modify entity @s DragonPhase set value 0
tag @e[type=ender_dragon,tag=ste_cos.minigame_real] remove ste_cos.minigame_active
tag @e[type=ender_dragon,tag=ste_cos.minigame_real] remove ste_cos.minigame_real

# удаление маркера центра
kill @e[type=marker,tag=ste_cos.carousel_center]
