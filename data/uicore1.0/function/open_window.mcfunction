#>
# This function opens a *window* for a player. When a player has a *window* opened, a chest minecart will attach to its head.  
# This function will create a blank window; windows inhabit *screens*. *screens* model the contents of the window, defining its layout. 
#
# Multiple datapack might try to open windows at same time. Good news is: there is protocol to handle that: 
# A window can be transactional or not. If it is NOT transactional and some other datapack wants to open a window, then the
# non-transactional window will be closed and the open request will be fulfilled regardless of the type of new window
# If the window is transactional, then no other window (transactional or not) can be opened until the transactional window
# is explicitly closed via function close_window 
#
# @executor - The player the window is opened for
# @param window_id - storage uicore1.0:io open_window.window_id : string - Each window has a non-unique window ID. Certain operations require
# specifying the window ID to ensure the action is performed for the correct window.
# @param window_title : string - storage uicore1.0:io open_window.window_title - This will display as the chest minecart name
# @return 1 if the window was opened succesfully, fails if the window couldn't be opened
# 
# How to call:
# data modify storage uicore1.0:io open_window set value {window_id:"<ID>", window_title:"<TITLE>"}
# execute as <PLAYER> run function uicore1.0:open_window
#
execute if entity @s[type=!player] run return fail
execute unless function zzzuicore1.0:player/_can_open_ui run return fail

function zzzuicore1.0:window/_close

#make new id
execute store result score $newId uicore.id run random value 1..
scoreboard players operation @s uicore.id = $newId uicore.id

summon minecraft:item_display ~ ~ ~ { \
	Tags: ["uicore1.0.root", "uicore.new", "uicore"], teleport_duration: 0, \
	Passengers: [{ \
		id: "interaction", \
		Tags: ["uicore1.0.interaction", "uicore"], \
		Passengers: [{ \
			id: "chest_minecart", \
			Tags: ["uicore1.0.chest_minecart", "uicore"], Invulnerable: 1b, CustomDisplayTile: 1b, DisplayState: {Name: "minecraft:air"}, \
            Passengers: [{ \
                id: "marker", \
		        Tags: ["uicore1.0.marker", "uicore"] \
            }] \
		}] \
	}] \
}

data modify storage zzzuicore1.0:io window/_init set value {transaction:false}
execute as @e[tag=uicore.new,limit=1] run function zzzuicore1.0:window/_init





