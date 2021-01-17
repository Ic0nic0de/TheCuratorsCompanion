ScriptName RN_Storage_Exclude extends objectreference

formlist property RN_ExcludedItems_Generic auto

;;------------------------------------------------------------------------------------------
	
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
			
	RN_ExcludedItems_Generic.AddForm(akBaseItem)
	TCCDebug.Log("Storage Exclude - Added [" +  akBaseItem.GetName() + "] " + akBaseItem + " to RN_ExcludedItems_Generic", 0)
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	RN_ExcludedItems_Generic.RemoveAddedForm(akBaseItem)
	TCCDebug.Log("Storage Exclude - Removed [" +  akBaseItem.GetName() + "] " + akBaseItem + " from RN_ExcludedItems_Generic", 0)
endEvent

