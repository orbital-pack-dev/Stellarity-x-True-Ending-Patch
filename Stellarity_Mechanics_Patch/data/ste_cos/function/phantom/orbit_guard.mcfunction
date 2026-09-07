# ste_cos:phantom/orbit_guard
# орбита стража

scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# поворот центра
tp @s ~ ~ ~ ~3 0

# позиция фантома
execute at @s positioned ~ ~1.5 ~ as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags unless entity @a[distance=..24,gamemode=!creative,gamemode=!spectator] run tp @s ^ ^ ^7

# поворот фантома
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags unless entity @a[distance=..24,gamemode=!creative,gamemode=!spectator] at @s facing entity @e[type=area_effect_cloud,tag=ste_cos_guard_marker,distance=..16,limit=1] feet run tp @s ~ ~ ~ ~-90 0
