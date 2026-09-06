# ste_cos:minigame_clones/summon_clone_2
# появление Копии 2 с эпическими эффектами и звуками

summon ender_dragon -14 85 -24.25 {Tags:["trueEnding_dragon_noAI","trueEnding_dragon_particlechecked","stellarity.ender_dragon","stellarity.dragon.invulnerable","smithed.strict","refresh_entity_exists","smithed.entity","ste_cos.clone_dragon","ste_cos.clone_2"],Health:300f,DragonPhase:3}

playsound entity.shulker.teleport master @a -14 85 -24.25 64.0 0.8
playsound entity.illusioner.prepare_mirror master @a -14 85 -24.25 64.0 1.0
playsound entity.ender_dragon.growl master @a -14 85 -24.25 64.0 1.1

particle flash{color:[0.85,0.25,1.0,1.0]} -14 85 -24.25 0 0 0 0 2 force
particle explosion_emitter -14 85 -24.25 2 2 2 0.1 5 force
particle dust_color_transition{from_color:[0.9,0.2,1.0],scale:3.0,to_color:[0.1,0.0,0.3]} -14 85 -24.25 3 3 3 0.2 100 force
