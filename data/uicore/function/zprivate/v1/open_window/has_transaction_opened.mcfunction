#
# @pre This function expects the window of the player to be taged with 'uicore.selected.window'
#
execute as @e[tag=uicore.selected.window, limit=1] on passengers on passengers on passengers if data entity @s {data:{uicore:{transaction:1b}}} run return 1
return 0

