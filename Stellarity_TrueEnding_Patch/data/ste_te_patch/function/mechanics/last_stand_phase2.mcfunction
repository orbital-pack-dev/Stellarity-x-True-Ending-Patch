# =====================================================================
# ste_te_patch:mechanics/last_stand_phase2
# =====================================================================

tag @s add ste_te_death_triggered

# Замораживаем Дракона и готовим к анимации портала (Y=78)
data modify entity @s Motion set value [0.0,0.0,0.0]
data modify entity @s NoAI set value 1b
tp @s ~ 78 ~

# --- Финальный визуальный взрыв ---
execute at @s run particle explosion_emitter ~ ~ ~ 0 0 0 0 3 force
execute at @s run particle flash{color:[1.0, 1.0, 1.0, 1.0]} ~ ~ ~ 0 0 0 0 5 force
execute at @s run particle dragon_breath ~ ~ ~ 15 15 15 0.8 1000 force

# Вызов True Ending смерти
function true_ending:boss/death

# --- Передача управления Stellarity для fly_to_portal / at_portal_loop ---
# Stellarity дальше сам подхватит at_portal_loop
function stellarity:entity/dragon/death/fly_to_portal
