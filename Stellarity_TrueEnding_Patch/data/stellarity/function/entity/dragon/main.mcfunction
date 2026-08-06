# End Crystal stuff
  scoreboard players reset #crystal_count stellarity.misc
  # Count Crystals (only the ones with the bottom part count)
    execute as @e[type=end_crystal,nbt={ShowBottom:1b},distance=..200] at @s run function stellarity:entity/dragon/crystal/loop
    # Make Dragon invulnerable if there is more than 1 Crystal
      execute if score #crystal_count stellarity.misc matches 1.. run function stellarity:entity/dragon/crystal/update_bossbar
      execute unless score #crystal_count stellarity.misc matches 1.. run function stellarity:entity/dragon/crystal/hide_bossbar

    # A special helper Marker is spawned right with the Dragon and is used
    # for things like death animations, dropping loot at correct time, etc.
      execute at @s run tp @e[type=marker,tag=stellarity.dragon_marker] ~ ~ ~

    # Get health
      execute store result score @s stellarity.dragon.health run data get entity @s Health 1
      # Convert to percentage
        execute store result score #max stellarity.misc run attribute @s max_health get
        scoreboard players set #100 stellarity.misc 100
        scoreboard players operation @s stellarity.dragon.health_percent = @s stellarity.dragon.health
        scoreboard players operation @s stellarity.dragon.health_percent *= #100 stellarity.misc
        scoreboard players operation @s stellarity.dragon.health_percent /= #max stellarity.misc
        # Prevent Crystals from healing the Dragon
          execute if score @s stellarity.dragon.health_old < @s stellarity.dragon.health run function stellarity:entity/dragon/prevent_heal
          scoreboard players operation @s stellarity.dragon.health_old = @s stellarity.dragon.health
          # Update bossbar
            execute store result bossbar stellarity:ender_dragon value run scoreboard players get @s stellarity.dragon.health

          execute if predicate kohara:chance/6percent run function stellarity:entity/dragon/beam_thingy/spawn

        # Bossbar Visbility
          bossbar set stellarity:ender_dragon players
          bossbar set stellarity:ender_dragon players @a[predicate=stellarity:location/dragons_den/in_main_area]
          bossbar set stellarity:crystal_count players
          bossbar set stellarity:crystal_count players @a[predicate=stellarity:location/dragons_den/in_main_area]

        # Music
          execute if entity @s[tag=!stellarity.to_portal,tag=!stellarity.at_portal] run function stellarity:entity/dragon/music/tick

        # KEEP: Trail and visual stuff
          execute store result score @s stellarity.misc run data get entity @s DragonPhase
          execute unless score @s[tag=!stellarity.at_portal] stellarity.misc matches 5..7 run function stellarity:entity/dragon/trail

        # Heartbeat while below 25% health
        # It only gets quicker and quicker as the Dragon knows it is closer to its death
          execute if score @s stellarity.dragon.health_percent matches ..25 run function stellarity:entity/dragon/heartbeat/main

        # Fly to portal to die
          execute if score @s[tag=!stellarity.at_portal] stellarity.dragon.health matches 0..1 run function stellarity:entity/dragon/death/fly_to_portal
          execute if score @s stellarity.dragon.health matches 0..1 if score @s[tag=stellarity.to_portal] stellarity.misc matches 5..7 run tag @s add stellarity.at_portal
          execute if entity @s[tag=stellarity.at_portal] run function stellarity:entity/dragon/death/at_portal_loop

      team join stellarity.dragon.pacify_others @e[type=enderman,predicate=stellarity:location/dragons_den/in_main_area]
