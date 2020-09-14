scriptName RN_Utility_Setup_C extends Quest

Import RN_Utility_Global

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

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("RunSetup_C", "OnRunSetup_C")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("RunSetup_C", "OnRunSetup_C")
endFunction

;;-- Functions ---------------------------------------

function OnRunSetup_C(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)
	
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
endFunction
