scriptName RN_Uniques_Setup extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

DBMSupportedModScript property DBM auto

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

formlist property _displayList_Merged auto
formlist property _displayList_Enabled auto

;;Collection Complete Notifications.
Message property _modCompleteMessage auto
Message property _modCompleteNotification auto

;;Globals for set completion
globalvariable property _Global_Mod_Complete auto
globalvariable property _Global_Display_Count auto
globalvariable property _Global_Display_Total auto

globalvariable property RN_SafeouseContent_Installed auto
globalvariable property RN_CreationClubContent_Installed auto

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

	RegisterForModEvent("TCCScan_Uniques", "_onScan")
	RegisterForModEvent("TCCSetup_Uniques", "_onSetup")
	RegisterForModEvent("TCCUpdate_Uniques", "_onPatchUpdate")
	RegisterForModEvent("TCCUpdate_Counts_Uniques", "_onCountUpdate")
endFunction

;;-- Events ---------------------------------------	

Event _onSetup(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
		
	_RunSetup()			
endEvent

;;-- Events ---------------------------------------		

Event _RunSetup()

	RN_Setup_Registered.Mod(1)

	if !DBM
		TCCDebug.Log("Fatal Error, DBM PATCH NOT SET ON QUEST " + GetOwningQuest().GetName() + " ABORTING SETUP...", 0)
		RN_Setup_Done.Mod(1)
		return
	endIf
	
	TCCDebug.Log("Official Patch [TCC Unique Items] Hooked [" + DBM.GetName()  + "] Support Handler", 0)
	Utility.Wait(2)
	
	if !_setupDone

		TCCDebug.Log("Official Patch [TCC Unique Items] - Setup Event Received...", 0)
		
		Int _Index
		
;;------------ Item Lists
			
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
				_onConsolidateDisplays(DBM.NewSectionDisplayRefLists[_Index], _displayList_Merged)
				_onConsolidateDisplays(DBM.NewSectionDisplayRefLists[_Index], _getDisplayRoom(DBM.NewSectionRoomNames[_Index]))
			endIf
		endWhile
		
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

	if !DBM
		TCCDebug.Log("Fatal Error, DBM PATCH NOT SET ON QUEST " + GetOwningQuest().GetName() + " ABORTING SETUP...", 0)
		return
	endIf
	
	_setupDone = false	
	_displayList_Merged.Revert()
	_RunSetup()
endEvent	

;;-- Events ---------------------------------------		

Event _onCountUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	if !DBM
		TCCDebug.Log("Fatal Error, DBM PATCH NOT SET ON QUEST " + GetOwningQuest().GetName() + " ABORTING SETUP...", 0)
		return
	endIf
	
	_Global_Display_Total.SetValue(_displayList_Merged.GetSize())	
	_Global_Display_Count.SetValue(_displayList_Enabled.GetSize())
endEvent

;;-- Events ---------------------------------------

Event _onScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	RN_Scan_Registered.Mod(1)

	if !DBM
		TCCDebug.Log("Fatal Error, DBM PATCH NOT SET ON QUEST " + GetOwningQuest().GetName() + " ABORTING SETUP...", 0)
		RN_Scan_Done.Mod(1)
		return
	endIf
	
	TCCDebug.Log("Official Patch [TCC Unique Items] - Scan Event Received...", 0)
	
	if !_Global_Mod_Complete.GetValue()
		Int Index = DBM.NewSectionDisplayRefLists.length
		While Index
			Index -= 1
			_onDisplayCheck(DBM.NewSectionDisplayRefLists[Index], _displayList_Enabled, _Global_Display_Count)
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
