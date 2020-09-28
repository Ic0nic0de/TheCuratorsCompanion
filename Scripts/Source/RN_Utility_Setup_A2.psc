ScriptName RN_Utility_Setup_A2 extends Quest

Import RN_Utility_Global

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control item lists. - Merged Formlist (Armory)
formlist property DBM_SectionArmory_Merged auto ;;Merged Item List.

;;Formlist to control item lists. - MoreHud.
Formlist Property dbmNew auto
formlist property dbmMaster auto

Globalvariable Property RN_Setup_Done auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("RunSetup_A2", "OnRunSetup_A2")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("RunSetup_A2", "OnRunSetup_A2")
endFunction

;;-- Functions ---------------------------------------

function OnRunSetup_A2(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)		
	
	Debug.Trace("The Curators Companion: Setup Event Received for RN_Utility_Setup_A2")
	
	Int _index = _itemsArray.length		
	While _index
		_index -= 1
		Formlist _List = _itemsArray[_index]
		_onConsolidateItems(_List, DBM_SectionArmory_Merged, dbmNew, dbmMaster)			
	endWhile
	
	RN_Setup_Done.Mod(1)
	Debug.Trace("The Curators Companion: Setup Event Completed for RN_Utility_Setup_A2")
endFunction
