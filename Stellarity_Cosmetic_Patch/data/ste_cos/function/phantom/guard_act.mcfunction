# =====================================================================
# ste_cos:phantom/guard_act
# Управляет конкретным фантомом через маркер.
# =====================================================================

# Сохраняем ID текущего маркера в #current_id
scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# Всегда отключаем ванильный ИИ и крутим по орбите
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags run data modify entity @s NoAI set value 1b
execute run function ste_cos:phantom/orbit_guard

# Спавним частицы-хвост и ареа-эффект (урон) для фантома в любом состоянии
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle soul_fire_flame ~ ~0.5 ~ 0.2 0.2 0.2 0.01 5 force
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s run particle dragon_breath ~ ~0.5 ~ 1.5 1.5 1.5 0.01 10 force

# Прямой урон и иссушение игрокам в радиусе 4 блоков
execute as @e[type=phantom,tag=ste_cos_guard,distance=..64] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run damage @s 2 minecraft:magic
