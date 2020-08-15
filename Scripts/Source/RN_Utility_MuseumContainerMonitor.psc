ScriptName RN_Utility_MuseumContainerMonitor extends ObjectReference

RN_Utility_ArrayHolder property RN_Array auto

DBM_ReplicaHandler property ReplicaHandler auto

RN_Utility_MCM property RN_MCM auto

formlist property dbmNew auto 						;; Items available to be displayed
formlist property dbmFound auto 					;; Items that are in inventory or storage
formlist property dbmDisp auto 						;; Items that are on display

formlist property DBM_ReplicaBaseItems auto 		;; holds the Replica Base Items.
formlist property DBM_ReplicaItems auto 			;; Holds the Replicas.

formlist property RN_TokenFormlist auto

objectreference property DBM_CloaksStorage auto
objectreference property DISPLAYCHEST auto

;-- Events --------------------------------

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		
	if dbmNew.HasForm(akBaseItem) || dbmFound.HasForm(akBaseItem)
		processForm(akBaseitem, true)
	endIf
	
endEvent			

;-- Events --------------------------------

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	if RN_MCM.ReplicaTag
		if DBM_CloaksStorage
		
			if akDestContainer == DISPLAYCHEST || akDestContainer == DBM_CloaksStorage
				;; Do Nothing
				
			elseif self.GetItemCount(akBaseItem) == 0 && !((DBM_ReplicaBaseItems.HasForm(akBaseitem) && self.GetItemCount(ReplicaHandler.GetReplica(akBaseItem))) || (DBM_ReplicaItems.HasForm(akBaseitem) && self.GetItemCount(ReplicaHandler.GetOriginal(akBaseItem))))
				if dbmDisp.HasForm(akBaseItem)
					processForm(akBaseitem, false, akDestContainer)
				endIf
			endIf
			
		else
		
			if self.GetItemCount(akBaseItem) == 0 && !((DBM_ReplicaBaseItems.HasForm(akBaseitem) && self.GetItemCount(ReplicaHandler.GetReplica(akBaseItem))) || (DBM_ReplicaItems.HasForm(akBaseitem) && self.GetItemCount(ReplicaHandler.GetOriginal(akBaseItem))))
				if dbmDisp.HasForm(akBaseItem)
					processForm(akBaseitem, false, akDestContainer)
				endIf
			endIf
			
		endIf
	else
		if DBM_CloaksStorage
		
			if akDestContainer == DISPLAYCHEST || akDestContainer == DBM_CloaksStorage
				;; Do Nothing
				
			elseif self.GetItemCount(akBaseItem) == 0 
				if dbmDisp.HasForm(akBaseItem)
					processForm(akBaseitem, false, akDestContainer)
				endIf
			endIf
			
		else
		
			if self.GetItemCount(akBaseItem) == 0
				if dbmDisp.HasForm(akBaseItem)
					processForm(akBaseitem, false, akDestContainer)
				endIf
			endIf
			
		endIf		
	endIf
endEvent

;-- Events --------------------------------

function processForm(form akBaseItem, bool added, ObjectReference akContainer = none)

	updateFormlists(akBaseitem, added, akContainer)
	
	if RN_MCM.ReplicaTag	
		if DBM_ReplicaBaseItems.HasForm(akBaseitem)											;; If the item being processed is a "Base Item" ...		
			
			updateFormlists(ReplicaHandler.GetReplica(akBaseItem), added, akContainer)		;; ... we also need to process the replica
				
		elseif DBM_ReplicaItems.HasForm(akBaseitem)											;; If the item being processed is a "Replica" ...

			updateFormlists(ReplicaHandler.GetOriginal(akBaseItem), added, akContainer)		;; ... we also need to process the original

		endIf
	endIf
	
endFunction

;-- Events --------------------------------

function updateFormlists(form akBaseItem, bool added, ObjectReference akContainer)

	if added
		dbmDisp.AddForm(akBaseItem)
		dbmFound.RemoveAddedForm(akBaseItem)			;; Anything coming into one of the display chests should only be coming from dbmFound
		dbmNew.RemoveAddedForm(akBaseItem)				;; But just to make sure lets do this too
	else
		dbmDisp.RemoveAddedForm(akBaseItem)
		if !RN_TokenFormlist.HasForm(akContainer) 	;; If it is somehow being taken out and isn't ending up in the player's inventory or one of the other containers from the list (should never be the case, just covering all bases)
			dbmNew.AddForm(akBaseItem)
		else
			dbmFound.AddForm(akBaseItem)
		endIf
	endIf
	
endFunction

