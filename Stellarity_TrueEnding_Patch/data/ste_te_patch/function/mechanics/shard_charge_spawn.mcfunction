# =====================================================================
# ste_te_patch:mechanics/shard_charge_spawn
# Спавн маркера-осколка при смерти кристалла.
# =====================================================================
summon marker 0 70 0 {Tags:["ste_crystal_shard_tmp"]}
spreadplayers 0 0 5 30 false @e[type=marker,tag=ste_crystal_shard_tmp]
tag @e[type=marker,tag=ste_crystal_shard_tmp] add ste_crystal_shard
tag @e[type=marker,tag=ste_crystal_shard_tmp] remove ste_crystal_shard_tmp
