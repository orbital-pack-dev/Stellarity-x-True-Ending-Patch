# =====================================================================
# ste_te_patch:mechanics/shard_charge_absorb
# Дракон поглощает осколок. Контекст: AS ender_dragon AT дракона.
# =====================================================================
scoreboard players add @s ste_te_charges 1
execute at @e[type=marker,tag=ste_crystal_shard,distance=..8,limit=1] run particle reverse_portal ~ ~ ~ 2 2 2 0.5 80 force
kill @e[type=marker,tag=ste_crystal_shard,distance=..8,limit=1]
playsound minecraft:entity.experience_orb.pickup hostile @a[distance=..256] ~ ~ ~ 5 0.5
playsound minecraft:block.beacon.power_select hostile @a[distance=..256] ~ ~ ~ 5 1.2
particle enchant ~ ~2 ~ 3 3 3 0.5 60 force
