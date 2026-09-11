# stellarity:entity/dragon/spawn/conditions
# подсчет кристаллов для ритуала возрождения

# если анимация уже идет, сохраняем счетчик
execute if entity @s[tag=stellarity.respawn_dragon] run scoreboard players set #respawn_crystal_count stellarity.misc 4
execute if entity @s[tag=stellarity.respawn_dragon] run return 1

# подсчет кристаллов на алтаре портала
execute in minecraft:the_end positioned 0 62 0 store result score #respawn_crystal_count stellarity.misc if entity @e[type=end_crystal,distance=..8,tag=!stellarity.new_crystal]
execute store result score #total_crystal_count stellarity.misc run scoreboard players get #respawn_crystal_count stellarity.misc

# если кристаллов меньше 4 - сброс
execute if score #respawn_crystal_count stellarity.misc matches ..3 run return 0

# если ровно 4 или больше кристаллов у портала - помечаем и запускаем ритуал
execute if score #respawn_crystal_count stellarity.misc matches 4.. in minecraft:the_end positioned 0 62 0 as @e[type=end_crystal,distance=..8,tag=!stellarity.new_crystal] run tag @s add stellarity.respawn_crystal
scoreboard players set #respawn_crystal_count stellarity.misc 4
scoreboard players set #total_crystal_count stellarity.misc 4
tag @s[tag=!stellarity.respawn_dragon] add stellarity.respawn_dragon

# защита от запуска ванильного дракона в обход анимации
execute in minecraft:the_end positioned 0 62 0 as @e[type=end_crystal,distance=..8,tag=!stellarity.new_crystal] if data entity @s beam_target run tag @s add stellarity.respawn_crystal
execute in minecraft:the_end positioned 0 62 0 as @e[type=end_crystal,distance=..8,tag=!stellarity.new_crystal] if data entity @s beam_target run tag @e[type=marker,tag=stellarity.exit_portal,limit=1] add stellarity.respawn_dragon
