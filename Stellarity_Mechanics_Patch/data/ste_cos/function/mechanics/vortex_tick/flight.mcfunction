# ste_cos:mechanics/vortex_tick/flight
# полет под эффектом вихря

execute if score @s ste_cos.was_flying matches 0 run function ste_cos:mechanics/vortex_tick/takeoff

# сниженная гравитация
attribute @s minecraft:gravity base set 0.07

# таймер частиц
scoreboard players add @s ste_cos.timer 1

# первый круг частиц
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~1.5 ~0.2 ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~-1.5 ~0.2 ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~ ~0.2 ~1.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~ ~0.2 ~-1.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~1.1 ~0.2 ~1.1 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~1.1 ~0.2 ~-1.1 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~-1.1 ~0.2 ~1.1 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~-1.1 ~0.2 ~-1.1 0 0 0 0 2 force

# второй круг частиц
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~2.5 ~0.1 ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~-2.5 ~0.1 ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~ ~0.1 ~2.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~ ~0.1 ~-2.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~1.8 ~0.1 ~1.8 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~1.8 ~0.1 ~-1.8 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~-1.8 ~0.1 ~1.8 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~-1.8 ~0.1 ~-1.8 0 0 0 0 2 force

# третий круг частиц
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~3.5 ~ ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~-3.5 ~ ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~ ~ ~3.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~ ~ ~-3.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~2.5 ~ ~2.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~2.5 ~ ~-2.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~-2.5 ~ ~2.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~-2.5 ~ ~-2.5 0 0 0 0 2 force

# шлейф частиц за летящим игроком
execute if score @s ste_cos.timer matches 13.. unless predicate ste_cos:enchantment/vortex_2 run particle minecraft:end_rod ~ ~0.5 ~ 0.25 0.25 0.25 0.02 3 normal
execute if score @s ste_cos.timer matches 13.. if predicate ste_cos:enchantment/vortex_2 run particle minecraft:dragon_breath ~ ~0.7 ~ 0.3 0.3 0.3 0.05 4 normal
execute if score @s ste_cos.timer matches 13.. if predicate ste_cos:enchantment/vortex_2 run particle minecraft:dust_color_transition{from_color:[0.400,0.000,1.000],scale:1,to_color:[0.700,0.300,1.000]} ~ ~0.7 ~ 0.3 0.3 0.3 0.02 3 normal

# ускорение полета вперед
execute unless predicate ste_cos:enchantment/vortex_2 unless block ^ ^ ^0.2 #minecraft:sword_efficient unless block ^ ^1.6 ^0.2 #minecraft:sword_efficient run tp @s ^ ^ ^0.2
execute if predicate ste_cos:enchantment/vortex_2 unless block ^ ^ ^0.35 #minecraft:sword_efficient unless block ^ ^1.6 ^0.35 #minecraft:sword_efficient run tp @s ^ ^ ^0.35
