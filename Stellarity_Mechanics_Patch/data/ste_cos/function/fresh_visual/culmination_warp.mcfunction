# ste_cos:fresh_visual/culmination_warp
# кульминация возрождения: за 1 секунду до появления дракона

# инверсия / приближение камеры
execute as @a run attribute @s minecraft:camera_distance base set -10

# звук гравитационного схлопывания перед взрывом (глубокий и медленный)
playsound entity.warden.sonic_charge hostile @a 0 129 0 48.0 0.65
playsound entity.illusioner.mirror_move hostile @a 0 129 0 48.0 0.60

# фиолетовая вспышка и объемное схлопывание Сердца в сингулярность
particle flash{color:-2673921} 0 129 0 0 0 0 0 1 force @a
particle reverse_portal 0 129 0 3 3 3 0.2 120 force @a
particle dragon_breath 0 129 0 1.5 1.5 1.5 0.08 60 force @a
particle dust_color_transition{from_color:[1.0,0.3,1.0],scale:3.0,to_color:[0.2,0.0,0.5]} 0 129 0 1.0 1.0 1.0 0.1 50 force @a
