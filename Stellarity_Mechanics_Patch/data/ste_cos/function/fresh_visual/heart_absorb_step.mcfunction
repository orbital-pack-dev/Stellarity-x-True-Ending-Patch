# ste_cos:fresh_visual/heart_absorb_step
# шаг плавного втягивания Сердца и рукавов частиц в тело Дракона

# плавное движение маркера к дракону
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] facing entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] eyes run tp @s ^ ^ ^0.85

# струя фиолетовых частиц и искр, всасывающихся в дракона
particle dust_color_transition{from_color:[0.9,0.2,1.0],scale:2.4,to_color:[0.15,0.0,0.4]} ~ ~ ~ 0.25 0.25 0.25 0.05 10 force @a
particle reverse_portal ~ ~ ~ 0.4 0.4 0.4 0.15 12 force @a
particle electric_spark ~ ~ ~ 0.2 0.2 0.2 0.08 5 force @a

execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..4.0,limit=1] run particle flash{color:-4980481} ~ ~ ~ 0 0 0 0 1 force @a
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..4.0,limit=1] run playsound entity.warden.heartbeat hostile @a ~ ~ ~ 48.0 0.65
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..4.0,limit=1] run playsound block.amethyst_block.resonate hostile @a ~ ~ ~ 48.0 0.55
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..4.0,limit=1] run kill @s

# тайм-аут завершения
execute if score #absorb_time ste_cos.timer matches 160.. run kill @s
