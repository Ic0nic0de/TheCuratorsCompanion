ScriptName RN_Utility_MuseumContainerMonitor extends ObjectReference

RN_Utility_MCM property RN_MCM auto
RN_Utility_Mods property RN_Mod auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto

formlist property RN_Safehouse_Items_Merged auto

formlist property RN_TokenFormlist auto

objectreference property DISPLAYCHEST auto

;-- Events --------------------------------

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		
	if dbmNew.HasForm(akBaseItem) && !RN_Safehouse_Items_Merged.HasForm(akBaseItem) || dbmFound.HasForm(akBaseItem) && !RN_Safehouse_Items_Merged.HasForm(akBaseItem)
		updateFormlists(akBaseitem, true)
	endIf
	
endEvent			

;-- Events --------------------------------

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	if RN_Mod.DBM_CloaksStorage
		if akDestContainer == DISPLAYCHEST || akDestContainer == RN_Mod.DBM_CloaksStorage
			;;Do Nothinhg
		else
			if self.GetItemCount(akBaseItem) == 0
				if dbmDisp.HasForm(akBaseItem) && !RN_Safehouse_Items_Merged.HasForm(akBaseItem)
					updateFormlists(akBaseitem, false, akDestContainer)
				endIf
			endIf	
		endIf
			
	else
		
		if self.GetItemCount(akBaseItem) == 0
			if dbmDisp.HasForm(akBaseItem) && !RN_Safehouse_Items_Merged.HasForm(akBaseItem)
				updateFormlists(akBaseitem, false, akDestContainer)
			endIf
		endIf	
	endIf		
endEvent

;-- Events --------------------------------

function updateFormlists(form akBaseItem, bool added, ObjectReference akContainer = none)

	if added
		dbmDisp.AddForm(akBaseItem)
		dbmFound.RemoveAddedForm(akBaseItem)
		dbmNew.RemoveAddedForm(akBaseItem)
	else
		dbmDisp.RemoveAddedForm(akBaseItem)
		if !RN_TokenFormlist.HasForm(akContainer)
			dbmNew.AddForm(akBaseItem)
		else
			dbmFound.AddForm(akBaseItem)
		endIf
	endIf
	
endFunction

