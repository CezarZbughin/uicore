execute if entity @s[type=!player] run return fail

scoreboard players operation $id uicore.id = @s uicore.id
execute as @e[tag=uicore1.0.root] if score @s uicore.id = $id uicore.id run function zzzuicore1.0:ui/kill

scoreboard players reset @s uicore.id