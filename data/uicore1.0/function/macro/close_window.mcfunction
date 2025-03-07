#>
# See documentation of function uicoire1.0:close_window
#
# @executor - The player whose window will be closed
# @param window_id - macro argument : string
# @output window_id - storage uicore:io close_window.window_id : string - the ID of the window that was closed if
# succesful, the ID of the current window if there was a missmatch
# @output error_diffrent_window_id - storage uicore:io close_window.error_diffrent_window_id : byte - true if 
# the currently opened window has a diffrent ID than what was given as parameter  
# @return 1 if the window was closed succesfully, fails plays didnt have a window with the given window ID opened
#
# How to call:
# function uicore1.0:macro/close_window {window_id:"<ID>"}
#
$data modify storage uicore1.0:io close_window set value {window_id:$(window_id)}
return run function uicore1.0:close_window