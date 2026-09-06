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

# атмосферные акценты при раскрутке торнадо (только в ключевые моменты, без спама каждый тик)
execute if score #tornado ste_cos.age matches 1 run playsound block.respawn_anchor.deplete ambient @a[distance=..64] 0 98 0 1.5 0.45
execute if score #tornado ste_cos.age matches 18 run playsound block.amethyst_block.resonate ambient @a[distance=..64] 0 98 0 1.5 0.50
execute if score #tornado ste_cos.age matches 35 run playsound block.respawn_anchor.deplete ambient @a[distance=..64] 0 98 0 1.8 0.55
