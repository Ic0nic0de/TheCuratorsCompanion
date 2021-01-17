scriptName RN_SupportedMod_ImmWeap extends ReferenceAlias

Import Debug 

Import RN_Utility_Global

RN_Utility_MCM Property MCM Auto

;; Set to 0 for custom made / unofficial patches.
Int Property _ArrayIndex Auto

;;Name of the patch to appear in the MCM.
String Property _ModName Auto

;;Global for mod completion.
globalvariable property _Global_Mod_Complete auto

;;Global for current display Count.
globalvariable property _Global_Display_Count auto

;;Global for Total display Count.
globalvariable property _Global_Display_Total auto

;;Formlist for Section Globals (Complete)
formlist property _IW_Global_Complete auto ;;Merged Item List.

;;Formlist for Section Globals (Totals)
formlist property _IW_Global_Total auto ;;Merged Item List.

;;Formlist for Section Globals (Counts)
formlist property _IW_Global_Count auto ;;Merged Item List.

;;Formlist to hold all item formlists.
formlist property TCC_ItemList_IW auto

;;Formlist to hold all Display formlists.
formlist property _IW_Formlist_Displays auto

;;Formlist to hold all Enabled formlists.
formlist property _IW_Formlist_Enabled auto

;;Formlist which holds a merge of all displays.
formlist property TCC_DisplayList_IW auto

;;Formlist which holds a merge of all enabled displays
formlist property TCC_EnabledList_IW auto

;;Formlist which controls which room the displays are counted in. 
formlist property TCC_DisplayList_DaedricGallery auto
formlist property TCC_DisplayList_Armory auto
formlist property TCC_DisplayList_HallofHeroes auto

;;Formlists to control item lists - MoreHUD
formlist property dbmNew auto
formlist property dbmMaster auto

;;Formlists to control Section complete messages
formlist property _IW_Message_Notification auto
formlist property _IW_Message_Default auto

;;Formlists to control item lists - Merged Formlist
formlist property TCC_ItemList_Patches auto ;;Merged Item List.

;;Collection Complete Notifications.
Message Property TCC_IW_Complete_Message auto
Message property TCC_IW_Complete_Notification auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Setup_Done Auto
globalvariable property RN_Setup_Registered auto
GlobalVariable Property RN_Scan_Done Auto
globalvariable property RN_Scan_Registered auto
globalvariable property RN_SupportedModCount auto

Bool _setupDone
string[] _ImmersiveWeapons_Section_names

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event onInit()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("TCCSetup_Patches", "_onSetup")
	RegisterForModEvent("TCCUpdate_Patches", "_onPatchUpdate")
	RegisterForModEvent("TCCUpdate_Counts", "_onCountUpdate")
	RegisterForModEvent("TCCUpdate_Arrays", "_onArrayUpdate")
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("TCCSetup_Patches", "_onSetup")
	RegisterForModEvent("TCCUpdate_Patches", "_onPatchUpdate")
	RegisterForModEvent("TCCUpdate_Counts", "_onCountUpdate")
	RegisterForModEvent("TCCUpdate_Arrays", "_onArrayUpdate")	
endEvent	

;;-- Events ---------------------------------------	

Event _onSetup(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	_RunSetup()
endEvent

;;-- Events ---------------------------------------	

Event _onArrayUpdate(string eventName, string strArg, float numArg, Form sender)
		
	_CreateArray()
	MCM.AddModSupport(Utility.Randomint(1,5), _ArrayIndex, _Global_Mod_Complete, _Global_Display_Count, _Global_Display_Total, _ModName)
	MCM.AddSectionSupport(_IW_Global_Count, _IW_Global_Total, _IW_Global_Complete, _ModName, _ImmersiveWeapons_Section_names)
	TCCDebug.Log("Official Patch [" + _ModName + "] - Array Created and pushed to MCM", 0)
endEvent

;;-- Events ---------------------------------------	

Event _RunSetup()
	
	RN_Setup_Registered.Mod(1)
	
	if !_setupDone
		
		TCCDebug.Log("Official Patch [" + _ModName + "] - Setup Event Received...", 0)
		
		_CreateArray()
		MCM.AddModSupport(Utility.Randomint(1,5), _ArrayIndex, _Global_Mod_Complete, _Global_Display_Count, _Global_Display_Total, _ModName)
		MCM.AddSectionSupport(_IW_Global_Count, _IW_Global_Total, _IW_Global_Complete, _ModName, _ImmersiveWeapons_Section_names)
		
		Int Index = 0
		Int _List = TCC_ItemList_IW.GetSize()		
		While Index < _List
			FormList List = TCC_ItemList_IW.GetAt(Index) as Formlist
			_onConsolidateItems(List, TCC_ItemList_Patches, dbmNew, dbmMaster)
			Index += 1
		endWhile

		Index = 0
		 _List = _IW_Formlist_Displays.GetSize()		
		While Index < _List
			FormList List = _IW_Formlist_Displays.GetAt(Index) as Formlist
			_onConsolidateDisplays(List, TCC_DisplayList_IW)
			Index += 1
		endWhile		
		
		Index = 0
		 _List = _IW_Formlist_Displays.GetSize()
		While Index < _List
			FormList List = _IW_Formlist_Displays.GetAt(Index) as Formlist
			if Index == 14
				_onConsolidateDisplays(List, TCC_DisplayList_DaedricGallery)
			elseif Index == 15
				_onConsolidateDisplays(List, TCC_DisplayList_HallofHeroes)
			else
				_onConsolidateDisplays(List, TCC_DisplayList_Armory)
			endif
			Index += 1
		endWhile	
				
		RN_Setup_Done.Mod(1)
		RN_SupportedModCount.Mod(1)
		_setupDone = True
		
		TCCDebug.Log("Official Patch [" + _ModName + "] - Setup Event Completed", 0)
		
	else
		
		RN_Setup_Done.Mod(1)
		TCCDebug.Log("Official Patch [" + _ModName + "] - Setup Event Already Completed", 0)
	endIf
endEvent	

;;-- Events ---------------------------------------		

Event _onCountUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	Int Index = 0
	Int _List = _IW_Formlist_Displays.GetSize()		
	While Index < _List
		FormList List = _IW_Formlist_Displays.GetAt(Index) as Formlist
		GlobalVariable Variable = _IW_Global_Total.GetAt(Index) as GlobalVariable
		Variable.SetValue(List.GetSize())
		Index += 1
	endWhile
	
	_Global_Display_Total.SetValue(TCC_DisplayList_IW.GetSize())
endEvent

;;-- Events ---------------------------------------	

Event _onPatchUpdate(string eventName, string strArg, float numArg, Form sender)
	
	_setupDone = false
	_RunSetup()
endEvent		

;;-- Events ---------------------------------------		

Event _onScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (DBM_RN_ScanHandler)
	
	RN_Scan_Registered.Mod(1)
	
	TCCDebug.Log("Official Patch [" + _ModName + "] - Scan Event Received...", 0)

	if !_Global_Mod_Complete.GetValue()
		Int Index = _IW_Formlist_Displays.GetSize()
		While Index
			Index -= 1
			Formlist DisplayList = _IW_Formlist_Displays.GetAt(Index) as Formlist
			Formlist EnabledList = _IW_Formlist_Enabled.GetAt(Index) as Formlist
			GlobalVariable Count = _IW_Global_Count.GetAt(Index) as GlobalVariable
			GlobalVariable Total = _IW_Global_Total.GetAt(Index) as GlobalVariable
			GlobalVariable Complete = _IW_Global_Complete.GetAt(Index) as GlobalVariable
			Message Notific = _IW_Message_Notification.GetAt(Index) as Message
			Message Default = _IW_Message_Default.GetAt(Index) as Message
			
			_onDisplayCheck(DisplayList, EnabledList, Count)
			_onDisplayCheck(DisplayList, TCC_EnabledList_IW, _Global_Display_Count)
			if (CheckValueCount1(Count, Total, Complete) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					Notific.Show()
				else
					Default.Show()
				endif
			endif	
			
			if (CheckValueCount1(_Global_Display_Count, _Global_Display_Total, _Global_Mod_Complete) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					TCC_IW_Complete_Notification.Show()
				else
					TCC_IW_Complete_Message.Show()
				endIf
			endIf	
		endWhile
	endIf

	RN_Scan_Done.Mod(1)	

	TCCDebug.Log("Official Patch [" + _ModName + "] - Scan Event Completed", 0)
EndEvent

Function _CreateArray()

	_ImmersiveWeapons_Section_names = new string[16]
	_ImmersiveWeapons_Section_names[0] = "Ancient Nord Set:"
	_ImmersiveWeapons_Section_names[1] = "Blades Set:"
	_ImmersiveWeapons_Section_names[2] = "Daedric Set:"
	_ImmersiveWeapons_Section_names[3] = "Dawnguard Set:"
	_ImmersiveWeapons_Section_names[4] = "Dragon Set:"
	_ImmersiveWeapons_Section_names[5] = "Dwarven Set:"
	_ImmersiveWeapons_Section_names[6] = "Ebony Set:"
	_ImmersiveWeapons_Section_names[7] = "Elven Set:"
	_ImmersiveWeapons_Section_names[8] = "Falmer Set:"
	_ImmersiveWeapons_Section_names[9] = "Glass Set:"
	_ImmersiveWeapons_Section_names[10] = "Iron Set:"
	_ImmersiveWeapons_Section_names[11] = "Orcish Set:"
	_ImmersiveWeapons_Section_names[12] = "Steel Set:"
	_ImmersiveWeapons_Section_names[13] = "Wolf Set:"
	_ImmersiveWeapons_Section_names[14] = "Daedric Gallery Set:"
	_ImmersiveWeapons_Section_names[15] = "Hall Of Heroes Set:"
endFunction
