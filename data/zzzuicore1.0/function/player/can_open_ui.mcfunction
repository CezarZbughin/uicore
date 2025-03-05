execute unless score @s uicore1.0.id matches 1.. run return 1

scoreboard players operation $id uicore1.0.id = @s uicore1.0.id
execute as @e[tag=uicore1.0.root] if score @s uicore1.0.id = $id uicore1.0.id \
    on passengers on passengers on passengers \
    unless data entity @s {data:{uicore:{isTransactional:1}}} \
    run return 1

return fail