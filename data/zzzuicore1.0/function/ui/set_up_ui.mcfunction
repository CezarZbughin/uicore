scoreboard players operation @s uicore1.0.id = $newId uicore1.0.id
$execute on passengers on passengers on passengers run data modify entity @s data.uicore set value {version:"1.0", namespace:$(namespace), screen:$(screen), isTransactional:$(isTransactional)}

#TODO:
# load screen
#  

tag @e[tag=uicore.new] remove uicore.new
