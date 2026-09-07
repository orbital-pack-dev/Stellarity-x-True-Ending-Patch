# ste_cos:minigame_clones/feedback_projectile_step
# полет снаряда

# наведение
execute facing entity @p[gamemode=!creative,gamemode=!spectator] eyes run tp @s ~ ~ ~ ~ ~

# полет
tp @s ^ ^ ^4.5

# частицы успеха
execute if entity @s[tag=ste_cos.fb_real] run particle dust{color:[1.0,0.85,0.15],scale:2.0} ~ ~ ~ 0.1 0.1 0.1 0 4 force @a
execute if entity @s[tag=ste_cos.fb_real] run particle dust{color:[0.2,0.95,0.3],scale:2.0} ~ ~ ~ 0.1 0.1 0.1 0 3 force @a
execute if entity @s[tag=ste_cos.fb_real] run particle dust{color:[0.75,0.15,0.95],scale:2.0} ~ ~ ~ 0.1 0.1 0.1 0 3 force @a
execute if entity @s[tag=ste_cos.fb_real] run particle electric_spark ~ ~ ~ 0.05 0.05 0.05 0.02 2 force @a

# частицы провала
execute if entity @s[tag=ste_cos.fb_fake] run particle squid_ink ~ ~ ~ 0.1 0.1 0.1 0.04 4 force @a
execute if entity @s[tag=ste_cos.fb_fake] run particle smoke ~ ~ ~ 0.1 0.1 0.1 0.03 4 force @a
execute if entity @s[tag=ste_cos.fb_fake] run particle dust{color:[0.05,0.02,0.08],scale:2.5} ~ ~ ~ 0.1 0.1 0.1 0 5 force @a

# попадание в игрока
execute if entity @p[distance=..3.0,gamemode=!creative,gamemode=!spectator] if entity @s[tag=ste_cos.fb_real] run playsound entity.player.levelup player @p ~ ~ ~ 1.5 1.5
execute if entity @p[distance=..3.0,gamemode=!creative,gamemode=!spectator] if entity @s[tag=ste_cos.fb_real] run particle flash{color:[1.0,0.85,0.2,1.0]} ~ ~ ~ 0 0 0 0 1 force @a

execute if entity @p[distance=..3.0,gamemode=!creative,gamemode=!spectator] if entity @s[tag=ste_cos.fb_fake] run playsound entity.elder_guardian.curse player @p ~ ~ ~ 1.0 1.2
execute if entity @p[distance=..3.0,gamemode=!creative,gamemode=!spectator] if entity @s[tag=ste_cos.fb_fake] run particle flash{color:[0.30,0.02,0.40,1.0]} ~ ~ ~ 0 0 0 0 1 force @a

execute if entity @p[distance=..3.0,gamemode=!creative,gamemode=!spectator] run kill @s
