#check current entity is a player
execute if entity @s[type=!player] run return fail

execute unless function zzzuicore1.0:player/can_open_ui run return fail

scoreboard players operation $id uicore1.0.id = @s uicore1.0.id
execute as @e[tag=uicore1.0.root] if score @s uicore1.0.id = $id uicore1.0.id run function zzzuicore1.0:ui/kill

#make new id
execute store result score $newId uicore1.0.id run random value 1..
scoreboard players operation @s uicore1.0.id = $newId uicore1.0.id

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

$execute as @e[tag=uicore.new,limit=1] run function zzzuicore1.0:ui/set_up_ui {namespace:$(namespace), screen:$(screen), isTransactional:$(isTransactional)}




