# =====================================================================
# ste_te_patch:mechanics/mirror_clones
# Зеркальные клоны при 25% HP.
# Вызывается in minecraft:the_end из main_tick на тике 50.
# =====================================================================

# Триггер (только 1 раз) при 25% HP
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.dragon,tag=!ste_te_mirror_done] if score @s trueEnding_health_percent matches ..250 at @s run function ste_te_patch:mechanics/mirror_clones_spawn

# Клон получил 0 HP → все в Triple Dive
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_mirror_clone_1] if data entity @s {Health:0.0f} run function ste_te_patch:mechanics/mirror_clones_hit
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_mirror_clone_2] if data entity @s {Health:0.0f} run function ste_te_patch:mechanics/mirror_clones_hit
