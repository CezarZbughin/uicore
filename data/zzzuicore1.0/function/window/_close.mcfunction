#
#
#

scoreboard players operation $id uicore.id = @s uicore.id
execute as @e[tag=uicore1.0.root] if score @s uicore.id = $id uicore.id run function zzzuicore1.0:window/_kill

scoreboard players set @s uicore.id 0 