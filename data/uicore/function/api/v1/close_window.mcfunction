#>
# Closes the window of the executor player if window id matches the one sent as parameter
#
# @executor - The player whose window will be closed
# @param window_id - storage uicore:api/v1/close_window io.window_id : string
# @output current_window_id - storage uicore:api/v1/close_window io.current_window_id : string - the window id before the call
# @return
# 
# How to call:
# data modify storage uicore:api/v1/close_window io set value {window_id:"<ID>"}
# execute as <PLAYER> run function uicore:api/v1/close_window
#

#initialize output 
data remove storage uicore:api/v1/close_window io.exception
data modify storage uicore:api/v1/close_window io.current_window_id set value "undefined"

#validate executor
execute if entity @s[type=!player] run return run function uicore:zprivate/v1/close_window/throw_not_player

execute unless function uicore:zprivate/v1/player/find_window run return run function uicore:zprivate/v1/close_window/throw_no_active_window

data modify storage uicore:api/v1/close_window io.current_window_id set from storage uicore:api/v1/close_window io.window_id

#check window id matches the id of the current window
execute as @e[tag=uicore.selected.window] \
    on passengers \
        on passengers \
            on passengers \
                store success storage uicore:tmp different_window_id byte 1 \
                    run data modify storage uicore:api/v1/close_window io.current_window_id set from entity @s data.uicore.window_id

execute if data storage uicore:tmp {different_window_id:1b} run return run function uicore:zprivate/v1/close_window/throw_window_id_mismatch

function uicore:zprivate/v1/player/force_close_window

return 1





