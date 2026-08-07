# =====================================================================
# BRIDGE (UPDATED): win_sync.mcfunction
# BUG FIX #4 — Склейка эпичной смерти.
#
# ЦЕПОЧКА СОБЫТИЙ:
#
#   ШАГ 1 — TE ФИНАЛЬНЫЙ УДАР (фаза Totem, bosstime 3000–3999):
#     Дракон садится на алтарь, рычит, бьёт ударной волной (bosstime 3081).
#     Это уже работает через true_ending:boss/phase_totem.
#     После bosstime 3101 → loop обратно на 3080 (ждёт хитов).
#     При получении урона (потеря тотема) → bosstime сбрасывается в 3000+ снова
#     ИЛИ TE переходит к следующей фазе.
#
#   ШАГ 2 — ПЕРЕХОД К STELLARITY КАТСЦЕНЕ (при HP ≤ 0):
#     Когда здоровье Дракона падает до 0:
#     - Снимаем принудительное бессмертие TE
#     - Даём Stellarity вести смерть: fly_to_portal → at_portal_loop → finish
#     - Это работает ЧЕРЕЗ уже существующий stellarity:entity/dragon/main (наша версия)
#       который проверяет stellarity.dragon.health 0..1 и вызывает death/fly_to_portal.
#
#   ДОПОЛНИТЕЛЬНО — КУЛЬМИНАЦИЯ (bosstime 3081 + low HP):
#     Если дракон в totem-фазе (bosstime 3080..3101) И HP ≤ 5%:
#     → Добавляем усиленные частицы и звуки для драматичности кульминации.
# =====================================================================

# ---------- ОЧИСТКА АРЕНЫ при смерти (основной триггер) ----------
# Дракон летит умирать (получил тег stellarity.at_portal) → чистим TE арену
execute in the_end as @e[type=ender_dragon,tag=stellarity.at_portal,tag=!ste_te_death_cleanup_done] at @s run function ste_te_patch:death_cleanup

# ---------- BUG FIX #4: УЛЬТИМЕЙТ ФЕЙЕРВЕРКОВ НА 50% HP ----------
# При первом достижении <= 50% HP (trueEnding_health_percent <= 500)
# принудительно переключаем на фазу Laser (2001)
execute in the_end as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!trueEnding_mirrordragon,tag=!ste_te_50_percent_triggered] if score $crystals_gone ste_te_flags matches 1 if score @s trueEnding_health_percent matches ..500 run scoreboard players set @s trueEnding_bosstime 2001
execute in the_end as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!trueEnding_mirrordragon,tag=!ste_te_50_percent_triggered] if score $crystals_gone ste_te_flags matches 1 if score @s trueEnding_health_percent matches ..500 run tag @s add ste_te_50_percent_triggered

# ---------- BUG FIX #5 (Part 1): КУЛЬМИНАЦИОННЫЙ МОМЕНТ ----------
# Когда TE в finalhit фазе (bosstime 3081) И HP ≤ 5% (≤50/1000) → КУЛЬМИНАЦИЯ
# Форсируем Stellarity начать death sequence немедленно (не ждать HP==0)
execute in the_end as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!trueEnding_mirrordragon] if score $crystals_gone ste_te_flags matches 1 if score @s trueEnding_bosstime matches 3081..3101 if score @s trueEnding_health_percent matches ..50 at @s run function ste_te_patch:fused_death_trigger

# ---------- FALLBACK: Если дракон умер без прохода через totem (инстакил, читы) ----------
execute in the_end as @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=!trueEnding_mirrordragon] if score @s stellarity.dragon.health matches 0..1 unless entity @s[tag=stellarity.at_portal] unless entity @s[tag=stellarity.to_portal] at @s run function stellarity:entity/dragon/death/fly_to_portal
