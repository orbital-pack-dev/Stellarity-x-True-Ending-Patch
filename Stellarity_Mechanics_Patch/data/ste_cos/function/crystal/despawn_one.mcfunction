# ste_cos:crystal/despawn_one
# исчезновение одного кристалла с эффектом

particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force
particle minecraft:dragon_breath ~ ~ ~ 0 0 0 0.5 30 force
playsound minecraft:block.glass.break block @a ~ ~ ~ 3 0.8
playsound minecraft:entity.generic.explode block @a ~ ~ ~ 2 0.7

kill @s
