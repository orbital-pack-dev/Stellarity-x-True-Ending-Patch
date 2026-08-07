# =====================================================================
# PATCH OVERRIDE: stellarity:entity/dragon/death/finish
# Оригинальный файл: Stellarity-5.5.4/data/stellarity/function/entity/dragon/death/finish.mcfunction
#
# ДОБАВЛЕНО В КОНЕЦ: Полная зачистка True Ending и сброс тегов-флагов патча.
# =====================================================================

# Moved from some Far End function I cannot remember
  function stellarity:structure/exit_portal/activated/generate

# Make Dragon Egg magically appear out of thin air
  execute unless score #stellarity.config stellarity.config.always_generate_egg matches 1 if score @s stellarity.dragon.times_killed matches 1 run setblock ~ ~5 ~ minecraft:dragon_egg
  execute if score #stellarity.config stellarity.config.always_generate_egg matches 1 run setblock ~ ~5 ~ minecraft:dragon_egg
  execute if score @s stellarity.dragon.times_killed matches 1 run particle minecraft:poof ~ ~5 ~ 0 0 0 0.3 50 force

# Generate End Gateways
  function stellarity:structure/exit_portal/gateway/choose_location

# Disable bossbar
  bossbar set stellarity:ender_dragon players

execute as @e[type=marker,tag=stellarity.dragon_marker] at @s run function stellarity:entity/dragon/death/finish_as_marker

scoreboard players reset @s stellarity.dragon.respawn_animation_progress
tag @s remove stellarity.portal_activated

execute if score #stellarity.config stellarity.config.boss_status_messages matches 1 run tellraw @a ["\n",{"translate":"entity.stellarity.dragon.death","with":[{"translate":"entity.minecraft.ender_dragon"}],"color":"#AF4BFF"},"\n"]

## Advancement
## They are in reverse order for a reason I cannot remember,
## but I think it was somewhat important :/
  # 'God Slayer'
    advancement grant @a[distance=..100,advancements={minecraft:end/kill_dragon=true,stellarity:dragons_den/god_slayer=false}] only stellarity:dragons_den/god_slayer
    # 'Free The End'
      advancement grant @a[distance=..100,advancements={minecraft:end/kill_dragon=false}] only minecraft:end/kill_dragon

    # Activate Altar of The Accursed.
      # regenerate if needed
        execute in minecraft:the_end positioned 50 76 -39 unless entity @e[type=marker,tag=stellarity.altar_of_the_accursed,distance=..32] run function stellarity:entity/dragon/death/regenerate_altar_check

        schedule function stellarity:entity/dragon/death/activate_altar_of_the_accursed_sound 5s
        schedule function stellarity:entity/dragon/death/activate_altar_of_the_accursed 8s

      ## Leftover ash
        scoreboard players set #stellarity.dragon.ash_duration stellarity.misc 500

        execute unless entity @e[type=marker,tag=stellarity.altar_of_the_accursed,tag=stellarity.altar_of_the_accursed_activated] run \
        schedule function stellarity:entity/dragon/play_track 230t
          execute if entity @e[type=marker,tag=stellarity.altar_of_the_accursed,tag=stellarity.altar_of_the_accursed_activated] run \
          schedule function stellarity:entity/dragon/play_track 70t

# =============================================================
# TRUE ENDING BRIDGE — СБРОС ПРИ ЗАВЕРШЕНИИ БОЯ
# Выполняется когда Stellarity подтверждает смерть и генерирует портал.
# =============================================================

# Зачищаем все TE боевые сущности (финальная зачистка, если win_sync не успел)
kill @e[type=marker,tag=trueEnding_shockwave]
kill @e[type=marker,tag=trueEnding_shockwave2]
kill @e[type=marker,tag=trueEnding_pad]
kill @e[type=marker,tag=trueEnding_ultrafireball]
kill @e[type=marker,tag=trueEnding_dragonparticle]
kill @e[type=phantom,tag=trueEnding_guardphantom]
kill @e[type=marker,tag=trueEnding_endspike]
kill @e[type=marker,tag=trueEnding_endspike_caged]
kill @e[type=ender_dragon,tag=trueEnding_mirrordragon]
kill @e[type=marker,tag=trueEnding_pivot]

# Сброс глобальных TE-скорбордов (чтобы следующий спаун начинался чисто)
scoreboard players reset crystals_left trueEnding_storage
scoreboard players reset crystals_left_pretick trueEnding_storage
scoreboard players reset respawn_ender_dragon trueEnding_storage

# Сброс музыки TE у игроков
execute in the_end positioned 0 80 0 as @a[distance=..256] run scoreboard players reset @s trueEnding_music

# Сброс флагов-патча (для корректного следующего призыва)
# (Дракон к этому моменту уже умирает, но его entity ещё может существовать)
execute as @e[type=ender_dragon,tag=ste_te_death_cleanup_done] run tag @s remove ste_te_death_cleanup_done
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] run tag @s remove trueEnding_dragon_particlechecked
execute as @e[type=ender_dragon] run tag @s remove trueEnding_halfhealth
execute as @e[type=ender_dragon] run tag @s remove trueEnding_quarterhealth
execute as @e[type=ender_dragon] run tag @s remove trueEnding_inattack
execute as @e[type=ender_dragon] run tag @s remove trueEnding_inattack_doubledive
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon] run tag @s remove ste_te_check_mace
execute as @e[type=ender_dragon] run tag @s remove ste_te_meteor_rain_done
execute as @e[type=ender_dragon] run tag @s remove ste_te_mirror_done
execute as @e[type=ender_dragon] run tag @s remove ste_te_last_stand
execute as @e[type=ender_dragon] run tag @s remove ste_te_death_triggered
execute as @e[type=ender_dragon] run tag @s remove ste_te_50_percent_triggered
execute as @e[type=ender_dragon] run tag @s remove ste_ai_locked
execute as @e[type=ender_dragon] run tag @s remove ste_ai_air_threat
execute as @e[type=ender_dragon] run tag @s remove ste_ai_close_threat

# Сброс scoreboard-флагов патча для повторного боя
scoreboard players set $dead ste_te_flags 0
scoreboard players set $crystals_gone ste_te_flags 0
scoreboard players set $guards_spawned ste_te_flags 0
scoreboard players set $guard_cooldown ste_te_flags 0
scoreboard players set $shield_dropped ste_te_flags 0
