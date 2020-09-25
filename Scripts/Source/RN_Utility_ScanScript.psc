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
		
			if _SectionToScan == 0
				Int _Index2 = 0
				Int _Length2 = RN_Array._Armory_Helms_Displays.length
				While _Index2 < _Length2
				ObjectReference formToProcess = RN_Array._Armory_Helms_Displays[_Index2] As ObjectReference
					if !RN_Array._Museum_Formlist_Enabled[_SectionToScan].HasForm(formToProcess) && !formToProcess.IsDisabled()
						RN_Array._Museum_Formlist_Enabled[_SectionToScan].AddForm(formToProcess)
						
					elseif RN_Array._Museum_Formlist_Enabled[_SectionToScan].HasForm(formToProcess) && formToProcess.IsDisabled()
						RN_Array._Museum_Formlist_Enabled[_SectionToScan].RemoveAddedForm(formToProcess)	
					endIf
					_Index2 += 1
				endWhile		
				
				RN_Array._Museum_Global_Count[_SectionToScan].setvalue(RN_Array._Museum_Formlist_Enabled[_SectionToScan].GetSize())
			endIf
			
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

