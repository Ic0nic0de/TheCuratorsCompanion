Scriptname TCCDebug extends Quest  

Import Debug
Import Utility

RN_Utility_MCM property MCM auto

Event OnInit()
	EnableLogging()
endEvent

;;-- Functions ---------------------------------------

Function EnableLogging() Global 

	SetINIBool("bEnableTrace:Papyrus", true)
	SetINIBool("bEnableLogging:Papyrus", true)
	SetINIBool("bLoadDebugInformation:Papyrus", true)	
	SetINIBool("bEnableProfiling:Papyrus", true)	
	SetINIFloat("fPostLoadUpdateTimeMS:Papyrus", 2000)
	
	OpenUserLog("TheCuratorsCompanion")
	TraceUser("TheCuratorsCompanion","[~~~ The Curators Companion Debug Log Started ~~~]")
EndFunction

;;-- Functions ---------------------------------------

Function DisableLogging() Global

	CloseUserLog("TheCuratorsCompanion")
endFunction

;;-- Functions ---------------------------------------

Function Log(String asMessage, Int aiLevel = 0, Bool bTrace = False) Global
	
	TraceUser("TheCuratorsCompanion", asMessage, aiLevel)
	if bTrace || aiLevel == 2
		Trace("The Curators Companion - " + asMessage, aiLevel)
	endif
EndFunction
