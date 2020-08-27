ScriptName RN_Storage_Exclude extends objectreference

formlist property RN_ExcludedItems_Custom auto

;;------------------------------------------------------------------------------------------
	
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		
	if !RN_ExcludedItems_Custom.HasForm(akBaseItem)		
		RN_ExcludedItems_Custom.AddForm(akBaseItem)		
	endif
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	if RN_ExcludedItems_Custom.HasForm(akBaseItem)
		RN_ExcludedItems_Custom.RemoveAddedForm(akBaseItem)
	endif
endEvent

