scriptName RN_Uniques_Setup extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;bool to control if the setup has been completed for the mod.
bool _setupDone = false

;;Formlists to control merged and found lists
formlist property TCC_ItemList_Patches auto

;;Formlists to control item lists - MoreHUD
formlist property dbmNew auto
formlist property dbmMaster auto

;; Global for ModEvent Return.
globalvariable property RN_Setup_Done auto
globalvariable property RN_Setup_Registered auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
globalvariable property RN_SafeouseContent_Installed auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Events ---------------------------------------			
	
Event onInit()
		
	RegisterForModEvent("TCCScan_Uniques", "_onScan")
	RegisterForModEvent("TCCSetup_Uniques", "_onSetup")
	RegisterForModEvent("TCCUpdate_Uniques", "_onPatchUpdate")
	RegisterForModEvent("TCCUpdate_Counts_Uniques", "_onCountUpdate")
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()
	
	RegisterForModEvent("TCCScan_Uniques", "_onScan")
	RegisterForModEvent("TCCSetup_Uniques", "_onSetup")
	RegisterForModEvent("TCCUpdate_Uniques", "_onPatchUpdate")
	RegisterForModEvent("TCCUpdate_Counts_Uniques", "_onCountUpdate")
endEvent

;;-- Events ---------------------------------------	

Event _onSetup(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
		
	_RunSetup()			
endEvent

;;-- Events ---------------------------------------		

Event _RunSetup()
	
	RN_Setup_Registered.Mod(1)
	RN_SafeouseContent_Installed.setvalue(1)
	
	if !_setupDone

		TCCDebug.Log("Official Patch [TCC Unique Items] - Setup Event Received...", 0)

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
		
		RN_Setup_Done.Mod(1)
		_setupDone = True
		
		TCCDebug.Log("Official Patch [TCC Unique Items] - Setup Event Completed", 0)
	else
		
		RN_Setup_Done.Mod(1)	
		TCCDebug.Log("Official Patch [TCC Unique Items] - Setup Event Already Completed", 0)
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
	
	TCCDebug.Log("Official Patch [TCC Unique Items] - Scan Event Received...", 0)
	
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
	TCCDebug.Log("Official Patch [TCC Unique Items] - Scan Event Completed", 0)
endEvent	
