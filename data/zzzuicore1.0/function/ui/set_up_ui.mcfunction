scoreboard players operation @s uicore.id = $newId uicore.id
$execute on passengers on passengers on passengers run data modify entity @s data.uicore set value {namespace:$(namespace), screen:$(screen), isTransactional:$(isTransactional)}

#TODO:
# load screen
#  

tag @e[tag=uicore.new] remove uicore.new
