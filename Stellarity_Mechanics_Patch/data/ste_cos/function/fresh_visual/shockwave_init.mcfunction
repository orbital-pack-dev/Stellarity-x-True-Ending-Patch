# ste_cos:fresh_visual/shockwave_init
# запуск адаптированной ударной волны в начале анимации возрождения (строго на высоте 0 129 0)

kill @e[type=marker,tag=ste_cos.shockwave]

scoreboard players set #shockwave_count ste_cos.timer 0

# спавн маркеров ударной волны строго на высоте Сердца 0 129 0
execute positioned 0 129 0 run function ste_cos:fresh_visual/shockwave_spawn_markers

# запуск круговорота торнадо на высоте 0 126 0 вокруг острова
function ste_cos:fresh_visual/tornado_init

playsound entity.warden.sonic_boom hostile @a 0 129 0 32.0 0.8
playsound block.respawn_anchor.set_spawn hostile @a 0 129 0 32.0 0.9
