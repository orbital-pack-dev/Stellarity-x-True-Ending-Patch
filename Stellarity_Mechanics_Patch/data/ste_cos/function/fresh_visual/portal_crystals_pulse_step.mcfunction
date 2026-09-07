# ste_cos:fresh_visual/portal_crystals_pulse_step
# шаг волны

tp @s ^ ^ ^5.0

# частицы волны
particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a
particle flash{color:[0.95,0.35,1.0,1.0]} ~ ~ ~ 0 0 0 0 1 force @a
particle dust_color_transition{from_color:[0.95,0.3,1.0],scale:2.5,to_color:[0.2,0.0,0.5]} ~ ~ ~ 1 0.5 1 0.05 4 force @a
particle dragon_breath ~ ~ ~ 1 0.5 1 0.02 3 force @a

# урон
execute as @e[type=!end_crystal,type=!marker,type=!block_display,type=!text_display,type=!item_display,type=!interaction,type=!area_effect_cloud,type=!ender_dragon,type=!armor_stand,distance=..7,tag=!ste_cos.pulse_hit] at @s run function ste_cos:fresh_visual/pulse_damage_entity

# удаление маркера
execute positioned 0 65 0 unless entity @s[distance=..200] run kill @s
