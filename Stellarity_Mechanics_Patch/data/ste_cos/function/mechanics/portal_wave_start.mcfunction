# ste_cos:mechanics/portal_wave_start
# спавн волны у портала

scoreboard players set #portal_danger_timer ste_cos.flags 0
summon area_effect_cloud 0 65 0 {Duration:160,Radius:5.0f,WaitTime:10,Tags:["ste_cos_portal_wave"],Particle:"dragon_breath"}
playsound entity.ender_dragon.growl hostile @a 0 65 0 2 0.8
