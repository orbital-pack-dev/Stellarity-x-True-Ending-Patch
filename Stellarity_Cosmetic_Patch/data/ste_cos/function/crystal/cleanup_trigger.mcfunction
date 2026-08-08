# ste_cos:crystal/cleanup_trigger
# Вызывается при заходе игрока в Энд

# Проверяем, была ли уже очистка
execute unless score #crystal_cleaned ste_cos.flags matches 1.. run schedule function ste_cos:crystal/cleanup_execute 8s append
