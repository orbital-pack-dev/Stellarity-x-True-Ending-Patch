# ste_cos:fresh_visual/tower_tether_launch
# запуск летящего луча от башенного кристалла в сторону Сердца Дракона (0 129 0)

tag @s add ste_cos.tether_crystal

# создание маркера снаряда луча на высоте 1.8 блока (центр модели кристалла)
summon marker ~ ~1.8 ~ {Tags:["ste_cos.tether_head","ste_cos.visual_marker","ste_cos.temp_head"]}

# поворот маркера снаряда строго на Сердце Дракона 0 129 0
execute as @e[type=marker,tag=ste_cos.temp_head,limit=1] facing 0 129 0 run tp @s ~ ~ ~ ~ ~
tag @e[type=marker,tag=ste_cos.temp_head] remove ste_cos.temp_head

playsound block.respawn_anchor.charge block @a ~ ~ ~ 8.0 1.5
playsound entity.illusioner.cast_spell block @a ~ ~ ~ 8.0 1.3
