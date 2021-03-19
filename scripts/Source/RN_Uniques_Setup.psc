scriptName RN_Uniques_Setup extends ReferenceAlias

Import Debug
Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_PropManager property Util auto
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

formlist property _displayList_Merged auto
formlist property _displayList_Enabled auto

;;Collection Complete Notifications.
Message property _modCompleteMessage auto
Message property _modCompleteNotification auto

;;Globals for set completion
globalvariable property _Global_Mod_Complete auto
globalvariable property _Global_Display_Count auto
globalvariable property _Global_Display_Total auto

objectreference property TCC_Achievements_Xmarker auto

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
	RegisterForModEvent("TCCSetup_Uniques", "_onSetup")
	RegisterForModEvent("TCCUpdate_Patches", "_onPatchUpdate")
	RegisterForModEvent("TCCUpdate_Counts", "_onCountUpdate")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endFunction

;;-- Events ---------------------------------------	

Event _onSetup(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
		
	_RunSetup()			
endEvent

;;-- Events ---------------------------------------		

Function _RunSetup()

	RN_Setup_Registered.Mod(1)

	if (!DBM || !Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + GetOwningQuest().GetName() + " ABORTING...", 2)
		return
	endIf
	
	Utility.Wait(2)
	
	if !_setupDone
		
		if !MCM.advdebug
			TCCDebug.Log("Official Patch [TCC Unique Items] - Setup Event Received...", 0)
		endif
		
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
				_ReturnInt += _onConsolidateDisplaysAll(DBM.NewSectionDisplayRefLists[_Index], _displayList_Merged)
				_onConsolidateDisplaysAll(DBM.NewSectionDisplayRefLists[_Index], Util._getDisplayRoom(DBM.NewSectionRoomNames[_Index]), Util._getDisplayTotal(DBM.NewSectionRoomNames[_Index]))
			endIf
		endWhile
		
		RN_Setup_Done.Mod(1)
		_setupDone = True
		
		if !MCM.advdebug
			TCCDebug.Log("Official Patch [TCC Unique Items] - Setup Event Completed", 0)
		endif
	else
		
		RN_Setup_Done.Mod(1)
		if !MCM.advdebug		
			TCCDebug.Log("Official Patch [TCC Unique Items] - Setup Event Already Completed", 0)
		endif
	endIf
endFunction

;;-- Events ---------------------------------------	

Event _onPatchUpdate(string eventName, string strArg, float numArg, Form sender)

	if !TCC_Achievements_Xmarker.IsDisabled()
		if (!DBM || !Util || !MCM)
			TCCDebug.Log("Fatal Error, Script Property not set on quest " + GetOwningQuest().GetName() + " ABORTING...", 2)
			return
		endIf
		
		_setupDone = false	
		_displayList_Merged.Revert()
		_ReturnInt = 0
		_RunSetup()
	endif
endEvent	

;;-- Events ---------------------------------------		

Event _onCountUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	if !TCC_Achievements_Xmarker.IsDisabled()
		if (!DBM || !Util || !MCM)
			TCCDebug.Log("Fatal Error, Script Property not set on quest " + GetOwningQuest().GetName() + " ABORTING...", 2)
			return
		endIf	
		_Global_Display_Total.SetValue(_displayList_Merged.GetSize() - _ReturnInt)	
		_Global_Display_Count.SetValue(_displayList_Enabled.GetSize())
	endif
endEvent

;;-- Events ---------------------------------------

Event _onScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	if !TCC_Achievements_Xmarker.IsDisabled()
	
		RN_Scan_Registered.Mod(1)

		if (!DBM || !Util || !MCM)
			TCCDebug.Log("Fatal Error, Script Property not set on quest " + GetOwningQuest().GetName() + " ABORTING...", 2)
			return
		endIf
		
		if !MCM.advdebug
			TCCDebug.Log("Scan Event Received for: TCC Unique Items", 0)
		endif
		
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
		if !MCM.advdebug
			TCCDebug.Log("Scan Event Completed for: TCC Unique Items", 0)
		endif
	endif
endEvent	

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)

	if !_Global_Mod_Complete.GetValue() && !TCC_Achievements_Xmarker.IsDisabled()
		ObjectReference Disp = DisplayRef as ObjectReference
		if _displayList_Merged.HasForm(Disp)
			if EnableState
				_displayList_Enabled.AddForm(Disp)
				if !MCM.advdebug
					TCCDebug.Log("Official Patch [TCC Unique Items] - Updated display " + Disp.GetBaseObject().GetName(), 0)
				endif
				_Global_Display_Count.Mod(1)
			elseif !EnableState
				if _displayList_Enabled.HasForm(Disp)
					_displayList_Enabled.RemoveAddedForm(Disp)
					if !MCM.advdebug
						TCCDebug.Log("Official Patch [TCC Unique Items] - Removed display " + Disp.GetBaseObject().GetName(), 0)
					endif
					_Global_Display_Count.Mod(-1)
				endIf
			endIf
		endif
		
		if (CheckValueCount1(_Global_Display_Count, _Global_Display_Total, _Global_Mod_Complete) && (MCM.ShowSetCompleteVal)) 
			if (MCM.ShowSimpleNotificationVal)
				_modCompleteNotification.Show()
			else
				_modCompleteMessage.Show()
			endif
		endif
	endIf
endEvent
