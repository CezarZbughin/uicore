execute if entity @s[type=!player] run return fail

scoreboard players operation $id uicore1.0.id = @s uicore1.0.id
execute as @e[tag=uicore1.0.root] if score @s uicore1.0.id = $id uicore1.0.id run function zzzuicore1.0:ui/kill

scoreboard players reset @s uicore1.0.id