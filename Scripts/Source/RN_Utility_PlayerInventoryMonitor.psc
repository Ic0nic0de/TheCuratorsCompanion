ScriptName RN_Utility_PlayerInventoryMonitor extends ReferenceAlias

RN_Utility_MCM property RN_MCM auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto

formlist property TCC_TokenList auto

formlist property TCC_ItemList_Safehouse auto

;;Museum storage containers to check within several events.
formlist property _MuseumContainerList_WP auto

objectreference[] TokenList

;-- Events --------------------------------

Event onInit()
	RegisterForModEvent("Update_TokenArray", "_Update")
	GoToState("DISABLED")
endEvent

;-- Events --------------------------------

Event OnPlayerLoadGame()
	
	RegisterForModEvent("Update_TokenArray", "_Update")
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(dbmNew)
	AddInventoryEventFilter(dbmFound)
	AddInventoryEventFilter(dbmDisp)
	GoToState("")
endEvent

;-- Events --------------------------------

Event _Update(string eventName, string strArg, float numArg, Form sender)
	
	;Debug.Notification(strArg)
	
	TokenList = new objectreference[128]
	Int _Index = 0
	While _Index < TCC_TokenList.GetSize()
		objectreference _Ref = TCC_TokenList.GetAt(_Index) as objectreference
		TokenList[_Index] = _Ref
		_Index += 1
	endWhile
endEvent

;-- Events --------------------------------

Event onItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	
	if !TCC_ItemList_Safehouse.HasForm(akBaseItem)
		if !_MuseumContainerList_WP.HasForm(akSourceContainer) && !dbmDisp.HasForm(akBaseItem)
			dbmNew.RemoveAddedForm(akBaseItem)
			dbmFound.AddForm(akBaseItem)
		endIf
	endIf
endEvent

;-- Events --------------------------------
		
Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if !TCC_ItemList_Safehouse.HasForm(akBaseItem) && dbmFound.HasForm(akBaseItem)	
		if !akDestContainer || (!_MuseumContainerList_WP.HasForm(akDestContainer) && !TCC_TokenList.HasForm(akDestContainer))

			Bool bDuplicate
			Int Index = 0
			Int Total = TCC_TokenList.GetSize()
			while Index && !bDuplicate
				bDuplicate = TokenList[Index].GetitemCount(akBaseItem)
				Index +=1
			endWhile
			
			if !bDuplicate
				if !dbmDisp.HasForm(akBaseItem)
					dbmNew.AddForm(akBaseItem)
					dbmFound.RemoveAddedForm(akBaseItem)
				endIF
			endIf
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
