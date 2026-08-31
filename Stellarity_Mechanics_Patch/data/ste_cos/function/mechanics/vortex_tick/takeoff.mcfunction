# Вихрь — взлёт

# Взрыв + мгновенное кольцо (радиус ~1)
particle minecraft:explosion ~ ~0.5 ~ 0 0 0 0 1 force
particle minecraft:cloud ~ ~0.5 ~ 0.8 0.1 0.8 0.3 20 force

particle minecraft:end_rod ~1.0 ~0.3 ~ 0 0 0 0 3 force
particle minecraft:end_rod ~-1.0 ~0.3 ~ 0 0 0 0 3 force
particle minecraft:end_rod ~ ~0.3 ~1.0 0 0 0 0 3 force
particle minecraft:end_rod ~ ~0.3 ~-1.0 0 0 0 0 3 force
particle minecraft:end_rod ~0.7 ~0.3 ~0.7 0 0 0 0 3 force
particle minecraft:end_rod ~0.7 ~0.3 ~-0.7 0 0 0 0 3 force
particle minecraft:end_rod ~-0.7 ~0.3 ~0.7 0 0 0 0 3 force
particle minecraft:end_rod ~-0.7 ~0.3 ~-0.7 0 0 0 0 3 force

# Звук
playsound minecraft:entity.ender_dragon.flap player @a[distance=..32] ~ ~ ~ 1.5 1.4

# Фейерверк
execute unless predicate ste_cos:enchantment/vortex_2 run summon firework_rocket ~ ~ ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:3,explosions:[]}}}}
execute if predicate ste_cos:enchantment/vortex_2 run summon firework_rocket ~ ~ ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:3,explosions:[]}}}}
execute if predicate ste_cos:enchantment/vortex_2 run summon firework_rocket ~ ~ ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:3,explosions:[]}}}}

# Буст вверх-вперёд (с проверкой коллизии по пути)
# Уровень 1: ^3 вверх, ^3 вперёд
execute unless predicate ste_cos:enchantment/vortex_2 unless block ^ ^1 ^1 #minecraft:sword_efficient unless block ^ ^3 ^3 #minecraft:sword_efficient run tp @s ^ ^3 ^3

# Уровень 2: мощнее
execute if predicate ste_cos:enchantment/vortex_2 unless block ^ ^1 ^1 #minecraft:sword_efficient unless block ^ ^4 ^5 #minecraft:sword_efficient run tp @s ^ ^4 ^5

# Сброс таймера расширяющихся колец
scoreboard players set @s ste_cos.timer 0
