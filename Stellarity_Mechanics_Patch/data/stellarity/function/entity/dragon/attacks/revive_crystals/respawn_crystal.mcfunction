# призыв нового кристалла если рядом нет старого
execute unless entity @e[type=end_crystal,distance=..3] at @s run summon end_crystal ~ ~ ~ {ShowBottom:1b,Glowing:1b,Tags:["stellarity.new_crystal","stellarity.end_crystal","smithed.entity","ste_cos.shielded_crystal"]}
execute as @e[type=end_crystal,tag=ste_cos.shielded_crystal,distance=..3] run team join ste_cos.cyan_glow @s

# эффекты возрождения
execute at @s run particle explosion_emitter ~ ~ ~ 0 0 0 0 1 force
execute at @s run particle dragon_breath ~ ~ ~ 0 0 0 1 50 force

function stellarity:entity/dragon/attacks/revive_crystals/wave
