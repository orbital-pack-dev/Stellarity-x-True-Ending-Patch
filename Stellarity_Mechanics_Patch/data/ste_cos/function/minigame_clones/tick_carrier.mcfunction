# ste_cos:minigame_clones/tick_carrier
# полет носителя

scoreboard players add #carrier_tick ste_cos.timer 1

# частицы шлейфа
execute as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run particle dust_color_transition{from_color:[0.85,0.2,1.0],scale:2.2,to_color:[0.15,0.0,0.4]} ~ ~ ~ 0.5 0.5 0.5 0.05 15 force @a
execute as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run particle reverse_portal ~ ~ ~ 0.5 0.5 0.5 0.04 8 force @a
execute as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run particle electric_spark ~ ~ ~ 0.4 0.4 0.4 0.02 5 force @a

# звуки крыльев
execute if score #carrier_tick ste_cos.timer matches 15 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0
execute if score #carrier_tick ste_cos.timer matches 30 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0
execute if score #carrier_tick ste_cos.timer matches 45 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0

execute if score #carrier_tick ste_cos.timer matches 1 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 0.70 67.21 -0.69 -133.9 -12.6
execute if score #carrier_tick ste_cos.timer matches 2 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 1.40 67.43 -1.35 -132.8 -13.7
execute if score #carrier_tick ste_cos.timer matches 3 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 2.10 67.67 -1.98 -131.6 -14.8
execute if score #carrier_tick ste_cos.timer matches 4 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 2.80 67.93 -2.59 -130.5 -15.9
execute if score #carrier_tick ste_cos.timer matches 5 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 3.49 68.19 -3.17 -129.3 -17.0
execute if score #carrier_tick ste_cos.timer matches 6 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 4.19 68.48 -3.73 -128.1 -18.1
execute if score #carrier_tick ste_cos.timer matches 7 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 4.88 68.77 -4.26 -126.8 -19.2
execute if score #carrier_tick ste_cos.timer matches 8 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 5.57 69.08 -4.76 -125.6 -20.3
execute if score #carrier_tick ste_cos.timer matches 9 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 6.25 69.39 -5.24 -124.3 -21.3
execute if score #carrier_tick ste_cos.timer matches 10 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 6.94 69.72 -5.69 -123.0 -22.3
execute if score #carrier_tick ste_cos.timer matches 11 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 7.61 70.06 -6.12 -121.6 -23.3
execute if score #carrier_tick ste_cos.timer matches 12 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 8.29 70.41 -6.53 -120.3 -24.3
execute if score #carrier_tick ste_cos.timer matches 13 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 8.96 70.76 -6.91 -118.8 -25.3
execute if score #carrier_tick ste_cos.timer matches 14 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 9.62 71.13 -7.26 -117.4 -26.3
execute if score #carrier_tick ste_cos.timer matches 15 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 10.28 71.50 -7.59 -115.9 -27.2
execute if score #carrier_tick ste_cos.timer matches 16 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 10.93 71.88 -7.90 -114.4 -28.1
execute if score #carrier_tick ste_cos.timer matches 17 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 11.58 72.26 -8.18 -112.8 -29.0
execute if score #carrier_tick ste_cos.timer matches 18 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 12.22 72.65 -8.44 -111.2 -29.8
execute if score #carrier_tick ste_cos.timer matches 19 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 12.86 73.05 -8.68 -109.5 -30.7
execute if score #carrier_tick ste_cos.timer matches 20 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 13.48 73.44 -8.89 -107.8 -31.5
execute if score #carrier_tick ste_cos.timer matches 21 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 14.10 73.85 -9.08 -106.1 -32.2
execute if score #carrier_tick ste_cos.timer matches 22 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 14.71 74.25 -9.24 -104.2 -33.0
execute if score #carrier_tick ste_cos.timer matches 23 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 15.31 74.66 -9.38 -102.4 -33.7
execute if score #carrier_tick ste_cos.timer matches 24 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 15.90 75.06 -9.50 -100.4 -34.3
execute if score #carrier_tick ste_cos.timer matches 25 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 16.49 75.47 -9.60 -98.4 -34.9
execute if score #carrier_tick ste_cos.timer matches 26 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 17.06 75.88 -9.67 -96.3 -35.5
execute if score #carrier_tick ste_cos.timer matches 27 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 17.62 76.29 -9.73 -94.2 -36.0
execute if score #carrier_tick ste_cos.timer matches 28 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 18.18 76.69 -9.76 -92.0 -36.5
execute if score #carrier_tick ste_cos.timer matches 29 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 18.72 77.10 -9.76 -89.7 -36.9
execute if score #carrier_tick ste_cos.timer matches 30 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 19.25 77.50 -9.75 -87.3 -37.3
execute if score #carrier_tick ste_cos.timer matches 31 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 19.77 77.90 -9.71 -84.8 -37.6
execute if score #carrier_tick ste_cos.timer matches 32 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 20.28 78.29 -9.66 -82.3 -37.8
execute if score #carrier_tick ste_cos.timer matches 33 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 20.77 78.68 -9.58 -79.6 -37.9
execute if score #carrier_tick ste_cos.timer matches 34 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 21.25 79.07 -9.48 -76.9 -38.0
execute if score #carrier_tick ste_cos.timer matches 35 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 21.72 79.44 -9.36 -74.1 -38.0
execute if score #carrier_tick ste_cos.timer matches 36 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 22.18 79.82 -9.22 -71.3 -37.9
execute if score #carrier_tick ste_cos.timer matches 37 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 22.62 80.18 -9.05 -68.3 -37.7
execute if score #carrier_tick ste_cos.timer matches 38 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 23.04 80.54 -8.87 -65.3 -37.3
execute if score #carrier_tick ste_cos.timer matches 39 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 23.46 80.88 -8.67 -62.2 -36.9
execute if score #carrier_tick ste_cos.timer matches 40 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 23.85 81.22 -8.44 -59.0 -36.3
execute if score #carrier_tick ste_cos.timer matches 41 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 24.23 81.55 -8.20 -55.8 -35.6
execute if score #carrier_tick ste_cos.timer matches 42 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 24.60 81.87 -7.94 -52.6 -34.8
execute if score #carrier_tick ste_cos.timer matches 43 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 24.95 82.17 -7.66 -49.3 -33.8
execute if score #carrier_tick ste_cos.timer matches 44 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 25.28 82.47 -7.35 -46.0 -32.6
execute if score #carrier_tick ste_cos.timer matches 45 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 25.59 82.75 -7.03 -42.8 -31.4
execute if score #carrier_tick ste_cos.timer matches 46 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 25.89 83.02 -6.69 -39.5 -29.9
execute if score #carrier_tick ste_cos.timer matches 47 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 26.17 83.27 -6.33 -36.2 -28.4
execute if score #carrier_tick ste_cos.timer matches 48 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 26.43 83.51 -5.95 -33.0 -26.6
execute if score #carrier_tick ste_cos.timer matches 49 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 26.67 83.74 -5.55 -29.8 -24.8
execute if score #carrier_tick ste_cos.timer matches 50 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 26.90 83.94 -5.14 -26.7 -22.8
execute if score #carrier_tick ste_cos.timer matches 51 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 27.10 84.14 -4.70 -23.7 -20.7
execute if score #carrier_tick ste_cos.timer matches 52 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 27.29 84.31 -4.25 -20.7 -18.5
execute if score #carrier_tick ste_cos.timer matches 53 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 27.45 84.47 -3.78 -17.8 -16.3
execute if score #carrier_tick ste_cos.timer matches 54 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 27.59 84.60 -3.29 -15.0 -14.0
execute if score #carrier_tick ste_cos.timer matches 55 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 27.72 84.72 -2.79 -12.3 -11.6
execute if score #carrier_tick ste_cos.timer matches 56 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 27.82 84.82 -2.26 -9.6 -9.3
execute if score #carrier_tick ste_cos.timer matches 57 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 27.90 84.90 -1.72 -7.1 -6.9
execute if score #carrier_tick ste_cos.timer matches 58 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 27.95 84.95 -1.17 -4.6 -4.6
execute if score #carrier_tick ste_cos.timer matches 59 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 27.99 84.99 -0.59 -2.3 -2.3
execute if score #carrier_tick ste_cos.timer matches 60 as @e[type=armor_stand,tag=ste_cos.minigame_carrier,limit=1] at @s run tp @s 28.00 85.00 0.00 0.0 0.0

# прибытие
execute if score #carrier_tick ste_cos.timer matches 60.. run function ste_cos:minigame_clones/arrive_carrier
