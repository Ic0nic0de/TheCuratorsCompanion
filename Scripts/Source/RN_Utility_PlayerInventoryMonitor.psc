ScriptName RN_Utility_PlayerInventoryMonitor extends ReferenceAlias

RN_Utility_ArrayHolder property RN_Array auto

DBM_ReplicaHandler Property ReplicaHandler Auto

RN_Utility_MCM property RN_MCM auto

formlist property dbmNew auto 						;; Items available to be displayed
formlist property dbmFound auto 					;; Items that are in inventory or storage
formlist property dbmDisp auto 						;; Items that are on display

Formlist property DBM_ReplicaBaseItems auto 		;; holds the Replica Base Items.
formlist property DBM_ReplicaItems auto 			;; Holds the Replicas.

formlist property RN_TokenFormlist auto

;-- Events --------------------------------

Event onInit()
	
	GoToState("DISABLED")	
endEvent

;-- Events --------------------------------

Event OnPlayerLoadGame()

	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(dbmNew)
	AddInventoryEventFilter(dbmFound)
	AddInventoryEventFilter(dbmDisp)
	
	GoToState("")
endEvent

;-- Events --------------------------------

Event onItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	
	if RN_Array._MuseumContainerArray_WP.Find(akSourceContainer) == -1 && !dbmDisp.HasForm(akBaseItem) || RN_Array._SafehouseContainerArray_WP.Find(akSourceContainer) == -1 && !dbmDisp.HasForm(akBaseItem) 	;; Ignore anything coming from the museum display containers, those are already handled in RN_Utility_MuseumContainerMonitor OnItemRemoved, and if dbmDisp.HasForm == true then this is a duplicate item so nothing to do here
		processForm(akBaseItem, true)
	endIf
	
endEvent

;-- Events --------------------------------
		
Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	if dbmFound.HasForm(akBaseItem) && !akDestContainer || (RN_Array._MuseumContainerArray_WP.Find(akDestContainer) == -1 && !RN_TokenFormlist.HasForm(akDestContainer)) || (RN_Array._SafehouseContainerArray_WP.Find(akDestContainer) == -1 && !RN_TokenFormlist.HasForm(akDestContainer))
	
        Bool bMoreThanOne
        Int Index = RN_TokenFormlist.GetSize()
		
        while Index && !bMoreThanOne
			Index -=1
			ObjectReference _Container = RN_TokenFormlist.GetAt(Index) as ObjectReference
			
			if RN_MCM.ReplicaTag
				bMoreThanOne = _Container.GetitemCount(akBaseItem) || (DBM_ReplicaBaseItems.HasForm(akBaseitem) && _Container.GetitemCount(ReplicaHandler.GetReplica(akBaseItem))) || (DBM_ReplicaItems.HasForm(akBaseitem) && _Container.GetitemCount(ReplicaHandler.GetOriginal(akBaseItem)))
			else
				bMoreThanOne = _Container.GetitemCount(akBaseItem)
			endIf

		endWhile
		
        if !bMoreThanOne
        	processForm(akBaseItem, false)
        endIf
		
    endIf
	
endEvent

;-- Events --------------------------------

Event processForm(form akBaseItem, bool added)

	updateFormlists(akBaseitem, added)
	
	if RN_MCM.ReplicaTag
		if DBM_ReplicaBaseItems.HasForm(akBaseitem)								;; If the item being processed is a "Base Item" ...				
			updateFormlists(ReplicaHandler.GetReplica(akBaseItem), added)		;; ... we also need to process the replica
				
		elseif DBM_ReplicaItems.HasForm(akBaseitem)								;; If the item being processed is a "Replica" ...
			updateFormlists(ReplicaHandler.GetOriginal(akBaseItem), added)		;; ... we also need to process the original

		endIf
	endIf
endEvent

;-- Events --------------------------------

Event updateFormlists(form akBaseItem, bool added)

	if added
		if !dbmDisp.HasForm(akBaseItem)
			dbmNew.RemoveAddedForm(akBaseItem)
			dbmFound.AddForm(akBaseItem)
		endIf
		
	else
		if !dbmDisp.HasForm(akBaseItem)
			dbmNew.AddForm(akBaseItem)
			dbmFound.RemoveAddedForm(akBaseItem)
		endIf
	endIf
	
endEvent

;-- Events --------------------------------

state DISABLED
	Event onItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	
	endEvent

	Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	endEvent
	
endState

