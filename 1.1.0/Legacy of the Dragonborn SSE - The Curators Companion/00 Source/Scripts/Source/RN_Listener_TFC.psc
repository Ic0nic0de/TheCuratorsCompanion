scriptName RN_Listener_TFC extends Quest

Import Debug

;;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

Quest Property FCQuest02 Auto
Actor Property FCMetellus Auto

GlobalVariable Property RN_Quest_Listener_Count Auto

Bool FirstRun = True

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function OnInit()
	
	RegisterForSingleUpdate(30)
endFunction

;;-- Functions ---------------------------------------
			
Function OnUpdate()	
	
	if (FCQuest02.GetStage() == 6000 || FCMetellus.IsDead())
	
		if (MCM.ShowListenerVal) && !FirstRun
			Notification("Museum Display Added: The Forgotten City")
		endIf
		
		RN_Quest_Listener_Count.Mod(1)	
	else
		RegisterForSingleUpdate(1)
	endIf
	
	FirstRun = False
		
endFunction

