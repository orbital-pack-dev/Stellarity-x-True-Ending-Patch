# ste_cos:crystal/cleanup_trigger
# Механика боя

execute unless score #crystal_cleaned ste_cos.flags matches 1.. run schedule function ste_cos:crystal/cleanup_execute 2s append

# Механика боя
advancement revoke @s only ste_cos:void_crossing
