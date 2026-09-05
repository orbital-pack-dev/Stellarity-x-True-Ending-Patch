# ste_cos:crystal/laser_projectile_hit
# взрыв и рассеивание лазера

particle dust_color_transition{from_color:[0.9,0.2,1.0],scale:2.5,to_color:[0.2,0.0,0.5]} ~ ~ ~ 0.5 0.5 0.5 0.1 20 force
playsound entity.generic.explode hostile @a ~ ~ ~ 16.0 1.2
playsound block.amethyst_block.resonate hostile @a ~ ~ ~ 16.0 1.5

# снятие beam_target у кристалла
execute as @e[type=end_crystal,tag=ste_cos.shielded_crystal,distance=..80,limit=1,sort=nearest] run data remove entity @s beam_target

kill @s
