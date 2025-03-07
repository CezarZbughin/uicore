#>
# See documentation of function uicoire1.0:open_window
#
# @executor - The player the window is opened for
# @param window_id - macro argument : string 
# @param window_title - macro argument : string
# @return 1 if the window was opened succesfully, fails if the window couldn't be opened
#
# How to call:
# function uicore1.0:macro/open_window {window_id:"<ID>", window_title:"<TITLE>"}
#
$data modify storage uicore1.0:io open_window set value {window_id:$(window_id), window_title:$(window_title)}
return run function uicore1.0:open_window