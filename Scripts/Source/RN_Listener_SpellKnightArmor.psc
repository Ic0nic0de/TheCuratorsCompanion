scriptName RN_Listener_SpellKnightArmor extends Quest

import Debug

quest property ccEDHSSE002_Quest auto
GlobalVariable Property RN_Quest_Listener_Count Auto

Bool FirstRun = True
Bool Complete

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnInit()
	
	RegisterForSingleUpdate(30)
endEvent

;;-- Functions ---------------------------------------
			
Event OnUpdate()	
	
	if !Complete
		if (ccEDHSSE002_Quest.GetStageDone(1500)) || (ccEDHSSE002_Quest.GetStageDone(2000))
			Complete = True
			RN_Quest_Listener_Count.Mod(1)
			Notification("Museum Display Added: Crypt of the Heart Display")
		else
			RegisterForSingleUpdate(5)
		endif
		
		FirstRun = False
	endif
endEvent
