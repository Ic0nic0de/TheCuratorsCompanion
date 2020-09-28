scriptName RN_SupportedMod_Script extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

RN_Utility_ArrayHolder property RN_Array auto

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
GlobalVariable property RN_Setup_Done auto
GlobalVariable property RN_Scan_Done auto

;;Global for mod completion.
GlobalVariable property iModComplete auto
globalvariable property iCreationComplete auto

;;Strings for ModEvent text replacement.
String property _ModSetup  auto
String property _ModScan  auto

globalvariable property RN_SupportedModCount auto
globalvariable property RN_SupportedCreationCount auto

formlist property RN_TokenFormlistExcluded auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Patch Type - false - Creaton / true - Patch
bool property _bPatchType auto 

;;Name of the mod to pass through Events.
String property _modName auto

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
GlobalVariable property _Global_Mod_Complete auto

;;Globals for current Count
GlobalVariable property _Global_Display_Count auto

;;Globals for Total Count
GlobalVariable property _Global_Display_Total auto

;;AddForm to quest display listener. 
ObjectReference[] property _questDisplays auto

;;Shrine Display Properties
ObjectReference[] property _wintersunShrine auto

;;Prisoner belongigns chest for mods that add one.
ObjectReference[] property _PrisonerChest auto
Bool _PrisonerChestAdded

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Events ---------------------------------------			
	
Event onInit()

	if _bPatchType && RN_Array._GVComplete.Find(_Global_Mod_Complete) < 0 || !_bPatchType && RN_Array._GVCreationComplete.Find(_Global_Mod_Complete) < 0
		Debug.MessageBox("=== The Curators Companion === \n \n Invalid Patch Detected \n (" + _modName + ") can not be added to an existing save or game in progress. \n \n If you would like to use (" + _modName + ") please start a new game on  " + MCM._ModVersion + " or uninstall this patch to continue.")
	endIf
	
	RegisterForModEvent(_ModSetup, "_onModSetup")	
	RegisterForModEvent(_ModScan, "_onModScan")
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()

	if _bPatchType && RN_Array._GVComplete.Find(_Global_Mod_Complete) < 0 || !_bPatchType && RN_Array._GVCreationComplete.Find(_Global_Mod_Complete) < 0
		Debug.MessageBox("=== The Curators Companion === \n \n Invalid Patch Detected \n (" + _modName + ") can not be added to an existing save or game in progress. \n \n If you would like to use (" + _modName + ") please start a new game on  " + MCM._ModVersion + " or uninstall this patch to continue.")
	endIf
	
	RegisterForModEvent(_ModSetup, "_onModSetup")	
	RegisterForModEvent(_ModScan, "_onModScan")
	
	if _displayList_Merged
		_Global_Display_Total.SetValue(_displayList_Merged.GetSize())
	else
		_Global_Display_Total.SetValue(_displaysArray[0].GetSize())
	endIf
	
	_Global_Display_Count.SetValue(_displayList_Enabled.GetSize())	
	
	if !_PrisonerChestAdded
		AddPrisonerChest()
	endIf
endEvent
	
;;-- Events ---------------------------------------		

Event _onModSetup(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)		
	
	if !_setupDone

		Trace("The Curators Companion: Setup Event Received for " +_modName)	
	
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
			Index = _wintersunShrine.Length
			while Index > 0
				Index -= 1		
				DBM_RN_ExplorationDisplays.AddForm(_wintersunShrine[Index])
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
		
		_PrisonerChestAdded = True
		
;;------------

		if _bPatchType	
			RN_SupportedModCount.Mod(1)
		else
			RN_SupportedCreationCount.Mod(1)
			
		endIf
			RN_Setup_Done.Mod(1)
		
		_setupDone = True
		
		Trace("The Curators Companion: Setup Event Completed for " +_modName)	
		
	else
		
		RN_Setup_Done.Mod(1)
		Trace("The Curators Companion: Setup Event Already Completed for " +_modName)
	endIf
	
endEvent	

;;-- Events ---------------------------------------		

Event _onModScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	If MCM.DevDebugVal
		Trace("_onModScan() Event Received for: " + _modName)
	endIf
	
	Int Index = _displaysArray.length
	While Index
		Index -= 1
		_onDisplayCheck(_displaysArray[Index], _displayList_Enabled, _Global_Display_Count)
	endWhile
	
	if _bPatchType
		if (CheckValueCount1(_Global_Display_Count, _Global_Display_Total, GetOwningQuest(), _Global_Mod_Complete, iModComplete) && (MCM.ShowSetCompleteVal))
			if (MCM.ShowSimpleNotificationVal)
				_modCompleteNotification.Show()
			else
				_modCompleteMessage.Show()
			endIf
		endIf
		
	else
		if (CheckValueCount1(_Global_Display_Count, _Global_Display_Total, GetOwningQuest(), _Global_Mod_Complete, iCreationComplete) && (MCM.ShowSetCompleteVal))
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

;;-- Events ---------------------------------------	

Event AddPrisonerChest()

	if _PrisonerChest
		Int Index = _PrisonerChest.length
		while Index > 0
			Index -= 1		
			RN_TokenFormlistExcluded.AddForm(_PrisonerChest[Index])
		EndWhile
	endIf
	
	_PrisonerChestAdded = True
endEvent
