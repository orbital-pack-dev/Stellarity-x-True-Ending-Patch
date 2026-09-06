# ste_cos:crystal/shielded_crystal_fire
# запуск направленного луча по ближайшему игроку

# присваиваем уникальный ID лазера кристаллу и стойке
scoreboard players add #laser_next_id ste_cos.id 1
scoreboard players operation @s ste_cos.id = #laser_next_id ste_cos.id

# спавним маленькую невидимую стойку для брони на высоте 2.0 блока от кристалла
data modify entity @s beam_target set value [I;0,0,0]
summon armor_stand ~ ~2 ~ {Small:1b,Invisible:1b,Invulnerable:1b,Marker:1b,NoGravity:1b,Tags:["ste_cos.crystal_laser_projectile","ste_cos.new_laser_temp"]}
scoreboard players operation @e[type=armor_stand,tag=ste_cos.new_laser_temp,limit=1] ste_cos.id = #laser_next_id ste_cos.id

# поворачиваем стойку строго в сторону глаз ближайшего игрока
execute as @e[type=armor_stand,tag=ste_cos.new_laser_temp,limit=1] at @s facing entity @p[distance=..48,gamemode=!creative,gamemode=!spectator] eyes run tp @s ~ ~ ~ ~ ~
tag @e[type=armor_stand,tag=ste_cos.new_laser_temp] remove ste_cos.new_laser_temp

# звуки и вспышка выстрела лазера (строго для игроков рядом, в 16 блоках)
playsound entity.illusioner.cast_spell hostile @a[distance=..16] ~ ~ ~ 1.0 1.2
playsound entity.warden.sonic_boom hostile @a[distance=..16] ~ ~ ~ 1.0 1.6
particle flash{color:[0.85,0.20,1.0,1.0]} ~ ~2 ~ 0 0 0 0 1 force
