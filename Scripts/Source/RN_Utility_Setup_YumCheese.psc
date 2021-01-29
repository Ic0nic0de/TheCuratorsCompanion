ScriptName RN_Utility_Setup_YumCheese extends Quest

RN_Utility_MCM property MCM auto

Import RN_Utility_Global

bool _setupDone

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control item lists. - Merged Formlist 1. (HOH, Lib)
formlist property TCC_ItemList_Safehouse auto ;;Merged Item List.

;;Formlist to control item lists. - MoreHud.
Formlist property dbmNew auto
formlist property dbmMaster auto

Objectreference[] property _Containers auto

formlist property _SafehouseContainerList auto
formlist property _SafehouseContainerList_WP auto

formlist property TCC_TokenList auto
formlist property TCC_TokenList_ExcludedItems auto

formlist property DBM_YUMCheeseDisplay auto
formlist property TCC_DisplayList_Safehouse auto

;; Global for ModEvent Return.
globalvariable property RN_Safehouse_Done auto
globalvariable property RN_Safehouse_Registered auto
globalvariable property RN_SupportedSafehouseCount auto

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
	
		TCCDebug.Log("Setup Event Received for: CheeseMod")

		Int _index = _itemsArray.length		
		While _index
			_index -= 1
			Formlist _List = _itemsArray[_index]
			_onConsolidateItems(_List, TCC_ItemList_Safehouse, dbmNew, dbmMaster)			
		endWhile
		
		_index = _Containers.length
		While _index
			_index -= 1
			TCC_TokenList.AddForm(_Containers[_index])
			TCC_TokenList_ExcludedItems.AddForm(_Containers[_index])
			_SafehouseContainerList.AddForm(_Containers[_index])
			_SafehouseContainerList_WP.AddForm(_Containers[_index])
			SendModEvent("Update_TokenArray", "Updating Token Array")
		endWhile
		
		_onConsolidateDisplays(DBM_YUMCheeseDisplay, TCC_DisplayList_Safehouse)

		RN_SupportedSafehouseCount.Mod(1)
		
		Utility.Wait(5)
		
		RN_Safehouse_Done.Mod(1)
		_setupDone = True
		
		MCM.UpdateReq = True
		TCCDebug.Log("Setup Event Completed for: CheeseMod")
	else
		
		RN_Safehouse_Done.Mod(1)
		
		TCCDebug.Log("Setup Event Already Completed for: CheeseMod")
	endIf
endEvent	