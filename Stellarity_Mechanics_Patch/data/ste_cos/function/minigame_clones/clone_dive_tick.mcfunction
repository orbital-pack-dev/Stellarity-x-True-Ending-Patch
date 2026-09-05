# ste_cos:minigame_clones/clone_dive_tick
# пикирование копии в бездну с последующим удалением

scoreboard players add @s ste_cos.dive_timer 1
tp @s ~ ~-2.5 ~
particle dragon_breath ~ ~ ~ 0.5 0.5 0.5 0.05 10 force
particle dust{color:[0.08,0.02,0.12],scale:2.0} ~ ~ ~ 0.8 0.5 0.8 0.05 8 force

execute if score @s ste_cos.dive_timer matches 35.. run particle explosion_emitter ~ ~ ~ 0 0 0 0 2 force
execute if score @s ste_cos.dive_timer matches 35.. run kill @s
