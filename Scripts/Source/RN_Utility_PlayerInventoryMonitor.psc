ScriptName RN_Utility_PlayerInventoryMonitor extends ReferenceAlias

RN_Utility_MCM property RN_MCM auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto

formlist property RN_TokenFormlist auto

Formlist property _SafehouseContainerList auto
Formlist property _SafehouseContainerList_WP auto

;;Museum storage containers to check within several events.
formlist property _MuseumContainerList_WP auto

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

Event onItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	
	if !_MuseumContainerList_WP.HasForm(akSourceContainer) && !dbmDisp.HasForm(akBaseItem) || !_SafehouseContainerList_WP.HasForm(akSourceContainer) && !dbmDisp.HasForm(akBaseItem) 	;; Ignore anything coming from the museum display containers, those are already handled in RN_Utility_MuseumContainerMonitor OnItemRemoved, and if dbmDisp.HasForm == true then this is a duplicate item so nothing to do here
		updateFormlists(akBaseItem, true)
	endIf
	
endEvent

;-- Events --------------------------------
		
Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	if dbmFound.HasForm(akBaseItem) && !akDestContainer || (!_MuseumContainerList_WP.HasForm(akDestContainer) && !RN_TokenFormlist.HasForm(akDestContainer)) || (!_SafehouseContainerList_WP.HasForm(akDestContainer) && !RN_TokenFormlist.HasForm(akDestContainer))
	
        Bool bMoreThanOne
        Int Index = RN_TokenFormlist.GetSize()
		
        while Index && !bMoreThanOne
			Index -=1
			ObjectReference _Container = RN_TokenFormlist.GetAt(Index) as ObjectReference
			bMoreThanOne = _Container.GetitemCount(akBaseItem)
		endWhile
		
        if !bMoreThanOne
        	updateFormlists(akBaseItem, false)
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
	Event onItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	
	endEvent

	Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	endEvent
	
endState

