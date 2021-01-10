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

	if !TCC_ItemList_Safehouse.HasForm(akBaseItem)
		if dbmNew.HasForm(akBaseItem) || dbmFound.HasForm(akBaseItem)
			dbmDisp.AddForm(akBaseItem)
			dbmFound.RemoveAddedForm(akBaseItem)
			dbmNew.RemoveAddedForm(akBaseItem)
		endIf
	endIf
endEvent			

;-- Events --------------------------------

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if !TCC_ItemList_Safehouse.HasForm(akBaseItem)
	
		if RN_Utility.DBM_CloaksStorage
			if !akDestContainer == DISPLAYCHEST || !akDestContainer == RN_Utility.DBM_CloaksStorage
				if !self.GetItemCount(akBaseItem)
					if dbmDisp.HasForm(akBaseItem)
						dbmDisp.RemoveAddedForm(akBaseItem)
						if !TCC_TokenList.HasForm(akDestContainer)
							dbmNew.AddForm(akBaseItem)
						else
							dbmFound.AddForm(akBaseItem)
						endIf					
					endIf
				endIf	
			endIf
			
		else
		
			if !self.GetItemCount(akBaseItem)
				if dbmDisp.HasForm(akBaseItem)
					dbmDisp.RemoveAddedForm(akBaseItem)
					if !TCC_TokenList.HasForm(akDestContainer)
						dbmNew.AddForm(akBaseItem)
					else
						dbmFound.AddForm(akBaseItem)
					endIf
				endIf
			endIf	
		endIf
	endIf		
endEvent
