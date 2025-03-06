#this will modify the item hold in the main hand to have the icon id given as argument
$data modify storage minecraft:uicore icon_id set value "$(icon_id)"
item modify entity @s weapon uicore1.0:set_icon_id