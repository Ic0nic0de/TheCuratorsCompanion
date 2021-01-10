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
	
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Received for: Setup D1")
		endIf
	
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
		
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Completed for: Setup D1")
		endIf
	else
		
		RN_Safehouse_Done.Mod(1)
		
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Already Completed for: Setup D1")
		endIf
	endIf
endEvent	

