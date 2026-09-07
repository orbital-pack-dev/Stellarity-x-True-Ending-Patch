# ste_cos:fresh_visual/portal_crystals_pulse_step
# шаг волны

# движение вперед
tp @s ^ ^ ^4.5

# частицы волны
particle sonic_boom ~ ~ ~ 0 0 0 0 1 force @a
particle flash{color:[0.95,0.35,1.0,1.0]} ~ ~ ~ 0 0 0 0 1 force @a
particle dust_color_transition{from_color:[0.95,0.3,1.0],scale:2.5,to_color:[0.2,0.0,0.5]} ~ ~ ~ 0.6 0.4 0.6 0.05 3 force @a
particle dragon_breath ~ ~ ~ 0.5 0.3 0.5 0.02 2 force @a

# урон сущностям (3.5 ед. магии)
execute as @e[type=!player,type=!end_crystal,type=!marker,type=!block_display,type=!text_display,type=!item_display,type=!interaction,type=!area_effect_cloud,type=!ender_dragon,type=!phantom,type=!armor_stand,tag=!smithed.strict,tag=!stellarity.marker,tag=!ste_cos.visual_marker,tag=!ste_cos.pulse_hit,distance=..7] at @s run function ste_cos:fresh_visual/pulse_damage_entity
execute as @a[gamemode=!creative,gamemode=!spectator,tag=!ste_cos.pulse_hit,distance=..7] at @s run function ste_cos:fresh_visual/pulse_damage_entity

# удаление маркера
execute positioned 0 65 0 unless entity @s[distance=..210] run kill @s
