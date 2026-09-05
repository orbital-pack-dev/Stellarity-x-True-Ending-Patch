# ste_cos:fresh_visual/heart_absorb_arrive
# финал всасывания: Сердце достигло Дракона (или таймаут на 35с)
# воспроизведение звуков резонанса, вспышки частиц и удаление модели

execute if score #heart_absorbed ste_cos.flags matches 1 run return 0
scoreboard players set #heart_absorbed ste_cos.flags 1

# громкие глубокие звуки поглощения Сердца Драконом
playsound entity.warden.heartbeat master @a ~ ~ ~ 64.0 0.65
playsound block.amethyst_block.resonate master @a ~ ~ ~ 64.0 0.55
playsound block.amethyst_block.chime master @a ~ ~ ~ 64.0 0.70
playsound entity.illusioner.cast_spell master @a ~ ~ ~ 64.0 0.75
playsound entity.ender_dragon.growl master @a ~ ~ ~ 64.0 1.05

# космический взрыв частиц контакта
particle flash{color:-4980481} ~ ~ ~ 0 0 0 0 2 force @a
particle sonic_boom ~ ~ ~ 0 0 0 0 2 force @a
particle dust_color_transition{from_color:[1.0,0.3,1.0],scale:3.5,to_color:[0.1,0.0,0.4]} ~ ~ ~ 1.5 1.5 1.5 0.3 120 force @a
particle reverse_portal ~ ~ ~ 1.5 1.5 1.5 0.2 80 force @a
particle electric_spark ~ ~ ~ 1.2 1.2 1.2 0.2 60 force @a
particle dragon_breath ~ ~ ~ 1.5 1.5 1.5 0.1 50 force @a

# удаление 3D-модели Сердца и всех ее компонентов
function project:_/delete

# удаление вспомогательных маркеров
kill @e[type=marker,tag=ste_cos.heart_absorbing]
kill @e[type=marker,tag=ste_cos.absorb_tendril]
kill @e[type=marker,tag=ste_cos.respawn_heart]
