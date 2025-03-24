#
#
#
$data modify storage uicore:api/v1/goto_screen io set value {window_id:$(window_id), namespace:$(namespace), screen_id:$(screen_id)}
return run function uicore:api/v1/goto_screen