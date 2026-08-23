# =====================================================================
# ste_cos:phantom/cleanup_current
# AS marker AT маркера. Кристалл-хозяин умер → убить фантома и маркер.
# =====================================================================

scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id
execute at @s as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run kill @s
kill @s
