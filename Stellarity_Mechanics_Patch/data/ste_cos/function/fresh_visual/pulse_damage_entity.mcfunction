# ste_cos:fresh_visual/pulse_damage_entity
# урон импульса

tag @s add ste_cos.pulse_hit
damage @s 3.5 generic by @e[type=marker,tag=stellarity.dragon_respawn.marker,limit=1]
playsound entity.player.hurt master @s ~ ~ ~ 1.0 1.0
particle flash{color:[0.9,0.25,1.0,1.0]} ~ ~1 ~ 0 0 0 0 1 force @a
particle dust{color:[1.0,0.3,0.9],scale:1.8} ~ ~1 ~ 0.4 0.4 0.4 0.1 8 force @a
