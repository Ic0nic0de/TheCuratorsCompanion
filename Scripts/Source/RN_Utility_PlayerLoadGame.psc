ScriptName RN_Utility_PlayerLoadGame extends ReferenceAlias

RN_Utility_Script property RN_Utility auto

RN_Utility_ScanScript property ScanScript01 auto
RN_Utility_ScanScript property ScanScript02 auto
RN_Utility_ScanScript property ScanScript03 auto
RN_Utility_ScanScript property ScanScript04 auto
RN_Utility_ScanScript property ScanScript05 auto
RN_Utility_ScanScript property ScanScript06 auto
RN_Utility_ScanScript property ScanScript07 auto
RN_Utility_ScanScript property ScanScript08 auto
RN_Utility_ScanScript property ScanScript09 auto
RN_Utility_ScanScript property ScanScript10 auto
RN_Utility_ScanScript property ScanScript11 auto
RN_Utility_ScanScript property ScanScript12 auto
RN_Utility_ScanScript property ScanScript13 auto

RN_Utility_ScanScript_Misc property MiscScanScript01 auto

RN_Utility_ScanScript_Armory property ArmoryScanScript01 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript02 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript03 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript04 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript05 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript06 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript07 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript08 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript09 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript10 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript11 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript12 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript13 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript14 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript15 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript16 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript17 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript18 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript19 auto
RN_Utility_ScanScript_Armory property ArmoryScanScript20 auto
 
Event OnPlayerLoadGame()
	
	TCCDebug.EnableLogging()
	RegisterScanScripts()
	RN_Utility.Maintenance()	
endEvent

Function RegisterScanScripts()

ScanScript01.Register()
ScanScript02.Register()
ScanScript03.Register()
ScanScript04.Register()
ScanScript05.Register()
ScanScript06.Register()
ScanScript07.Register()
ScanScript08.Register()
ScanScript09.Register()
ScanScript10.Register()
ScanScript11.Register()
ScanScript12.Register()
ScanScript13.Register()
MiscScanScript01.Register()
ArmoryScanScript01.Register()
ArmoryScanScript02.Register()
ArmoryScanScript03.Register()
ArmoryScanScript04.Register()
ArmoryScanScript05.Register()
ArmoryScanScript06.Register()
ArmoryScanScript07.Register()
ArmoryScanScript08.Register()
ArmoryScanScript09.Register()
ArmoryScanScript10.Register()
ArmoryScanScript11.Register()
ArmoryScanScript12.Register()
ArmoryScanScript13.Register()
ArmoryScanScript14.Register()
ArmoryScanScript15.Register()
ArmoryScanScript16.Register()
ArmoryScanScript17.Register()
ArmoryScanScript18.Register()
ArmoryScanScript19.Register()
ArmoryScanScript20.Register()
endFunction
