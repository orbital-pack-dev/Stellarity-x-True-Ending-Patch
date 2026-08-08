# =====================================================================
# ste_cos:egg/egg_glow
# AT маркера (стоящего на блоке яйца). Частицы вокруг яйца-блока.
# =====================================================================

execute at @s run particle minecraft:dust_color_transition{from_color:[0.50,0.00,0.80],scale:1.2,to_color:[1.00,0.00,1.00]} ~0.5 ~0.5 ~0.5 0.3 0.3 0.3 0 10 force
execute at @s run particle minecraft:dust_color_transition{from_color:[1.00,0.00,1.00],scale:0.8,to_color:[0.10,0.00,0.30]} ~0.5 ~0.5 ~0.5 0.4 0.4 0.4 0 5 force
execute at @s run particle minecraft:end_rod ~0.5 ~0.6 ~0.5 0.4 0.4 0.4 0 2 force
execute at @s run particle minecraft:portal ~0.5 ~0.5 ~0.5 0.5 0.5 0.5 0.05 10 force
