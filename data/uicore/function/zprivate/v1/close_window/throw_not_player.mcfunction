data modify storage uicore:api/v1/close_window io.exception set value {invalid_executor:{}}
#finally 
tag @e remove uicore.selected.window

return fail