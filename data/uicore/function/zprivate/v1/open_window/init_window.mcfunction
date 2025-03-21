#
#
#
say cac
scoreboard players operation @s uicore.id = $new_id uicore.id
execute on passengers run scoreboard players operation @s uicore.id = $new_id uicore.id
execute on passengers on passengers run scoreboard players operation @s uicore.id = $new_id uicore.id
execute on passengers on passengers on passengers run scoreboard players operation @s uicore.id = $new_id uicore.id

execute on passengers on passengers on passengers run data modify entity @s data.uicore.window_id set from storage uicore:api/v1/open_window io.window_id
execute on passengers on passengers on passengers run data modify entity @s data.uicore.window_title set from storage uicore:api/v1/open_window io.window_title
execute on passengers on passengers run data modify entity @s CustomName set from storage uicore:api/v1/open_window io.window_title
execute on passengers on passengers on passengers run data modify entity @s data.uicore.transaction set from storage uicore:zprivate/v1/open_window/init_window io.transaction
tag @e remove uicore.new
