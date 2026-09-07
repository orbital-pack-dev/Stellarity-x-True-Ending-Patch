# ste_cos:phantom/guard_act
# поведение фантома

scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# орбита
function ste_cos:phantom/orbit_guard

# шлейф фантома
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s positioned ^ ^ ^-1.8 run particle dust_color_transition{from_color:[0.3,0.85,1.0],scale:1.6,to_color:[0.7,0.1,0.9]} ~ ~ ~ 0.3 0.25 0.3 0.02 4 force @a
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s positioned ^ ^ ^-2.0 run particle soul_fire_flame ~ ~ ~ 0.2 0.2 0.2 0.02 3 force @a
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s positioned ^ ^ ^-2.2 run particle dragon_breath ~ ~ ~ 0.35 0.3 0.35 0.01 4 force @a
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s positioned ^ ^ ^-1.6 run particle electric_spark ~ ~ ~ 0.2 0.2 0.2 0.04 2 force @a

# AI фантомов
execute as @e[type=phantom,tag=ste_cos_guard] run data merge entity @s {Silent:0b,NoAI:0b}

# звуки фантома
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s if predicate true_ending:chance/6_percent run playsound entity.phantom.ambient hostile @a[distance=..16] ~ ~ ~ 1.0 0.8
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s if predicate true_ending:chance/6_percent run playsound entity.phantom.flap hostile @a[distance=..16] ~ ~ ~ 1.0 0.65
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s if predicate true_ending:chance/6_percent run playsound block.amethyst_block.chime hostile @a[distance=..16] ~ ~ ~ 1.0 0.6

# перезарядка атаки
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags if score @s ste_cos.timer matches 1.. run scoreboard players remove @s ste_cos.timer 1

# эффекты игрокам
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run effect give @s wither 4 1 true
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run effect give @s darkness 4 0 true
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run effect give @s slowness 4 1 true

# укус
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags if score @s ste_cos.timer matches ..0 at @s as @a[distance=..3,gamemode=!spectator,gamemode=!creative] run damage @s 4 minecraft:mob_attack
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags if score @s ste_cos.timer matches ..0 at @s if entity @a[distance=..3,gamemode=!spectator,gamemode=!creative] run playsound entity.phantom.bite hostile @a[distance=..16] ~ ~ ~ 1.0 0.85
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags if score @s ste_cos.timer matches ..0 at @s if entity @a[distance=..3,gamemode=!spectator,gamemode=!creative] run scoreboard players set @s ste_cos.timer 30
