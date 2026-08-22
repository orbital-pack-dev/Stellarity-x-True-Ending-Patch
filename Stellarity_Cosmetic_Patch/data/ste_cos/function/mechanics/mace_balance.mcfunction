# =====================================================================
# ste_cos:mechanics/mace_balance
# Вызывается каждый тик, если дракон жив. Нерфит Булаву: в радиусе 50 от дракона
# снижает урон (Слабость 5, Медлительность 2) ПОКА ИГРОК ДЕРЖИТ ЕЁ В РУКАХ.
# Эффект длится 2 секунды (обновляется), поэтому если убрать булаву - он быстро спадет сам.
# =====================================================================

# Накладываем Слабость 5 и Медлительность 2
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon] at @s as @a[distance=..50,gamemode=!spectator,gamemode=!creative] if data entity @s SelectedItem{id:"minecraft:mace"} run effect give @s weakness 2 0 true
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon] at @s as @a[distance=..50,gamemode=!spectator,gamemode=!creative] if data entity @s SelectedItem{id:"minecraft:mace"} run effect give @s slowness 2 1 true
