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
bool bNotified

bool bRegisterExploration
bool bRegisterHallofWonders
bool bRegisterQuests
bool bRegisterSafeHouse

formlist property TCC_ItemList_Patches auto

formlist property dbmNew auto
formlist property dbmMaster auto

formlist property DBM_RN_QuestDisplays auto ;; Quest Complete
formlist property DBM_RN_Quest_Stage_Displays auto ;; Quest Complete based on GetStageDone()
formlist property DBM_RN_Quest_StagePassed_Displays auto;; Quest Passed a setstage ( >= akStage)

formlist property DBM_RN_ExplorationDisplays auto

formlist property RN_ExcludedItems_Generic auto
formlist property TCC_TokenList_ExcludedItems auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto
globalvariable property RN_SupportedModCount auto

Formlist Property _questDisplays auto
Formlist property _questNames auto

Formlist property _explorationDisplays auto
Formlist property _explorationNames auto

Formlist property _ExcludedTransferItems auto
Formlist property _PrisonerChest auto

formlist property _DisplayList auto
formlist property _EnabledList auto

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
Int Tracker
Int SectionDone

float ftimeStart
float ftimeEnd

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnInit()

	if (!DBM || !Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + self.GetName() + " ABORTING...", 2)
		return
	endIf
	
	APIScript.UnregisteredPatch = True
	RegisterForSingleUpdate(1)	
EndEvent

;;-- Events ---------------------------------------		

Event OnUpdate()
	
	UnregisterForUpdate()
	
	if !bConfigured
		bConfigured = (APIScript.RegisterSupportedMod(_ModName, Self, None))
		RegisterModEvents()
		GoToState("SettingUp")
	endif
EndEvent

;;-- State ---------------------------------------	

State SetupDone
	
	Event OnUpdate()
		
		UnregisterForUpdate()
		
		RegisterModEvents()
	EndEvent
endState

;;-- State ---------------------------------------		

State SettingUp
	
	Event OnBeginState()
		
		if (!_setupDone)
			
			ftimeStart = Utility.GetCurrentRealTime()
			
			Tracker = 1
			RegisterForSingleUpdate(0)	
		else
			UnregisterForUpdate()
			GoToState("SetupDone")
		endIf
	endEvent
	
	Event OnUpdate()
		
		Int _Index
		
		if Tracker == 999
			if SectionDone == 7
				SectionDone = 0
				
				UpdateCounts()
				_setupDone = true
				
				ftimeEnd = Utility.GetCurrentRealTime()
				TCCDebug.Log("RN_SupportedMod_Script - Setup function completed for " + _ModName + " in " + (ftimeEnd - ftimeStart) + " seconds.")	
				
				GoToState("SetupDone")
			else
				RegisterForSingleUpdate(2)
			endif
			
		elseif	Tracker == 1
			Tracker = 2
			RegisterForSingleUpdate(0)				
				
;;-----------------------------------------------------------------
				
			_Index = DBM.NewSectionItemLists.length		
			While _Index
				_Index -= 1
				if DBM.NewSectionItemLists[_Index] != none
					_onConsolidateItems(DBM.NewSectionItemLists[_Index], TCC_ItemList_Patches, dbmNew, dbmMaster)	
				endIf
			endWhile
			
			SectionDone += 1

;;-----------------------------------------------------------------

		elseif	Tracker == 2
			Tracker = 3
			RegisterForSingleUpdate(0)
			
			_Index = DBM.NewSectionItemAltLists.length		
			While _Index
				_Index -= 1
				if DBM.NewSectionItemAltLists[_Index] != none
					_onConsolidateItems(DBM.NewSectionItemAltLists[_Index], TCC_ItemList_Patches, dbmNew, dbmMaster)
				endIf
			endWhile
			
			SectionDone += 1

;;-----------------------------------------------------------------
			
		elseif	Tracker == 3
			Tracker = 4
			RegisterForSingleUpdate(0)
			
			_Index = DBM.NewSectionDisplayRefLists.length		
			While _Index
				_Index -= 1
				if DBM.NewSectionDisplayRefLists[_Index] != none 
					_ReturnInt += _onConsolidateDisplaysAll(DBM.NewSectionDisplayRefLists[_Index], _DisplayList)
					_onConsolidateDisplaysAll(DBM.NewSectionDisplayRefLists[_Index], Util._getDisplayRoom(DBM.NewSectionRoomNames[_Index]), Util._getDisplayTotal(DBM.NewSectionRoomNames[_Index]))
					
					if DBM.NewSectionRoomNames[_Index] == "Safehouse"
						bRegisterSafeHouse = (APIScript.RegisterDisplayList("Safehouse", _ModName, DBM.NewSectionDisplayRefLists[_Index], DBM.NewSectionItemLists[_Index]))
					endIf
						
					if DBM.NewSectionRoomNames[_Index] == "Hall of Wonders"
						bRegisterHallofWonders = (APIScript.RegisterDisplayList("Hall of Wonders", _ModName, DBM.NewSectionDisplayRefLists[_Index], DBM.NewSectionItemLists[_Index]))
					endif				
				endIf
			endWhile
			
			SectionDone += 1

;;-----------------------------------------------------------------

		elseif	Tracker == 4
			Tracker = 5
			RegisterForSingleUpdate(0)
			
			if (_explorationDisplays && _explorationDisplays.GetSize() > 0) && (_explorationNames && _explorationNames.GetSize() > 0)
				_Index = 0
				while _Index < _explorationDisplays.GetSize()
					ObjectReference _Ref = _explorationDisplays.GetAt(_Index) as ObjectReference		
					DBM_RN_ExplorationDisplays.AddForm(_Ref)
					_Index += 1
				EndWhile
				
				bRegisterExploration = (APIScript.RegisterExplorationDisplayList(_ModName, _explorationDisplays, _explorationNames))
			endif
			
			SectionDone += 1

;;-----------------------------------------------------------------
			
		elseif	Tracker == 5
			Tracker = 6
			RegisterForSingleUpdate(0)
			
			if (_questDisplays && _questDisplays.GetSize() > 0) && (_questNames && _questNames.GetSize() > 0)
				if (_ModName != "The Forgotten City") && (_ModName != "Vigilant.") && (_ModName != "Spell Knight Armor")
					_Index = 0
					while _Index < _questDisplays.GetSize()
						ObjectReference _Ref = _questDisplays.GetAt(_Index) as ObjectReference	
						DBM_RN_QuestDisplay smQuest = _Ref as DBM_RN_QuestDisplay
						DBM_RN_QuestDisplayStage smQuest2 = _Ref as DBM_RN_QuestDisplayStage
						DBM_RN_QuestDisplayStagePassed smQuest3 = _Ref as DBM_RN_QuestDisplayStagePassed	

						if (smQuest)
							DBM_RN_QuestDisplays.AddForm(_Ref)
						elseif (smQuest2)
							DBM_RN_Quest_Stage_Displays.AddForm(_Ref)
						elseif (smQuest3)
							DBM_RN_Quest_StagePassed_Displays.AddForm(_Ref)					
						endif

						_Index += 1
					EndWhile
				endif
				bRegisterQuests = (APIScript.RegisterQuestDisplayList(_ModName, _questDisplays, _questNames))
			endIf
			
			SectionDone += 1

;;-----------------------------------------------------------------
			
		elseif	Tracker == 6
			Tracker = 7
			RegisterForSingleUpdate(0)

			if (_ExcludedTransferItems && _ExcludedTransferItems.GetSize() > 0)
				_Index = 0
				while _Index < _ExcludedTransferItems.GetSize()
					Form _Item = _ExcludedTransferItems.GetAt(_Index) as Form	
					RN_ExcludedItems_Generic.AddForm(_Item)
					_Index += 1
				EndWhile		
			endif
			
			SectionDone += 1

;;-----------------------------------------------------------------
			
		elseif	Tracker == 7
			Tracker = 999
			RegisterForSingleUpdate(0)
			
			if (_PrisonerChest && _PrisonerChest.GetSize() > 0)
				_Index = 0
				while _Index < _PrisonerChest.GetSize()
					ObjectReference _Ref = _PrisonerChest.GetAt(_Index) as ObjectReference	
					TCC_TokenList_ExcludedItems.AddForm(_Ref)
					_Index += 1
				EndWhile
			endif
			
			SectionDone += 1
		endif
	endEvent
endState

;;-- functions ---------------------------------------

Function ResetTracking()
	
	bRegisterSafeHouse = False
	bRegisterHallofWonders = False
	bRegisterQuests = False
	bRegisterExploration = False

	Int _Index = DBM.NewSectionRoomNames.length		
	While _Index
		_Index -= 1
		if DBM.NewSectionRoomNames[_Index] == "Safehouse"
			bRegisterSafeHouse = (APIScript.RegisterDisplayList("Safehouse", _ModName, DBM.NewSectionDisplayRefLists[_Index], DBM.NewSectionItemLists[_Index]))
		endIf
		
		if DBM.NewSectionRoomNames[_Index] == "Hall of Wonders"
			bRegisterHallofWonders = (APIScript.RegisterDisplayList("Hall of Wonders", _ModName, DBM.NewSectionDisplayRefLists[_Index], DBM.NewSectionItemLists[_Index]))
		endif				
	endWhile
	
	if (_questDisplays && _questDisplays.GetSize() > 0) && (_questNames && _questNames.GetSize() > 0)
		bRegisterQuests = (APIScript.RegisterQuestDisplayList(_ModName, _questDisplays, _questNames))
	endif
	
	if (_explorationDisplays && _explorationDisplays.GetSize() > 0) && (_explorationNames && _explorationNames.GetSize() > 0)
		bRegisterExploration = (APIScript.RegisterExplorationDisplayList(_ModName, _explorationDisplays, _explorationNames))
	endif

endFunction

;;-- functions ---------------------------------------		

Function RegisterModEvents()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endFunction

;;-- functions ---------------------------------------	

function UpdateArrays()
	
	MCM.AddModSupport(_GlobalComplete, _GlobalCount, _GlobalTotal, _ModName, RN_SupportedModCount, DBM)
	
	if (_ModName == "Heavy Armory") || (_ModName == "Immersive Weapons")
		_CreateArray()
		MCM.AddSectionSupport(_NewSectionGlobalCount, _NewSectionGlobalTotal, _NewSectionGlobalComplete, _ModName, _NewSectionArrayName, _NewSectionItemsList, _NewSectionDisplayList)
	endIf
endfunction	

;;-- functions ---------------------------------------		

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

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)
	
	TCCDebug.Log("Official Patch [" + _ModName  + "] - Scan Event Received...", 0)

	Int Index = DBM.NewSectionDisplayRefLists.length
	While Index
		Index -= 1
		_onDisplayCheck(DBM.NewSectionDisplayRefLists[Index], _EnabledList, _GlobalCount, _ModName)
	endWhile
	
	if (CheckValueCount1(_GlobalCount, _GlobalTotal, _GlobalComplete) && (MCM.ShowSetCompleteVal) && (!bNotified))  
		_CompleteNotification.Show()
		bNotified = True
	endif
	
	RN_Scan_Done.Mod(1)
	
	TCCDebug.Log("Official Patch [" + _ModName  + "] - Scan Event Completed", 0)
endEvent	

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)
	
	ObjectReference Disp = DisplayRef as ObjectReference
	
	if (_DisplayList.HasForm(Disp))
	
		if (EnableState) && (!_EnabledList.HasForm(Disp))
		
			_EnabledList.AddForm(Disp)
			
			TCCDebug.Log("Official Patch [" + _ModName  + "] - Updated display " + Disp.GetName() + Disp, 0)
			
			_GlobalCount.Mod(1)
			
		elseif (!EnableState) && (_EnabledList.HasForm(Disp))
		
			_EnabledList.RemoveAddedForm(Disp)
			
			TCCDebug.Log("Official Patch [" + _ModName  + "] - Removed display " + Disp.GetName() + Disp, 0)
			
			_GlobalCount.Mod(-1)
		endIf
	endIf

	if (CheckValueCount1(_GlobalCount, _GlobalTotal, _GlobalComplete) && (MCM.ShowSetCompleteVal) && (!bNotified))  
		_CompleteNotification.Show()
		bNotified = True
	endif
endEvent

;;-- functions ---------------------------------------	

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
