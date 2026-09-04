# stellarity:entity/dragon/crystal/loop
# цикл кристалла края и аура

scoreboard players add #crystal_count stellarity.misc 1

execute unless entity @s[tag=stellarity.end_crystal.init] run function stellarity:entity/dragon/crystal/init

# аура кристаллов строго каждую секунду (раз в 20 тиков), без спама каждый тик
scoreboard players add @s ste_cos.aura_tick 1
execute if score @s ste_cos.aura_tick matches 20.. run scoreboard players set @s ste_cos.aura_tick 0
execute if score @s ste_cos.aura_tick matches 0 run function ste_cos:fresh_visual/crystal_aura

# периодическое лечение дракона от кристаллов
scoreboard players add @s ste_cos.timer 1
execute if score @s ste_cos.timer matches 20.. as @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..48] run function ste_cos:mechanics/crystal_heal
execute if score @s ste_cos.timer matches 20.. run scoreboard players set @s ste_cos.timer 0
