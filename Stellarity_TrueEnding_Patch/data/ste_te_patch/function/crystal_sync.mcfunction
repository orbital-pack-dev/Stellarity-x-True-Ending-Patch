# =====================================================================
# BRIDGE 2 (UPDATED): crystal_sync.mcfunction
# Синхронизация кристаллов и принудительный щит при живых кристаллах.
#
# ИСТОЧНИК СЧЁТЧИКА (Stellarity):
#   - scoreboard #crystal_count stellarity.misc
#     (сбрасывается в 0 каждый тик, затем каждый кристалл с ShowBottom:1b добавляет +1)
#   - Stellarity сам управляет Invulnerable:1b через invulnerability/apply
#     и Invulnerable:0b через invulnerability/remove.
#
# БАГ 1 - ЖЁСТКИЙ ЩИТ:
#   True Ending в a_main строка 57-58 может снять бессмертие
#   (если bosstime < 3000 и trueEnding_health_percent < 100).
#   Пока кристаллы живы, мы принудительно ВОССТАНАВЛИВАЕМ бессмертие,
#   перебивая попытку TE снять его.
#   Флаг ste_te_crystals_gone отсутствует → кристаллы ЖИВЫ.
# =====================================================================

# ---------- СИНХРОНИЗАЦИЯ СЧЁТЧИКА ----------
# Зеркалим счётчик кристаллов Stellarity → True Ending
# (TE использует crystals_left trueEnding_storage для своей логики crystal_count)
execute if score #crystal_count stellarity.misc matches 0.. run scoreboard players operation crystals_left trueEnding_storage = #crystal_count stellarity.misc

# ---------- ПРИНУДИТЕЛЬНЫЙ ЩИТ (BUG FIX #1) ----------
# Пока флаг ste_te_crystals_gone НЕ установлен (кристаллы живы):
# → принудительно держим Invulnerable:1b и тег stellarity.dragon.invulnerable
# → это перебивает любые попытки TE или ванили снять щит досрочно
execute in the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=!trueEnding_mirrordragon,tag=!ste_te_crystals_gone] run data modify entity @s Invulnerable set value 1b
execute in the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=!trueEnding_mirrordragon,tag=!ste_te_crystals_gone,tag=!stellarity.dragon.invulnerable] run tag @s add stellarity.dragon.invulnerable

# ЖЕСТКАЯ НЕУЯЗВИМОСТЬ: Резистанс 255 и хил до максимума
execute in the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=!trueEnding_mirrordragon,tag=!ste_te_crystals_gone] run effect give @s resistance 5 255 true
execute in the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=!trueEnding_mirrordragon,tag=!ste_te_crystals_gone] run data merge entity @s {Health:1024f}

# ---------- СИГНАЛ СБРОСА ЩИТА (при первом обнулении кристаллов) ----------
# Если Stellarity видит 0 кристаллов И флаг ещё не взведён → выполняем переход
execute in the_end positioned 0 65 0 if entity @p[distance=..128] if score #crystal_count stellarity.misc matches 0 as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!trueEnding_mirrordragon,tag=!ste_te_crystals_gone] at @s run function ste_te_patch:crystal_shield_drop
