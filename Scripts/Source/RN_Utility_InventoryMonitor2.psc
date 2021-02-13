ScriptName RN_Utility_InventoryMonitor2 extends ReferenceAlias

RN_Utility_MCM property RN_MCM auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto

formlist property TCC_TokenList auto
formlist property TCC_ItemList_Museum_2 auto

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
	AddInventoryEventFilter(TCC_ItemList_Museum_2)
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
	
	if !_MuseumContainerList_WP.HasForm(akSourceContainer) && !dbmDisp.HasForm(akBaseItem)
		dbmNew.RemoveAddedForm(akBaseItem)
		dbmFound.AddForm(akBaseItem)
	endIf
endEvent

;-- Events --------------------------------
		
Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if dbmFound.HasForm(akBaseItem)	
		if !akDestContainer || (!_MuseumContainerList_WP.HasForm(akDestContainer) && TokenList.find(akDestContainer) == -1)

			Bool bDuplicate
			Int Index = TokenList.length
			while Index > 0 && !bDuplicate
				Index -=1
				if TokenList[Index] != none
					bDuplicate = TokenList[Index].GetitemCount(akBaseItem)
				endif
			endWhile
			
			if !bDuplicate && !dbmDisp.HasForm(akBaseItem)
				dbmNew.AddForm(akBaseItem)
				dbmFound.RemoveAddedForm(akBaseItem)
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
