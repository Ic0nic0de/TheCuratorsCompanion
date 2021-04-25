ScriptName RN_Utility_InventoryMonitor2 extends ReferenceAlias

RN_PatchAPI property API auto
RN_Utility_MCM property RN_MCM auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto
formlist property TCC_ItemList_Museum_2 auto

;;Museum storage containers to check within several events.
formlist property _MuseumContainerList_WP auto

;-- Events --------------------------------

Event onInit()
	
	RegisterForModEvent("FireScripts", "_OnFireScripts")
endEvent

;-- Events --------------------------------

Event OnPlayerLoadGame()
	
	RegisterForModEvent("FireScripts", "_OnFireScripts")
endEvent

;-- Events --------------------------------

Event _OnFireScripts (string eventName, string strArg, float numArg, Form sender)

	GoToState("Running")
endEvent	

;;-- Functions ---------------------------------------

State Running
	
	Event OnBeginState()
		RemoveAllInventoryEventFilters()
		AddInventoryEventFilter(TCC_ItemList_Museum_2)
	endEvent

	Event onItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		
		if !_MuseumContainerList_WP.HasForm(akSourceContainer) && !dbmDisp.HasForm(akBaseItem)
			dbmNew.RemoveAddedForm(akBaseItem)
			dbmFound.AddForm(akBaseItem)
		endIf
	endEvent

	Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
		
		if dbmFound.HasForm(akBaseItem)	
			if !akDestContainer || (!_MuseumContainerList_WP.HasForm(akDestContainer) && API.TokenRefList.find(akDestContainer) == -1)

				Bool bDuplicate
				Int Index = API.TokenRefList.length
				while Index && !bDuplicate
					Index -=1
					if API.TokenRefList[Index] != none
						bDuplicate = API.TokenRefList[Index].GetitemCount(akBaseItem)
					endif
				endWhile
				
				if !bDuplicate && !dbmDisp.HasForm(akBaseItem)
					dbmNew.AddForm(akBaseItem)
					dbmFound.RemoveAddedForm(akBaseItem)				
				endIf
			endIf
		endIf
	endEvent
endState

;-- Events --------------------------------

auto state disabled

	Event onItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	endEvent

	Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	endEvent
endState
