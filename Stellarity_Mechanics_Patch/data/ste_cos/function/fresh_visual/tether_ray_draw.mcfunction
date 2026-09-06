# ste_cos:fresh_visual/tether_ray_draw
# запуск отрисовки постоянных фиолетовых электрических лучей от всех привязанных кристаллов

execute as @e[type=end_crystal,tag=ste_cos.tether_connected] at @s positioned ~ ~1.8 ~ facing 0 98 0 run function ste_cos:fresh_visual/tether_ray_step
