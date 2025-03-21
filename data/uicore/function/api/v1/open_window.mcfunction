#>
# @executor - The player the window is opened for
# @param window_id - storage uicore:api/v1/open_window io.window_id : string - The window id
# @param window_title - storage uicore:api/v1/open_window io.window_title - This will display as the chest minecart name
# @output  
#
# @return 1 if the window was opened succesfully, fails if the window couldn't be opened
# 
# How to call:
# data modify storage uicore:api/v1/open_window io set value {window_id:"<ID>", window_title:"<TITLE>"}
# execute as <PLAYER> run function uicore:api/v1/open_window
#

#initialize output 
data modify storage uicore:api/v1/open_window io merge value {current_window_id:"undefined"}
data remove storage uicore:api/v1/open_window io.exception

#validate executor
execute if entity @s[type=!player] run return run function uicore:zprivate/v1/open_window/throw_not_player

function uicore:zprivate/v1/player/find_window

execute if function uicore:zprivate/v1/open_window/has_transaction_opened run return run function uicore:zprivate/v1/open_window/throw_transaction_in_progress

#close the window that is currently opened
function uicore:zprivate/v1/player/force_close_window

#make new id
execute store result score $new_id uicore.id run random value 1..
scoreboard players operation @s uicore.id = $new_id uicore.id

summon minecraft:item_display ~ ~ ~ { \
	Tags: ["uicore.new","uicore.window", "uicore.v1", "uicore"], teleport_duration: 0, \
	Passengers: [{ \
		id: "interaction", \
		Tags: ["uicore.interaction", "uicore.v1", "uicore"], \
		Passengers: [{ \
			id: "chest_minecart", \
			Tags: ["uicore.chest_minecart", "uicore.v1", "uicore"], Invulnerable: 1b, CustomDisplayTile: 1b, DisplayState: {Name: "minecraft:air"}, \
            Passengers: [{ \
                id: "marker", \
		        Tags: ["uicore.marker", "uicore.v1", "uicore"] \
            }] \
		}] \
	}] \
}

data modify storage uicore:zprivate/v1/open_window/init_window io set value {transaction:false}
execute as @e[tag=uicore.new, limit=1] run function uicore:zprivate/v1/open_window/init_window

#finally xxxxxxx
tag @e remove uicore.selected.window
