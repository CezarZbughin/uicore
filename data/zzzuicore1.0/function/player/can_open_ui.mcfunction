execute unless score @s uicore.id matches 1.. run return 1

scoreboard players operation $id uicore.id = @s uicore.id
execute as @e[tag=uicore1.0.root] if score @s uicore.id = $id uicore.id \
    on passengers on passengers on passengers \
    unless data entity @s {data:{uicore:{isTransactional:1}}} \
    run return 1

return fail