scriptName TCC_CustomPatchScript extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																					;;Auto Filled Properties
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

globalvariable property RN_CustomModCount auto

globalvariable property RN_CreationClubContent_Installed auto
globalvariable property RN_SafeouseContent_Installed auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																					;;Manually Filled Properties
;;Name of this patch (This is how the patch will appear in the MCM)
String Property _PatchName Auto

;;Set this to True if this patch adds displays to the Hall of Wonders (Creation Club).
bool property bCreationClubPatch auto

;;Set this to True if this patch adds displays to the Safehouse.
bool property bSafeHousePatch auto

;;Add all Displayable Item Formlists to this Array.
formlist[] property _itemsArray auto

;;Add all Display Formlists to this Array.
formlist[] property _displaysArray auto

;;Formlist for the room that the displays are housed in.
formlist[] property _displayRoomflist auto

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

;;AddForm to quest display listener. (Requires the DBM_RN_ExplorationDisplay script to be attached to the display reference) 
Formlist Property _questDisplays auto ;Optional

;;Addform to exploration listener. (Requires either the DBM_RN_QuestDisplay script or DBM_RN_QuestDisplayStage script to be attached to the display reference) 
Formlist property _ExplorationDisplays auto ;Optional

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
		
	MCM.AddCustomModSupport(Utility.Randomint(1,5), _Global_Mod_Complete, _Global_Display_Count, _Global_Display_Total, _PatchName)			
endEvent

;;-- Events ---------------------------------------		

Event _RunSetup()
	
	RN_Setup_Registered.Mod(1)
	
	if !_setupDone

		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Received for: " + GetOwningQuest().GetName())
		endIf
		
		MCM.AddCustomModSupport(Utility.Randomint(1,5), _Global_Mod_Complete, _Global_Display_Count, _Global_Display_Total, _PatchName)
		
		if bCreationClubPatch
			if !RN_CreationClubContent_Installed.GetValue()
				RN_CreationClubContent_Installed.setvalue(1)
			endIf
		endIf

		if bSafeHousePatch
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
			_onConsolidateDisplays(_displaysArray[Index], _displayList_Merged)
			_onConsolidateDisplays(_displaysArray[Index], _displayRoomflist[Index])
		endWhile
		
;;------------
		
		if _ExplorationDisplays
			Index = 0
			while Index < _ExplorationDisplays.GetSize()
				ObjectReference _Ref = _ExplorationDisplays.GetAt(Index) as ObjectReference		
				DBM_RN_ExplorationDisplays.AddForm(_Ref)
				Index += 1
			EndWhile
		endIf
	
;;------------

		if _questDisplays
			Index = 0
			while Index < _questDisplays.GetSize()
				ObjectReference _Ref = _questDisplays.GetAt(Index) as ObjectReference		
				DBM_RN_QuestDisplays.AddForm(_Ref)
				Index += 1
			EndWhile
		endIf

;;------------
		
		RN_CustomModCount.Mod(1)
		
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

Event _onCountUpdate(string eventName, string strArg, float numArg, Form sender)

	_Global_Display_Total.SetValue(_displayList_Merged.GetSize())	
	_Global_Display_Count.SetValue(_displayList_Enabled.GetSize())
endEvent

;;-- Events ---------------------------------------

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
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

;/
/;