execute if entity @s[type=!player] run return fail

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

scoreboard players operation @e[tag=uicore.new,limit=1] uicore1.0.id = $newId uicore1.0.id
tag @e[tag=uicore.new] remove uicore.new

