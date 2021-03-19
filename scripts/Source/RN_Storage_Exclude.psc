ScriptName RN_Storage_Exclude extends objectreference

;;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM auto

formlist property RN_ExcludedItems_Generic auto

;;------------------------------------------------------------------------------------------
	
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
			
	RN_ExcludedItems_Generic.AddForm(akBaseItem)
	if !MCM.advdebug
		TCCDebug.Log("Storage Exclude - Added [" +  akBaseItem.GetName() + "] " + akBaseItem + " to RN_ExcludedItems_Generic", 0)
	endif
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	RN_ExcludedItems_Generic.RemoveAddedForm(akBaseItem)
	if !MCM.advdebug
		TCCDebug.Log("Storage Exclude - Removed [" +  akBaseItem.GetName() + "] " + akBaseItem + " from RN_ExcludedItems_Generic", 0)
	endif
endEvent

