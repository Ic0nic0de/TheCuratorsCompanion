scriptname RN_TimerScript extends referencealias

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

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
	Notify("The Curators Companion: " + strArg, MCM.ColourString)
	
	While DBM_SortWait.GetValue()
		Utility.Wait(1)
		Index += 1
		if Index == 20 
			if !Utility.IsInMenuMode()
				Notify("The Curators Companion: " + strArg, MCM.ColourString)
			endIf
			Index = 0
		endIF
	endWhile
endEvent



