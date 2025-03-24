#
# @executor minecart
#
data modify storage uicore:tmp current_items set from entity @s Items
#set previous items
execute on passengers run data modify entity @s data.uicore.previous_items set from storage uicore:tmp current_items

#set previous input
data remove storage uicore:tmp current_items[{components:{"minecraft:custom_data":{uicore:{}}}}]
execute on passengers run data modify entity @s data.uicore.previous_input set from storage uicore:tmp current_items
