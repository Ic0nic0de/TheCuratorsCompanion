ScriptName RN_Storage_Exclude extends objectreference

formlist property RN_ExcludedItems_Generic auto

;;------------------------------------------------------------------------------------------
	
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
			
	RN_ExcludedItems_Generic.AddForm(akBaseItem)		
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	RN_ExcludedItems_Generic.RemoveAddedForm(akBaseItem)
endEvent

