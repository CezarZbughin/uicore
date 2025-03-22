data modify storage uicore:api/v1/open_window io.exception set value {transaction_in_progress:{}}
#finally 
tag @e remove uicore.selected.window

return fail