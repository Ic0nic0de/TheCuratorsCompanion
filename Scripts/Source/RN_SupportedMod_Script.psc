scriptName RN_SupportedMod_Script extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;bool to control if the setup has been completed for the mod.
bool _setupDone = false

;;Formlists to control merged and found lists
formlist property Supported_Items_Merged auto

;;Formlists to control item lists - MoreHUD
formlist property dbmNew auto
formlist property dbmMaster auto

;;Formlist to control quest displays.
formlist property DBM_RN_QuestDisplays auto
Formlist property DBM_RN_ExplorationDisplays auto

;; Global for ModEvent Return.
globalvariable property RN_Setup_Done auto
globalvariable property RN_Setup_Registered auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

;;Global for mod completion.
globalvariable property iModComplete auto
globalvariable property iCreationComplete auto

globalvariable property RN_SupportedModCount auto
globalvariable property RN_SupportedCreationCount auto

formlist property RN_TokenFormlistExcluded auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Patch Type - false - Creaton / true - Patch
bool property _bPatchType auto 

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control Display lists.
formlist[] property _displaysArray auto
formlist[] property _displayRooms auto

formlist property _displayList_Merged auto
formlist property _displayList_Enabled auto

;;Collection Complete Notifications.
Message property _modCompleteMessage auto
Message property _modCompleteNotification auto

;;Globals for set completion
globalvariable property _Global_Mod_Complete auto

;;Globals for current Count
globalvariable property _Global_Display_Count auto

;;Globals for Total Count
globalvariable property _Global_Display_Total auto

;;AddForm to quest display listener. 
ObjectReference[] property _questDisplays auto

;;Shrine Display Properties
Formlist property _wintersunShrine auto

;;Prisoner belongigns chest for mods that add one.
ObjectReference[] property _PrisonerChest auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Events ---------------------------------------			
	
Event onInit()
		
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("TCCSetup_Patches", "_onSetup")
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("TCCSetup_Patches", "_onSetup")
		
	if _displayList_Merged
		_Global_Display_Total.SetValue(_displayList_Merged.GetSize())
	else
		_Global_Display_Total.SetValue(_displaysArray[0].GetSize())
	endIf
	
	_Global_Display_Count.SetValue(_displayList_Enabled.GetSize())	
endEvent

;;-- Events ---------------------------------------	

Event _onSetup(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	Debug.Notification("Received")
	_RunSetup()
endEvent

;;-- Events ---------------------------------------		

Event _RunSetup()
	
	RN_Setup_Registered.Mod(1)
	
	if !_setupDone

		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Received for: " +_Global_Mod_Complete)
		endIf

		Int Index = _itemsArray.length		
		While Index
			Index -= 1
			_onConsolidateItems(_itemsArray[Index], Supported_Items_Merged, dbmNew, dbmMaster)			
		endWhile
		
;;------------
		
		Index = _displaysArray.length		
		While Index
			Index -= 1
			if _displayList_Merged
				_onConsolidateDisplays(_displaysArray[Index], _displayList_Merged)
			endIf
		endWhile
				
		if _displayList_Merged
			_Global_Display_Total.SetValue(_displayList_Merged.GetSize())
		else
			_Global_Display_Total.SetValue(_displaysArray[0].GetSize())
		endIf
		
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
			Index = _questDisplays.Length
			while Index > 0
				Index -= 1		
				DBM_RN_QuestDisplays.AddForm(_questDisplays[Index])
			EndWhile
		endIf

;;------------

		if _PrisonerChest
			Index = _PrisonerChest.length
			while Index > 0
				Index -= 1		
				RN_TokenFormlistExcluded.AddForm(_PrisonerChest[Index])
			EndWhile
		endIf
		
;;------------

		if _bPatchType	
			RN_SupportedModCount.Mod(1)
		else
			RN_SupportedCreationCount.Mod(1)	
		endIf
		
		RN_Setup_Done.Mod(1)
		_setupDone = True
		
		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Completed for: " +_Global_Mod_Complete)
		endIf
	else
		
		RN_Setup_Done.Mod(1)
		
		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Already Completed for: " +_Global_Mod_Complete)
		endIf
	endIf
endEvent	

;;-- Events ---------------------------------------		

Event _onScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	RN_Scan_Registered.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Received for: " +_Global_Mod_Complete)
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
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Completed for: " +_Global_Mod_Complete)
	endIf
	
EndEvent	
