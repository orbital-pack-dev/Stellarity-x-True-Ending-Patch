# ste_cos:crystal/shielded_crystal_deflect
# отражение и уничтожение снарядов силовым щитом кристалла

# 1. Трезубец — НЕ удаляется, а отскакивает вниз
execute as @e[type=trident,distance=..3.5] at @s run function ste_cos:crystal/trident_deflect
execute as @e[type=trident,distance=..3.5] at @s run function ste_cos:crystal/trident_deflect

# 2. Обычные и спектральные стрелы
execute at @e[type=arrow,distance=..3.5] run particle electric_spark ~ ~ ~ 0.2 0.2 0.2 0.1 8 force
execute at @e[type=arrow,distance=..3.5] run playsound item.shield.block hostile @a[distance=..16] ~ ~ ~ 1.0 1.2
kill @e[type=arrow,distance=..3.5]

execute at @e[type=spectral_arrow,distance=..3.5] run particle electric_spark ~ ~ ~ 0.2 0.2 0.2 0.1 8 force
execute at @e[type=spectral_arrow,distance=..3.5] run playsound item.shield.block hostile @a[distance=..16] ~ ~ ~ 1.0 1.2
kill @e[type=spectral_arrow,distance=..3.5]

# 3. Снежки, жемчуг Края, яйца, заряды ветра
execute at @e[type=snowball,distance=..3.5] run playsound item.shield.block hostile @a[distance=..16] ~ ~ ~ 1.0 1.2
kill @e[type=snowball,distance=..3.5]

execute at @e[type=ender_pearl,distance=..3.5] run playsound item.shield.block hostile @a[distance=..16] ~ ~ ~ 1.0 1.2
kill @e[type=ender_pearl,distance=..3.5]

execute at @e[type=egg,distance=..3.5] run playsound item.shield.block hostile @a[distance=..16] ~ ~ ~ 1.0 1.2
kill @e[type=egg,distance=..3.5]

execute at @e[type=wind_charge,distance=..3.5] run playsound item.shield.block hostile @a[distance=..16] ~ ~ ~ 1.0 1.2
kill @e[type=wind_charge,distance=..3.5]

execute at @e[type=breeze_wind_charge,distance=..3.5] run playsound item.shield.block hostile @a[distance=..16] ~ ~ ~ 1.0 1.2
kill @e[type=breeze_wind_charge,distance=..3.5]
