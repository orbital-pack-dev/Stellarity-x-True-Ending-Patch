# пробуждение шалкера для атаки
data merge entity @n[type=shulker] {NoAI:0b,Invulnerable:0b,Silent:0b}

particle flash ~ ~ ~ 0 0 0 0 1 force @a
playsound entity.shulker.open hostile @a[distance=..32] ~ ~ ~ 1.0 1.0
