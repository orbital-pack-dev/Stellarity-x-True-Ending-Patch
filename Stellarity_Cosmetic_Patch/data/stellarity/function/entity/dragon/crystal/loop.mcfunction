# stellarity:entity/dragon/crystal/loop (PATCHED by ste_cos)
# Задача: посчитать кристаллы, init, частицы.
# [PATCH] Кристаллы НЕ защищены interaction-щитом — они уязвимы всегда.
scoreboard players add #crystal_count stellarity.misc 1

execute unless entity @s[tag=stellarity.end_crystal.init] run function stellarity:entity/dragon/crystal/init

particle soul_fire_flame ~ ~1 ~ .6 .6 .6 0.02 1 normal
particle dragon_breath ~ ~1 ~ .6 .6 .6 0.02 1 normal

# Лечение Дракона на 8 HP каждую секунду (20 тиков)
scoreboard players add @s ste_cos.timer 1
execute if score @s ste_cos.timer matches 20.. as @e[type=ender_dragon,tag=stellarity.ender_dragon,distance=..32] run function ste_cos:mechanics/crystal_heal
execute if score @s ste_cos.timer matches 20.. run scoreboard players set @s ste_cos.timer 0

# =====================================================================
# Фикс "невидимых" кристаллов: создаем хитбокс, чтобы игрок мог ударить забаганный кристалл
# =====================================================================
# Создаем interaction, если его еще нет (проверка по тегу САМОГО кристалла для 100% защиты от спама на Paper)
execute unless entity @s[tag=ste_cos.has_hitbox] run summon interaction ~ ~ ~ {Tags:["ste_cos.crystal_hitbox"],width:2.0f,height:2.0f}
tag @s add ste_cos.has_hitbox

# Если кто-то ударил interaction - взрываем кристалл (наносим 100 урона, чтобы он взорвался)
execute as @e[type=interaction,tag=ste_cos.crystal_hitbox,distance=..1] on attacker run damage @e[type=end_crystal,distance=..1,limit=1] 100 minecraft:player_attack
