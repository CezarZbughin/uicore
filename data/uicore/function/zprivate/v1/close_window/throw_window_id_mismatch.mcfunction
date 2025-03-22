data modify storage uicore:api/v1/close_window io.exception set value {window_exception:{window_id_mismatch:{}}}
#finally 
tag @e remove uicore.selected.window

return fail