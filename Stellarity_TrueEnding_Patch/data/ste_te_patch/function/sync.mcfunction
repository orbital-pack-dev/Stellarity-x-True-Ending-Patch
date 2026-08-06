# 1. INITIALIZATION AND TAGS (Entity Identification)
# Ensure the dragon always has both tags so True Ending and Stellarity both process it.
execute as @e[type=ender_dragon,tag=stellarity.ender_dragon,tag=!trueEnding_dragon_particlechecked] run tag @s add trueEnding_dragon_particlechecked
execute as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked,tag=!stellarity.ender_dragon] run tag @s add stellarity.ender_dragon

# 2. CRYSTAL SYNCHRONIZATION (Shield Down Bridge)
# If Stellarity registers 0 crystals, force True Ending to start the final phase
execute if score #crystal_count stellarity.misc matches 0 as @e[type=ender_dragon,tag=trueEnding_dragon_particlechecked] unless score @s trueEnding_bosstime matches 5000.. run scoreboard players set @s trueEnding_bosstime 5000

# Also synchronize crystal counts for TE logic
execute if score #crystal_count stellarity.misc matches 0.. run scoreboard players operation crystals_left trueEnding_storage = #crystal_count stellarity.misc
