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
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endEvent

;;-- Events ---------------------------------------		

Event Register()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endEvent

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)	
	
	ObjectReference Disp = DisplayRef as ObjectReference
	
	if TCC_DisplayList_DibellaStatues.HasForm(Disp)
	
		if !RN_Museum_Dibella_Statues_Complete.GetValue()
			
			if EnableState
				TCC_EnabledList_DibellaStatues.AddForm(Disp)
				RN_Museum_Dibella_Statues_Count.Mod(1)
					
			elseif !EnableState
				if TCC_EnabledList_DibellaStatues.HasForm(Disp)
					TCC_EnabledList_DibellaStatues.RemoveAddedForm(Disp)
					RN_Museum_Dibella_Statues_Count.Mod(-1)
				endIf
			endIf
		
			if (CheckValueCount1(RN_Museum_Dibella_Statues_Count, RN_Museum_Dibella_Statues_Total, RN_Museum_Dibella_Statues_Complete) && (MCM.ShowSetCompleteVal)) 
				if (MCM.ShowSimpleNotificationVal)
					RN_Dibella_Complete_Notification.Show()
				else
					RN_Dibella_Complete_Message.Show()
				endif
			endif
		endIf
	
	elseif TCC_DisplayList_Paintings.HasForm(Disp)
	
		if !RN_Museum_Paintings_Complete.GetValue()
			
			if EnableState
				TCC_EnabledList_Paintings.AddForm(Disp)
				RN_Museum_Paintings_Count.Mod(1)
					
			elseif !EnableState
				if TCC_EnabledList_Paintings.HasForm(Disp)
					TCC_EnabledList_Paintings.RemoveAddedForm(Disp)
					RN_Museum_Paintings_Count.Mod(-1)
				endIf
			endIf

		
			if (CheckValueCount1(RN_Museum_Paintings_Count, RN_Museum_Paintings_Total, RN_Museum_Paintings_Complete) && (MCM.ShowSetCompleteVal)) 
				if (MCM.ShowSimpleNotificationVal)
					RN_Paintings_Complete_Notification.Show()
				else
					RN_Paintings_Complete_Message.Show()
				endif
			endif
		endIf
	endIf
endEvent
	
;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)
	
	TCCDebug.Log("Scan Event Received for: Misc Displays")

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
	TCCDebug.Log("Scan Event Completed for: Misc Displays")
endEvent
