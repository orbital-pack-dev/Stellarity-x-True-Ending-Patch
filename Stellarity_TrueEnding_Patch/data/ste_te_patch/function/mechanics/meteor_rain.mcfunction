# =====================================================================
# ste_te_patch:mechanics/meteor_rain
# =====================================================================

execute run scoreboard players add @s ste_te_m1 5
execute if score @s ste_te_m1 matches 600.. run scoreboard players set @s ste_te_m1 0

# Проверка: HP < 20%
execute store result score @s temp_health run data get entity @s Health 1

# Спавн метеоритов
execute if score @s temp_health matches ..205 if score @s ste_te_m1 matches 0 at @s run summon fireball ~ ~20 ~ {ExplosionPower:3b,Motion:[0.0,-2.0,0.0],acceleration_power:0.1d,Tags:["te_fireball"]}
execute if score @s temp_health matches ..205 if score @s ste_te_m1 matches 0 at @s run summon fireball ~10 ~25 ~10 {ExplosionPower:3b,Motion:[0.0,-2.0,0.0],acceleration_power:0.1d,Tags:["te_fireball"]}
execute if score @s temp_health matches ..205 if score @s ste_te_m1 matches 0 at @s run summon fireball ~-10 ~30 ~-10 {ExplosionPower:3b,Motion:[0.0,-2.0,0.0],acceleration_power:0.1d,Tags:["te_fireball"]}
execute if score @s temp_health matches ..205 if score @s ste_te_m1 matches 0 at @s run summon fireball ~10 ~25 ~-10 {ExplosionPower:3b,Motion:[0.0,-2.0,0.0],acceleration_power:0.1d,Tags:["te_fireball"]}
execute if score @s temp_health matches ..205 if score @s ste_te_m1 matches 0 at @s run summon fireball ~-10 ~30 ~10 {ExplosionPower:3b,Motion:[0.0,-2.0,0.0],acceleration_power:0.1d,Tags:["te_fireball"]}
execute if score @s temp_health matches ..205 if score @s ste_te_m1 matches 0 at @s run summon fireball ~5 ~20 ~5 {ExplosionPower:3b,Motion:[0.0,-2.0,0.0],acceleration_power:0.1d,Tags:["te_fireball"]}
execute if score @s temp_health matches ..205 if score @s ste_te_m1 matches 0 at @s run summon fireball ~-5 ~35 ~-5 {ExplosionPower:3b,Motion:[0.0,-2.0,0.0],acceleration_power:0.1d,Tags:["te_fireball"]}

execute if score @s temp_health matches ..205 if score @s ste_te_m1 matches 0 at @s run playsound minecraft:entity.blaze.shoot hostile @a[distance=..256] ~ ~ ~ 10 0.5
execute if score @s temp_health matches ..205 if score @s ste_te_m1 matches 0 run title @a[distance=..256] actionbar {"text":"METEOR RAIN","color":"red","bold":true}
