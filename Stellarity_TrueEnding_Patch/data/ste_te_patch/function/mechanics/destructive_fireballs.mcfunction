# =====================================================================
# ste_te_patch:mechanics/destructive_fireballs
# Все вновь спавнящиеся fireball в the_end получают ExplosionPower:3b.
# Вызывается in minecraft:the_end из main_tick на тике 10.
# =====================================================================

execute in minecraft:the_end as @e[type=fireball,tag=!ste_te_destructive] run tag @s add ste_te_destructive
execute in minecraft:the_end as @e[type=fireball,tag=ste_te_destructive] run data merge entity @s {ExplosionPower:3b,power:[0.0,-1.0,0.0]}
