ScriptName RN_Storage_Restrict extends objectreference

;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

formlist property dbmMaster auto 
formlist property dbmDisp auto 	;; Items that are on display

;;Mod start up global variable.
globalvariable property RN_Setup_Start auto

;;------------------------------------------------------------------------------------------

Function OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if (RN_Setup_Start.GetValue()) 	;; If setup hasn't finished, return the item to player.	
	
		RemoveItem(akBaseItem, aiItemCount, TRUE, akSourceContainer)	
		Debug.MessageBox("The Relic Storage Container is unavailable during mod setup")
		return
	endif
	
	if MCM.Restricted
	
		if !dbmMaster.HasForm(akBaseItem)	;; If the item is not a displayable relic, return the item to the player.
			
			RemoveItem(akBaseItem, aiItemCount, TRUE, akSourceContainer)
			Debug.MessageBox(akBaseItem.GetName() + " is not displayable at the Museum")
			
		elseif dbmDisp.HasForm(akBaseItem) 			;; if the item is displayed, return the item to the player.
			
			RemoveItem(akBaseItem, aiItemCount, TRUE, akSourceContainer)
			Debug.MessageBox(akBaseItem.GetName() + "  is already on display at the Museum")	
		
		endif
	endIf
endFunction

