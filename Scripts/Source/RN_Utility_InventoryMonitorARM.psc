ScriptName RN_Utility_InventoryMonitorARM extends ReferenceAlias

RN_Utility_MCM property RN_MCM auto

DBM_ReplicaHandler property ReplicaHandler auto

Formlist property DBM_ReplicaBaseItems auto
formlist property DBM_ReplicaItems auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto

formlist property TCC_ItemList_Armory auto

formlist property TCC_TokenList auto

;;Museum storage containers to check within several events.
formlist property _MuseumContainerList_WP auto

objectreference[] TokenList

;-- Events --------------------------------

Event onInit()
	
	RegisterForModEvent("Update_TokenArray", "_Update")
	RegisterForModEvent("FireScripts", "_OnFireScripts")
endEvent

;-- Events --------------------------------

Event OnPlayerLoadGame()
	
	RegisterForModEvent("Update_TokenArray", "_Update")
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
		AddInventoryEventFilter(TCC_ItemList_Armory)
	endEvent

	Event onItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		
		if !_MuseumContainerList_WP.HasForm(akSourceContainer) && !dbmDisp.HasForm(akBaseItem)
			dbmNew.RemoveAddedForm(akBaseItem)
			dbmFound.AddForm(akBaseItem)
				
			if RN_MCM.ReplicaTag
				if DBM_ReplicaBaseItems.HasForm(akBaseitem)								;; If the item being processed is a "Base Item" ...				
					dbmNew.RemoveAddedForm(ReplicaHandler.GetReplica(akBaseItem))
					dbmFound.AddForm(ReplicaHandler.GetReplica(akBaseItem))
						
				elseif DBM_ReplicaItems.HasForm(akBaseitem)								;; If the item being processed is a "Replica" ...
					dbmNew.RemoveAddedForm(ReplicaHandler.GetOriginal(akBaseItem))
					dbmFound.AddForm(ReplicaHandler.GetOriginal(akBaseItem))
				endIf
			endIf
		endIf
	endEvent

	Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

		if dbmFound.HasForm(akBaseItem)	
			if !akDestContainer || (!_MuseumContainerList_WP.HasForm(akDestContainer) && TokenList.find(akDestContainer) == -1)

				Bool bDuplicate
				Int Index = TokenList.length
				while Index > 0 && !bDuplicate
					Index -=1
					if TokenList[Index] != none
						if RN_MCM.ReplicaTag
							bDuplicate = TokenList[Index].GetitemCount(akBaseItem) || (DBM_ReplicaBaseItems.HasForm(akBaseitem) && TokenList[Index].GetitemCount(ReplicaHandler.GetReplica(akBaseItem))) || (DBM_ReplicaItems.HasForm(akBaseitem) && TokenList[Index].GetitemCount(ReplicaHandler.GetOriginal(akBaseItem)))					
						else
							bDuplicate = TokenList[Index].GetitemCount(akBaseItem)
						endif
					endif
				endWhile
				
				if !bDuplicate && !dbmDisp.HasForm(akBaseItem)
					dbmNew.AddForm(akBaseItem)
					dbmFound.RemoveAddedForm(akBaseItem)
					if RN_MCM.ReplicaTag
						if DBM_ReplicaBaseItems.HasForm(akBaseitem)								;; If the item being processed is a "Base Item" ...				
							dbmNew.AddForm(ReplicaHandler.GetReplica(akBaseItem))
							dbmFound.RemoveAddedForm(ReplicaHandler.GetReplica(akBaseItem))
								
						elseif DBM_ReplicaItems.HasForm(akBaseitem)								;; If the item being processed is a "Replica" ...
							dbmNew.AddForm(ReplicaHandler.GetOriginal(akBaseItem))
							dbmFound.RemoveAddedForm(ReplicaHandler.GetOriginal(akBaseItem))
						endIf
					endIf					
				endIf
			endIf
		endIf
	endEvent
endState

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

auto state disabled

	Event onItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	endEvent

	Event onItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	endEvent
endState
