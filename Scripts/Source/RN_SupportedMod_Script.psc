scriptName RN_SupportedMod_Script extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

RN_Utility_ArrayHolder property RN_Array auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																			;; General Properties

;;Formlists to control merged and found lists
formlist property Supported_Items_Merged auto

;;Formlists to control item lists - MoreHUD
formlist property dbmNew auto
formlist property dbmMaster auto

;;Formlist to control quest displays.
formlist property DBM_RN_QuestDisplays auto

;; Global for ModEvent Return.
GlobalVariable property RN_Setup_Done auto
GlobalVariable property RN_Scan_Done auto

;;Global for mod completion.
GlobalVariable property iModComplete auto

;;Strings for ModEvent text replacement.
String property _ModSetup  auto
String property _ModScan  auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																			;; Mod Specific Properties
;;Name of the mod to pass through Events.
String property _modName auto

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control Display lists.
formlist[] property _displaysArray auto

formlist property _displayList_Merged auto
formlist property _displayList_Enabled auto

;;Collection Complete Notifications.
Message property _modCompleteMessage auto
Message property _modCompleteNotification auto

;;Globals for set completion
GlobalVariable property _modComplete auto

;;Globals for current Count
GlobalVariable property _displayCount auto

;;Globals for Total Count
GlobalVariable property _displayTotal auto

;;bool to control if the setup has been completed for the mod.
bool _setupDone = false

;;AddForm to quest display listener. 
ObjectReference property _questDisplay auto

;;Shrine Display Properties
Formlist property DBM_RN_ExplorationDisplays auto
ObjectReference[] property _wintersunShrine auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																			;; Script Start
;;-- Events ---------------------------------------		

Event onInit()

	RegisterForModEvent(_ModSetup, "_onModSetup")	
	RegisterForModEvent(_ModScan, "_onModScan")	
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()

	RegisterForModEvent(_ModSetup, "_onModSetup")	
	RegisterForModEvent(_ModScan, "_onModScan")	
endEvent

;;-- Events ---------------------------------------		

Event _onModSetup(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, automatic Call from (RN_Utility_Script)		
	
	if !_setupDone

		If MCM.DevDebugVal
			Trace("_onModSetup() Event Received for: " + _modName)
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
			_displayTotal.SetValue(_displayList_Merged.GetSize())
		else
			_displayTotal.SetValue(_displaysArray[0].GetSize())
		endIf
	
;;------------
		
		if _wintersunShrine
			Index = _wintersunShrine.Length
			while Index > 0
				Index -= 1		
				DBM_RN_ExplorationDisplays.AddForm(_wintersunShrine[Index])
			EndWhile
		endIf
	
;;------------
		
		if _questDisplay
			DBM_RN_QuestDisplays.AddForm(_questDisplay)
		endIf
						
		RN_Setup_Done.Mod(1)
		
		_setupDone = True
		
		If MCM.DevDebugVal
			Trace("_onModSetup() Event Completed for: " + _modName)
		endIf
		
	else
	
		Trace("Setup already completed for " +_modName)	
	endIf
	
endEvent	

;;-- Events ---------------------------------------		

Event _onModScan(string eventName, string strArg, float numArg, Form sender) ;; automatic Call from (RN_Utility_Script)
	
	If MCM.DevDebugVal
		Trace("_onModScan() Event Received for: " + _modName)
	endIf
	
	Int Index = _displaysArray.length
	While Index
		Index -= 1
		_onDisplayCheck(_displaysArray[Index], _displayList_Enabled, _displayCount)
	endWhile
	
		if _displayList_Merged
			if (CheckFormListSizes(_displayList_Enabled, _displayList_Merged, GetOwningQuest(), _modComplete, iModComplete) && (MCM.ShowSetCompleteVal))	
				if (MCM.ShowSimpleNotificationVal)
					_modCompleteNotification.Show()
				else
					_modCompleteMessage.Show()
				endIf
			endIf
					
		else 	
			if (CheckFormListSizes(_displayList_Enabled, _displaysArray[0], GetOwningQuest(), _modComplete, iModComplete) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					_modCompleteNotification.Show()
				else
					_modCompleteMessage.Show()
				endIf
			endIf
		endIf
	
	RN_Scan_Done.Mod(1)
	
	If MCM.DevDebugVal
		Trace("_onModScan() Event Completed for: " + _modName)
	endIf
	
EndEvent	
