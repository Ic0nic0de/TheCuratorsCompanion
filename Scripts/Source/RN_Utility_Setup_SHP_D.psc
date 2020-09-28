scriptName RN_Utility_Setup_SHP_D extends Quest

Import RN_Utility_Global

;Display Ref List - Safehouse
formlist property DBM_DwemerDishDisplay auto
formlist property DBM_SectionSafehouse_Merged auto

;; Global for ModEvent Return.
globalvariable property RN_Safehouse_Done auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("RunSafehousePlusSetup_D", "OnRunSafehousePlusSetup_D")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("RunSafehousePlusSetup_D", "OnRunSafehousePlusSetup_D")
endFunction

;;-- Functions ---------------------------------------

function OnRunSafehousePlusSetup_D(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)

	Debug.Trace("The Curators Companion: Setup Event Received for RN_Utility_Setup_SHP_D")
	
	;;Merge Safehouse Display Lists
	_onConsolidateDisplays(DBM_DwemerDishDisplay, DBM_SectionSafehouse_Merged)	
	
	RN_Safehouse_Done.Mod(1)
	Debug.Trace("The Curators Companion: Setup Event Completed for RN_Utility_Setup_SHP_D")
endFunction
