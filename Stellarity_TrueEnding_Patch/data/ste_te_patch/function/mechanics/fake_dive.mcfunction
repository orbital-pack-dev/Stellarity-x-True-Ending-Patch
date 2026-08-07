# =====================================================================
# ste_te_patch:mechanics/fake_dive
# =====================================================================

execute run scoreboard players add @s ste_te_m12 5
execute if score @s ste_te_m12 matches 1200.. run scoreboard players set @s ste_te_m12 0

# Если таймер 0, запускаем фейк-дайв логику (спавн AEC и урона)
execute if score @s ste_te_m12 matches 0 at @s run summon area_effect_cloud ~ ~ ~ {Radius:10f,Duration:200,custom_particle:{type:"minecraft:dragon_breath"}}
execute if score @s ste_te_m12 matches 0 at @s run particle sonic_boom ~ ~ ~ 10 10 10 0 100 force
execute if score @s ste_te_m12 matches 0 at @s as @a[distance=..20] run damage @s 10 minecraft:mob_attack by @e[type=ender_dragon,tag=stellarity.ender_dragon,limit=1,sort=nearest]
execute if score @s ste_te_m12 matches 0 at @s as @a[distance=..20] run data modify entity @s Motion set value [0.0, 1.5, 0.0]
execute if score @s ste_te_m12 matches 0 at @s run playsound minecraft:entity.ender_dragon.growl hostile @a[distance=..256] ~ ~ ~ 10 0.8
execute if score @s ste_te_m12 matches 0 run title @a[distance=..256] actionbar {"text":"FAKE DIVE","color":"dark_purple","bold":true}
