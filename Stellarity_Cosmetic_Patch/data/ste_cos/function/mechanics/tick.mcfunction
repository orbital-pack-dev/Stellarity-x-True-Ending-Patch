# =====================================================================
# ste_cos:mechanics/tick
# Главный тикер всех боевых механик. Вызывается из main_tick
# ТОЛЬКО внутри измерения the_end (execute in minecraft:the_end run ...).
# =====================================================================

# Mech.1 — Vortex (only in the End, during battle, 400 block radius)
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s as @a[distance=..400,gamemode=survival] run function ste_cos:mechanics/still_check
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s as @a[distance=..400,gamemode=adventure] run function ste_cos:mechanics/still_check

# Mech.1 — Remove active vortex if battle ended
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=area_effect_cloud,tag=ste_cos_vortex]

# Mech.1 — Execute vortex tick
execute if entity @e[type=area_effect_cloud,tag=ste_cos_vortex,limit=1] as @e[type=area_effect_cloud,tag=ste_cos_vortex] at @s run function ste_cos:mechanics/vortex_tick

# Mech.2 — Disable Elytra during battle
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:mechanics/elytra_disable

# Mech.3 — Player damage nerf (Weakness I)
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s run effect give @a[distance=..400,gamemode=survival] weakness 2 0 true

# Mech.3b — Player Strength buff (Strength I)
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s run effect give @a[distance=..400,gamemode=survival] strength 2 0 true

# Mech.4 — Portal danger zone (spawn dragon breath at portal when dragon is far)
execute if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run function ste_cos:mechanics/portal_danger

# Mech.4 — Tick portal wave if it exists
execute as @e[type=area_effect_cloud,tag=ste_cos_portal_wave] at @s run function ste_cos:mechanics/portal_wave_tick

# Mech.4 — Clear waves if dragon is dead
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run scoreboard players set #wave_timer ste_cos.flags 0
execute unless entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run kill @e[type=area_effect_cloud,tag=ste_cos_portal_wave]
