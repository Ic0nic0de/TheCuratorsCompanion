ScriptName RN_Utility_Setup_A2 extends Quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

Import Debug

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control item lists. - Merged Formlist (Armory)
formlist property TCC_ItemList_Armory auto ;;Merged Item List.

;;Formlist to control item lists. - MoreHud.
Formlist Property dbmNew auto
formlist property dbmMaster auto

Globalvariable Property RN_Setup_Done auto
globalvariable property RN_Setup_Registered auto

bool _setupDone

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()
	
	_RunSetup(false)
endFunction
	
;;-- Functions ---------------------------------------

function _RunSetup(bool forced)	
	
	RN_Setup_Registered.Mod(1)
	
	if forced
		_setupDone = false
	endIf
	
	if !_setupDone

		TCCDebug.Log("Setup Event Received for: Setup A2")
	
		Int _index = _itemsArray.length		
		While _index
			_index -= 1
			Formlist _List = _itemsArray[_index]
			_onConsolidateItems(_List, TCC_ItemList_Armory, dbmNew, dbmMaster)			
		endWhile
		
		RN_Setup_Done.Mod(1)
		_setupDone = true
		TCCDebug.Log("Setup Event Completed for: Setup A2")
	
	else
		
		RN_Setup_Done.Mod(1)
		TCCDebug.Log("Setup Event Already Completed for: Setup A2")
	endIf
endFunction
