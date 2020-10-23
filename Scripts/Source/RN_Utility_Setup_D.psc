ScriptName RN_Utility_Setup_D extends Quest

RN_Utility_MCM property MCM auto

Import RN_Utility_Global

bool _setupDone

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control item lists. - Merged Formlist 1. (HOH, Lib)
formlist property RN_Safehouse_Items_Merged auto ;;Merged Item List.

;;Formlist to control item lists. - MoreHud.
Formlist Property dbmNew auto
formlist property dbmMaster auto

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
			DBMDebug.Log(Self, "TCC: Setup Event Received for: Setup D")
		endIf
	
		Int _index = _itemsArray.length		
		While _index
			_index -= 1
			Formlist _List = _itemsArray[_index]
			_onConsolidateItems(_List, RN_Safehouse_Items_Merged, dbmNew, dbmMaster)			
		endWhile
		
		Utility.Wait(5)
		
		RN_Safehouse_Done.Mod(1)
		_setupDone = True
		
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Completed for: Setup D")
		endIf
	else
		
		RN_Safehouse_Done.Mod(1)
		
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Already Completed for: Setup D")
		endIf
	endIf
endEvent			
