scriptName RN_SupportedMod_Script extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																					;;AutoFill Properties
bool _setupDone = false

formlist property TCC_ItemList_Patches auto

formlist property dbmNew auto
formlist property dbmMaster auto

formlist property DBM_RN_QuestDisplays auto
Formlist property DBM_RN_ExplorationDisplays auto

globalvariable property RN_Setup_Done auto
globalvariable property RN_Setup_Registered auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

globalvariable property RN_SupportedModCount auto

formlist property TCC_TokenList_ExcludedItems auto

globalvariable property RN_CreationClubContent_Installed auto
globalvariable property RN_SafeouseContent_Installed auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Name of the patch to appear in the MCM
String Property _ModName Auto

;;Set this to True if this patch is located in the Hall of Wonders (Creation Club).
bool property bCreationClub auto

;;Set this to True if this patch is located in the Safehouse.
bool property bSafeHouseMod auto

;;Formlists that contain the displayable items.
formlist[] property _itemsArray auto

;;Formlists that contain the display References.
formlist[] property _displaysArray auto

;;Formlist for the room that the displays are housed in.
formlist[] property _displayRooms auto

;;Formlist needed if you are adding displays to 2 or more rooms / sections.
formlist property _displayList_Merged auto

;;Formlist to keep track of enabled displays.
formlist property _displayList_Enabled auto

;;Message to show when all items have been collected.
Message property _modCompleteMessage auto

;;Notification to show when all items have been collected.
Message property _modCompleteNotification auto

;;Global for mod completion
globalvariable property _Global_Mod_Complete auto

;;Global for current display Count
globalvariable property _Global_Display_Count auto

;;Global for Total display Count
globalvariable property _Global_Display_Total auto

;;AddForm to quest display listener. (Requires Another script on the display itself) 
Formlist Property _questDisplays auto ;Optional

;;Addform to exploration listener. (Requires Another script on the display itself) 
Formlist property _wintersunShrine auto ;Optional

;;Prisoner belongigns chest for mods that add one.
ObjectReference[] property _PrisonerChest auto ;Optional

;; Set to 0 for custom made / unofficial patches
Int Property _ArrayIndex Auto

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

Event _onSetup(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
		
	_RunSetup()			
endEvent

;;-- Events ---------------------------------------	

Event _onArrayUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
		
	MCM.AddModSupport(Utility.Randomint(1,5), _ArrayIndex, _Global_Mod_Complete, _Global_Display_Count, _Global_Display_Total, _ModName)			
endEvent

;;-- Events ---------------------------------------		

Event _RunSetup()
	
	RN_Setup_Registered.Mod(1)
	
	if !_setupDone

		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Received for: " + GetOwningQuest().GetName())
		endIf
		
		MCM.AddModSupport(Utility.Randomint(1,5), _ArrayIndex, _Global_Mod_Complete, _Global_Display_Count, _Global_Display_Total, _ModName)
		
		if bCreationClub
			if !RN_CreationClubContent_Installed.GetValue()
				RN_CreationClubContent_Installed.setvalue(1)
			endIf
		endIf

		if bSafeHouseMod
			if !RN_SafeouseContent_Installed.GetValue()
				RN_SafeouseContent_Installed.setvalue(1)
			endIf
		endIf	
		
		
		Int Index = _itemsArray.length		
		While Index
			Index -= 1
			_onConsolidateItems(_itemsArray[Index], TCC_ItemList_Patches, dbmNew, dbmMaster)			
		endWhile
		
;;------------
		
		Index = _displaysArray.length		
		While Index
			Index -= 1
			if _displayList_Merged
				_onConsolidateDisplays(_displaysArray[Index], _displayList_Merged)
			endIf
		endWhile
		
;;------------
		
		if _displayRooms
			Index = _displaysArray.length
			While Index 
				Index -= 1
				_onConsolidateDisplays(_displaysArray[Index], _displayRooms[Index])
			endWhile
		endIf
		
;;------------
		
		if _wintersunShrine
			Index = 0
			while Index < _wintersunShrine.GetSize()
				ObjectReference _Shrine = _wintersunShrine.GetAt(Index) as ObjectReference		
				DBM_RN_ExplorationDisplays.AddForm(_Shrine)
				Index += 1
			EndWhile
		endIf
	
;;------------

		if _questDisplays
			Index = 0
			while Index < _questDisplays.GetSize()
				ObjectReference _Display = _questDisplays.GetAt(Index) as ObjectReference		
				DBM_RN_QuestDisplays.AddForm(_Display)
				Index += 1
			EndWhile
		endIf

;;------------

		if _PrisonerChest
			Index = _PrisonerChest.length
			while Index > 0
				Index -= 1		
				TCC_TokenList_ExcludedItems.AddForm(_PrisonerChest[Index])
			EndWhile
		endIf
		
;;------------
		
		RN_SupportedModCount.Mod(1)
		
		RN_Setup_Done.Mod(1)
		_setupDone = True
		
		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Completed for: " + GetOwningQuest().GetName())
		endIf
	else
		
		RN_Setup_Done.Mod(1)
		
		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Already Completed for: " + GetOwningQuest().GetName())
		endIf
	endIf
endEvent

;;-- Events ---------------------------------------	

Event _onPatchUpdate(string eventName, string strArg, float numArg, Form sender)
	
	_setupDone = false
	_RunSetup()
endEvent	

;;-- Events ---------------------------------------		

Event _onCountUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	if _displayList_Merged
		_Global_Display_Total.SetValue(_displayList_Merged.GetSize())
	else
		_Global_Display_Total.SetValue(_displaysArray[0].GetSize())
	endIf

	_Global_Display_Count.SetValue(_displayList_Enabled.GetSize())
endEvent

;;-- Events ---------------------------------------

Event _onScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	RN_Scan_Registered.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Received for: " + GetOwningQuest().GetName())
	endIf
	
	if !_Global_Mod_Complete.GetValue()
		Int Index = _displaysArray.length
		While Index
			Index -= 1
			_onDisplayCheck(_displaysArray[Index], _displayList_Enabled, _Global_Display_Count)
		endWhile
		
		if (CheckValueCount1(_Global_Display_Count, _Global_Display_Total, _Global_Mod_Complete) && (MCM.ShowSetCompleteVal))
			if (MCM.ShowSimpleNotificationVal)
				_modCompleteNotification.Show()
			else
				_modCompleteMessage.Show()
			endIf
		endIf	
	endIf
	
	RN_Scan_Done.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Completed for: " + GetOwningQuest().GetName())
	endIf
endEvent	
