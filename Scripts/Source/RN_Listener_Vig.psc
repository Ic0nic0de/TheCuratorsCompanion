scriptName RN_Listener_Vig extends Quest

import RN_Utility_Global

import debug

;;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM auto

;Act 1 properties
quest property zzzAoMMQ09 auto
quest property zzzAoMMQ10 auto
quest property zzzAoMMQGoodEnd auto

;Act 2 properties
quest property zzzBmMq01 auto
quest property zzzBmMq03 auto

;Act 3 properties
quest property zzzCOMq01 auto

;Act 4 properties.
quest property zzzCHMQ01 auto
quest property zzzCHMemoryQuest08 auto
quest property zzzCHMemoryQuest09 auto

Bool FirstRun = True
Bool AllComplete
Bool Act1Complete
Bool Act2Complete
Bool Act3Complete
Bool Act4Complete

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnInit()
	
	RegisterForSingleUpdate(30)
endEvent

;;-- Functions ---------------------------------------
			
Event OnUpdate()	
	
	if !AllComplete
		if !Act1Complete
			if (zzzAoMMQ10.GetStageDone(50)) ;; GOOD ENDING
				Act1Complete = True
				Notify("Museum Display Added: Vigiant Act 1 (Good Ending)", MCM.ColourString)
				if MCM.advdebug
					TCCDebug.Log("Vigilant Quest Display Listener Registered Act 1 (Good Ending)", 0)
				endif
			elseif (zzzAoMMQGoodEnd.GetStageDone(110) && zzzAoMMQGoodEnd.IsCompleted()) ;; MERCIFUL ENDING
				Act1Complete = True
				Notify("Museum Display Added: Vigiant Act 1 (Merciful Ending)", MCM.ColourString)
				if MCM.advdebug
					TCCDebug.Log("Vigilant Quest Display Listener Registered Act 1 (Merciful Ending)", 0)
				endif
				
			elseif (zzzAoMMQ09.GetStageDone(999)) || (!zzzAoMMQGoodEnd.GetStageDone(110) && zzzAoMMQGoodEnd.IsCompleted()) ;; BAD ENDING
				Act1Complete = True
				Notify("Museum Display Added: Vigiant Act 1 (Bad Ending)", MCM.ColourString)
				if MCM.advdebug
					TCCDebug.Log("Vigilant Quest Display Listener Registered Act 1 (Bad Ending)", 0)
				endif
			endif
		endif

		if !Act2Complete
			if (zzzBmMq01.GetStageDone(110)) ;; GOOD ENDING
				Act2Complete = True
				Notify("Museum Display Added: Vigiant Act 2 (Good Ending)", MCM.ColourString)
				if MCM.advdebug
					TCCDebug.Log("Vigilant Quest Display Listener Registered Act 2 (Good Ending)", 0)
				endif
				
			elseif (zzzBmMq03.GetStageDone(220)) ;; BAD ENDING
				Act2Complete = True
				Notify("Museum Display Added: Vigiant Act 2 (Bad Ending)", MCM.ColourString)
				if MCM.advdebug
					TCCDebug.Log("Vigilant Quest Display Listener Registered Act 2 (Bad Ending)", 0)	
				endif
			endif
		endif

		if !Act3Complete
			if (zzzCOMq01.GetStageDone(100)) || (zzzCOMq01.GetStageDone(200));; GOOD ENDING
				Act3Complete = True
				Notify("Museum Display Added: Vigiant Act 3 (Good Ending)", MCM.ColourString)				
			endif
		endif
		
		if !Act4Complete
			if (zzzCHMemoryQuest08.GetStageDone(360)) || (zzzCHMemoryQuest09.GetStageDone(200)) ;; WORST ENDING
				Act4Complete = True
				Notify("Museum Display Added: Vigiant Act 4 (Worst Ending)", MCM.ColourString)		
				if MCM.advdebug
					TCCDebug.Log("Vigilant Quest Display Listener Registered Act 4 (Worst Ending)", 0)
				endif
				
			elseif (zzzCHMemoryQuest08.GetStageDone(90)) ;; TRUE ENDING
				Act4Complete = True
				Notify("Museum Display Added: Vigiant Act 4 (True Ending)", MCM.ColourString)
				if MCM.advdebug
					TCCDebug.Log("Vigilant Quest Display Listener Registered Act 4 (True Ending)", 0)
				endif

			elseif (zzzCHMemoryQuest08.GetStageDone(230)) ;; BITTER ENDING
				Act4Complete = True
				Notify("Museum Display Added: Vigiant Act 4 (Bitter Ending)", MCM.ColourString)
				if MCM.advdebug
					TCCDebug.Log("Vigilant Quest Display Listener Registered Act 4 (Bitter Ending)", 0)
				endif
				
			elseif (zzzCHMQ01.GetStageDone(150)) || (zzzCHMQ01.GetStageDone(180)) ;; BAD ENDING
				Act4Complete = True
				Notify("Museum Display Added: Vigiant Act 4 (Bad Ending)", MCM.ColourString)
				if MCM.advdebug
					TCCDebug.Log("Vigilant Quest Display Listener Registered Act 4 (Bad Ending)", 0)
				endif
				
			elseif (zzzCHMemoryQuest09.GetStageDone(100)) || (zzzCHMemoryQuest09.GetStageDone(150)) ;; MADNESS ENDING
				Act4Complete = True
				Notify("Museum Display Added: Vigiant Act 4 (Madness Ending)", MCM.ColourString)
				if MCM.advdebug
					TCCDebug.Log("Vigilant Quest Display Listener Registered Act 4 (Madness Ending)", 0)
				endif
			endif
		endif	
	endif
	
	
	if Act1Complete && Act2Complete && Act3Complete && Act4Complete
		AllComplete = True	
	else
		RegisterForSingleUpdate(1)
	endif
	
	FirstRun = False
endEvent
