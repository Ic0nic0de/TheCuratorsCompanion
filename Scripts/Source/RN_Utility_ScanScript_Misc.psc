Scriptname RN_Utility_ScanScript_Misc extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

message property RN_Paintings_Complete_Message auto
message property RN_Paintings_Complete_Notification auto

message property RN_Dibella_Complete_Message auto
message property RN_Dibella_Complete_Notification auto

formlist property TCC_DisplayList_Paintings auto
formlist property TCC_EnabledList_Paintings auto

formlist property TCC_DisplayList_DibellaStatues auto
formlist property TCC_EnabledList_DibellaStatues auto

globalvariable property RN_Museum_Paintings_Complete auto
globalvariable property RN_Museum_Paintings_Count auto
globalvariable property RN_Museum_Paintings_Total auto

globalvariable property RN_Museum_Dibella_Statues_Complete auto
globalvariable property RN_Museum_Dibella_Statues_Count auto
globalvariable property RN_Museum_Dibella_Statues_Total auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event onInit()
	
	RegisterForModEvent("TCCScan", "_onScan")
endEvent

;;-- Events ---------------------------------------		

Event Register()
	
	RegisterForModEvent("TCCScan", "_onScan")
endEvent
	
;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Received for: Paintings")
	endIf

;;----------	

	if RN_Museum_Paintings_Complete.GetValue() == 0
	
		_onDisplayCheck(TCC_DisplayList_Paintings, TCC_EnabledList_Paintings, RN_Museum_Paintings_Count)
		
		if (CheckValueCount1(RN_Museum_Paintings_Count, RN_Museum_Paintings_Total, RN_Museum_Paintings_Complete) && (MCM.ShowSetCompleteVal)) 
			if (MCM.ShowSimpleNotificationVal)
				RN_Paintings_Complete_Notification.Show()
			else
				RN_Paintings_Complete_Message.Show()
			endif
		endif
	endIf

	if RN_Museum_Dibella_Statues_Complete.GetValue() == 0
	
		_onDisplayCheck(TCC_DisplayList_DibellaStatues, TCC_EnabledList_DibellaStatues, RN_Museum_Dibella_Statues_Count)
		
		if (CheckValueCount1(RN_Museum_Dibella_Statues_Count, RN_Museum_Dibella_Statues_Total, RN_Museum_Dibella_Statues_Complete) && (MCM.ShowSetCompleteVal)) 
			if (MCM.ShowSimpleNotificationVal)
				RN_Dibella_Complete_Notification.Show()
			else
				RN_Dibella_Complete_Message.Show()
			endif
		endif
	endIf
	
	RN_Scan_Done.Mod(1)
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Completed for: Paintings")
	endIf	
endEvent

