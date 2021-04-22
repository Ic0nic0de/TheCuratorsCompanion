Scriptname RN_Utility_ScanScript_Quests extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

message property TCC_SectionComplete_Quest auto

Formlist Property DBM_RN_QuestDisplays Auto
Formlist Property DBM_RN_Quest_Stage_Displays Auto
Formlist Property DBM_RN_Quest_StagePassed_Displays Auto
Formlist Property DBM_RN_QuestDisplays_Enabled Auto
			
;;Global to control activation
GlobalVariable Property RN_Quest_Listener_Count Auto
GlobalVariable Property RN_Quest_Listener_Total Auto
GlobalVariable Property RN_Quest_Listener_Complete Auto

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
	
	if DBM_RN_QuestDisplays.HasForm(Disp) || DBM_RN_Quest_Stage_Displays.HasForm(Disp) || DBM_RN_Quest_StagePassed_Displays.HasForm(Disp)

		if EnableState
			DBM_RN_QuestDisplays_Enabled.AddForm(Disp)
			
			TCCDebug.Log("Updated quest display " + Disp.GetName() + Disp, 0)

			RN_Quest_Listener_Count.Mod(1)
		else
			DBM_RN_QuestDisplays_Enabled.RemoveAddedForm(Disp)
			
			TCCDebug.Log("Removed quest display " + Disp.GetName() + Disp, 0)

			RN_Quest_Listener_Count.Mod(-1)
		endIf
	endif

	if (CheckValueCount1(RN_Quest_Listener_Count, RN_Quest_Listener_Total, RN_Quest_Listener_Complete) && (MCM.ShowSetCompleteVal) && (!bNotified)) 
		TCC_SectionComplete_Quest.Show()
		bNotified = True	
	endif
endEvent

;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)
	TCCDebug.Log("Scan Event Received for: Quest Displays")

	
	_onDisplayCheck(DBM_RN_QuestDisplays, DBM_RN_QuestDisplays_Enabled, RN_Quest_Listener_Count)
	_onDisplayCheck(DBM_RN_Quest_Stage_Displays, DBM_RN_QuestDisplays_Enabled, RN_Quest_Listener_Count)
	_onDisplayCheck(DBM_RN_Quest_StagePassed_Displays, DBM_RN_QuestDisplays_Enabled, RN_Quest_Listener_Count)

	if (CheckValueCount1(RN_Quest_Listener_Count, RN_Quest_Listener_Total, RN_Quest_Listener_Complete) && (MCM.ShowSetCompleteVal) && (!bNotified)) 
		TCC_SectionComplete_Quest.Show()
		bNotified = True	
	endif
	
	RN_Scan_Done.Mod(1)
	TCCDebug.Log("Scan Event Completed for: Quest Displays")
endEvent
