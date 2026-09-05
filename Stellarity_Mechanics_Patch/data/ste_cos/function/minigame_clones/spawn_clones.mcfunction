# ste_cos:minigame_clones/spawn_clones
# призыв 2 копий на высоте 128 и инициализация центра карусели

scoreboard players set #minigame_state ste_cos.flags 3
scoreboard players set #carousel_timer ste_cos.timer 0
scoreboard players set #minigame_resolved ste_cos.flags 0

# создание центрального маркера вращения
kill @e[type=marker,tag=ste_cos.carousel_center]
summon marker 0 65 0 {Tags:["ste_cos.carousel_center"]}

# звуки и визуальный взрыв призыва копий
playsound entity.shulker.teleport master @a[distance=..32] 0 65 0 1.0 0.8
playsound entity.illusioner.prepare_mirror master @a[distance=..32] 0 65 0 1.0 1.0
playsound entity.ender_dragon.growl master @a[distance=..32] 0 65 0 1.0 1.1
particle flash{color:[0.85,0.25,1.0,1.0]} 0 65 0 0 0 0 0 2 force
particle explosion_emitter 0 65 0 2 2 2 0.1 5 force
particle dust_color_transition{from_color:[0.9,0.2,1.0],scale:3.0,to_color:[0.1,0.0,0.3]} 0 65 0 3 3 3 0.2 120 force

# призыв двух копий с полным набором тегов и нормальным здоровьем
summon ender_dragon 0 65 28 {Tags:["trueEnding_dragon_noAI","trueEnding_dragon_particlechecked","stellarity.ender_dragon","stellarity.dragon.invulnerable","smithed.strict","refresh_entity_exists","smithed.entity","ste_cos.clone_dragon","ste_cos.clone_1"],Health:300f,DragonPhase:3}
summon ender_dragon 0 65 -28 {Tags:["trueEnding_dragon_noAI","trueEnding_dragon_particlechecked","stellarity.ender_dragon","stellarity.dragon.invulnerable","smithed.strict","refresh_entity_exists","smithed.entity","ste_cos.clone_dragon","ste_cos.clone_2"],Health:300f,DragonPhase:3}
