# таймер анимации возрождения
scoreboard players add #timer stellarity.misc 1

# отмена если кристаллы отсутствуют
execute unless entity @e[type=end_crystal] run function stellarity:entity/dragon/spawn/cancel

# частицы чар вокруг центра
execute if score #timer stellarity.misc matches 1..100 run particle enchant 0 65 0 2 0 2 1 10 force
execute if score #timer stellarity.misc matches 101.. run particle enchant 0 65 0 2 0 2 3 50 force

# запуск лучей кристаллов
execute if score #timer stellarity.misc matches 100 run function stellarity:entity/dragon/spawn/crystal_beam/1

# установка кристаллов по башням
execute if score #timer stellarity.misc matches 120 run function stellarity:entity/dragon/spawn/respawn_crystal with storage stellarity:main {pos:[63, 80, 0]}
execute if score #timer stellarity.misc matches 140 run function stellarity:entity/dragon/spawn/respawn_crystal with storage stellarity:main {pos:[50, 85, 36]}
execute if score #timer stellarity.misc matches 160 run function stellarity:entity/dragon/spawn/respawn_crystal with storage stellarity:main {pos:[18, 92, 59]}
execute if score #timer stellarity.misc matches 180 run function stellarity:entity/dragon/spawn/respawn_crystal with storage stellarity:main {pos:[-19, 98, 59]}
execute if score #timer stellarity.misc matches 200 run function stellarity:entity/dragon/spawn/respawn_crystal with storage stellarity:main {pos:[-51, 89, 36]}
execute if score #timer stellarity.misc matches 220 run function stellarity:entity/dragon/spawn/respawn_crystal with storage stellarity:main {pos:[-63, 77, 0]}
execute if score #timer stellarity.misc matches 240 run function stellarity:entity/dragon/spawn/respawn_crystal with storage stellarity:main {pos:[-51, 95, -39]}
execute if score #timer stellarity.misc matches 260 run function stellarity:entity/dragon/spawn/respawn_crystal with storage stellarity:main {pos:[-19, 104, -60]}
execute if score #timer stellarity.misc matches 280 run function stellarity:entity/dragon/spawn/respawn_crystal with storage stellarity:main {pos:[18, 74, -60]}
execute if score #timer stellarity.misc matches 300 run function stellarity:entity/dragon/spawn/respawn_crystal with storage stellarity:main {pos:[50, 101, -39]}

# клетки вокруг кристаллов
execute if score #timer stellarity.misc matches 181 run function stellarity:entity/dragon/spawn/iron_bars with storage stellarity:main {pos:[-19, 98, 59]}
execute if score #timer stellarity.misc matches 261 run function stellarity:entity/dragon/spawn/iron_bars with storage stellarity:main {pos:[-19, 104, -60]}

# замена кристаллов
execute if score #timer stellarity.misc matches 121..301 run function stellarity:entity/dragon/spawn/replace_crystal

# луч в конце возрождения
execute if score #timer stellarity.misc matches 320 run function stellarity:entity/dragon/spawn/crystal_beam/2

# световой импульс
execute if score #timer stellarity.misc matches 340 run function stellarity:entity/dragon/spawn/respawn_finish
