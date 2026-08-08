# =====================================================================
# OVERRIDE: true_ending:boss/dive/decoy_enderdragon_summon (Косметический Патч)
#
# ФИКС Тройного-Нырка (копии дракона):
#   - Копия спавнится ВЫСОКО (на ~128 выше дракона, как оригинал) — чтобы не
#     появиться внутри башни/блока и не умереть от suffocation за 1 тик.
#   - NoAI:1b — vanilla ИИ выключен, чтобы второй дракон не конфликтовал
#     (иначе vanilla-механизм деспавнит второго "настоящего" дракона).
#     Копию ведёт ТОЛЬКО TE через true_ending:boss/dive/decoy_enderdragon.
#   - Теги: trueEnding_mirrordragon (TE ведёт её), без temp (упрощение).
#
#   @s = сам дракон (вызван из dive/phase, AS дракона AT дракона).
#   Вызывается при bosstime 1020 и 1050 (2 копии, правая и левая).
# =====================================================================

# Первая копия (bosstime 1020) — справа, высоко
execute if score @s trueEnding_bosstime matches 1020 run summon ender_dragon ~12 ~128 ~10 {Tags:["trueEnding_mirrordragon","temp","stellarity.ender_dragon","stellarity.dragon.invulnerable","smithed.entity"],NoAI:1b,Silent:1b,Invulnerable:1b}

# Вторая копия (bosstime 1050) — слева, высоко
execute if score @s trueEnding_bosstime matches 1050 run summon ender_dragon ~-12 ~128 ~10 {Tags:["trueEnding_mirrordragon","temp","stellarity.ender_dragon","stellarity.dragon.invulnerable","smithed.entity"],NoAI:1b,Silent:1b,Invulnerable:1b}
