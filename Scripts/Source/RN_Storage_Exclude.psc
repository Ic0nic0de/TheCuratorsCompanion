ScriptName RN_Storage_Exclude extends objectreference

formlist property RN_ExcludedItems_Generic auto

;;------------------------------------------------------------------------------------------
	
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		
	if !RN_ExcludedItems_Generic.HasForm(akBaseItem)		
		RN_ExcludedItems_Generic.AddForm(akBaseItem)		
	endif
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	if RN_ExcludedItems_Generic.HasForm(akBaseItem)
		RN_ExcludedItems_Generic.RemoveAddedForm(akBaseItem)
	endif
endEvent

