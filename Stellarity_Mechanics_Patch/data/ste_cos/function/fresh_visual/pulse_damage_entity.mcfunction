# ste_cos:fresh_visual/pulse_damage_entity
# урон импульса

damage @s 3.5 magic
tag @s add ste_cos.pulse_hit
particle flash{color:[1.0,0.2,1.0,1.0]} ~ ~1 ~ 0 0 0 0 1 force @a
playsound entity.generic.explode master @a ~ ~ ~ 1.0 1.2
