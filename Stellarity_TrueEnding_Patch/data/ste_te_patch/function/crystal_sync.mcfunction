# =====================================================================
# ste_te_patch:crystal_sync (v2.2 Bug Fixes)
# =====================================================================

# ---------- СИНХРОНИЗАЦИЯ СЧЁТЧИКА ----------
execute if score #crystal_count stellarity.misc matches 0.. run scoreboard players operation crystals_left trueEnding_storage = #crystal_count stellarity.misc

# Синхронизация $crystals_gone из счётчика Stellarity (#crystal_count)
#   #crystal_count >= 1  → кристаллы ЖИВЫ   → $crystals_gone = 0
#   #crystal_count  == 0 → все разрушены     → $crystals_gone = 1
execute if score #crystal_count stellarity.misc matches 1.. run scoreboard players set $crystals_gone ste_te_flags 0
execute unless score #crystal_count stellarity.misc matches 1.. run scoreboard players set $crystals_gone ste_te_flags 1

# ---------- ПРИНУДИТЕЛЬНЫЙ ЩИТ ----------
# Пока флаг $crystals_gone = 0 (кристаллы живы):
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] if score $crystals_gone ste_te_flags matches 0 run data modify entity @s Invulnerable set value 1b
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,tag=!stellarity.dragon.invulnerable] if score $crystals_gone ste_te_flags matches 0 run tag @s add stellarity.dragon.invulnerable

# ЖЕСТКАЯ НЕУЯЗВИМОСТЬ: Резистанс 255 и хил до максимума
# BUG FIX 3.3: Skip healing if Last Stand ($dead == 1) is active
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] if score $crystals_gone ste_te_flags matches 0 if score $dead ste_te_flags matches 0 run effect give @s resistance 5 255 true
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] if score $crystals_gone ste_te_flags matches 0 if score $dead ste_te_flags matches 0 run execute store result entity @s Health float 1 run attribute @s minecraft:generic.max_health get

# ---------- СИГНАЛ СБРОСА ЩИТА (одноразовый через $shield_dropped) ----------
execute in minecraft:the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] at @s if score $crystals_gone ste_te_flags matches 1 if score $shield_dropped ste_te_flags matches 0 run function ste_te_patch:crystal_shield_drop
