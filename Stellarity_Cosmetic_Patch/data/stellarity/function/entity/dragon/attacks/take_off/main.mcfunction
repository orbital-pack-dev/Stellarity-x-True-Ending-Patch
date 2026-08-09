execute unless score @s stellarity.dragon.perch_cooldown matches 1.. \
at @s run \
function stellarity:entity/dragon/attacks/take_off/shulkers/prepare

execute unless score @s stellarity.dragon.perch_cooldown matches 10.. run \
scoreboard players set @s stellarity.dragon.perch_cooldown 400
