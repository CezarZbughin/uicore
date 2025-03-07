#>
# Closes the window of the player if they have a window with the given window ID opened
#
# @executor - The player whose window will be closed
# @param window_id - storage uicore1.0:io close_window.window_id : string - Each window has a non-unique window ID. Certain operations require
# specifying the window ID to ensure the action is performed for the correct window.
# @output window_id - storage uicore:io close_window.window_id : string - the ID of the window that was closed if
# succesful, the ID of the current window if there was a missmatch
# @output error_diffrent_window_id - storage uicore:io close_window.error_diffrent_window_id : byte - true if 
# the currently opened window has a diffrent ID than what was given as parameter  
# @return 1 if the window was closed succesfully, fails players didnt have a window with the given window ID opened
# 
# How to call:
# data modify storage uicore1.0:io close_window set value {window_id:"<ID>"}
# execute as <PLAYER> run function uicore1.0:close_window
#
execute if entity @s[type=!player] run return fail
execute unless score @s uicore.id matches 1.. run return fail

data modify storage uicore1.0:io close_window.error_different_window_id set value 0b
scoreboard players operation $id uicore.id = @s uicore.id
execute as @e[tag=uicore1.0.root] \
    if score @s uicore.id = $id uicore.id \
    on passengers on passengers on passengers \
    store success storage uicore1.0:io close_window.error_different_window_id byte 1 \
    run data modify storage uicore1.0:io close_window.window_id set from entity @s data.uicore.window_id

execute if data storage uicore1.0:io {close_window:{error_different_window_id:1b}} run return fail

function zzzuicore1.0:window/_close

return 1
