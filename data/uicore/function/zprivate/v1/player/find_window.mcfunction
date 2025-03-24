#
# This function will tag the window of the player with 'uicore.selected.window'
#
# @executor the player whose window will be taged
#
tag @e remove uicore.selected.window
execute store result storage uicore:zprivate/v1/window_by_id id int 1 run scoreboard players get @s uicore.id
return run execute as @e[predicate=uicore:api/v1/window_by_id] run tag @s add uicore.selected.window