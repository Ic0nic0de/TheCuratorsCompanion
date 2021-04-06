ScriptName RN_SupportedSH_Script extends Quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_PropManager property Util auto

RN_PatchAPI property APIScript auto

bool property _setupDone = false auto hidden
bool bConfigured

;;Formlists to control item lists.
formlist[] property _itemsArray auto

formlist property TCC_ItemList_Clutter auto ;;Merged Item List.

;;Formlist to control item lists. - MoreHud.
Formlist property dbmNew auto
formlist property dbmClutter auto

Objectreference[] property _Containers auto

formlist property _SafehouseContainerList auto
formlist property _SafehouseContainerList_WP auto

formlist property TCC_TokenList auto
formlist property TCC_TokenList_ExcludedItems auto

formlist property DisplayList auto
formlist property TCC_DisplayList_Clutter auto

;; Global for ModEvent Return.
globalvariable property TCC_RoomEditCount_Clutter auto

String Property _ModName auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Events ---------------------------------------			

Event OnInit()
	
	if (!Util || !MCM)
		TCCDebug.Log("Fatal Error, Script Property not set on quest " + self.GetName() + " ABORTING...", 2)
		return
	endIf
	
	RegisterForSingleUpdate(0)	
EndEvent

;;-- Events ---------------------------------------		

Event OnUpdate()
	
	if bConfigured	
		UnregisterForUpdate()
		Return
	endif
	
	bConfigured = APIScript.RegisterSupportedMod(_ModName, none, none, none, Self)
EndEvent

;;-- Functions ---------------------------------------

function RunSetup()	
	
	Int _index = _itemsArray.length		
	While _index
		_index -= 1
		Formlist _List = _itemsArray[_index]
		_onConsolidateItems(_List, TCC_ItemList_Clutter, dbmNew, dbmClutter)			
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
	
	_onConsolidateDisplaysAll(DisplayList, TCC_DisplayList_Clutter, TCC_RoomEditCount_Clutter)
	
	_setupDone = True
endFunction	

;;-- Functions ---------------------------------------

Event RevertLists()

	Int _index = _Containers.length
	While _index
		_index -= 1
		TCC_TokenList.RemoveAddedForm(_Containers[_index])
		TCC_TokenList_ExcludedItems.RemoveAddedForm(_Containers[_index])
		_SafehouseContainerList.RemoveAddedForm(_Containers[_index])
		_SafehouseContainerList_WP.RemoveAddedForm(_Containers[_index])
		SendModEvent("Update_TokenArray", "Updating Token Array")
	endWhile
	
	_setupDone = False
endEvent
	