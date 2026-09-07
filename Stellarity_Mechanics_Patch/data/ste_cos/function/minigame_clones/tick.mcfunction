# ste_cos:minigame_clones/tick
# мини-игра клонов

# фаза 1
execute if score #minigame_state ste_cos.flags matches 1 as @e[type=ender_dragon,tag=ste_cos.minigame_real,limit=1] at @s positioned 0 67 0 if entity @s[distance=..8] run function ste_cos:minigame_clones/start_carrier

# фаза 2
execute if score #minigame_state ste_cos.flags matches 2 run function ste_cos:minigame_clones/tick_carrier

# фаза 3
execute if score #minigame_state ste_cos.flags matches 3 if score #carousel_active ste_cos.flags matches 0 run function ste_cos:minigame_clones/tick_summon_stage
execute if score #minigame_state ste_cos.flags matches 3 if score #carousel_active ste_cos.flags matches 1 run function ste_cos:minigame_clones/tick_carousel

# фаза 4
execute if score #minigame_state ste_cos.flags matches 4 run function ste_cos:minigame_clones/tick_resolve
