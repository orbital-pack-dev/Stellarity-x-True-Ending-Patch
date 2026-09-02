# ste_cos:phantom/orbit_guard
# Фантомы-стражи

# Механика боя
scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# Механика боя
tp @s ~ ~ ~ ~2 ~

# Фантомы-стражи

execute if score @s ste_cos.radius matches 4 if score @s ste_cos.orbit_y matches 5 at @s rotated as @s positioned ~ ~0.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^4
execute if score @s ste_cos.radius matches 4 if score @s ste_cos.orbit_y matches 10 at @s rotated as @s positioned ~ ~1.0 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^4
execute if score @s ste_cos.radius matches 4 if score @s ste_cos.orbit_y matches 15 at @s rotated as @s positioned ~ ~1.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^4
execute if score @s ste_cos.radius matches 4 if score @s ste_cos.orbit_y matches 25 at @s rotated as @s positioned ~ ~2.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^4
execute if score @s ste_cos.radius matches 4 if score @s ste_cos.orbit_y matches 35 at @s rotated as @s positioned ~ ~3.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^4
execute if score @s ste_cos.radius matches 5 if score @s ste_cos.orbit_y matches 5 at @s rotated as @s positioned ~ ~0.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^5
execute if score @s ste_cos.radius matches 5 if score @s ste_cos.orbit_y matches 10 at @s rotated as @s positioned ~ ~1.0 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^5
execute if score @s ste_cos.radius matches 5 if score @s ste_cos.orbit_y matches 15 at @s rotated as @s positioned ~ ~1.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^5
execute if score @s ste_cos.radius matches 5 if score @s ste_cos.orbit_y matches 25 at @s rotated as @s positioned ~ ~2.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^5
execute if score @s ste_cos.radius matches 5 if score @s ste_cos.orbit_y matches 35 at @s rotated as @s positioned ~ ~3.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^5
execute if score @s ste_cos.radius matches 6 if score @s ste_cos.orbit_y matches 5 at @s rotated as @s positioned ~ ~0.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^6
execute if score @s ste_cos.radius matches 6 if score @s ste_cos.orbit_y matches 10 at @s rotated as @s positioned ~ ~1.0 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^6
execute if score @s ste_cos.radius matches 6 if score @s ste_cos.orbit_y matches 15 at @s rotated as @s positioned ~ ~1.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^6
execute if score @s ste_cos.radius matches 6 if score @s ste_cos.orbit_y matches 25 at @s rotated as @s positioned ~ ~2.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^6
execute if score @s ste_cos.radius matches 6 if score @s ste_cos.orbit_y matches 35 at @s rotated as @s positioned ~ ~3.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^6
execute if score @s ste_cos.radius matches 7 if score @s ste_cos.orbit_y matches 5 at @s rotated as @s positioned ~ ~0.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^7
execute if score @s ste_cos.radius matches 7 if score @s ste_cos.orbit_y matches 10 at @s rotated as @s positioned ~ ~1.0 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^7
execute if score @s ste_cos.radius matches 7 if score @s ste_cos.orbit_y matches 15 at @s rotated as @s positioned ~ ~1.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^7
execute if score @s ste_cos.radius matches 7 if score @s ste_cos.orbit_y matches 25 at @s rotated as @s positioned ~ ~2.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^7
execute if score @s ste_cos.radius matches 7 if score @s ste_cos.orbit_y matches 35 at @s rotated as @s positioned ~ ~3.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^7
execute if score @s ste_cos.radius matches 8 if score @s ste_cos.orbit_y matches 5 at @s rotated as @s positioned ~ ~0.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^8
execute if score @s ste_cos.radius matches 8 if score @s ste_cos.orbit_y matches 10 at @s rotated as @s positioned ~ ~1.0 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^8
execute if score @s ste_cos.radius matches 8 if score @s ste_cos.orbit_y matches 15 at @s rotated as @s positioned ~ ~1.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^8
execute if score @s ste_cos.radius matches 8 if score @s ste_cos.orbit_y matches 25 at @s rotated as @s positioned ~ ~2.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^8
execute if score @s ste_cos.radius matches 8 if score @s ste_cos.orbit_y matches 35 at @s rotated as @s positioned ~ ~3.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^8

# Механика боя
execute if score @s ste_cos.orbit_y matches 0 at @s rotated as @s positioned ~ ~1.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run tp @s ^ ^ ^7

# Механика боя
execute at @s positioned ~ ~1.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run tp @s ~ ~ ~ facing ^ ^ ^-1
