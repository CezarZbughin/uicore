#
#
#

#initialize output 
data remove storage uicore:thrown exception

execute if entity @s[type=!player] run return run function uicore:zprivate/v1/throw/invalid_executor

execute unless function uicore:zprivate/v1/player/find_window run return run function uicore:zprivate/v1/throw/no_active_window

#check window id matches the id of the current window
data modify storage uicore:tmp current_window_id set from storage uicore:api/v1/goto_screen io.window_id
data modify storage uicore:tmp different_window_id set value 0b
execute as @e[tag=uicore.selected.window] \
    on passengers \
        on passengers \
            on passengers \
                store success storage uicore:tmp different_window_id byte 1 \
                    run data modify storage uicore:tmp current_window_id set from entity @s data.uicore.window_id

execute if data storage uicore:tmp {different_window_id:1b} run return run function uicore:zprivate/v1/throw/window_id_mismatch

#try
execute as @e[tag=uicore.selected.window] \
    on passengers \
        on passengers run \
            function uicore:zprivate/v1/window/load_screen with storage uicore:api/v1/goto_screen io
#catch - throw on
execute if data storage uicore:thrown exception.screen_not_found run return fail
#endtry

function uicore:zprivate/v1/meta/call_on_init with storage uicore:api/v1/goto_screen io

execute as @e[tag=uicore.selected.window] \
    on passengers \ 
        on passengers run \
            function uicore:zprivate/v1/goto_screen/after_on_init
