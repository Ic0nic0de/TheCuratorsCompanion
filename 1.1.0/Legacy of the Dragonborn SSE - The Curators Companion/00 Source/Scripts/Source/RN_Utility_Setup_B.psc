ScriptName RN_Utility_Setup_B extends Quest

Import RN_Utility_Global

;;Formlists & Keywords to control item lists - MoreHud.
Formlist Property dbmNew auto
formlist property dbmMaster auto

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control item lists - Merged Formlist 2. (DAE, HOLE, HOO, NS, GH, HOS)
formlist property DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged auto ;;Merged Item List.

Globalvariable Property RN_Setup_Done auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("RunSetup_B", "OnRunSetup_B")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("RunSetup_B", "OnRunSetup_B")
endFunction

;;-- Functions ---------------------------------------

function OnRunSetup_B(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)		
	
	Int _index = _itemsArray.length		
	While _index
		_index -= 1
		Formlist _List = _itemsArray[_index]
		_onConsolidateItems(_List, DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged, dbmNew, dbmMaster)			
	endWhile
	
	RN_Setup_Done.Mod(1)	
endFunction
