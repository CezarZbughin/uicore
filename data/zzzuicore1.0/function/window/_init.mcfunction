scoreboard players operation @s uicore.id = $newId uicore.id
execute on passengers on passengers on passengers run data modify entity @s data.uicore.window_id set from storage uicore1.0:io open_window.window_id
execute on passengers on passengers on passengers run data modify entity @s data.uicore.window_title set from storage uicore1.0:io open_window.window_title
execute on passengers on passengers run data modify entity @s CustomName set from storage uicore1.0:io open_window.window_title
execute on passengers on passengers on passengers run data modify entity @s data.uicore.transaction set from storage zzzuicore1.0:io window/_init.transaction
tag @e[tag=uicore.new] remove uicore.new
