Scriptname RN_Utility_ScanScript_Misc extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

message property TCC_SectionComplete_Misc auto

formlist property TCC_DisplayList_MiscItems auto
formlist property TCC_EnabledList_MiscItems auto

globalvariable property RN_Museum_MiscItems_Complete auto
globalvariable property RN_Museum_MiscItems_Count auto
globalvariable property RN_Museum_MiscItems_Total auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

bool bNotified

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event onInit()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endEvent

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)
	
	ObjectReference Disp = DisplayRef as ObjectReference
	
	if (TCC_DisplayList_MiscItems.HasForm(Disp))
		
		if (EnableState) && (!TCC_EnabledList_MiscItems.HasForm(Disp))
		
			TCC_EnabledList_MiscItems.AddForm(Disp)
			
			TCCDebug.Log("Updated [Misc Items] display " + Disp.GetName() + Disp, 0)
			
			RN_Museum_MiscItems_Count.Mod(1)
			
		elseif (!EnableState) && (TCC_EnabledList_MiscItems.HasForm(Disp))
		
			TCC_EnabledList_MiscItems.RemoveAddedForm(Disp)
			
			TCCDebug.Log("Removed [Misc Items] display " + Disp.GetName() + Disp, 0)
			
			RN_Museum_MiscItems_Count.Mod(-1)
		endIf
	
		if (CheckValueCount1(RN_Museum_MiscItems_Count, RN_Museum_MiscItems_Total, RN_Museum_MiscItems_Complete) && (MCM.ShowSetCompleteVal) && (!bNotified)) 
			TCC_SectionComplete_Misc.Show()
			bNotified = True	
		endif
	endif
endEvent

;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)
	TCCDebug.Log("Scan Event Received for: Misc Displays")
	
	_onDisplayCheck(TCC_DisplayList_MiscItems, TCC_EnabledList_MiscItems, RN_Museum_MiscItems_Count, "Misc")
		
	if (CheckValueCount1(RN_Museum_MiscItems_Count, RN_Museum_MiscItems_Total, RN_Museum_MiscItems_Complete) && (MCM.ShowSetCompleteVal) && (!bNotified)) 
		TCC_SectionComplete_Misc.Show()
		bNotified = True	
	endif
	
	RN_Scan_Done.Mod(1)
	
	TCCDebug.Log("Scan Event Completed for: Misc Displays")
endEvent
