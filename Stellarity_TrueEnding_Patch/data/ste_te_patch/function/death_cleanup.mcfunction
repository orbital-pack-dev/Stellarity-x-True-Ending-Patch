# =====================================================================
# ste_te_patch:death_cleanup
# Вызывается при смерти дракона или завершении боя для сброса флагов
# =====================================================================

scoreboard players set $dead ste_te_flags 0
scoreboard players set $crystals_gone ste_te_flags 0
scoreboard players set $guards_spawned ste_te_flags 0
scoreboard players set $guard_cooldown ste_te_flags 0

tag @e[type=ender_dragon,tag=stellarity.ender_dragon] remove ste_te_death_triggered
tag @e[type=ender_dragon,tag=stellarity.ender_dragon] remove ste_te_last_stand
tag @e[type=ender_dragon,tag=stellarity.ender_dragon] remove ste_te_50_percent_triggered

# Устанавливаем флаг, что очистка пройдена для этого дракона
tag @s add ste_te_death_cleanup_done

# Убиваем стражей и маркеры
kill @e[type=phantom,tag=ste_crystal_guard]
kill @e[type=marker,tag=ste_crystal_shard]
