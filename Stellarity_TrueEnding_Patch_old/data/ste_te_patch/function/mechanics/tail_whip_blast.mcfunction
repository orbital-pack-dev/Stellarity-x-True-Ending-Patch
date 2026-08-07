# =====================================================================
# ste_te_patch:mechanics/tail_whip_blast
# =====================================================================

# Урон и отбрасывание AT дракона
execute at @s as @a[distance=..12] run damage @s 12 minecraft:mob_attack by @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,sort=nearest]
execute at @s as @a[distance=..12] run data modify entity @s Motion set value [1.5,1.0,1.5]

# Партиклы
execute at @s run particle sweep_attack ~ ~1 ~ 3 0.5 3 0 10 force
execute at @s run particle dragon_breath ~ ~1 ~ 4 1 4 0.1 50 force

# Звуки
execute at @s run playsound minecraft:entity.ender_dragon.flap hostile @a[distance=..64] ~ ~ ~ 5 0.5
execute at @s run playsound minecraft:entity.player.attack.sweep hostile @a[distance=..64] ~ ~ ~ 5 0.1
