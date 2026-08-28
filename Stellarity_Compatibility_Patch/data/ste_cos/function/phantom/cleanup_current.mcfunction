# ste_cos:phantom/cleanup_current
# Фикс кристаллов

scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id
execute at @s as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run kill @s
kill @s
