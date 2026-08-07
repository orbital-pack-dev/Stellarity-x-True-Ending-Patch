# =====================================================================
# ste_te_patch:mechanics/mirror_clones
# =====================================================================

execute run scoreboard players add @s ste_te_m10 5
execute if score @s ste_te_m10 matches 800.. run scoreboard players set @s ste_te_m10 0

# HP < 40%
execute store result score @s temp_health run data get entity @s Health 1
execute if score @s temp_health matches ..409 if score @s ste_te_m10 matches 0 unless entity @e[type=ender_dragon,tag=ste_mirror_clone_1] run function ste_te_patch:mechanics/mirror_clones_spawn

# --- Подхват поражения клона (клон убит → все в Triple Dive) ---
# Проверяем HP клонов; если любой клон получил 0 HP — mirror_clones_hit
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_mirror_clone_1] if data entity @s {Health:0.0f} run function ste_te_patch:mechanics/mirror_clones_hit
execute in minecraft:the_end as @e[type=ender_dragon,tag=ste_mirror_clone_2] if data entity @s {Health:0.0f} run function ste_te_patch:mechanics/mirror_clones_hit
