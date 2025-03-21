execute as @a[scores={uicore.id=1..}] at @s run function uicore:zprivate/v1/player/tick_player
execute as @e[tag=uicore.window, tag=uicore.v1] at @s run function uicore:zprivate/v1/window/tick_window