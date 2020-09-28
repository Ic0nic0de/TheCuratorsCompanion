scriptName RN_Utility_Setup_D1 extends Quest

Import RN_Utility_Global

;Display Ref List - Safehouse
formlist property DBM_FoodDisplayList auto
formlist property DBM_FoodRawDisplayList auto
formlist property DBM_LiquorDisplayList auto
formlist property DBM_DishDisplay auto
formlist property DBM_SilverDisplay auto
formlist property DBM_DisplayClosetList auto

formlist property DBM_SectionSafehouse_Merged auto

;; Global for ModEvent Return.
globalvariable property RN_Safehouse_Done auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("RunSetup_D1", "OnRunSetup_D1")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("RunSetup_D1", "OnRunSetup_D1")
endFunction

;;-- Functions ---------------------------------------

function OnRunSetup_D1(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)

	Debug.Trace("The Curators Companion: Setup Event Received for RN_Utility_Setup_D1")
	
	;;Merge Safehouse Display Lists
	_onConsolidateDisplays(DBM_FoodDisplayList, DBM_SectionSafehouse_Merged)
	_onConsolidateDisplays(DBM_FoodRawDisplayList, DBM_SectionSafehouse_Merged)
	_onConsolidateDisplays(DBM_LiquorDisplayList, DBM_SectionSafehouse_Merged)
	_onConsolidateDisplays(DBM_DishDisplay, DBM_SectionSafehouse_Merged)
	_onConsolidateDisplays(DBM_SilverDisplay, DBM_SectionSafehouse_Merged)
	_onConsolidateDisplays(DBM_DisplayClosetList, DBM_SectionSafehouse_Merged)	
	
	RN_Safehouse_Done.Mod(1)
	Debug.Trace("The Curators Companion: Setup Event Completed for RN_Utility_Setup_D1")
endFunction

