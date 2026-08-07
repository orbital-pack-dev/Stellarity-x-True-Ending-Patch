# =====================================================================
# OVERRIDE: true_ending:boss/dive/decoy_enderdragon_summon
# Оригинальный скрипт использовал spreadplayers, который мог фейлиться
# на нестандартном террейне Stellarity.
#
# BUG FIX #3 - ФИКС КОПИЙ ДРАКОНА:
# Мы спавним копии на относительных координатах.
# Первая копия (bosstime 1020) спавнится справа-сзади,
# Вторая копия (bosstime 1050) спавнится слева-сзади.
# =====================================================================

execute if score @s trueEnding_bosstime matches 1020 run summon ender_dragon ~10 ~-2 ~10 {Tags:["trueEnding_mirrordragon"],NoAI:0b,Silent:1b,Invulnerable:1b}
execute if score @s trueEnding_bosstime matches 1050 run summon ender_dragon ~-10 ~-2 ~-10 {Tags:["trueEnding_mirrordragon"],NoAI:0b,Silent:1b,Invulnerable:1b}
