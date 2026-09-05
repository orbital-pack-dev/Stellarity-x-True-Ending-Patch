# ste_cos:crystal/shielded_crystal_tick
# тиковый цикл защищенного кристалла

# 1. Защита от снарядов (отражение трезубцев, уничтожение остальных)
function ste_cos:crystal/shielded_crystal_deflect

# 2. Накопление заряда лазера (цикл ~100 тиков = 5 секунд)
scoreboard players add @s ste_cos.laser_timer 1

# звук и частицы зарядки за 1.5 секунды до выстрела
execute if score @s ste_cos.laser_timer matches 70 80 90 run playsound block.respawn_anchor.charge hostile @a ~ ~1.8 ~ 16.0 0.9
execute if score @s ste_cos.laser_timer matches 70..99 run particle dust_color_transition{from_color:[0.3,0.9,1.0],scale:1.4,to_color:[0.85,0.1,1.0]} ~ ~1.8 ~ 0.2 0.2 0.2 0.05 2 force

# выстрел при готовности заряда (если рядом в 48 блоках есть игрок)
execute if score @s ste_cos.laser_timer matches 100.. if entity @p[distance=..48,gamemode=!creative,gamemode=!spectator] run function ste_cos:crystal/shielded_crystal_fire
execute if score @s ste_cos.laser_timer matches 100.. run scoreboard players set @s ste_cos.laser_timer 0
