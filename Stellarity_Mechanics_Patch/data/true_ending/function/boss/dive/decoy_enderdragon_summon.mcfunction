# Фикс нырка

# Механика боя

# Фикс портала
execute if score @s trueEnding_bosstime matches 1020 positioned 0 150 0 run summon marker ~ ~ ~ {Tags:["ste_cos_decoy_pos"]}
execute if score @s trueEnding_bosstime matches 1020 run spreadplayers 0 0 15 30 under 255 false @e[type=marker,tag=ste_cos_decoy_pos]
execute if score @s trueEnding_bosstime matches 1020 as @e[type=marker,tag=ste_cos_decoy_pos] at @s run tp @s ~ 150 ~
execute if score @s trueEnding_bosstime matches 1020 at @e[type=marker,tag=ste_cos_decoy_pos] run summon ender_dragon ~ ~ ~ {Tags:["trueEnding_mirrordragon","trueEnding_dragon_particlechecked","stellarity.ender_dragon","stellarity.dragon.invulnerable","smithed.strict","refresh_entity_exists","smithed.entity"],NoAI:0b,Silent:1b,Invulnerable:1b}
execute if score @s trueEnding_bosstime matches 1020 run kill @e[type=marker,tag=ste_cos_decoy_pos]

# Фикс портала
execute if score @s trueEnding_bosstime matches 1050 positioned 0 150 0 run summon marker ~ ~ ~ {Tags:["ste_cos_decoy_pos"]}
execute if score @s trueEnding_bosstime matches 1050 run spreadplayers 0 0 15 30 under 255 false @e[type=marker,tag=ste_cos_decoy_pos]
execute if score @s trueEnding_bosstime matches 1050 as @e[type=marker,tag=ste_cos_decoy_pos] at @s run tp @s ~ 150 ~
execute if score @s trueEnding_bosstime matches 1050 at @e[type=marker,tag=ste_cos_decoy_pos] run summon ender_dragon ~ ~ ~ {Tags:["trueEnding_mirrordragon","trueEnding_dragon_particlechecked","stellarity.ender_dragon","stellarity.dragon.invulnerable","smithed.strict","refresh_entity_exists","smithed.entity"],NoAI:0b,Silent:1b,Invulnerable:1b}
execute if score @s trueEnding_bosstime matches 1050 run kill @e[type=marker,tag=ste_cos_decoy_pos]
