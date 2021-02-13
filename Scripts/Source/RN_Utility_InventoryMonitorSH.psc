ScriptName RN_Utility_InventoryMonitorSH extends ReferenceAlias

RN_Utility_MCM property RN_MCM auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto

formlist property TCC_TokenList auto

Formlist property _SafehouseContainerList_WP auto

Formlist property TCC_ItemList_Safehouse auto

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
	AddInventoryEventFilter(TCC_ItemList_Safehouse)
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

	if !_SafehouseContainerList_WP.HasForm(akSourceContainer) && !dbmDisp.HasForm(akBaseItem)
		dbmNew.RemoveAddedForm(akBaseItem)
		dbmFound.AddForm(akBaseItem)
	endIf
endEvent

;-- Events --------------------------------

Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if dbmFound.HasForm(akBaseItem)	
		if !akDestContainer || (!_SafehouseContainerList_WP.HasForm(akDestContainer) && TokenList.find(akDestContainer) == -1)

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
