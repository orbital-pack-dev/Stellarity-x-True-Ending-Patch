# ste_cos:fresh_visual/tornado_tick
# раскрут слоёв с разной угловой скоростью + звук, нарастающий вместе с ним

execute unless score #tornado ste_cos.age matches 60.. run scoreboard players add #tornado ste_cos.age 1

# ядро — самое быстрое, крутится сразу
execute as @e[tag=ste_cos.tor_core] at @s run tp @s ~ ~ ~ ~9 0
# внутренний слой — заметно медленнее
execute as @e[tag=ste_cos.tor_inner] at @s run tp @s ~ ~ ~ ~5 0
# средний слой — крутится в обратную сторону, ломает симметрию
execute as @e[tag=ste_cos.tor_mid] at @s run tp @s ~ ~ ~ ~-4 0
# внешний — тянется медленным шлейфом
execute as @e[tag=ste_cos.tor_outer] at @s run tp @s ~ ~ ~ ~2 0

# слои включаются не разом, а по очереди — вихрь раскручивается наружу
execute if score #tornado ste_cos.age matches 0.. as @e[tag=ste_cos.tor_core] at @s run function ste_cos:fresh_visual/tor_wave_core
execute if score #tornado ste_cos.age matches 8.. as @e[tag=ste_cos.tor_inner] at @s run function ste_cos:fresh_visual/tor_wave_inner
execute if score #tornado ste_cos.age matches 18.. as @e[tag=ste_cos.tor_mid] at @s run function ste_cos:fresh_visual/tor_wave_mid
execute if score #tornado ste_cos.age matches 32.. as @e[tag=ste_cos.tor_outer] at @s run function ste_cos:fresh_visual/tor_wave_outer

# звук нарастает вместе с раскрутом, а не играет ровно с 1 тика
execute if score #tornado ste_cos.age matches 0..12 if predicate true_ending:chance/6_percent run playsound block.respawn_anchor.deplete ambient @a 0 129 0 24.0 0.4
execute if score #tornado ste_cos.age matches 13..30 if predicate true_ending:chance/8_percent run playsound block.respawn_anchor.deplete ambient @a 0 129 0 30.0 0.5
execute if score #tornado ste_cos.age matches 31.. if predicate true_ending:chance/8_percent run playsound block.respawn_anchor.deplete ambient @a 0 129 0 32.0 0.55
execute if score #tornado ste_cos.age matches 20.. if predicate true_ending:chance/10_percent run playsound block.amethyst_block.resonate ambient @a 0 129 0 32.0 0.5
