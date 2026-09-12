# stellarity:entity/dragon/spawn/conditions
# подсчет кристаллов для ритуала возрождения

# если анимация уже идет, сохраняем счетчик и проверяем целостность
execute if entity @s[tag=stellarity.respawn_dragon] store result score #current_glav ste_cos.flags if entity @e[type=end_crystal,tag=ste_cos_anim_glav_crystal]
execute if entity @s[tag=stellarity.respawn_dragon] if score #current_glav ste_cos.flags matches 4 run scoreboard players set #respawn_crystal_count stellarity.misc 4
execute if entity @s[tag=stellarity.respawn_dragon] if score #current_glav ste_cos.flags matches 4 run return 1
execute if entity @s[tag=stellarity.respawn_dragon] unless score #current_glav ste_cos.flags matches 4 run function stellarity:entity/dragon/spawn/cancel
execute if entity @s[tag=stellarity.respawn_dragon] unless score #current_glav ste_cos.flags matches 4 run return 0

# быстрая проверка: если рядом с алтарем вообще нет кристаллов, ритуал не может начаться
execute in minecraft:the_end positioned 0 62 0 unless entity @e[type=end_crystal,distance=..8] run scoreboard players set #respawn_crystal_count stellarity.misc 0
execute in minecraft:the_end positioned 0 62 0 unless entity @e[type=end_crystal,distance=..8] run return 0

# запуск валидации 4 кардинальных кристаллов
function ste_cos:crystal/anim_checkpoints

# если на кардинальных точках не 4 кристалла - ритуал не может начаться
execute unless score #respawn_crystal_count stellarity.misc matches 4 run return 0

# если ровно 4 кристалла подтверждены на своих постаментах - запускаем ритуал возрождения
tag @s[tag=!stellarity.respawn_dragon] add stellarity.respawn_dragon
