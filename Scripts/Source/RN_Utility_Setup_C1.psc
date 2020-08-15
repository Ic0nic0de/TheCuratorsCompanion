scriptName RN_Utility_Setup_C1 extends Quest

Import RN_Utility_Global

;Display Ref List - Hall Of Heroes
formlist property DBM_SectionHOHGroundFloorLeft auto
formlist property DBM_SectionHOHGroundFloorRight auto
formlist property DBM_SectionHOHReceptionHall auto
formlist property DBM_SectionHOHUpperGallery auto
formlist property DBM_SectionHOHMasksAndClaws auto
formlist property DBM_SectionHOHJewelry auto
formlist property DBM_SectionHOHCultureandArts auto
formlist property DBM_SectionHOH_Merged auto

;Display Ref List - Hall Of Lost Empires
formlist property DBM_SectionHOLEMainFloor auto
formlist property DBM_SectionHOLEUpperRing auto
formlist property DBM_SectionHOLE_Merged auto

;;Globals For List Sizes.
GlobalVariable Property GV_SectionHallofHeroes Auto
GlobalVariable Property GV_SectionHOLE Auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Setup_Done Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("RunSetup_C1", "OnRunSetup_C1")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("RunSetup_C1", "OnRunSetup_C1")
endFunction

;;-- Functions ---------------------------------------

function OnRunSetup_C1(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)
	
	;;Merge Hall Of Heroes Display Lists
	_onConsolidateDisplays(DBM_SectionHOHGroundFloorLeft, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHGroundFloorRight, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHReceptionHall, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHUpperGallery, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHMasksAndClaws, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHJewelry, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHCultureandArts, DBM_SectionHOH_Merged)

	;;Merge Hall Of Lost Empires Display Lists
	_onConsolidateDisplays(DBM_SectionHOLEMainFloor, DBM_SectionHOLE_Merged)  
	_onConsolidateDisplays(DBM_SectionHOLEUpperRing, DBM_SectionHOLE_Merged)
	
	GV_SectionHallofHeroes.Mod(DBM_SectionHOH_Merged.GetSize())
	GV_SectionHOLE.Mod(DBM_SectionHOLE_Merged.GetSize())
	
	
	RN_Setup_Done.Mod(1)
endFunction
