data modify storage uicore:api/v1/close_window io.exception set value {window_exception:{no_active_window:{}}}
#finally 
tag @e remove uicore.selected.window

return fail