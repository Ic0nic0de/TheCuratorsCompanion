scriptName RN_Utility_Setup_C2 extends Quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

Import Debug

RN_Utility_ArrayHolder property RN_Array auto

;Display Ref List - Armory
formlist property DBM_SectionArmory_Displays_Merged auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Setup_Done Auto
globalvariable property RN_Setup_Registered auto

bool _setupDone

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()
	
	_RunSetup(false)
endFunction
	
;;-- Functions ---------------------------------------

function _RunSetup(bool forced)	
	
	RN_Setup_Registered.Mod(1)
	
	if forced
		_setupDone = false
	endIf
	
	if !_setupDone

		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Received for: Setup C2")
		endIf
	
		;;Merge Armory Display Lists
		Int _Index = 0 	
		Int _Length = RN_Array._Armory_Formlist_Displays.length
		While _Index < _Length
			_onConsolidateDisplays(RN_Array._Armory_Formlist_Displays[_Index], DBM_SectionArmory_Displays_Merged)
			_Index += 1
		endWhile
		
		RN_Setup_Done.Mod(1)
		_setupDone = true
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Completed for: Setup C2")
		endIf
	
	else
		
		RN_Setup_Done.Mod(1)
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Already Completed for: Setup C2")
		endIf
	endIf
endFunction
