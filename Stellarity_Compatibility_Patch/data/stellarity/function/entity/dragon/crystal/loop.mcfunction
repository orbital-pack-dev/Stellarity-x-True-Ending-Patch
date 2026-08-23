# stellarity:entity/dragon/crystal/loop (PATCHED by ste_cos)
# Task: count crystals, init, particles.
# [PATCH] Crystals are NOT protected by interaction shield - they are always vulnerable.
scoreboard players add #crystal_count stellarity.misc 1

execute unless entity @s[tag=stellarity.end_crystal.init] run function stellarity:entity/dragon/crystal/init

particle soul_fire_flame ~ ~1 ~ .6 .6 .6 0.02 1 normal
particle dragon_breath ~ ~1 ~ .6 .6 .6 0.02 1 normal



# =====================================================================
# Fix invisible crystals:
# USING FORCELOAD INSTEAD OF HITBOXES!
# =====================================================================
