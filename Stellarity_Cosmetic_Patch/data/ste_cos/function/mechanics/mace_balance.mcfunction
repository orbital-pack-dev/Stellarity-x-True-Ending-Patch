# =====================================================================
# ste_cos:mechanics/mace_balance
# Вызывается если дракон жив. Нерфит Булаву: в радиусе дракона
# снижает урон и накладывает медлительность 2 + слабость 1.
# Снимаем нерф с игроков, которые убрали булаву из рук или вышли из радиуса Дракона (хотя если вышли, просто проверяем булаву, этого достаточно)
# Но лучше снимать нерф просто если нет булавы в руках
execute as @a[tag=ste_cos.mace_nerfed] unless data entity @s SelectedItem{id:"minecraft:mace"} run function ste_cos:mechanics/mace_nerf_disable

# Накладываем нерф на тех, кто держит булаву и находится рядом с Драконом
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon] at @s as @a[distance=..50,gamemode=!spectator,gamemode=!creative,tag=!ste_cos.mace_nerfed] if data entity @s SelectedItem{id:"minecraft:mace"} run function ste_cos:mechanics/mace_nerf
