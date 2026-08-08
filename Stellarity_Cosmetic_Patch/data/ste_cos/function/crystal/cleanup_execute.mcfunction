# ste_cos:crystal/cleanup_execute
# Вызывается через 8 секунд после захода первого игрока в Энд

# Проверяем, была ли очистка. Защита от двойного вызова.
execute if score #crystal_cleaned ste_cos.flags matches 1.. run return 0

# Уничтожаем все кристаллы (и фантомов, привязанных к ним)
kill @e[type=end_crystal,distance=..250]
kill @e[type=phantom,tag=ste_cos_guard,distance=..250]

# Помечаем, что очистка произведена
scoreboard players set #crystal_cleaned ste_cos.flags 1
