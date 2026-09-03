# ste_cos:phantom/guard_act
# поведение фантома возле кристалла

scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# полет по круговой орбите
function ste_cos:phantom/orbit_guard

# частицы кристаллов Stellarity на страже
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle soul_fire_flame ~ ~0.2 ~ 0.3 0.2 0.3 0.02 3 normal
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle dragon_breath ~ ~0.2 ~ 0.3 0.2 0.3 0.01 3 normal
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle portal ~ ~0.2 ~ 0.3 0.2 0.3 0.05 4 normal

# наложение эффектов при приближении игрока (без взрыва)
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run effect give @s darkness 4 0 true
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run effect give @s slowness 4 1 true
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..3,gamemode=!spectator,gamemode=!creative] run damage @s 2 minecraft:magic
