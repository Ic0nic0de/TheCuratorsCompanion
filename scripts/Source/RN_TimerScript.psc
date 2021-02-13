scriptname RN_TimerScript extends referencealias

globalvariable property DBM_SortWait auto

Event Oninit()
	RegisterForModEvent("_StartTimer", "_OnStartTimer")
endEvent

;;-- Events ---------------------------------------	

Event OnPlayerLoadGame()
	RegisterForModEvent("_StartTimer", "_OnStartTimer")
endEvent

;;-- Events ---------------------------------------	

Event _OnStartTimer(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	Int Index = 0
	Debug.Notification(strArg)
	
	While DBM_SortWait.GetValue()
		Utility.Wait(1)
		Index += 1
		if Index == 20 
			if !Utility.IsInMenuMode()
				Debug.Notification(strArg)
			endIf
			Index = 0
		endIF
	endWhile
endEvent



