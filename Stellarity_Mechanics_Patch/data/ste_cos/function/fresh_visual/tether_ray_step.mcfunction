# ste_cos:fresh_visual/tether_ray_step
# шаг отрисовки фиолетового электрического луча привязки от кристалла к Сердцу Дракона

particle dust{color:[0.85,0.15,1.0],scale:1.2} ~ ~ ~ 0 0 0 0 1 force @a[distance=..256]
particle dust_color_transition{from_color:[0.9,0.2,1.0],scale:1.3,to_color:[0.25,0.0,0.5]} ~ ~ ~ 0 0 0 0 1 force @a[distance=..256]

# искры электрического тока вдоль луча
execute if predicate true_ending:chance/20_percent run particle electric_spark ~ ~ ~ 0.1 0.1 0.1 0.04 1 force @a[distance=..256]

# следующий шаг вперед по направлению к точке 0 98 0 (пока луч не дошел до Сердца)
execute positioned ^ ^ ^3.5 if entity @e[type=marker,tag=ste_cos.respawn_heart,limit=1] unless entity @e[type=marker,tag=ste_cos.respawn_heart,distance=..4.5,limit=1] facing 0 98 0 run function ste_cos:fresh_visual/tether_ray_step
