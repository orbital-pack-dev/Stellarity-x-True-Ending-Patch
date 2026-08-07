# =====================================================================
# ste_te_patch:mechanics/island_wrath_fire
# Контекст: AS ender_dragon AT дракона.
# =====================================================================

# Телепорт к рандомному кристальному столбу
execute as @e[type=end_crystal,sort=random,limit=1] at @s run tp @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,limit=1] ~ 75 ~

# Гигантский цилиндр частиц
execute at @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,limit=1] run particle sonic_boom ~ ~ ~ 20 15 20 0 200 force
execute at @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,limit=1] run particle dragon_breath ~ ~ ~ 15 10 15 0.5 300 force
execute at @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,limit=1] run particle flash{color:[0.4, 0.0, 1.0, 1.0]} ~ ~ ~ 0 0 0 0 1 force

# Урон всем в радиусе 30
execute at @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,limit=1] as @a[distance=..30] run damage @s 15 minecraft:mob_attack by @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,limit=1,sort=nearest]

# Отбрасывание к краям острова (боковой Motion)
execute as @a[distance=..30,x=-30,z=-30,dx=60,dz=60] at @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,limit=1] run data merge entity @s {Motion:[2.0,1.0,2.0]}

# Звуки
playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 0.6
playsound minecraft:entity.ender_dragon.flap hostile @a[distance=..256] ~ ~ ~ 8 0.4
playsound minecraft:entity.warden.sonic_boom hostile @a[distance=..256] ~ ~ ~ 8 0.9

# Title
title @a[distance=..256] title {"text":"ISLAND WRATH","color":"dark_purple","bold":true}
title @a[distance=..256] subtitle {"text":"The Dragon descends!","color":"gray"}
