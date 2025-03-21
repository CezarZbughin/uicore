#
# This function will close the window that is currently opened for the executor, it does not check if the window is transactional
# This will call the 'on_close' event handler for the screen that is opened in the window 
# @pre - the window enitity of the player must be taged with 'uicore.selected.window'
#
# @executor - the player whose window will be closed
#

execute as @e[tag=uicore.selected.window, limit=1] on passengers on passengers on passengers run data modify storage uicore:zprivate/v1/meta/call_on_close macro set from entity @s data.uicore
function uicore:zprivate/v1/meta/call_on_close with storage uicore:zprivate/v1/meta/call_on_close macro

execute as @e[tag=uicore.selected.window, limit=1] run function uicore:zprivate/v1/window/kill

scoreboard players set @s uicore.id 0 