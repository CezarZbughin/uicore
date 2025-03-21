#
#
#

$data modify storage uicore:api/v1/open_window io set value {window_id:$(window_id), window_title:$(window_title)}
return run function uicore:api/v1/open_window