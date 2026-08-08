# =====================================================================
# ste_cos:phantom/cleanup_current
# AS marker AT маркера. Кристалл-хозяин умер → убить фантома и маркер.
# =====================================================================

execute at @s run kill @e[type=phantom,tag=ste_cos_guard,distance=..8,limit=1]
kill @s
