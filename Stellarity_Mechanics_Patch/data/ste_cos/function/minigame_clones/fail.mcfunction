# ste_cos:minigame_clones/fail
# игрок ошибся или вышло время

execute if score #minigame_resolved ste_cos.flags matches 1 run return 0
scoreboard players set #minigame_resolved ste_cos.flags 1
scoreboard players set #minigame_state ste_cos.flags 4
scoreboard players set #minigame_outcome ste_cos.flags 2
scoreboard players set #minigame_resolve_timer ste_cos.timer 0

# темная черно-фиолетовая вспышка неудачи
particle smoke ~ ~2 ~ 2 2 2 0.1 100 force @a
particle squid_ink ~ ~2 ~ 2 2 2 0.2 80 force @a
particle dust{color:[0.08,0.02,0.12],scale:3.0} ~ ~2 ~ 2 2 2 0.2 120 force @a
particle flash{color:[0.50,0.05,0.90,1.0]} ~ ~2 ~ 0 0 0 0 2 force @a

# звуки телепортации и насмешки
playsound entity.enderman.teleport master @a ~ ~ ~ 64.0 0.8
playsound entity.vex.ambient master @a ~ ~ ~ 64.0 0.9
playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 0.75

# копии сразу уходят в пике вниз
execute as @e[type=ender_dragon,tag=ste_cos.clone_dragon] at @s run function ste_cos:minigame_clones/clone_dive
