ScriptName RN_Utility_Setup_SHP extends Quest

Import RN_Utility_Global

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control item lists. - Merged Formlist 1. (HOH, Lib)
formlist property RN_Safehouse_Items_Merged auto ;;Merged Item List.

;;Formlist to control item lists. - MoreHud.
Formlist property dbmNew auto
formlist property dbmMaster auto

globalvariable property RN_Safehouse_Done auto

Objectreference[] property _Containers auto

formlist property _SafehouseContainerList auto
formlist property _SafehouseContainerList_WP auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("RunSafehousePlusSetup", "OnRunSafehousePlusSetup")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("RunSafehousePlusSetup", "OnRunSafehousePlusSetup")
endFunction

;;-- Functions ---------------------------------------

function OnRunSafehousePlusSetup(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)		
		
	Int _index = _itemsArray.length		
	While _index
		_index -= 1
		Formlist _List = _itemsArray[_index]
		_onConsolidateItems(_List, RN_Safehouse_Items_Merged, dbmNew, dbmMaster)			
	endWhile
	
	_index = _Containers.length
	While _index
		_index -= 1
		_SafehouseContainerList.AddForm(_Containers[_index])
		_SafehouseContainerList_WP.AddForm(_Containers[_index])
	endWhile
	
	RN_Safehouse_Done.Mod(1)
endFunction
