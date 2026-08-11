# ste_cos:crystal/cleanup_execute
# Вызывается через 8 секунд после захода первого игрока в Энд.
#
# НАЗНАЧЕНИЕ: убрать со столбов "старые" кристаллы, чтобы при следующем
# призыве дракона Stellarity восстановил их заново (ванильная механика
# респавна арены). РОВНО поэтому кристаллы должны стираться при входе.
#
# ВАЖНО:
#   - schedule-функция выполняется НЕ от игрока и НЕ в Энде → оборачиваем
#     в 'in minecraft:the_end positioned 0 65 0'.
#   - Чистим только когда бой НЕ идёт (нет живого дракона), иначе очистка
#     сломала бы неуязвимость активного боя.
#   - ОБЯЗАТЕЛЬНО нарисуем "площадку призыва" кристаллов заново нельзя,
#     поэтому просто чистим лишние кристаллы арены (без ShowBottom:1b не трогаем
#     те, что входят в бой).

# Проверяем, была ли очистка + не идёт ли бой
execute if score #crystal_cleaned ste_cos.flags matches 1.. run return 0
execute in minecraft:the_end if entity @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1] run return 0

# Уничтожаем кристаллы арены (не принадлежащие активному бою).
# ShowBottom:1b — боевые кристаллы на столбах; их тоже стираем при входе,
# чтобы арена пере-создала их при призыве. (Бой не идёт — безопасно.)
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=end_crystal,distance=..250]

# Убираем и фантомов-стражей, если остались
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=phantom,tag=ste_cos_guard,distance=..250]
execute in minecraft:the_end positioned 0 65 0 run kill @e[type=armor_stand,tag=ste_cos_guard_marker,distance=..250]

# Помечаем, что очистка произведена
scoreboard players set #crystal_cleaned ste_cos.flags 1
