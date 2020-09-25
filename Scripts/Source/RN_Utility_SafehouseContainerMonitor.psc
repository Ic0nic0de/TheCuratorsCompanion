ScriptName RN_Utility_SafehouseContainerMonitor extends ObjectReference

RN_Utility_MCM property RN_MCM auto

formlist property dbmNew auto 						;; Items available to be displayed
formlist property dbmFound auto 					;; Items that are in inventory or storage
formlist property dbmDisp auto 						;; Items that are on display

formlist property _ChestSpecificItems auto

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
	AddInventoryEventFilter(_ChestSpecificItems)
	GoToState("")
endEvent

;-- Events --------------------------------

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		
	if dbmNew.HasForm(akBaseItem) && _ChestSpecificItems.HasForm(akBaseItem) || dbmFound.HasForm(akBaseItem) && _ChestSpecificItems.HasForm(akBaseItem)
		updateFormlists(akBaseitem, true)
	endIf	
endEvent			

;-- Events --------------------------------

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if self.GetItemCount(akBaseItem) == 0
		if dbmDisp.HasForm(akBaseItem)
			updateFormlists(akBaseitem, false, akDestContainer)
		endIf
	endIf	
endEvent

;-- Events --------------------------------

function updateFormlists(form akBaseItem, bool added, ObjectReference akContainer = none)

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

;-- Events --------------------------------

state DISABLED

	Event onItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	endEvent

	Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	endEvent
endState
