Scriptname RN_Utility_ScanScript extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

RN_Utility_ArrayHolder property RN_Array auto

;;----------

GlobalVariable Property iMuseumSets Auto
GlobalVariable Property RN_Scan_Done Auto

Int Property _SectionToScan Auto

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
	
	if RN_Array._Museum_Global_Complete[_SectionToScan].GetValue() == 0
		_onDisplayCheck(RN_Array._Museum_Formlist_Merged[_SectionToScan], RN_Array._Museum_Formlist_Enabled[_SectionToScan], RN_Array._Museum_Global_Count[_SectionToScan])
			if (CheckSetCount1(RN_Array._Museum_Global_Count[_SectionToScan], RN_Array._Museum_Global_Total[_SectionToScan], RN_Array._Museum_Global_Complete[_SectionToScan], iMuseumSets) && (MCM.ShowSetCompleteVal)) 
				if (MCM.ShowSimpleNotificationVal)
					RN_Array._Museum_Message_Notification[_SectionToScan].Show()
				else
					RN_Array._Museum_Message_Default[_SectionToScan].Show()
				endif
			endif
	endIf

;;----------
	
	RN_Scan_Done.Mod(1)
	
	If MCM.DevDebugVal
		Trace("_onModScan() Event Completed for: " + _RoomName)
	endIf
	
endEvent

