ScriptName RN_Utility_MuseumContainerMonitor extends ObjectReference

RN_Utility_MCM property RN_MCM auto
RN_Utility_Script property RN_Utility auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto

formlist property TCC_ItemList_Safehouse auto

formlist property TCC_TokenList auto

objectreference property DISPLAYCHEST auto

;-- Events --------------------------------

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if dbmNew.HasForm(akBaseItem) && !TCC_ItemList_Safehouse.HasForm(akBaseItem) || dbmFound.HasForm(akBaseItem) && !TCC_ItemList_Safehouse.HasForm(akBaseItem)
		updateFormlists(akBaseitem, true)
	endIf
endEvent			

;-- Events --------------------------------

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if RN_Utility.DBM_CloaksStorage
		if akDestContainer == DISPLAYCHEST || akDestContainer == RN_Utility.DBM_CloaksStorage
			;;Do Nothinhg
		else
			if self.GetItemCount(akBaseItem) == 0
				if dbmDisp.HasForm(akBaseItem) && !TCC_ItemList_Safehouse.HasForm(akBaseItem)
					updateFormlists(akBaseitem, false, akDestContainer)
				endIf
			endIf	
		endIf
			
	else
		
		if self.GetItemCount(akBaseItem) == 0
			if dbmDisp.HasForm(akBaseItem) && !TCC_ItemList_Safehouse.HasForm(akBaseItem)
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
		if !TCC_TokenList.HasForm(akContainer)
			dbmNew.AddForm(akBaseItem)
		else
			dbmFound.AddForm(akBaseItem)
		endIf
	endIf
endFunction
