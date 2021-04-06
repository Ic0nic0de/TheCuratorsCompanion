scriptName RN_SupportedMod_Script extends quest

Import Debug
Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_PropManager property Util auto
DBMSupportedModScript property DBM auto

RN_PatchAPI property APIScript auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																					;;AutoFill Properties
bool property _setupDone = false auto hidden
bool bConfigured

formlist property TCC_ItemList_Patches auto

formlist property dbmNew auto
formlist property dbmMaster auto

formlist property DBM_RN_QuestDisplays auto
formlist property DBM_RN_Quest_Stage_Displays auto
formlist property DBM_RN_ExplorationDisplays auto

formlist property RN_ExcludedItems_Generic auto
formlist property TCC_TokenList_ExcludedItems auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto
globalvariable property RN_SupportedModCount auto

Formlist Property _questDisplays auto
Formlist Property _questDisplaysStage auto
Formlist property _ExplorationDisplays auto
Formlist property _ExcludedTransferItems auto
Formlist property _PrisonerChest auto

formlist property _DisplayList auto
formlist property _EnabledList auto

Message property _CompleteMessage auto
Message property _CompleteNotification auto

globalvariable property _GlobalComplete auto
globalvariable property _GlobalCount auto
globalvariable property _GlobalTotal auto

String Property _ModName auto

formlist property _NewSectionGlobalComplete auto
formlist property _NewSectionGlobalCount auto
formlist property _NewSectionGlobalTotal auto
formlist property _NewSectionDisplayList auto
formlist property _NewSectionItemsList auto
string[] _NewSectionArrayName

Int _ReturnInt

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Events ---------------------------------------			

Event OnInit()

	if (!DBM || !Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + self.GetName() + " ABORTING...", 2)
		return
	endIf

	RegisterForSingleUpdate(0)	
EndEvent

;;-- Events ---------------------------------------		

Event OnUpdate()
	if bConfigured
		RegisterModEvents()
		UnregisterForUpdate()
		Return
	endif
	
	bConfigured = APIScript.RegisterSupportedMod(_ModName, Self, none, none, none)
	RegisterModEvents()
	RunSetup()
EndEvent

;;-- Events ---------------------------------------		

Function RegisterModEvents()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endFunction

;;-- Events ---------------------------------------		

function RunSetup()
	
	Int _Index
		
	_Index = DBM.NewSectionItemLists.length		
	While _Index
		_Index -= 1
		if DBM.NewSectionItemLists[_Index] != none
			_onConsolidateItems(DBM.NewSectionItemLists[_Index], TCC_ItemList_Patches, dbmNew, dbmMaster)	
		endIf
	endWhile

	_Index = DBM.NewSectionItemAltLists.length		
	While _Index
		_Index -= 1
		if DBM.NewSectionItemAltLists[_Index] != none
			_onConsolidateItems(DBM.NewSectionItemAltLists[_Index], TCC_ItemList_Patches, dbmNew, dbmMaster)
		endIf
	endWhile
	
	_Index = DBM.NewSectionDisplayRefLists.length		
	While _Index
		_Index -= 1
		if DBM.NewSectionDisplayRefLists[_Index] != none 
			_ReturnInt += _onConsolidateDisplaysAll(DBM.NewSectionDisplayRefLists[_Index], _DisplayList)
			_onConsolidateDisplaysAll(DBM.NewSectionDisplayRefLists[_Index], Util._getDisplayRoom(DBM.NewSectionRoomNames[_Index]), Util._getDisplayTotal(DBM.NewSectionRoomNames[_Index]))
		endIf
	endWhile
	
;;------------ Quest / Exploration Displays
	
	_Index = 0
	while _Index < _explorationDisplays.GetSize()
		ObjectReference _Ref = _ExplorationDisplays.GetAt(_Index) as ObjectReference		
		DBM_RN_ExplorationDisplays.AddForm(_Ref)
		_Index += 1
	EndWhile

	_Index = 0
	while _Index < _questDisplays.GetSize()
		ObjectReference _Ref = _questDisplays.GetAt(_Index) as ObjectReference		
		DBM_RN_QuestDisplays.AddForm(_Ref)
		_Index += 1
	EndWhile

	_Index = 0
	while _Index < _questDisplaysStage.GetSize()
		ObjectReference _Ref = _questDisplaysStage.GetAt(_Index) as ObjectReference		
		DBM_RN_Quest_Stage_Displays.AddForm(_Ref)
		_Index += 1
	EndWhile	

;;------------ Exclusion Forms

	_Index = 0
	while _Index < _ExcludedTransferItems.GetSize()
		Form _Item = _ExcludedTransferItems.GetAt(_Index) as Form	
		RN_ExcludedItems_Generic.AddForm(_Item)
		_Index += 1
	EndWhile		

	_Index = 0
	while _Index < _PrisonerChest.GetSize()
		ObjectReference _Ref = _PrisonerChest.GetAt(_Index) as ObjectReference	
		TCC_TokenList_ExcludedItems.AddForm(_Ref)
		_Index += 1
	EndWhile
	
	_setupDone = True
endFunction

;;-- Events ---------------------------------------	

function UpdateArrays()
	
	MCM.AddModSupport(_GlobalComplete, _GlobalCount, _GlobalTotal, _ModName, RN_SupportedModCount, DBM)
	
	if (_ModName == "Heavy Armory") || (_ModName == "Immersive Weapons")
		_CreateArray()
		MCM.AddSectionSupport(_NewSectionGlobalCount, _NewSectionGlobalTotal, _NewSectionGlobalComplete, _ModName, _NewSectionArrayName, _NewSectionItemsList, _NewSectionDisplayList)
	endIf
endfunction	

;;-- Events ---------------------------------------		

function UpdateCounts()
	
	_GlobalTotal.SetValue(_DisplayList.GetSize() - _ReturnInt)	
	_GlobalCount.SetValue(_EnabledList.GetSize())
	
	if (_ModName == "Heavy Armory") || (_ModName == "Immersive Weapons") 
		Int Index = 0
		Int _List = _NewSectionDisplayList.GetSize()		
		While Index < _List
			FormList List = _NewSectionDisplayList.GetAt(Index) as Formlist
			GlobalVariable Variable = _NewSectionGlobalTotal.GetAt(Index) as GlobalVariable
			Variable.SetValue(List.GetSize())
			Index += 1
		endWhile
	endif
endfunction

;;-- Events ---------------------------------------

Event _onScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	RN_Scan_Registered.Mod(1)
	
	if MCM.advdebug
		TCCDebug.Log("Official Patch [" + _ModName  + "] - Scan Event Received...", 0)
	endif
	
	if (!_GlobalComplete.GetValue())
		Int Index = DBM.NewSectionDisplayRefLists.length
		While Index
			Index -= 1
			_onDisplayCheck(DBM.NewSectionDisplayRefLists[Index], _EnabledList, _GlobalCount)
		endWhile
		
		if (CheckValueCount1(_GlobalCount, _GlobalTotal, _GlobalComplete) && (MCM.ShowSetCompleteVal))
			if (MCM.ShowSimpleNotificationVal)
				_CompleteNotification.Show()
			else
				_CompleteMessage.Show()
			endIf
		endIf	
	endIf
	
	RN_Scan_Done.Mod(1)
	
	if MCM.advdebug
		TCCDebug.Log("Official Patch [" + _ModName  + "] - Scan Event Completed", 0)
	endif
endEvent	

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)
	
	if (!_GlobalComplete.GetValue())
		ObjectReference Disp = DisplayRef as ObjectReference
		if (_DisplayList.HasForm(Disp))
			if (EnableState)
				_EnabledList.AddForm(Disp)
				if MCM.advdebug
					TCCDebug.Log("Official Patch [" + _ModName  + "] - Updated display " + Disp.GetName() + Disp, 0)
				endif
				_GlobalCount.Mod(1)
			elseif (!EnableState)
				if (_EnabledList.HasForm(Disp))
					_EnabledList.RemoveAddedForm(Disp)
					if MCM.advdebug
						TCCDebug.Log("Official Patch [" + _ModName  + "] - Removed display " + Disp.GetName() + Disp, 0)
					endif
					_GlobalCount.Mod(-1)
				endIf
			endIf
		endif
		
		if (CheckValueCount1(_GlobalCount, _GlobalTotal, _GlobalComplete) && (MCM.ShowSetCompleteVal)) 
			if (MCM.ShowSimpleNotificationVal)
				_CompleteNotification.Show()
			else
				_CompleteMessage.Show()
			endif
		endif
	endIf
endEvent

;;-- Events ---------------------------------------	

Function _CreateArray()

	if (_ModName == "Heavy Armory")
	
		_NewSectionArrayName = new string[19]
		_NewSectionArrayName[0] = "Ancient Nord Set"
		_NewSectionArrayName[1] = "Blades Set"
		_NewSectionArrayName[2] = "Daedric Set"
		_NewSectionArrayName[3] = "Dawnguard Set"
		_NewSectionArrayName[4] = "Dragon Set"
		_NewSectionArrayName[5] = "Dwarven Set"
		_NewSectionArrayName[6] = "Ebony Set"
		_NewSectionArrayName[7] = "Elven Set"
		_NewSectionArrayName[8] = "Falmer Set"
		_NewSectionArrayName[9] = "Forsworn Set"
		_NewSectionArrayName[10] = "Glass Set"
		_NewSectionArrayName[11] = "Imperial Set"
		_NewSectionArrayName[12] = "Iron Set"
		_NewSectionArrayName[13] = "Nord Hero Set"
		_NewSectionArrayName[14] = "Nordic Set"
		_NewSectionArrayName[15] = "Orcish Set"
		_NewSectionArrayName[16] = "Silver Set"
		_NewSectionArrayName[17] = "Stalhrim Set"
		_NewSectionArrayName[18] = "Steel Set"
		
	elseif (_ModName == "Immersive Weapons")
	
		_NewSectionArrayName = new string[16]
		_NewSectionArrayName[0] = "Ancient Nord Set"
		_NewSectionArrayName[1] = "Blades Set"
		_NewSectionArrayName[2] = "Daedric Set"
		_NewSectionArrayName[3] = "Dawnguard Set"
		_NewSectionArrayName[4] = "Dragon Set"
		_NewSectionArrayName[5] = "Dwarven Set"
		_NewSectionArrayName[6] = "Ebony Set"
		_NewSectionArrayName[7] = "Elven Set"
		_NewSectionArrayName[8] = "Falmer Set"
		_NewSectionArrayName[9] = "Glass Set"
		_NewSectionArrayName[10] = "Iron Set"
		_NewSectionArrayName[11] = "Orcish Set"
		_NewSectionArrayName[12] = "Steel Set"
		_NewSectionArrayName[13] = "Wolf Set"
		_NewSectionArrayName[14] = "Daedric Gallery Set"
		_NewSectionArrayName[15] = "Hall of Heroes Set"
	endIf
endFunction
