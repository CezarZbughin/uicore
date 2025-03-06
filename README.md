# features
- **save screen**  -> save_screen(namespace,screen,layout)
	- transforme data and store
		- validate the data
		- save it in a generic format that can later be compiled
	- compile screen
		- we need to itterete the layout and generete data that the ui entity can operate on
		- the result of the complie should make loading efficient, we dont want to do a lot of transformations online

- **load screen** -> load_screen(namespace, screen)


- **screen**
icon click detection

# questions
 - screen compilation on reload / lazy compile
	- on reload:
		- clean appoach
		- no online compilation => efficiency
		- CON requires dp syncronization that might me needed anyway
	- lazy:
		- CON requires checking if the seen is complied every time we load
		- flexible as no reload is needed to recomplie screen 
 - screens are loaded on players or on ui entities
	- on players -> then why ui entities are a thing anymore
	- on ui entityes -> the how does the user know which entity is which

# design
open_ui(player, namespace, screen, isTransactional)

in layout : 
custom_data : {
    uicore : {
        icon_id : "home"
    }
}


mc:uicore_namepace_repo
{
    screen0 : {
        layout : [{custom_data:{uicore:{icon_id:"home"}}}]
    }
}

{
	data: {
		uicore: {
			isTransactional: 0,
			namespace: "game.ui",
			screen: "screen0",
			layout: [
				{
					custom_data: {
						uicore: {
							icon_id: "home"
						},
						uicoremeta: {
                            hasOnClick : 1
                        }
					}
				}
			]
		}
	}
}


# redesign
- open_window(player, window_id)
- goto_screen(player, window_id, namespace, screen_id)
- close_window(window_id)