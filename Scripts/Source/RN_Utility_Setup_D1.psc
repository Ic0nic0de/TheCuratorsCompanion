scriptName RN_Utility_Setup_D1 extends Quest

RN_Utility_MCM property MCM auto

Import RN_Utility_Global

bool _setupDone

;Display Ref List - Safehouse
formlist property DBM_FoodDisplayList auto
formlist property DBM_FoodRawDisplayList auto
formlist property DBM_LiquorDisplayList auto
formlist property DBM_DishDisplay auto
formlist property DBM_SilverDisplay auto
formlist property DBM_DisplayClosetList auto

formlist property TCC_DisplayList_Safehouse auto

;; Global for ModEvent Return.
globalvariable property RN_Safehouse_Done auto
globalvariable property RN_Safehouse_Registered auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("TCCSetup_SH", "OnSetup")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("TCCSetup_SH", "OnSetup")
endFunction

;;-- Functions ---------------------------------------

Event OnSetup(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)
	
	RN_Safehouse_Registered.Mod(1)
	
	if !_setupDone

		TCCDebug.Log("Setup Event Received for: Setup D1")
	
		;;Merge Safehouse Display Lists
		_onConsolidateDisplays(DBM_FoodDisplayList, TCC_DisplayList_Safehouse)
		_onConsolidateDisplays(DBM_FoodRawDisplayList, TCC_DisplayList_Safehouse)
		_onConsolidateDisplays(DBM_LiquorDisplayList, TCC_DisplayList_Safehouse)
		_onConsolidateDisplays(DBM_DishDisplay, TCC_DisplayList_Safehouse)
		_onConsolidateDisplays(DBM_SilverDisplay, TCC_DisplayList_Safehouse)
		_onConsolidateDisplays(DBM_DisplayClosetList, TCC_DisplayList_Safehouse)	
		
		Utility.Wait(5)
		
		RN_Safehouse_Done.Mod(1)
		_setupDone = True
		
		TCCDebug.Log("Setup Event Completed for: Setup D1")
	else
		
		RN_Safehouse_Done.Mod(1)
		TCCDebug.Log("Setup Event Already Completed for: Setup D1")
	endIf
endEvent	

