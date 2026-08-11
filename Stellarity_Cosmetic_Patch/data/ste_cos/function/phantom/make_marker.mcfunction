# =====================================================================
# ste_cos:phantom/make_marker
# ФАЗА 1 (as end_crystal at кристалл).
# Создаёт ОДИН маркер-armor_stand на кристалле с уникальным id.
# Также сразу присваивает маркеру РАНДОМНЫЙ размах орбиты 4..8
# и РАНДОМНУЮ высоту орбиты 0.5..3.5 (используются когда появится фантом).
# =====================================================================

# Новый id маркера
scoreboard players add #guard_id ste_cos.flags 1

# Маркер +0.5 над кристаллом
summon armor_stand ~ ~0.5 ~ {Invisible:1b,Marker:1b,NoGravity:1b,Tags:["ste_cos_guard_marker","ste_cos_guard_marker_new"]}

# Назначить id маркеру
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] run scoreboard players operation @s ste_cos.id = #guard_id ste_cos.flags

# Рандомная высота орбиты 0..3 шага по +1 (итог 0.5 + [0..3] = 0.5..3.5)
execute store result score #rh ste_cos.flags run random value 0..3
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] at @s if score #rh ste_cos.flags matches 1.. run tp @s ~ ~1 ~
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] at @s if score #rh ste_cos.flags matches 2.. run tp @s ~ ~1 ~
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] at @s if score #rh ste_cos.flags matches 3.. run tp @s ~ ~1 ~

# Рандомный размах орбиты 4..8
execute store result score #rr ste_cos.flags run random value 4..8
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new,limit=1] run scoreboard players operation @s ste_cos.radius = #rr ste_cos.flags

# Снятие временного тега
execute as @e[type=armor_stand,tag=ste_cos_guard_marker_new] run tag @s remove ste_cos_guard_marker_new
