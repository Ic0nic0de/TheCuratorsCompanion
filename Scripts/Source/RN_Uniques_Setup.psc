scriptName RN_Uniques_Setup extends quest

Import Debug
Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_PropManager property Util auto
DBMSupportedModScript property DBM auto

RN_PatchAPI property APIScript auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

bool property _setupDone = false auto hidden
bool bConfigured

;;Formlists to control merged and found lists
formlist property TCC_ItemList_Patches auto

;;Formlists to control item lists - MoreHUD
formlist property dbmNew auto
formlist property dbmMaster auto

;; Global for ModEvent Return.
globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto
globalvariable property RN_SupportedModCount auto
String Property _ModName auto

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

Int _ReturnInt

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnInit()

	if (!DBM || !Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + self.GetName() + " ABORTING...", 2)
		return
	endIf

	RegisterForSingleUpdate(0)	
EndEvent

;;-- Events ---------------------------------------		

Event OnUpdate()
	if bConfigured
		RegisterModEvents()
		UnregisterForUpdate()
		Return
	endif
	
	bConfigured = APIScript.RegisterSupportedMod(_ModName, none, none, self, none)
	RegisterModEvents()
	RunSetup()
EndEvent

;;-- Events ---------------------------------------		

Function RegisterModEvents()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endFunction

;;-- Events ---------------------------------------		

function RunSetup()
		
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
			_ReturnInt += _onConsolidateDisplaysAll(DBM.NewSectionDisplayRefLists[_Index], _displayList_Merged)
			_onConsolidateDisplaysAll(DBM.NewSectionDisplayRefLists[_Index], Util._getDisplayRoom(DBM.NewSectionRoomNames[_Index]), Util._getDisplayTotal(DBM.NewSectionRoomNames[_Index]))
		endIf
	endWhile
	
	_setupDone = True
endFunction

;;-- Events ---------------------------------------	

function UpdateArrays()
	
	MCM.AddModSupport(_Global_Mod_Complete, _Global_Display_Count, _Global_Display_Total, _ModName, RN_SupportedModCount, DBM)
endfunction

;;-- Events ---------------------------------------		

function UpdateCounts()
	
	_Global_Display_Total.SetValue(_displayList_Merged.GetSize() - _ReturnInt)	
	_Global_Display_Count.SetValue(_displayList_Enabled.GetSize())
endfunction

;;-- Events ---------------------------------------

Event _onScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	RN_Scan_Registered.Mod(1)
	
	if MCM.advdebug
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
	if MCM.advdebug
		TCCDebug.Log("Scan Event Completed for: TCC Unique Items", 0)
	endif
endEvent	

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)

	if !_Global_Mod_Complete.GetValue()
		ObjectReference Disp = DisplayRef as ObjectReference
		if _displayList_Merged.HasForm(Disp)
			if EnableState
				_displayList_Enabled.AddForm(Disp)
				if MCM.advdebug
					TCCDebug.Log("Official Patch [TCC Unique Items] - Updated display " + Disp.GetBaseObject().GetName(), 0)
				endif
				_Global_Display_Count.Mod(1)
			elseif !EnableState
				if _displayList_Enabled.HasForm(Disp)
					_displayList_Enabled.RemoveAddedForm(Disp)
					if MCM.advdebug
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
