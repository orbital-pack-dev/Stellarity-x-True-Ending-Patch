# stellarity:entity/dragon/spawn/replace_crystal
# замена кристалла на башне и запуск луча привязки к Сердцу Дракона

kill @e[type=end_crystal,tag=!stellarity.new_crystal,sort=nearest,distance=..7]

particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force
particle flash{color:-4980481} ~ ~ ~ 0 0 0 0 1 force @a
particle dust_color_transition{from_color:[0.8,0.1,1.0],scale:2.0,to_color:[0.2,0.0,0.5]} ~ ~ ~ 0.5 0.5 0.5 0.1 25 force @a

playsound minecraft:entity.generic.explode block @a ~ ~ ~ 32.0 0.70
playsound minecraft:block.amethyst_block.chime block @a ~ ~ ~ 32.0 0.70

# запуск луча-снаряда от башни к точке 0 128 0
function ste_cos:fresh_visual/tower_tether_launch

tag @s remove stellarity.new_crystal
