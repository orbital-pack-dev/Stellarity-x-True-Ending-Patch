# stellarity:entity/dragon/spawn/cancel
# отмена возрождения дракона

execute if score @s stellarity.dragon.times_killed matches 1.. run function stellarity:structure/exit_portal/activated/generate
execute unless score @s stellarity.dragon.times_killed matches 1.. run function stellarity:structure/exit_portal/deactivated/generate

execute in minecraft:the_end positioned 0 65 0 as @e[type=end_crystal,distance=15..400,tag=!stellarity.respawn_crystal,tag=!ste_cos_portal_fix] at @s run function stellarity:entity/dragon/spawn/crystal_transitions/cancel
execute as @e[type=end_crystal,tag=stellarity.respawn_crystal] at @s run function stellarity:entity/dragon/spawn/crystal_transitions/respawn

scoreboard players reset @s stellarity.dragon.respawn_animation_progress
tag @s remove stellarity.respawn_dragon

kill @e[type=marker,tag=stellarity.dragon_respawn.beam]

setblock 0 63 0 bedrock replace

# гарантированная очистка всех визуальных эффектов патча и сброс камеры
execute as @e[type=minecraft:end_crystal] run team leave @s
execute as @e[type=minecraft:end_crystal] run data merge entity @s {Glowing:0b,Invulnerable:0b}
scoreboard players set #tower_retry_count ste_cos.flags 0
function ste_cos:fresh_visual/cleanup_all
