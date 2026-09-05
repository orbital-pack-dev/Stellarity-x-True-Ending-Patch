# ste_cos:minigame_clones/clone_dive
# переход копии в пике вниз и исчезновение (ИИ и звуки отключаются)

data merge entity @s {Silent:1b,NoAI:1b}
tag @s add ste_cos.clones_diving
scoreboard players set @s ste_cos.dive_timer 0
