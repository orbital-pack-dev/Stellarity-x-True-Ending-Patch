# stellarity:entity/dragon/death/loop_as_marker
# визуальный подъем маркера смерти дракона с космическими частицами

tp @s ~ ~0.1 ~

# частицы восхождения энергии дракона
particle dust_color_transition{from_color:[0.85,0.15,1.0],scale:1.6,to_color:[0.2,0.0,0.5]} ~ ~ ~ 0.3 0.3 0.3 0.05 4 force
particle reverse_portal ~ ~ ~ 0.4 0.4 0.4 0.1 6 force
particle electric_spark ~ ~ ~ 0.25 0.25 0.25 0.05 2 force
particle end_rod ~ ~ ~ 0.2 0.2 0.2 0.02 2 force
particle witch ~ ~ ~ 0.2 0.2 0.2 0 2 force
particle dragon_breath ~ ~ ~ 0.2 0.2 0.2 0.02 1 force

execute if predicate true_ending:chance/10_percent run playsound block.amethyst_block.chime hostile @a ~ ~ ~ 1.5 1.5
