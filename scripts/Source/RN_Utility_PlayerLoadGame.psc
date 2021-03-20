ScriptName RN_Utility_PlayerLoadGame extends ReferenceAlias

RN_Utility_MCM property MCM auto
RN_Utility_Script property RN_Utility auto
 
Event OnPlayerLoadGame()
	
	if MCM.advdebug
		TCCDebug.EnableLogging()
	endif
	RN_Utility.Maintenance()	
endEvent

