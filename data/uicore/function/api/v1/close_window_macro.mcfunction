#
#
#
$data modify storage uicore:api/v1/close_window io set value {window_id:$(window_id)}
return run function uicore:api/v1/close_window