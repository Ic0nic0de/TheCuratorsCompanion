scriptName TCC_CustomPatchScript extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

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
globalvariable property RN_CreationClubContent_Installed auto
globalvariable property RN_SafeouseContent_Installed auto

formlist property TCC_DisplayList_None auto
formlist property TCC_DisplayList_Armory auto
formlist property TCC_DisplayList_DaedricGallery auto
formlist property TCC_DisplayList_DragonbornHall auto
formlist property TCC_DisplayList_Guildhouse auto
formlist property TCC_DisplayList_HallofHeroes auto
formlist property TCC_DisplayList_HallofLostEmpires auto
formlist property TCC_DisplayList_HallofOddities auto
formlist property TCC_DisplayList_HallofSecrets auto
formlist property TCC_DisplayList_HallofWonders auto
formlist property TCC_DisplayList_Library auto
formlist property TCC_DisplayList_NaturalScience auto
formlist property TCC_DisplayList_Safehouse auto
formlist property TCC_DisplayList_Storeroom auto

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

	if !DBM
		TCCDebug.Log("Fatal Error, DBM PATCH NOT SET ON QUEST " + GetOwningQuest().GetName() + " ABORTING SETUP...", 0)
		return
	endIf
	
	MCM.AddCustomModSupport(_GlobalComplete, _GlobalCount, _GlobalTotal, DBM.sSupportedModName + ":", RN_CustomModCount)
endEvent

;;-- Events ---------------------------------------		

Event _RunSetup()
	
	RN_Setup_Registered.Mod(1)
	
	if !DBM
		TCCDebug.Log("Fatal Error, DBM PATCH NOT SET ON QUEST " + GetOwningQuest().GetName() + " ABORTING SETUP...", 0)
		RN_Setup_Done.Mod(1)
		return
	endIf
	
	TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName  + "] Hooked [" + DBM.GetName()  + "] Support Handler", 0)
	Utility.Wait(2)
	
	if !_setupDone
	
		TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + ":" + "] - Setup Event Received...", 0)
		
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
				_onConsolidateDisplays(DBM.NewSectionDisplayRefLists[_Index], _DisplayList)
				_onConsolidateDisplays(DBM.NewSectionDisplayRefLists[_Index], _getDisplayRoom(DBM.NewSectionRoomNames[_Index]))
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
		
		MCM.UpdateReq = True
		TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + ":" + "] - Setup Event Completed", 0)
	else
		RN_Setup_Done.Mod(1)
		TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + ":" + "] - Setup Event Already Completed", 0)
	endIf
endEvent

;;-- Events ---------------------------------------	

Event _onPatchUpdate(string eventName, string strArg, float numArg, Form sender)

	if !DBM
		TCCDebug.Log("Fatal Error, DBM PATCH NOT SET ON QUEST " + GetOwningQuest().GetName() + " ABORTING SETUP...", 0)
		return
	endIf
	
	_setupDone = false
	_DisplayList.Revert()
	_RunSetup()
endEvent	

;;-- Events ---------------------------------------		

Event _onCountUpdate(string eventName, string strArg, float numArg, Form sender)

	if !DBM
		TCCDebug.Log("Fatal Error, DBM PATCH NOT SET ON QUEST " + GetOwningQuest().GetName() + " ABORTING SETUP...", 0)
		return
	endIf
	
	_GlobalTotal.SetValue(_DisplayList.GetSize())	
	_GlobalCount.SetValue(_EnabledList.GetSize())
endEvent

;;-- Events ---------------------------------------

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)

	if !DBM
		TCCDebug.Log("Fatal Error, DBM PATCH NOT SET ON QUEST " + GetOwningQuest().GetName() + " ABORTING SETUP...", 0)
		RN_Scan_Done.Mod(1)
		return
	endIf
	
	TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + ":" + "] - Scan Event Received...", 0)
	
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
	
	TCCDebug.Log("Custom Patch [" + DBM.sSupportedModName + ":" + "] - Scan Event Completed", 0)
endEvent	

;;-- Events ---------------------------------------

Formlist Function _getDisplayRoom(String _RoomName)
	
	if (_RoomName == "Armory")
		return TCC_DisplayList_Armory
	
	elseif (_RoomName == "Daedric Gallery")
		return TCC_DisplayList_DaedricGallery
		
	elseif (_RoomName == "Dragonborn Hall")
		return TCC_DisplayList_DragonbornHall

	elseif (_RoomName == "Guildhouse")
		return TCC_DisplayList_Guildhouse

	elseif (_RoomName == "Hall of Heroes")
		return TCC_DisplayList_HallofHeroes

	elseif (_RoomName == "Hall of Lost Empires")
		return TCC_DisplayList_HallofLostEmpires

	elseif (_RoomName == "Hall of Oddities")
		return TCC_DisplayList_HallofOddities

	elseif (_RoomName == "Hall of Secrets")
		return TCC_DisplayList_HallofSecrets

	elseif (_RoomName == "Hall of Wonders")
		RN_CreationClubContent_Installed.setvalue(1)
		return TCC_DisplayList_HallofWonders

	elseif (_RoomName == "Gallery Library")
		return TCC_DisplayList_Library

	elseif (_RoomName == "Natural Science")
		return TCC_DisplayList_NaturalScience

	elseif (_RoomName == "Safehouse")
		RN_SafeouseContent_Installed.setvalue(1)
		return TCC_DisplayList_Safehouse

	elseif (_RoomName == "Museum Storeroom")
		return TCC_DisplayList_Storeroom
	endif
	
	Return TCC_DisplayList_None
endFunction
