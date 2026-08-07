# =====================================================================
# ste_te_patch:mechanics/royal_laser
# Ультимейт — 8 фаерболов в 8 сторон. КД 5 мин.
# Вызывается in minecraft:the_end из main_tick на тике 40.
# =====================================================================

scoreboard players add @s ste_te_m4 5

# Сбрасываем при >= 6000 тиков и только после гибели кристаллов
execute if score $crystals_gone ste_te_flags matches 1 if score @s ste_te_m4 matches 6000.. run scoreboard players set @s ste_te_m4 0
execute if score $crystals_gone ste_te_flags matches 1 if score @s ste_te_m4 matches 0 run function ste_te_patch:mechanics/royal_laser_fire
