# stellarity:entity/dragon/death/at_portal_loop
# фиксация дракона над центром портала во время гибели

tag @s add stellarity.at_portal
tag @s remove stellarity.to_portal

data merge entity @s {DragonPhase:6,Invulnerable:0b}

execute rotated as @s run tp @s 0 65 0 ~ ~

attribute @s armor modifier add stellarity:last_hit -1 add_multiplied_total
attribute @s armor_toughness modifier add stellarity:last_hit -1 add_multiplied_total
