# ste_cos:crystal/shielded_crystal_fire
# запуск направленного луча по ближайшему игроку

# спавним маркер снаряда луча на высоте 2.0 блока от кристалла
summon marker ~ ~2 ~ {Tags:["ste_cos.crystal_laser_projectile","ste_cos.new_laser_temp"]}

# поворачиваем маркер строго в сторону глаз ближайшего игрока
execute as @e[type=marker,tag=ste_cos.new_laser_temp,limit=1] at @s facing entity @p[distance=..48,gamemode=!creative,gamemode=!spectator] eyes run tp @s ~ ~ ~ ~ ~
tag @e[type=marker,tag=ste_cos.new_laser_temp] remove ste_cos.new_laser_temp

# звуки и вспышка выстрела лазера
playsound entity.illusioner.cast_spell hostile @a ~ ~ ~ 32.0 1.2
playsound entity.warden.sonic_boom hostile @a ~ ~ ~ 32.0 1.6
particle flash{color:[0.85,0.20,1.0,1.0]} ~ ~2 ~ 0 0 0 0 1 force
