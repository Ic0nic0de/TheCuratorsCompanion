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

formlist property DBM_RN_QuestDisplays auto ;; Quest Complete
formlist property DBM_RN_Quest_Stage_Displays auto ;; Quest Complete based on GetStageDone()
formlist property DBM_RN_Quest_StagePassed_Displays auto;; Quest Passed a setstage ( >= akStage)

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

Formlist property _questDisplaysStage auto
Formlist property _questNamesStage auto

Formlist property _questDisplaysStagePassed auto
Formlist property _questNamesStagePassed auto

Formlist property _explorationDisplays auto
Formlist property _explorationNames auto

Formlist property _SafehouseDisplays auto
Formlist property _SafehouseNames auto

Formlist property _HallofWondersDisplays auto
Formlist property _HallofWondersNames auto

Int _ReturnInt

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnInit()

	if (!DBM || !Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + self.GetName() + " ABORTING...", 2)
		return
	endIf
	
	APIScript.UnregisteredPatch = True
	RegisterForSingleUpdate(Utility.RandomInt(1,5))	
EndEvent

;;-- Events ---------------------------------------		

Event OnUpdate()
	
	UnregisterForUpdate()
		
	if bConfigured
		RegisterModEvents()
	else
		
		bConfigured = (APIScript.RegisterSupportedMod(DBM.sSupportedModName, None, Self))
		RegisterModEvents()
		RegisterDisplays()
		RunSetup()
	endif
EndEvent

;;-- Events ---------------------------------------		

Function RegisterModEvents()

	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endFunction

;;-- Events ---------------------------------------		

function RunSetup()
	
	if (!_setupDone)
		
		float ftimeStart = Utility.GetCurrentRealTime()
		
;;------------ Item and Display lists (Consolidation Code used to prep room counts and apply moreHUD Icons)
	
		Int _Index = DBM.NewSectionItemLists.length		
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
		
;;------------ Quest / Exploration Listeners (For Notifications & Display Tracking)

		if (_explorationDisplays)

			_Index = 0
			while _Index < _explorationDisplays.GetSize()
				ObjectReference _Ref = _ExplorationDisplays.GetAt(_Index) as ObjectReference		
				DBM_RN_ExplorationDisplays.AddForm(_Ref)
				_Index += 1
			EndWhile
		endIf

		if (_questDisplays)

			_Index = 0
			while _Index < _questDisplays.GetSize()
				ObjectReference _Ref = _questDisplays.GetAt(_Index) as ObjectReference		
				DBM_RN_QuestDisplays.AddForm(_Ref)
				_Index += 1
			EndWhile
		endIf

		if (_questDisplaysStage)

			_Index = 0
			while _Index < _questDisplaysStage.GetSize()
				ObjectReference _Ref = _questDisplaysStage.GetAt(_Index) as ObjectReference		
				DBM_RN_Quest_Stage_Displays.AddForm(_Ref)
				_Index += 1
			EndWhile	
		endIf

		if (_questDisplaysStagePassed)
			_Index = 0
			while _Index < _questDisplaysStagePassed.GetSize()
				ObjectReference _Ref = _questDisplaysStagePassed.GetAt(_Index) as ObjectReference		
				DBM_RN_Quest_StagePassed_Displays.AddForm(_Ref)
				_Index += 1
			EndWhile	
		endIf
		
		UpdateCounts()
		float ftimeEnd = Utility.GetCurrentRealTime()
		TCCDebug.Log("TCC_CustomPatchScript - Setup function completed for " + DBM.sSupportedModName + " in " + (ftimeEnd - ftimeStart) + " seconds.")	
	endif

	_setupDone = True
endfunction

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

Event _onScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	RN_Scan_Registered.Mod(1)
	
	TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName  + "] - Scan Event Received...", 0)

	Int Index = DBM.NewSectionDisplayRefLists.length
	While Index
		Index -= 1
		_onDisplayCheck(DBM.NewSectionDisplayRefLists[Index], _EnabledList, _GlobalCount)
	endWhile
	
	if (CheckValueCount1(_GlobalCount, _GlobalTotal, _GlobalComplete) && (MCM.ShowSetCompleteVal) && (!bNotified))  
		_CompleteNotification.Show()
		bNotified = True
	endif
	
	RN_Scan_Done.Mod(1)
	
	TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName  + "] - Scan Event Completed", 0)
endEvent	

;;-- Events ---------------------------------------	

Function RegisterDisplays()

	if (_SafehouseDisplays && _SafehouseNames)
		bRegisterSafeHouse = (APIScript.RegisterSafehouseDisplayList(DBM.sSupportedModName, _SafehouseDisplays, _SafehouseNames))
	endIf
	
	if (_HallofWondersDisplays && _HallofWondersNames)
		bRegisterHallofWonders = (APIScript.RegisterHallofWondersDisplayList(DBM.sSupportedModName, _HallofWondersDisplays, _HallofWondersNames))
	endIf
	
	if (_explorationDisplays && _explorationNames)
		bRegisterExploration = (APIScript.RegisterExplorationDisplayList(DBM.sSupportedModName, _explorationDisplays, _explorationNames))
	endIf
	
	if (_questDisplays && _questNames)
		bRegisterQuests = (APIScript.RegisterQuestDisplayList(DBM.sSupportedModName, _questDisplays, _questNames))
	endIf		

	if (_questDisplaysStage && _questNamesStage)
		bRegisterQuestStage = (APIScript.RegisterQuestDisplayList(DBM.sSupportedModName, _questDisplaysStage, _questNamesStage))
	endIf	

	if (_questDisplaysStagePassed && _questNamesStagePassed)
		bRegisterQuestStagePassed = (APIScript.RegisterQuestDisplayList(DBM.sSupportedModName, _questDisplaysStagePassed, _questNamesStagePassed))
	endIf
endFunction

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)
	
	ObjectReference Disp = DisplayRef as ObjectReference
	
	if (_DisplayList.HasForm(Disp))
		if (EnableState)
			_EnabledList.AddForm(Disp)
			
			TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName  + "] - Updated display " + Disp.GetName() + Disp, 0)
			
			_GlobalCount.Mod(1)
			
		else
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
