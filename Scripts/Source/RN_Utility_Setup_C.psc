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
formlist property TCC_DisplayList_Library auto

;Display Ref List - Natural Science
formlist property DBM_SectionNaturalScienceAnimals auto
formlist property DBM_SectionNSGemstone auto
formlist property DBM_SectionNSShells auto
formlist property TCC_DisplayList_NaturalScience auto

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

		TCCDebug.Log("Setup Event Received for: Setup C")
	
		;;Merge Library Display Lists
		_onConsolidateDisplays(DBM_SectionLibraryLowerFloorLeft, TCC_DisplayList_Library)
		_onConsolidateDisplays(DBM_SectionLibraryLowerFloorRight, TCC_DisplayList_Library)
		_onConsolidateDisplays(DBM_SectionLibraryUpperFloor, TCC_DisplayList_Library)
		_onConsolidateDisplays(DBM_SectionLibraryRareBooks, TCC_DisplayList_Library)
		_onConsolidateDisplays(DBM_SectionLibraryMaps, TCC_DisplayList_Library)

		;;Merge Gallery Of Natural Science Display Lists
		_onConsolidateDisplays(DBM_SectionNaturalScienceAnimals, TCC_DisplayList_NaturalScience)
		_onConsolidateDisplays(DBM_SectionNSGemstone, TCC_DisplayList_NaturalScience)  
		_onConsolidateDisplays(DBM_SectionNSShells, TCC_DisplayList_NaturalScience)
		
		RN_Setup_Done.Mod(1)
		_setupDone = true
		TCCDebug.Log("Setup Event Completed for: Setup C")
	
	else
		
		RN_Setup_Done.Mod(1)
		TCCDebug.Log("Setup Event Already Completed for: Setup C")
	endIf
endFunction
