Scriptname RN_Utility_Transfer extends Quest  

message property TransferComplete auto
message property TransferDisplayWait auto
message property TransferDisplayDone auto

objectreference property RN_Storage_Container auto
objectreference property RN_Excluded_Act auto
objectreference property DBM_AutoSortDropOff auto
objectreference property DBM_PrepStation auto
objectreference property PlayerRef auto

formlist property TCC_TokenList auto
formlist property dbmMaster auto
formlist property dbmDisp auto
formlist property RN_ExcludedItems_Generic auto
formlist property TCC_ItemList_Safehouse auto
formlist property DBM_ProtectedItems auto

globalvariable property DBM_SortWait auto
globalvariable Property RN_Transfer_Count auto
globalvariable property DBM_DisplayCount auto
globalvariable property TCC_TransferDisplay auto

int _OldDisplayCount

Function RunCustomTransfer()
	
	RN_Transfer_Count.setvalue(0)
	
	Int Index = TCC_TokenList.GetSize()
	Bool Transferable
	While Index
		Index -= 1
		ObjectReference _Container = TCC_TokenList.GetAt(Index) as ObjectReference
		if _Container != PlayerRef
			Int Index2 = _Container.GetNumItems()
			While Index2
				Index2 -= 1
				Form ItemRelic = _Container.GetNthForm(Index2)
				if dbmMaster.HasForm(ItemRelic) && !dbmDisp.HasForm(ItemRelic) && !TCC_ItemList_Safehouse.HasForm(ItemRelic)
					if _Container as Actor
						Actor _Actor = _Container as Actor
						Transferable = !_Actor.IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic) && !RN_ExcludedItems_Generic.HasForm(ItemRelic) && !DBM_ProtectedItems.HasForm(ItemRelic)
					else
						Transferable = !Game.GetPlayer().IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic) && !RN_ExcludedItems_Generic.HasForm(ItemRelic) && !DBM_ProtectedItems.HasForm(ItemRelic)
					endIF
					
					if Transferable
						_Container.RemoveItem(ItemRelic, 1, true, DBM_AutoSortDropOff)
						RN_Transfer_Count.Mod(1)
					endIf
				endIf
			endWhile
		endIf
	endWhile
	DisplayFunc()
endFunction

Function RunAllTransfer()

	RN_Transfer_Count.setvalue(0)

	Int Index = TCC_TokenList.GetSize()
	Bool Transferable
	While Index
		Index -= 1
		ObjectReference _Container = TCC_TokenList.GetAt(Index) as ObjectReference		
		Int Index2 = _Container.GetNumItems()
		While Index2
			Index2 -= 1
			Form ItemRelic = _Container.GetNthForm(Index2)
			if dbmMaster.HasForm(ItemRelic) && !dbmDisp.HasForm(ItemRelic) && !TCC_ItemList_Safehouse.HasForm(ItemRelic)
				if _Container as Actor && _Container != PlayerRef
					Actor _Actor = _Container as Actor
					Transferable = !_Actor.IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic) && !RN_ExcludedItems_Generic.HasForm(ItemRelic) && !DBM_ProtectedItems.HasForm(ItemRelic)
				else
					Transferable = !Game.GetPlayer().IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic) && !RN_ExcludedItems_Generic.HasForm(ItemRelic) && !DBM_ProtectedItems.HasForm(ItemRelic)
				endIF
				
				if Transferable
					_Container.RemoveItem(ItemRelic, 1, true, DBM_AutoSortDropOff)
					RN_Transfer_Count.Mod(1)
				endIf
			endIf
		endWhile
	endWhile
	DisplayFunc()
endFunction

Function RunRelicTransfer()

	RN_Transfer_Count.setvalue(0)
	
	Int Index = RN_Storage_Container.GetNumItems()
	While Index
		Index -= 1
		Form ItemRelic = RN_Storage_Container.GetNthForm(Index)
		if dbmMaster.HasForm(ItemRelic) && !dbmDisp.HasForm(ItemRelic) && !TCC_ItemList_Safehouse.HasForm(ItemRelic)
			Bool Transferable = !Game.IsObjectFavorited(ItemRelic) && !RN_ExcludedItems_Generic.HasForm(ItemRelic) && !DBM_ProtectedItems.HasForm(ItemRelic)
			if Transferable
				RN_Storage_Container.RemoveItem(ItemRelic, 1, true, DBM_AutoSortDropOff)
				RN_Transfer_Count.Mod(1)
			endIf
		endIf
	endWhile
	DisplayFunc()
endFunction

Function DisplayFunc()

	UpdateCurrentInstanceGlobal(RN_Transfer_Count)
	
	Int Index = TransferComplete.Show()
	
	if Index == 0
	
		_OldDisplayCount = DBM_DisplayCount.GetValue() as Int		
		(DBM_PrepStation.Activate(DBM_AutoSortDropOff))
		
		If !Utility.IsInMenuMode()
			TransferDisplayWait.Show()
		endIf
		
		Index = 0
		
		While DBM_SortWait.GetValue()
			Utility.Wait(1)
			Index += 1
			if Index == 20 
				if !Utility.IsInMenuMode()
					TransferDisplayWait.Show()
				endIf
				Index = 0
			endIF
		endWhile
		
		TCC_TransferDisplay.SetValue(DBM_DisplayCount.GetValue() as Int - _OldDisplayCount)
		
		UpdateCurrentInstanceGlobal(TCC_TransferDisplay)
		
		TransferDisplayDone.Show()
	else
		Return
	endIf
endFunction

