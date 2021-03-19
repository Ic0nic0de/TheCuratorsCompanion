ScriptName RN_Utility_PlayerLoadGame extends ReferenceAlias

RN_Utility_Script property RN_Utility auto
 
Event OnPlayerLoadGame()
	
	TCCDebug.EnableLogging()
	RN_Utility.Maintenance()	
endEvent

