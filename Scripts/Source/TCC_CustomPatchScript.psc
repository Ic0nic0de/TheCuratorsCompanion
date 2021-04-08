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

formlist property TCC_ItemList_Patches auto

formlist property dbmNew auto
formlist property dbmMaster auto

formlist property DBM_RN_QuestDisplays auto
Formlist Property DBM_RN_Quest_Stage_Displays auto
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
Formlist Property _questDisplaysStage auto
Formlist property _ExplorationDisplays auto

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
		bConfigured = APIScript.RegisterSupportedMod(DBM.sSupportedModName, None, Self)
		RegisterModEvents()
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
		
;;------------ Quest / Exploration Displays

		if (_explorationDisplays)
			_Index = 0
			while _Index < _explorationDisplays.GetSize()
				ObjectReference _Ref = _ExplorationDisplays.GetAt(_Index) as ObjectReference		
				DBM_RN_ExplorationDisplays.AddForm(_Ref)
				_Index += 1
			EndWhile
		endif

		if (_questDisplays)
			_Index = 0
			while _Index < _questDisplays.GetSize()
				ObjectReference _Ref = _questDisplays.GetAt(_Index) as ObjectReference		
				DBM_RN_QuestDisplays.AddForm(_Ref)
				_Index += 1
			EndWhile
		endif
		
		if (_questDisplaysStage)
			_Index = 0
			while _Index < _questDisplaysStage.GetSize()
				ObjectReference _Ref = _questDisplaysStage.GetAt(_Index) as ObjectReference		
				DBM_RN_Quest_Stage_Displays.AddForm(_Ref)
				_Index += 1
			EndWhile	
		endif
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

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)
	
	if MCM.advdebug
		TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + "] - Scan Event Received...", 0)
	endif
	
	if !_GlobalComplete.GetValue()
		Int Index = DBM.NewSectionDisplayRefLists.length
		While Index
			Index -= 1
			_onDisplayCheck(DBM.NewSectionDisplayRefLists[Index], _EnabledList, _GlobalCount)
		endWhile
		
		if (CheckValueCount1(_GlobalCount, _GlobalTotal, _GlobalComplete) && (MCM.ShowSetCompleteVal))
			_CompleteNotification.Show()
		endIf	
	endIf
	
	RN_Scan_Done.Mod(1)
	
	if MCM.advdebug
		TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + "] - Scan Event Completed", 0)
	endif
endEvent	

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)
	
	if !_GlobalComplete.GetValue()
		ObjectReference Disp = DisplayRef as ObjectReference
		if _DisplayList.HasForm(Disp)
			if EnableState
				_EnabledList.AddForm(Disp)
				if MCM.advdebug
					TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + "] - Updated display " + Disp.GetName() + Disp, 0)
				endif
				_GlobalCount.Mod(1)
			elseif !EnableState
				if _EnabledList.HasForm(Disp)
					_EnabledList.RemoveAddedForm(Disp)
					if MCM.advdebug
						TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + "] - Removed display " + Disp.GetName() + Disp, 0)
					endif
					_GlobalCount.Mod(-1)
				endIf
			endIf
		endif
		
		if (CheckValueCount1(_GlobalCount, _GlobalTotal, _GlobalComplete) && (MCM.ShowSetCompleteVal)) 
			_CompleteNotification.Show()
		endif
	endIf
endEvent
