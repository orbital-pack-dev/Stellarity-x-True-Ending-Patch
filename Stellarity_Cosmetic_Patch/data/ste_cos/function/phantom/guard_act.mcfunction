# Контекст: AS маркер, AT маркера.
# Управляет фантомом: орбита + частицы + урон.

scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# Орбита - вызываем отдельную функцию (AS маркер)
function ste_cos:phantom/orbit_guard

# Частицы-хвост от фантома
execute as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle soul_fire_flame ~ ~0.5 ~ 0.2 0.2 0.2 0.01 5 force
execute as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle dragon_breath ~ ~0.5 ~ 1.5 1.5 1.5 0.01 10 force

# Урон игрокам в радиусе 4 блоков от фантома
execute as @e[type=phantom,tag=ste_cos_guard,distance=..300] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run damage @s 2 minecraft:magic