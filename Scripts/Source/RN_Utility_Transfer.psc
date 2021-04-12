Scriptname RN_Utility_Transfer extends Quest 
 
RN_Utility_MCM property MCM auto

;;Alias to force the base item into.
referencealias property FoundAlias auto
message property TCC_TransferContainer auto
message property TCC_TransferComplete auto
message property TCC_RetrievalComplete auto

message property TransferComplete auto
message property TransferDisplayWait auto
message property TransferDisplayDone auto
message property DBM_SortError auto

objectreference property RN_Storage_Container auto
objectreference property RN_Excluded_Act auto
objectreference property DBM_AutoSortDropOff auto
objectreference property DBM_PrepStation auto
objectreference property PlayerRef auto

formlist property TCC_TokenList auto
formlist property dbmMaster auto
formlist property dbmDisp auto
formlist property RN_ExcludedItems_Generic auto
formlist property DBM_ProtectedItems auto

globalvariable property DBM_SortWait auto
globalvariable property DBM_DisplayCount auto

int _Transfered
int _PlayerTransfered
int _OldDisplayCount

Function RunCustomTransfer()
	
	_Transfered = 0
	
	Int Index = TCC_TokenList.GetSize()
	Bool Transferable
	While Index
		Index -= 1
		ObjectReference _Container = TCC_TokenList.GetAt(Index) as ObjectReference
		if _Container && _Container != PlayerRef
			Int Index2 = _Container.GetNumItems()
			While Index2
				Index2 -= 1
				Form ItemRelic = _Container.GetNthForm(Index2)
				if dbmMaster.HasForm(ItemRelic) && !dbmDisp.HasForm(ItemRelic)
					if _Container as Actor
						Actor _Actor = _Container as Actor
						Transferable = !_Actor.IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic) && !RN_ExcludedItems_Generic.HasForm(ItemRelic) && !DBM_ProtectedItems.HasForm(ItemRelic)
					else
						Transferable = !Game.GetPlayer().IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic) && !RN_ExcludedItems_Generic.HasForm(ItemRelic) && !DBM_ProtectedItems.HasForm(ItemRelic)
					endIF
					
					if Transferable
						_Container.RemoveItem(ItemRelic, 1, true, DBM_AutoSortDropOff)
						_Transfered += 1
					endIf
				endIf
			endWhile
		endIf
	endWhile
	DisplayFunc()
endFunction

Function RunAllTransfer()

	_Transfered = 0

	Int Index = TCC_TokenList.GetSize()
	Bool Transferable
	While Index
		Index -= 1
		ObjectReference _Container = TCC_TokenList.GetAt(Index) as ObjectReference	
		if _Container
			Int Index2 = _Container.GetNumItems()
			While Index2
				Index2 -= 1
				Form ItemRelic = _Container.GetNthForm(Index2)
				if dbmMaster.HasForm(ItemRelic) && !dbmDisp.HasForm(ItemRelic)
					if _Container as Actor && _Container != PlayerRef
						Actor _Actor = _Container as Actor
						Transferable = !_Actor.IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic) && !RN_ExcludedItems_Generic.HasForm(ItemRelic) && !DBM_ProtectedItems.HasForm(ItemRelic)
					else
						Transferable = !Game.GetPlayer().IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic) && !RN_ExcludedItems_Generic.HasForm(ItemRelic) && !DBM_ProtectedItems.HasForm(ItemRelic)
					endIF
					
					if Transferable
						_Container.RemoveItem(ItemRelic, 1, true, DBM_AutoSortDropOff)
						_Transfered += 1
					endIf
				endIf
			endWhile
		endif
	endWhile
	DisplayFunc()
endFunction

Function RunRelicTransfer()

	_Transfered = 0
	
	Int Index = RN_Storage_Container.GetNumItems()
	While Index
		Index -= 1
		Form ItemRelic = RN_Storage_Container.GetNthForm(Index)
		if dbmMaster.HasForm(ItemRelic) && !dbmDisp.HasForm(ItemRelic)
			Bool Transferable = !Game.IsObjectFavorited(ItemRelic) && !RN_ExcludedItems_Generic.HasForm(ItemRelic) && !DBM_ProtectedItems.HasForm(ItemRelic)
			if Transferable
				RN_Storage_Container.RemoveItem(ItemRelic, 1, true, DBM_AutoSortDropOff)
				_Transfered += 1
			endIf
		endIf
	endWhile
	DisplayFunc()
endFunction

Function DisplayFunc()
	
	if MCM.advdebug
		TCCDebug.Log("Display - Started Displaying Tranfered Items...")
	endif
	
	Int Index = TransferComplete.Show(_Transfered as Int)
	
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
		
		_Transfered = (DBM_DisplayCount.GetValue() as Int - _OldDisplayCount)
		
		TransferDisplayDone.Show(_Transfered as Int)
	else
		Return
	endIf
	
	if MCM.advdebug
		TCCDebug.Log("Display - Finished Displaying Tranfered Items")
	endif
endFunction

Function TransferRelics(ObjectReference ref)
	
	_PlayerTransfered = 0
	
	if (ref) && (ref.GetBaseObject().GetType() == 28)
		if !DBM_SortWait.GetValue()
			FoundAlias.ForceRefTo(ref)
			Int _MenuButton = TCC_TransferContainer.Show()
			if _MenuButton == 0	
				DBM_SortWait.SetValue(1)
				SendModEvent("_StartTimer", "Transfering Items")
				Int _Index = PlayerRef.GetNumItems()
				while _Index
					_Index -= 1		
					Form _ItemRelic = PlayerRef.GetNthForm(_Index)
					if dbmMaster.HasForm(_ItemRelic)
						Bool Transferable = !Game.GetPlayer().IsEquipped(_ItemRelic) && !Game.IsObjectFavorited(_ItemRelic) && !RN_ExcludedItems_Generic.HasForm(_ItemRelic) && !DBM_ProtectedItems.HasForm(_ItemRelic)
						if Transferable
							PlayerRef.RemoveItem(_ItemRelic, PlayerRef.GetItemCount(_ItemRelic), true, ref)
							_PlayerTransfered += 1
						endIf
					endIf
				endWhile
				DBM_SortWait.SetValue(0)
				TCC_TransferComplete.show(_PlayerTransfered)
				
			elseif _MenuButton == 1
				DBM_SortWait.SetValue(1)
				SendModEvent("_StartTimer", "Retrieving Items")
				Int _Index = ref.GetNumItems()
				while _Index
					_Index -= 1		
					Form _ItemRelic = ref.GetNthForm(_Index)
					if dbmMaster.HasForm(_ItemRelic)
						ref.RemoveItem(_ItemRelic, ref.GetItemCount(_ItemRelic), true, PlayerRef)
						_PlayerTransfered += 1
					endIf
				endWhile
				DBM_SortWait.SetValue(0)
				TCC_RetrievalComplete.show(_PlayerTransfered)
			elseif _MenuButton == 2
				FoundAlias.Clear()
				return
			endif
			
			FoundAlias.Clear()
		else
			DBM_SortError.Show()
		endIf
	else
		Debug.Notification("This spell can only be used on containers")
	endif
endFunction

