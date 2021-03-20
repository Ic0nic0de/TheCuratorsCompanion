scriptName TCC_CustomPatchScript extends ReferenceAlias

Import Debug
Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_PropManager property Util auto
DBMSupportedModScript property DBM auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																					;;Auto Filled Properties
bool _setupDone = false

formlist property TCC_ItemList_Patches auto

formlist property dbmNew auto
formlist property dbmMaster auto

formlist property DBM_RN_QuestDisplays auto
Formlist Property DBM_RN_Quest_Stage_Displays auto
Formlist property DBM_RN_ExplorationDisplays auto

globalvariable property RN_Setup_Done auto
globalvariable property RN_Setup_Registered auto
globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto
globalvariable property RN_CustomModCount auto

formlist property _DisplayList auto
formlist property _EnabledList auto

Message property _CompleteMessage auto
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

;;-- Events ---------------------------------------			

Event onInit()

	Register()	
endEvent

;;-- Events ---------------------------------------			
	
Event onPlayerLoadGame()

	Register()
endEvent

;;-- Events ---------------------------------------		

Function Register()

	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("TCCSetup_Patches", "_onSetup")
	RegisterForModEvent("TCCUpdate_Patches", "_onPatchUpdate")
	RegisterForModEvent("TCCUpdate_Counts", "_onCountUpdate")
	RegisterForModEvent("TCCUpdate_Arrays", "_onArrayUpdate")
endFunction

;;-- Events ---------------------------------------	

Event _onSetup(string eventName, string strArg, float numArg, Form sender)
	
	_RunSetup()	
endEvent

;;-- Events ---------------------------------------	

Event _onArrayUpdate(string eventName, string strArg, float numArg, Form sender)

	if (!DBM || !Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + GetOwningQuest().GetName() + " ABORTING...", 2)
		return
	endIf
	
	MCM.AddCustomModSupport(_GlobalComplete, _GlobalCount, _GlobalTotal, DBM.sSupportedModName, RN_CustomModCount, DBM)
endEvent

;;-- Events ---------------------------------------		

Event _RunSetup()
	
	RN_Setup_Registered.Mod(1)
	
	if (!DBM || !Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + GetOwningQuest().GetName() + " ABORTING...", 2)
		RN_Setup_Done.Mod(1)
		return
	endIf
	
	if (!_setupDone)
		
		Util.UpdateReq = True
		
		if MCM.advdebug
			TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + "] - Setup Event Received...", 0)
		endIf
		
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
		
;;------------

		RN_Setup_Done.Mod(1)
		_setupDone = True
		
		if MCM.advdebug
			TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + "] - Setup Event Completed", 0)
		endif
	else
		RN_Setup_Done.Mod(1)
		if MCM.advdebug
			TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + "] - Setup Event Already Completed", 0)
		endif
	endIf
endEvent

;;-- Events ---------------------------------------	

Event _onPatchUpdate(string eventName, string strArg, float numArg, Form sender)

	if (!DBM || !Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + GetOwningQuest().GetName() + " ABORTING...", 2)
		return
	endIf
	
	_setupDone = false
	_DisplayList.Revert()
	_ReturnInt = 0
	_RunSetup()
endEvent	

;;-- Events ---------------------------------------		

Event _onCountUpdate(string eventName, string strArg, float numArg, Form sender)

	if (!DBM || !Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + GetOwningQuest().GetName() + " ABORTING...", 2)
		return
	endIf
	
	_GlobalTotal.SetValue(_DisplayList.GetSize() - _ReturnInt)	
	_GlobalCount.SetValue(_EnabledList.GetSize())
endEvent

;;-- Events ---------------------------------------

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)

	if (!DBM || !Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + GetOwningQuest().GetName() + " ABORTING...", 2)
		RN_Scan_Done.Mod(1)
		return
	endIf
	
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
			if (MCM.ShowSimpleNotificationVal)
				_CompleteNotification.Show()
			else
				_CompleteMessage.Show()
			endIf
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
			if (MCM.ShowSimpleNotificationVal)
				_CompleteNotification.Show()
			else
				_CompleteMessage.Show()
			endif
		endif
	endIf
endEvent
