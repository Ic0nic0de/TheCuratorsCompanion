ScriptName RN_Utility_PlayerLoadGame extends ReferenceAlias

RN_Utility_MCM property MCM auto
RN_Utility_Script property RN_Utility auto
RN_Achivement_Script_Master property AchScript auto

 
Event OnPlayerLoadGame()
	
	if MCM.advdebug
		TCCDebug.EnableLogging()
	endif
	AchScript.RegisterForModEvent("FireScripts", "_OnFireScripts")
	RN_Utility.Maintenance()	
endEvent

