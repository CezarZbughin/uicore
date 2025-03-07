execute unless score @s uicore.id matches 1.. run return 1

scoreboard players operation $id uicore.id = @s uicore.id
execute as @e[tag=uicore1.0.root] if score @s uicore.id = $id uicore.id \
    on passengers on passengers on passengers \
    if data entity @s {data:{uicore:{transaction:1}}} \
    run return fail

return 1