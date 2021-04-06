ScriptName RN_Utility_SafehouseContainerMonitor extends ObjectReference

RN_Utility_MCM property RN_MCM auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto
formlist property dbmClutter auto

formlist property _ChestSpecificItems auto

formlist property TCC_TokenList auto

int[] property _DisplayCounts auto

;-- Events --------------------------------

Event onInit()
	
	Registerformodevent("SH_Update", "onSH_Update")
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(dbmNew)
	AddInventoryEventFilter(dbmFound)
	AddInventoryEventFilter(dbmDisp)
	AddInventoryEventFilter(_ChestSpecificItems)	
endEvent

;-- Events --------------------------------

Event onPlayerLoadGame()
	
	Registerformodevent("SH_Update", "onSH_Update")
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(dbmNew)
	AddInventoryEventFilter(dbmFound)
	AddInventoryEventFilter(dbmDisp)
	AddInventoryEventFilter(_ChestSpecificItems)
endEvent

;-- Events --------------------------------

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	
	if RN_MCM.Safehouse_Enabled
		if dbmNew.HasForm(akBaseItem) && _ChestSpecificItems.HasForm(akBaseItem) || dbmFound.HasForm(akBaseItem) && _ChestSpecificItems.HasForm(akBaseItem)
		
			Int _ItemPosition = _ChestSpecificItems.Find(akBaseItem)
				
			if Self.GetItemCount(akBaseItem) < _DisplayCounts[_ItemPosition]
				dbmDisp.RemoveAddedForm(akBaseItem)	
				dbmNew.RemoveAddedForm(akBaseItem)
				dbmFound.AddForm(akBaseItem)	
			else		
				dbmFound.RemoveAddedForm(akBaseItem)
				dbmNew.RemoveAddedForm(akBaseItem)
				dbmDisp.AddForm(akBaseItem)
			endIf	

		endIf
	endIf
endEvent			

;-- Events --------------------------------

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if RN_MCM.Safehouse_Enabled	
		Int _ItemPosition = _ChestSpecificItems.Find(akBaseItem)

		if self.GetItemCount(akBaseItem) == 0 || Self.GetItemCount(akBaseItem) < _DisplayCounts[_ItemPosition]
			if dbmDisp.HasForm(akBaseItem)
				dbmDisp.RemoveAddedForm(akBaseItem)
				if !TCC_TokenList.HasForm(akDestContainer)
					dbmNew.AddForm(akBaseItem)
				else
					dbmFound.AddForm(akBaseItem)
				endIf
			endIf
		endIf
	endIf		
endEvent

;-- Events --------------------------------

Event onSH_Update(string eventName, string strArg, float numArg, Form sender)
	
	Int _Index = self.GetNumItems()
	While _Index 
		_Index -= 1
		form akBaseItem = self.GetNthForm(_Index) as form
		if dbmClutter.HasForm(akBaseItem) && _ChestSpecificItems.HasForm(akBaseItem)
		
			Int _ItemPosition = _ChestSpecificItems.Find(akBaseItem)
				
			if Self.GetItemCount(akBaseItem) < _DisplayCounts[_ItemPosition]
				dbmDisp.RemoveAddedForm(akBaseItem)	
				dbmNew.RemoveAddedForm(akBaseItem)
				dbmFound.AddForm(akBaseItem)	
			else		
				dbmFound.RemoveAddedForm(akBaseItem)
				dbmNew.RemoveAddedForm(akBaseItem)
				dbmDisp.AddForm(akBaseItem)
			endIf
		endIf
	endWhile
endEvent
	