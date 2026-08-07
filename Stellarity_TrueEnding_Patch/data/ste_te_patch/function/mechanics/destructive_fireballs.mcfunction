# =====================================================================
# ste_te_patch:mechanics/destructive_fireballs
# Все вновь спавнящиеся fireball в the_end получают ExplosionPower:3b.
# =====================================================================

# Добавляем тег te_fireball тем фаерболам, которые спавним сами,
# но если мы хотим затрагивать только их, то мы уже пишем Tags:["te_fireball"] при их создании.
# Поэтому тут проверяем только te_fireball.

execute as @e[type=fireball,tag=te_fireball,tag=!ste_te_destructive] run data modify entity @s ExplosionPower set value 3b
execute as @e[type=fireball,tag=te_fireball,tag=!ste_te_destructive] run tag @s add ste_te_destructive
