# ste_cos:fresh_visual/culmination_warp
# кульминация возрождения: за 1 секунду до появления дракона

# инверсия / приближение камеры
execute as @a run attribute @s minecraft:camera_distance base set -10

# звук гравитационного схлопывания перед взрывом
playsound entity.warden.sonic_charge hostile @a 0 129 0 32.0 1.5
playsound entity.illusioner.mirror_move hostile @a 0 129 0 32.0 0.8

# фиолетовая вспышка и сжатие Сердца в сингулярность
particle flash{color:-2673921} 0 129 0 0 0 0 0 1 force @a
particle reverse_portal 0 129 0 2 2 2 0.5 80 force @a
particle dust_color_transition{from_color:[1.0,0.3,1.0],scale:2.0,to_color:[0.2,0.0,0.5]} 0 129 0 0.5 0.5 0.5 0.1 40 force @a
