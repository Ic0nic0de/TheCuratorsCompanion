scriptName TCC_CustomPatchScript extends quest

Import Debug
Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_PropManager property Util auto
DBMSupportedModScript property DBM auto

RN_PatchAPI property APIScript auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																					;;Auto Filled Properties
bool property _setupDone = false auto hidden
bool bConfigured
bool bNotified

bool bRegisterExploration
bool bRegisterHallofWonders
bool bRegisterQuestStagePassed
bool bRegisterQuestStage
bool bRegisterQuests
bool bRegisterSafeHouse

formlist property TCC_ItemList_Patches auto

formlist property dbmNew auto
formlist property dbmMaster auto

formlist property DBM_RN_QuestDisplays auto 
formlist property DBM_RN_Quest_Stage_Displays auto
formlist property DBM_RN_Quest_StagePassed_Displays auto

Formlist property DBM_RN_ExplorationDisplays auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto
globalvariable property RN_CustomModCount auto

formlist property _DisplayList auto
formlist property _EnabledList auto

Message property _CompleteNotification auto

globalvariable property _GlobalComplete auto
globalvariable property _GlobalCount auto
globalvariable property _GlobalTotal auto

Formlist Property _questDisplays auto
Formlist property _questNames auto

Formlist property _explorationDisplays auto
Formlist property _explorationNames auto

Int _ReturnInt

float ftimeStart
float ftimeEnd

Int Tracker
Int SectionDone

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
		bConfigured = (APIScript.RegisterSupportedMod(DBM.sSupportedModName, None, Self))
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
			if SectionDone == 5
				SectionDone = 0
				
				UpdateCounts()
				_setupDone = true
				
				ftimeEnd = Utility.GetCurrentRealTime()
				TCCDebug.Log("TCC_CustomPatchScript - Setup function completed for " + DBM.sSupportedModName + " in " + (ftimeEnd - ftimeStart) + " seconds.")	
				
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
						bRegisterSafeHouse = (APIScript.RegisterDisplayList("Safehouse", DBM.sSupportedModName, DBM.NewSectionDisplayRefLists[_Index], DBM.NewSectionItemLists[_Index]))
					endIf
						
					if DBM.NewSectionRoomNames[_Index] == "Hall of Wonders"
						bRegisterHallofWonders = (APIScript.RegisterDisplayList("Hall of Wonders", DBM.sSupportedModName, DBM.NewSectionDisplayRefLists[_Index], DBM.NewSectionItemLists[_Index]))
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
				
				bRegisterExploration = (APIScript.RegisterExplorationDisplayList(DBM.sSupportedModName, _explorationDisplays, _explorationNames))
			endif
			
			SectionDone += 1

;;-----------------------------------------------------------------
			
		elseif	Tracker == 5
			Tracker = 999
			RegisterForSingleUpdate(0)
			
			if (_questDisplays && _questDisplays.GetSize() > 0) && (_questNames && _questNames.GetSize() > 0)
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
				bRegisterQuests = (APIScript.RegisterQuestDisplayList(DBM.sSupportedModName, _questDisplays, _questNames))
			endIf
			
			SectionDone += 1
		endif
	endEvent
endState

;;-- functions ---------------------------------------

Function ResetTracking()

	Int _Index = DBM.NewSectionRoomNames.length		
	While _Index
		_Index -= 1
		if DBM.NewSectionRoomNames[_Index] == "Safehouse"
			bRegisterSafeHouse = (APIScript.RegisterDisplayList("Safehouse", DBM.sSupportedModName, DBM.NewSectionDisplayRefLists[_Index], DBM.NewSectionItemLists[_Index]))
		endIf
		
		if DBM.NewSectionRoomNames[_Index] == "Hall of Wonders"
			bRegisterHallofWonders = (APIScript.RegisterDisplayList("Hall of Wonders", DBM.sSupportedModName, DBM.NewSectionDisplayRefLists[_Index], DBM.NewSectionItemLists[_Index]))
		endif				
	endWhile
	
	if (_questDisplays && _questDisplays.GetSize() > 0) && (_questNames && _questNames.GetSize() > 0)
		bRegisterQuests = (APIScript.RegisterQuestDisplayList(DBM.sSupportedModName, _questDisplays, _questNames))
	endif
	
	if (_explorationDisplays && _explorationDisplays.GetSize() > 0) && (_explorationNames && _explorationNames.GetSize() > 0)
		bRegisterExploration = (APIScript.RegisterExplorationDisplayList(DBM.sSupportedModName, _explorationDisplays, _explorationNames))
	endif
endFunction

;;-- Events ---------------------------------------		

Function RegisterModEvents()

	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endFunction

;;-- Events ---------------------------------------	

function UpdateArrays()
	
	MCM.AddCustomModSupport(_GlobalComplete, _GlobalCount, _GlobalTotal, DBM.sSupportedModName, RN_CustomModCount, DBM)
endfunction

;;-- Events ---------------------------------------		

function UpdateCounts()
	
	_GlobalTotal.SetValue(_DisplayList.GetSize() - _ReturnInt)	
	_GlobalCount.SetValue(_EnabledList.GetSize())
endfunction

;;-- Events ---------------------------------------

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)
	
	TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName  + "] - Scan Event Received...", 0)

	Int Index = DBM.NewSectionDisplayRefLists.length
	While Index
		Index -= 1
		_onDisplayCheck(DBM.NewSectionDisplayRefLists[Index], _EnabledList, _GlobalCount, DBM.sSupportedModName)
	endWhile
	
	if (CheckValueCount1(_GlobalCount, _GlobalTotal, _GlobalComplete) && (MCM.ShowSetCompleteVal) && (!bNotified))  
		_CompleteNotification.Show()
		bNotified = True
	endif
	
	RN_Scan_Done.Mod(1)
	
	TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName  + "] - Scan Event Completed", 0)
endEvent	

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)
	
	ObjectReference Disp = DisplayRef as ObjectReference
	
	if (_DisplayList.HasForm(Disp))
	
		if (EnableState) && (!_EnabledList.HasForm(Disp))
		
			_EnabledList.AddForm(Disp)
			
			TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName  + "] - Updated display " + Disp.GetName() + Disp, 0)
			
			_GlobalCount.Mod(1)
			
		elseif (!EnableState) && (_EnabledList.HasForm(Disp))
		
			_EnabledList.RemoveAddedForm(Disp)
			
			TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName  + "] - Removed display " + Disp.GetName() + Disp, 0)
			
			_GlobalCount.Mod(-1)
		endIf
	endIf

	if (CheckValueCount1(_GlobalCount, _GlobalTotal, _GlobalComplete) && (MCM.ShowSetCompleteVal) && (!bNotified))  
		_CompleteNotification.Show()
		bNotified = True
	endif
endEvent
