data modify storage uicore:thrown exception set value {window_id_mismatch:{}}
data modify storage uicore:thrown exception.window_id_mismatch.current set from storage uicore:zprivate/v1/throw/window_id_mismatch current_window_id
return fail