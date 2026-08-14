# =====================================================================
# ste_cos:mechanics/mace_balance
# Вызывается если дракон жив. Нерфит Булаву: в радиусе дракона
# снижает урон и накладывает медлительность 2 + слабость 1.
# =====================================================================

# Сбрасываем атрибут всем кто был понерфлен
execute as @a[tag=ste_cos.mace_nerfed] run attribute @s attack_damage base set 1.0
tag @a remove ste_cos.mace_nerfed

# Игроки держащие Булаву в радиусе 50 от дракона получают нерф
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon] at @s as @a[distance=..50,gamemode=!spectator,gamemode=!creative] if data entity @s SelectedItem{id:"minecraft:mace"} run function ste_cos:mechanics/mace_nerf
