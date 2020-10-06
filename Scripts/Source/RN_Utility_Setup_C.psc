scriptName RN_Utility_Setup_C extends Quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

Import Debug

;Display Ref List - Library
formlist property DBM_SectionLibraryLowerFloorLeft auto
formlist property DBM_SectionLibraryLowerFloorRight auto
formlist property DBM_SectionLibraryUpperFloor auto
formlist property DBM_SectionLibraryRareBooks auto
formlist property DBM_SectionLibraryMaps auto
formlist property DBM_SectionLibrary_Merged auto

;Display Ref List - Natural Science
formlist property DBM_SectionNaturalScienceAnimals auto
formlist property DBM_SectionNSGemstone auto
formlist property DBM_SectionNSShells auto
formlist property DBM_SectionNS_Merged auto

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
			DBMDebug.Log(Self, "TCC: Setup Event Received for: Setup C")
		endIf
	
		;;Merge Library Display Lists
		_onConsolidateDisplays(DBM_SectionLibraryLowerFloorLeft, DBM_SectionLibrary_Merged)
		_onConsolidateDisplays(DBM_SectionLibraryLowerFloorRight, DBM_SectionLibrary_Merged)
		_onConsolidateDisplays(DBM_SectionLibraryUpperFloor, DBM_SectionLibrary_Merged)
		_onConsolidateDisplays(DBM_SectionLibraryRareBooks, DBM_SectionLibrary_Merged)
		_onConsolidateDisplays(DBM_SectionLibraryMaps, DBM_SectionLibrary_Merged)

		;;Merge Gallery Of Natural Science Display Lists
		_onConsolidateDisplays(DBM_SectionNaturalScienceAnimals, DBM_SectionNS_Merged)
		_onConsolidateDisplays(DBM_SectionNSGemstone, DBM_SectionNS_Merged)  
		_onConsolidateDisplays(DBM_SectionNSShells, DBM_SectionNS_Merged)
		
		RN_Setup_Done.Mod(1)
		_setupDone = true
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Completed for: Setup C")
		endIf
	
	else
		
		RN_Setup_Done.Mod(1)
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Already Completed for: Setup C")
		endIf
	endIf
endFunction
