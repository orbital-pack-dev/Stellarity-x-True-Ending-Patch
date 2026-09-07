# ste_cos:minigame_clones/clone_dive_tick
# пике в бездну

scoreboard players add @s ste_cos.dive_timer 1
tp @s ~ ~-2.0 ~
particle reverse_portal ~ ~ ~ 1.0 1.0 1.0 0.1 20 force
particle dragon_breath ~ ~ ~ 0.6 0.6 0.6 0.05 12 force
particle dust_color_transition{from_color:[0.6,0.05,0.8],scale:2.0,to_color:[0.1,0.0,0.2]} ~ ~ ~ 0.8 0.6 0.8 0.05 10 force

execute if score @s ste_cos.dive_timer matches 30.. run particle explosion_emitter ~ ~ ~ 0 0 0 0 2 force
execute if score @s ste_cos.dive_timer matches 30.. run playsound entity.illusioner.death master @a ~ ~ ~ 1.5 0.9
execute if score @s ste_cos.dive_timer matches 30.. run kill @s
