# stellarity:entity/dragon/death/finish_as_marker
# финальный взрыв при гибели дракона

# двойная фиолетовая вспышка
particle flash{color:-4980481} ~ ~ ~ 0 0 0 0 2 force @a
particle flash{color:-2673921} ~ ~ ~ 0 0 0 0 1 force @a

# ударная волна и эмиттер взрыва
particle sonic_boom ~ ~ ~ 0 0 0 0 2 force @a
particle explosion_emitter ~ ~ ~ 0 0 0 0 5 force @a

# облака градиентной космической пыли и искр
particle dust_color_transition{from_color:[1.0,0.3,1.0],scale:4.0,to_color:[0.15,0.0,0.4]} ~ ~ ~ 3 3 3 0.4 200 force @a
particle end_rod ~ ~ ~ 2.5 2.5 2.5 0.3 120 force @a
particle electric_spark ~ ~ ~ 2 2 2 0.2 80 force @a
particle dragon_breath ~ ~ ~ 1.5 1.5 1.5 0.15 100 force @a

# звуки гибели дракона, вардена и резонанса аметиста
playsound entity.ender_dragon.growl hostile @a[distance=0..] ~ ~ ~ 10 0.8
playsound entity.warden.death hostile @a[distance=0..] ~ ~ ~ 10 0.7
playsound entity.warden.sonic_boom hostile @a[distance=0..] ~ ~ ~ 10 0.6
playsound block.amethyst_block.resonate hostile @a[distance=0..] ~ ~ ~ 10 0.5

loot spawn ~ ~ ~ loot stellarity:entity/ender_dragon

execute as @e[type=item,distance=..1] run data merge entity @s {Motion:[0.0d,-0.61d,0.0d],NoGravity:1b,Glowing:1b}
execute as @e[type=item,distance=..1] run team join stellarity.purple_glow @s
execute as @n[type=item,distance=..1] run tag @s add stellarity.boss_drop
execute as @n[type=item,distance=..1] run tag @s add stellarity.item

kill @s
