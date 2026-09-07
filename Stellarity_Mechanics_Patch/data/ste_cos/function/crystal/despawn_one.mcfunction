# ste_cos:crystal/despawn_one
# деспавн кристалла

particle reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.1 60 force
particle dragon_breath ~ ~1 ~ 0.4 0.4 0.4 0.02 30 force
particle soul_fire_flame ~ ~1 ~ 0.4 0.4 0.4 0.02 20 force
particle end_rod ~ ~1 ~ 0.3 0.3 0.3 0.01 15 force

playsound minecraft:block.amethyst_block.resonate block @a[distance=..16] ~ ~ ~ 1.0 0.65
playsound minecraft:entity.illusioner.mirror_move block @a[distance=..16] ~ ~ ~ 1.0 0.60
playsound minecraft:block.respawn_anchor.deplete block @a[distance=..16] ~ ~ ~ 1.0 0.55

kill @s
