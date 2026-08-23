# PATCH (v8): оверрайд extra_health — ЛОМАЕТ "хил до 1024".
#
# Оригинал TE ставил "data modify entity @s Health set value 1024", что при
# умирании кристаллов снимало ~700 ХП мгновенно → TE думал, что дракону нанесли
# огромный урон → скипал фазы и пере-респавнил кристаллы.
#
# Теперь: лишний 1024-буфер НЕ используется. Дракон всегда на реальном ХП
# (Stellarity: 300). Вся extra-логика отключена безопасно.

#get current health
execute store result score temp_health trueEnding_health_extra run data get entity @s Health

# НЕ добавляем 1024-буфер: оставляем дракона на фактическом здоровье.
# (вместо "Health set value 1024" — ничего не меняем)

#reset damage dealt // reset health
scoreboard players set temp_damageDealt trueEnding_health_extra 0

execute if score 10tick trueEnding_clock matches 1 unless score @s trueEnding_health_extra > @s trueEnding_health_extra_max if data entity @e[type=end_crystal,distance=..32,limit=1] ShowBottom run scoreboard players add @s trueEnding_health_extra 1
