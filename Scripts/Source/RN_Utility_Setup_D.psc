ScriptName RN_Utility_Setup_D extends Quest

Import RN_Utility_Global

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control item lists. - Merged Formlist 1. (HOH, Lib)
formlist property RN_Safehouse_Items_Merged auto ;;Merged Item List.

;;Formlist to control item lists. - MoreHud.
Formlist Property dbmNew auto
formlist property dbmMaster auto

globalvariable property RN_Safehouse_Done auto
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("RunSetup_D", "OnRunSetup_D")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("RunSetup_D", "OnRunSetup_D")
endFunction

;;-- Functions ---------------------------------------

function OnRunSetup_D(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)		

	Debug.Trace("The Curators Companion: Setup Event Received for RN_Utility_Setup_D")
	
	Int _index = _itemsArray.length		
	While _index
		_index -= 1
		Formlist _List = _itemsArray[_index]
		_onConsolidateItems(_List, RN_Safehouse_Items_Merged, dbmNew, dbmMaster)			
	endWhile
	
	RN_Safehouse_Done.Mod(1)
	Debug.Trace("The Curators Companion: Setup Event Completed for RN_Utility_Setup_D")
endFunction

