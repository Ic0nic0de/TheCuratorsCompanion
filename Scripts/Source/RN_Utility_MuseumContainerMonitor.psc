ScriptName RN_Utility_MuseumContainerMonitor extends ObjectReference

RN_Utility_MCM property RN_MCM auto
RN_Utility_Script property RN_Utility auto

DBM_ReplicaHandler property ReplicaHandler auto

Formlist property DBM_ReplicaBaseItems auto
formlist property DBM_ReplicaItems auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto

formlist property TCC_TokenList auto

objectreference property DISPLAYCHEST auto

;-- Events --------------------------------

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if dbmNew.HasForm(akBaseItem) || dbmFound.HasForm(akBaseItem)
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
				if dbmDisp.HasForm(akBaseItem) 
					updateFormlists(akBaseitem, false, akDestContainer)
				endIf
			endIf	
		endIf
			
	else
		
		if self.GetItemCount(akBaseItem) == 0
			if dbmDisp.HasForm(akBaseItem)
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
	
	if RN_MCM.ReplicaTag
		ProcessReplica(akBaseItem, added, akContainer)
	endif
endFunction

function ProcessReplica(form akBaseItem, bool added, ObjectReference akContainer = none)
		
	if added
		if DBM_ReplicaBaseItems.HasForm(akBaseitem)		
			dbmDisp.AddForm(ReplicaHandler.GetReplica(akBaseItem))
			dbmFound.RemoveAddedForm(ReplicaHandler.GetReplica(akBaseItem))
			dbmNew.RemoveAddedForm(ReplicaHandler.GetReplica(akBaseItem))
		elseif DBM_ReplicaItems.HasForm(akBaseitem)
			dbmDisp.AddForm(ReplicaHandler.GetOriginal(akBaseItem))
			dbmFound.RemoveAddedForm(ReplicaHandler.GetOriginal(akBaseItem))
			dbmNew.RemoveAddedForm(ReplicaHandler.GetOriginal(akBaseItem))
		endIf
	else
		if DBM_ReplicaBaseItems.HasForm(akBaseitem)		
			dbmDisp.RemoveAddedForm(ReplicaHandler.GetReplica(akBaseItem))
			if !TCC_TokenList.HasForm(akContainer)
				dbmNew.AddForm(ReplicaHandler.GetReplica(akBaseItem))
			else
				dbmFound.AddForm(ReplicaHandler.GetReplica(akBaseItem))
			endIf			
			
		elseif DBM_ReplicaItems.HasForm(akBaseitem)
			dbmDisp.RemoveAddedForm(ReplicaHandler.GetOriginal(akBaseItem))
			if !TCC_TokenList.HasForm(akContainer)
				dbmNew.AddForm(ReplicaHandler.GetOriginal(akBaseItem))
			else
				dbmFound.AddForm(ReplicaHandler.GetOriginal(akBaseItem))
			endIf					
		endIf	
	endIf		
endFunction


