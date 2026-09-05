# ste_cos:phantom/guard_act
# поведение фантома возле кристалла

scoreboard players operation #current_id ste_cos.flags = @s ste_cos.id

# полет по круговой орбите
function ste_cos:phantom/orbit_guard

# объемный космический шлейф за фантомом (force @a виден снизу с земли)
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s positioned ^ ^ ^-1.8 run particle dust_color_transition{from_color:[0.3,0.85,1.0],scale:1.6,to_color:[0.7,0.1,0.9]} ~ ~ ~ 0.3 0.25 0.3 0.02 4 force @a
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s positioned ^ ^ ^-2.0 run particle soul_fire_flame ~ ~ ~ 0.2 0.2 0.2 0.02 3 force @a
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s positioned ^ ^ ^-2.2 run particle dragon_breath ~ ~ ~ 0.35 0.3 0.35 0.01 4 force @a
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s positioned ^ ^ ^-1.6 run particle electric_spark ~ ~ ~ 0.2 0.2 0.2 0.04 2 force @a

# поддержание активного AI и звуков у фантомов-стражей
execute as @e[type=phantom,tag=ste_cos_guard] run data merge entity @s {Silent:0b,NoAI:0b}

# зловещие звуки фантома и кристалла
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s if predicate true_ending:chance/6_percent run playsound entity.phantom.ambient hostile @a ~ ~ ~ 32.0 0.8
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s if predicate true_ending:chance/6_percent run playsound entity.phantom.flap hostile @a ~ ~ ~ 32.0 0.65
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s if predicate true_ending:chance/6_percent run playsound block.amethyst_block.chime hostile @a ~ ~ ~ 32.0 0.6

# наложение Иссушения II, Тьмы и Замедления при приближении игрока
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run effect give @s wither 5 1 true
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run effect give @s darkness 4 0 true
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..4,gamemode=!spectator,gamemode=!creative] run effect give @s slowness 4 1 true
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s as @a[distance=..3,gamemode=!spectator,gamemode=!creative] run damage @s 4 minecraft:mob_attack
execute as @e[type=phantom,tag=ste_cos_guard,distance=..32] if score @s ste_cos.id = #current_id ste_cos.flags at @s if entity @a[distance=..4,gamemode=!spectator,gamemode=!creative] run playsound entity.phantom.bite hostile @a ~ ~ ~ 32.0 0.85
