# ste_cos:mechanics/portal_danger
# опасная зона вокруг центрального портала

# запуск дыхания дракона у портала
execute if score #portal_danger_timer ste_cos.flags matches 200.. run function ste_cos:mechanics/portal_wave_start

# счетчик волн
scoreboard players add #portal_danger_timer ste_cos.flags 1
