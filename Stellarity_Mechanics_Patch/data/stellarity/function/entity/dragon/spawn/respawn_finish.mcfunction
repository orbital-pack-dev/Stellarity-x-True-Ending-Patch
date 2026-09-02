# завершение анимации возрождения
kill @e[type=end_crystal,tag=stellarity.respawn_crystal]
particle flash 0 100 0 0 0 0 0 1 force
summon ender_dragon 0 100 0 {DragonPhase:0,Tags:["stellarity.ender_dragon"]}
