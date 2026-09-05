# ste_cos:minigame_clones/fail
# игрок ошибся или вышло время: дракон наказывает лазером!

execute if score #minigame_resolved ste_cos.flags matches 1 run return 0
scoreboard players set #minigame_resolved ste_cos.flags 1
scoreboard players set #minigame_state ste_cos.flags 0

# темная черно-фиолетовая вспышка неудачи
particle smoke ~ ~2 ~ 2 2 2 0.1 100 force @a
particle squid_ink ~ ~2 ~ 2 2 2 0.2 80 force @a
particle dust{color:[0.08,0.02,0.12],scale:3.0} ~ ~2 ~ 2 2 2 0.2 120 force @a
particle flash{color:[0.50,0.05,0.90,1.0]} ~ ~2 ~ 0 0 0 0 2 force @a

# звуки телепортации и насмешки
playsound entity.enderman.teleport master @a ~ ~ ~ 64.0 0.8
playsound entity.witch.ambient master @a ~ ~ ~ 64.0 0.9
playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 0.75

# копии уходят в пике вниз
execute as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s run function ste_cos:minigame_clones/clone_dive

# оригинал немедленно переходит в атаку Лазером True Ending!
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real] run scoreboard players set @s trueEnding_bosstime 2200
execute as @e[type=ender_dragon,tag=ste_cos.minigame_real] run data modify entity @s DragonPhase set value 3
tag @e[type=ender_dragon,tag=ste_cos.minigame_real] remove ste_cos.minigame_active
tag @e[type=ender_dragon,tag=ste_cos.minigame_real] remove ste_cos.minigame_real

# удаление маркера центра
kill @e[type=marker,tag=ste_cos.carousel_center]
