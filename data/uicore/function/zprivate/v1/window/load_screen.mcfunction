#
#
#

#reset exception
data remove storage uicore:thrown exception

data modify storage uicore:tmp success_fetch_screen set value 0b
$execute store success storage uicore:tmp success_fetch_screen byte 1 run \
    data modify entity @s Items set from storage uicore.$(namespace):screens $(screen_id).layout
    
execute if data storage uicore:tmp {success_fetch_screen:0b} run return run function uicore:zprivate/v1/throw/screen_not_found

#add id to all items
execute store result entity @s Items[].components."minecraft:custom_data".uicore.player_id int 1 run scoreboard players get @s uicore.id

$execute on passengers run data modify entity @s data.uicore merge value {namespace:$(namespace), screen:$(screen_id)}
return 1