ScriptName RN_Utility_Setup_SHP extends Quest

RN_Utility_MCM property MCM auto

Import RN_Utility_Global

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control item lists. - Merged Formlist 1. (HOH, Lib)
formlist property RN_Safehouse_Items_Merged auto ;;Merged Item List.

;;Formlist to control item lists. - MoreHud.
Formlist property dbmNew auto
formlist property dbmMaster auto

Objectreference[] property _Containers auto

formlist property _SafehouseContainerList auto
formlist property _SafehouseContainerList_WP auto

formlist property RN_TokenFormlist auto
formlist property RN_TokenFormlistExcluded auto

formlist property DBM_DwemerDishDisplay auto
formlist property DBM_SectionSafehouse_Merged auto

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

function OnSetup(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)		
	
	RN_Safehouse_Registered.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(Self, "TCC: Setup Event Received for: Safehouse Plus")
	endIf
	
	Int _index = _itemsArray.length		
	While _index
		_index -= 1
		Formlist _List = _itemsArray[_index]
		_onConsolidateItems(_List, RN_Safehouse_Items_Merged, dbmNew, dbmMaster)			
	endWhile
	
	_index = _Containers.length
	While _index
		_index -= 1
		RN_TokenFormlist.AddForm(_Containers[_index])
		RN_TokenFormlistExcluded.AddForm(_Containers[_index])
		_SafehouseContainerList.AddForm(_Containers[_index])
		_SafehouseContainerList_WP.AddForm(_Containers[_index])
	endWhile
	
	_onConsolidateDisplays(DBM_DwemerDishDisplay, DBM_SectionSafehouse_Merged)
	
	RN_Safehouse_Done.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(Self, "TCC: Setup Event Completed for: Safehouse Plus")
	endIf
endFunction
