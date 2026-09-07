# ste_cos:minigame_clones/start_clone_exit
# разлет копий

# копия 1
execute as @e[type=ender_dragon,tag=ste_cos.clone_1,limit=1] at @s run summon armor_stand ~ ~ ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,Tags:["ste_cos.clone_exit_carrier","ste_cos.exit_1"]}
execute as @e[type=armor_stand,tag=ste_cos.exit_1] at @s facing 120 95 120 run tp @s ~ ~ ~ ~ ~

# копия 2
execute as @e[type=ender_dragon,tag=ste_cos.clone_2,limit=1] at @s run summon armor_stand ~ ~ ~ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,Tags:["ste_cos.clone_exit_carrier","ste_cos.exit_2"]}
execute as @e[type=armor_stand,tag=ste_cos.exit_2] at @s facing -120 95 -120 run tp @s ~ ~ ~ ~ ~

playsound entity.ender_dragon.growl master @a 0 85 0 64.0 1.2
