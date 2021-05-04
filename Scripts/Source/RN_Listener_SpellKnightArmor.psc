scriptName RN_Listener_SpellKnightArmor extends Quest

import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

quest property ccEDHSSE002_Quest auto

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
			Notify("Museum Display Added: Crypt of the Heart Display", MCM.ColourString)
		else
			RegisterForSingleUpdate(5)
		endif
		
		FirstRun = False
	endif
endEvent
