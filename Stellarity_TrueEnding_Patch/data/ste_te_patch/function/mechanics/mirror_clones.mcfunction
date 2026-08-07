# =====================================================================
# ste_te_patch:mechanics/mirror_clones
# Зеркальные клоны при 25% HP.
# =====================================================================

# Триггер (только 1 раз)
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!ste_te_mirror_done] if score @s trueEnding_health_percent matches ..250 run function ste_te_patch:mechanics/mirror_clones_spawn

# Поддержание: если клон получил урон (HP < 200 из 200) → переход в dive
execute as @e[type=ender_dragon,tag=ste_mirror_clone_1] if data entity @s {Health:0.0f} run function ste_te_patch:mechanics/mirror_clones_hit
execute as @e[type=ender_dragon,tag=ste_mirror_clone_2] if data entity @s {Health:0.0f} run function ste_te_patch:mechanics/mirror_clones_hit
