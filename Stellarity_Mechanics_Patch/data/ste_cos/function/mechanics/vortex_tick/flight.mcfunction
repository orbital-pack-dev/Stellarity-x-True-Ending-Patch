# Вихрь — полёт

execute if score @s ste_cos.was_flying matches 0 run function ste_cos:mechanics/vortex_tick/takeoff

# Гравитация
attribute @s minecraft:gravity base set 0.07

# Таймер (для расширяющихся колец первые 3 «кольца»)
scoreboard players add @s ste_cos.timer 1

# === Расширяющиеся кольца (тики 1-12 после взлёта) ===
# Кольцо 1 (r=1.5), тики 1-4
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~1.5 ~0.2 ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~-1.5 ~0.2 ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~ ~0.2 ~1.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~ ~0.2 ~-1.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~1.1 ~0.2 ~1.1 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~1.1 ~0.2 ~-1.1 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~-1.1 ~0.2 ~1.1 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 1..4 run particle minecraft:end_rod ~-1.1 ~0.2 ~-1.1 0 0 0 0 2 force

# Кольцо 2 (r=2.5), тики 5-8
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~2.5 ~0.1 ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~-2.5 ~0.1 ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~ ~0.1 ~2.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~ ~0.1 ~-2.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~1.8 ~0.1 ~1.8 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~1.8 ~0.1 ~-1.8 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~-1.8 ~0.1 ~1.8 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 5..8 run particle minecraft:end_rod ~-1.8 ~0.1 ~-1.8 0 0 0 0 2 force

# Кольцо 3 (r=3.5), тики 9-12
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~3.5 ~ ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~-3.5 ~ ~ 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~ ~ ~3.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~ ~ ~-3.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~2.5 ~ ~2.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~2.5 ~ ~-2.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~-2.5 ~ ~2.5 0 0 0 0 2 force
execute if score @s ste_cos.timer matches 9..12 run particle minecraft:end_rod ~-2.5 ~ ~-2.5 0 0 0 0 2 force

# === Обычный шлейф (после 12-го тика) ===
# Уровень 1: белый ветер — спавним по 2 end_rod чуть сзади
execute if score @s ste_cos.timer matches 13.. unless predicate ste_cos:enchantment/vortex_2 run particle minecraft:end_rod ~ ~0.5 ~ 0.25 0.25 0.25 0.02 3 normal

# Уровень 2: фиолетовый вихрь — дракон-дыхание + dust переход
execute if score @s ste_cos.timer matches 13.. if predicate ste_cos:enchantment/vortex_2 run particle minecraft:dragon_breath ~ ~0.7 ~ 0.3 0.3 0.3 0.05 4 normal
execute if score @s ste_cos.timer matches 13.. if predicate ste_cos:enchantment/vortex_2 run particle minecraft:dust_color_transition{from_color:[0.400,0.000,1.000],scale:1,to_color:[0.700,0.300,1.000]} ~ ~0.7 ~ 0.3 0.3 0.3 0.02 3 normal

# Микро-ТП каждый тик с проверкой коллизии (голова + ноги)
# Уровень 1: ^0.2/тик
execute unless predicate ste_cos:enchantment/vortex_2 unless block ^ ^ ^0.2 #minecraft:sword_efficient unless block ^ ^1.6 ^0.2 #minecraft:sword_efficient run tp @s ^ ^ ^0.2

# Уровень 2: ^0.35/тик
execute if predicate ste_cos:enchantment/vortex_2 unless block ^ ^ ^0.35 #minecraft:sword_efficient unless block ^ ^1.6 ^0.35 #minecraft:sword_efficient run tp @s ^ ^ ^0.35
