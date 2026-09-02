# ste_cos:crystal/cleanup_trigger
# запуск очистки арены

execute unless score #crystal_cleaned ste_cos.flags matches 1.. run schedule function ste_cos:crystal/cleanup_execute 2s append

# сброс достижения
advancement revoke @s only ste_cos:void_crossing
