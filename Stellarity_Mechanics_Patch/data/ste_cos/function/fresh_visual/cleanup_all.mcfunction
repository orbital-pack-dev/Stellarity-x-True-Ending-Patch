# ste_cos:fresh_visual/cleanup_all
# очистка всех визуальных маркеров и возврат камеры

# сброс дистанции камеры у всех игроков
execute as @a run attribute @s minecraft:camera_distance base reset

# удаление всех вспомогательных маркеров визуала
kill @e[type=marker,tag=ste_cos.respawn_heart]
kill @e[type=marker,tag=ste_cos.heart_absorbing]
kill @e[type=marker,tag=ste_cos.absorb_tendril]
kill @e[type=marker,tag=ste_cos.tornado_marker]
kill @e[type=marker,tag=ste_cos.shockwave]
kill @e[type=marker,tag=ste_cos.tether_head]
kill @e[type=marker,tag=ste_cos.visual_marker]

# сброс тегов привязки лучей у кристаллов
tag @e[type=end_crystal] remove ste_cos.tether_connected
tag @e[type=end_crystal] remove ste_cos.tether_crystal
