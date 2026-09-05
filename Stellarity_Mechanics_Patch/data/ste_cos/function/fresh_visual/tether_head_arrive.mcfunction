# ste_cos:fresh_visual/tether_head_arrive
# прибытие снаряда луча к Сердцу Дракона в точку 0 129 0

# приятный магический звук связывания кристалла с сердцем (громко, медленный резонанс)
playsound block.amethyst_block.chime hostile @a 0 129 0 48.0 0.70
playsound block.amethyst_block.resonate hostile @a 0 129 0 48.0 0.65
playsound entity.illusioner.cast_spell hostile @a 0 129 0 48.0 0.75

# усиление уровня Сердца Дракона
function ste_cos:fresh_visual/heart_level_up

# объемная космическая вспышка контакта и втягивание материи
particle flash{color:-4980481} 0 129 0 0 0 0 0 1 force @a
particle dust_color_transition{from_color:[0.85,0.1,1.0],scale:2.4,to_color:[0.2,0.0,0.5]} 0 129 0 0.6 0.6 0.6 0.1 35 force @a
particle electric_spark 0 129 0 0.6 0.6 0.6 0.1 30 force @a
particle reverse_portal 0 129 0 1.2 1.2 1.2 0.1 40 force @a
particle dragon_breath 0 129 0 0.8 0.8 0.8 0.05 20 force @a

# привязка кристалла к постоянному фиолетовому лучу
tag @e[type=end_crystal,tag=ste_cos.tether_crystal,tag=!ste_cos.tether_connected,limit=1,sort=nearest] add ste_cos.tether_connected

# удаление маркера снаряда
kill @s
