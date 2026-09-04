# ste_cos:fresh_visual/tether_head_arrive
# прибытие снаряда луча к Сердцу Дракона в точку 0 129 0

# приятный магический звук связывания кристалла с сердцем (громко, слышно снизу)
playsound block.amethyst_block.chime hostile @a 0 129 0 32.0 1.2
playsound block.amethyst_block.resonate hostile @a 0 129 0 32.0 1.4
playsound entity.illusioner.cast_spell hostile @a 0 129 0 32.0 1.4

# усиление уровня Сердца Дракона
function ste_cos:fresh_visual/heart_level_up

# фиолетовая вспышка контакта
particle flash{color:-4980481} 0 129 0 0 0 0 0 1 force @a
particle dust_color_transition{from_color:[0.85,0.1,1.0],scale:2.2,to_color:[0.2,0.0,0.5]} 0 129 0 0.5 0.5 0.5 0.1 30 force @a
particle electric_spark 0 129 0 0.5 0.5 0.5 0.1 25 force @a

# привязка кристалла к постоянному фиолетовому лучу
tag @e[type=end_crystal,tag=ste_cos.tether_crystal,tag=!ste_cos.tether_connected,limit=1,sort=nearest] add ste_cos.tether_connected

# удаление маркера снаряда
kill @s
