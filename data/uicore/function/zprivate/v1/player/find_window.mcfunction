#
# This function will tag the window of the player with 'uicore.selected.window'
#
# @executor the player whose window will be taged
#
execute unless score @s uicore.id matches 1.. run return fail
scoreboard players operation $player_id uicore.id = @s uicore.id
return run \
    execute as @e[tag=uicore.window, tag=uicore.v1] if score @s uicore.id = $player_id uicore.id run tag @s add uicore.selected.window
