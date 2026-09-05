# ste_cos:minigame_clones/clone_dive
# переход копии в пике вниз и исчезновение (выдаем тег True Ending только сейчас, чтобы копия ушла вниз)

tag @s add trueEnding_mirrordragon
data merge entity @s {Silent:1b}
tag @s add ste_cos.clones_diving
scoreboard players set @s ste_cos.dive_timer 0
