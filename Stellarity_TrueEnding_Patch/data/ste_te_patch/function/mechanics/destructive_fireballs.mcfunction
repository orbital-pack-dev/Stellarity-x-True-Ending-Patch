# =====================================================================
# ste_te_patch:mechanics/destructive_fireballs
# Все вновь спавнящиеся fireball получают ExplosionPower:3b.
# Вызывается из main_tick на тике 10.
# =====================================================================

# Ищем fireball без нашего тега
execute as @e[type=fireball,tag=!ste_te_destructive] run tag @s add ste_te_destructive
execute as @e[type=fireball,tag=ste_te_destructive] run data merge entity @s {ExplosionPower:3b}
