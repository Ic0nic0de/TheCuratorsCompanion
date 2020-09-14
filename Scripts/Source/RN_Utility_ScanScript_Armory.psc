Scriptname RN_Utility_ScanScript_Armory extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

RN_Utility_ArrayHolder property RN_Array auto

;;----------

GlobalVariable Property iArmorySets Auto
GlobalVariable Property RN_Scan_Done Auto

String Property _ModEventName Auto

String Property _RoomName Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																			;; Script Start
;;-- Events ---------------------------------------			
	
Event onInit()
	
	RegisterForModEvent(_ModEventName, "_onScan")
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()
	
	RegisterForModEvent(_ModEventName, "_onScan")
endEvent

;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender)	

	If MCM.DevDebugVal
		Trace("_onModScan() Event Received for: " + _RoomName)
	endIf
	
;;----------

	Int _Index = 0
	Int _Length = RN_Array._Armory_Section_names.length
	While _Index < _Length 
		if RN_Array._Armory_Global_Complete[_Index].GetValue() == 0
			_onDisplayCheck(RN_Array._Armory_Formlist_Displays[_Index], RN_Array._Armory_Formlist_Enabled[_Index], RN_Array._Armory_Global_Count[_Index])		
			if _Index == 11
				Int _Index2 = 0
				Int _Length2 = RN_Array._Armory_Helms_Displays.length
				While _Index2 < _Length2
					if RN_Array._Armory_Formlist_Enabled[_Index].HasForm(RN_Array._Armory_Helms_Displays[_Index2]) && !RN_Array._Armory_Helms_Displays[_Index2].IsDisabled()
						RN_Array._Armory_Formlist_Enabled[_Index].AddForm(RN_Array._Armory_Helms_Displays[_Index2])
						RN_Array._Armory_Global_Count[_Index].Mod(1)
					endIf
					_Index2 += 1
				endWhile
			endIf
			if (CheckSetCount1(RN_Array._Armory_Global_Count[_Index], RN_Array._Armory_Global_Total[_Index], RN_Array._Armory_Global_Complete[_Index], iArmorySets) && (MCM.ShowSetCompleteVal)) 
				if (MCM.ShowSimpleNotificationVal)
					RN_Array._Armory_Message_Notification[_Index].Show()
				else
					RN_Array._Armory_Message_Default[_Index].Show()
				endif
			endif
		endIf
		_Index += 1		
	endWhile

;;----------
	
	RN_Scan_Done.Mod(1)
	
	If MCM.DevDebugVal
		Trace("_onModScan() Event Completed for: " + _RoomName)
	endIf
	
endEvent

