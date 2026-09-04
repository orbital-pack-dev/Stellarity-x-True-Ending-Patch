# ste_cos:fresh_visual/tornado_wave
# спиральные закручивающиеся рукава торнадо вокруг Сердца Дракона (высота 126, радиусы 18..38)

scoreboard players add #tornado_step ste_cos.timer 1

execute rotated ~15 0 run particle dragon_breath ^ ^ ^18 ^10000000000000 ^1000000000000 ^ 0.00000000000003 0 force @a[distance=..256]
execute rotated ~15 0 run particle dust_color_transition{from_color:[0.85,0.15,1.0],scale:1.6,to_color:[0.2,0.0,0.5]} ^ ^ ^28 ^10000000000000 ^1000000000000 ^ 0.00000000000004 0 force @a[distance=..256]
execute rotated ~15 0 run particle witch ^ ^ ^38 ^10000000000000 ^1000000000000 ^ 0.00000000000002 0 force @a[distance=..256]

execute unless score #tornado_step ste_cos.timer matches 24.. rotated ~15 ~ run function ste_cos:fresh_visual/tornado_wave
execute if score #tornado_step ste_cos.timer matches 24.. run scoreboard players set #tornado_step ste_cos.timer 0
