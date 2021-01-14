ScriptName RN_Utility_PlayerLoadGame extends ReferenceAlias

RN_Utility_Script Property RN_Utility auto

RN_Utility_ScanScript property ScanScript_1	auto
RN_Utility_ScanScript property ScanScript_2	auto
RN_Utility_ScanScript property ScanScript_3	auto
RN_Utility_ScanScript property ScanScript_4	auto	
RN_Utility_ScanScript property ScanScript_5	auto
RN_Utility_ScanScript property ScanScript_6	auto	
RN_Utility_ScanScript property ScanScript_7	 auto
RN_Utility_ScanScript property ScanScript_8	 auto
RN_Utility_ScanScript property ScanScript_9	 auto
RN_Utility_ScanScript property ScanScript_10 auto	
RN_Utility_ScanScript property ScanScript_11 auto
RN_Utility_ScanScript property ScanScript_12 auto
RN_Utility_ScanScript property ScanScript_13 auto
RN_Utility_ScanScript_Armory property ScanScript_14	auto
RN_Utility_ScanScript_Misc property ScanScript_15 auto 	
RN_Utility_autoScan property AutoScan auto
  	
Event OnPlayerLoadGame()

	AutoScan.Register()
	ScanScript_1.Register()
	ScanScript_2.Register()
	ScanScript_3.Register()
	ScanScript_4.Register()
	ScanScript_5.Register()
	ScanScript_6.Register()
	ScanScript_7.Register()
	ScanScript_8.Register()
	ScanScript_9.Register()
	ScanScript_10.Register()
	ScanScript_11.Register()
	ScanScript_12.Register()
	ScanScript_13.Register()
	ScanScript_14.Register()
	ScanScript_15.Register()
	
	RN_Utility.Maintenance()	
endEvent

