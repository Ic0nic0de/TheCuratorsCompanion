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
globalvariable property iDisplaySectionComplete auto

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
	
	if TCC_DisplayList_MiscItems.HasForm(Disp)
	
		if !RN_Museum_MiscItems_Complete.GetValue()
			
			if EnableState
				TCC_EnabledList_MiscItems.AddForm(Disp)
				if MCM.advdebug
					TCCDebug.Log("Museum Shitty non icons - Updated display " + Disp.GetBaseObject().GetName(), 0)
				endif
				RN_Museum_MiscItems_Count.Mod(1)
					
			elseif !EnableState
				if TCC_EnabledList_MiscItems.HasForm(Disp)
					TCC_EnabledList_MiscItems.RemoveAddedForm(Disp)
					if MCM.advdebug
						TCCDebug.Log("Museum Shitty non icons - Removed display " + Disp.GetBaseObject().GetName(), 0)
					endif
					RN_Museum_MiscItems_Count.Mod(-1)
				endIf
			endIf

		
			if (CheckValueCount1(RN_Museum_MiscItems_Count, RN_Museum_MiscItems_Total, RN_Museum_MiscItems_Complete) && (MCM.ShowSetCompleteVal)) 
				iDisplaySectionComplete.Mod(1)
				TCC_SectionComplete_Misc.Show()
			endif
		endIf
	endIf
endEvent
	
;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)
	
	if MCM.advdebug
		TCCDebug.Log("Scan Event Received for: Misc Displays")
	endif

	if !RN_Museum_MiscItems_Complete.GetValue()
	
		_onDisplayCheck(TCC_DisplayList_MiscItems, TCC_EnabledList_MiscItems, RN_Museum_MiscItems_Count)
		
		if (CheckValueCount1(RN_Museum_MiscItems_Count, RN_Museum_MiscItems_Total, RN_Museum_MiscItems_Complete) && (MCM.ShowSetCompleteVal)) 
			iDisplaySectionComplete.Mod(1)
			TCC_SectionComplete_Misc.Show()
		endif
	endIf
	
	RN_Scan_Done.Mod(1)
	if MCM.advdebug
		TCCDebug.Log("Scan Event Completed for: Misc Displays")
	endif
endEvent
