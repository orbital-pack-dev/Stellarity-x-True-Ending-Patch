# ste_cos:minigame_clones/start_carrier
# подхват дракона невидимым армор-стендом и запуск полета по S-кривой до 28 85 0

scoreboard players set #minigame_state ste_cos.flags 2
scoreboard players set #carrier_tick ste_cos.timer 0

tag @s remove stellarity.to_portal
data modify entity @s DragonPhase set value 10
data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]

# призыв невидимого маркерного армор-стенда точно в 0 67 0
kill @e[type=armor_stand,tag=ste_cos.minigame_carrier]
summon armor_stand 0 67 0 {Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,Tags:["ste_cos.minigame_carrier"]}

# посадка дракона на армор-стенд
ride @s mount @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1]

playsound entity.ender_dragon.growl master @a 0 67 0 2.0 1.0
playsound entity.illusioner.prepare_blindness master @a 0 67 0 2.0 0.85
playsound block.amethyst_block.resonate master @a 0 67 0 2.0 0.6
particle flash{color:[0.85,0.25,1.0,1.0]} 0 67 0 0 0 0 0 2 force
