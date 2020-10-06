ScriptName RN_Utility_Setup_B extends Quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

Import Debug

;;Formlists & Keywords to control item lists - MoreHud.
Formlist Property dbmNew auto
formlist property dbmMaster auto

;;Formlists to control item lists.
formlist[] property _itemsArray auto

;;Formlists to control item lists - Merged Formlist 2. (DAE, HOLE, HOO, NS, GH, HOS)
formlist property DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged auto ;;Merged Item List.

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

		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Received for: Setup B")
		endIf
	
		Int _index = _itemsArray.length		
		While _index
			_index -= 1
			Formlist _List = _itemsArray[_index]
			_onConsolidateItems(_List, DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged, dbmNew, dbmMaster)			
		endWhile
		
		RN_Setup_Done.Mod(1)
		_setupDone = true
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Completed for: Setup B")
		endIf
	
	else
		
		RN_Setup_Done.Mod(1)
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Already Completed for: Setup B")
		endIf
	endIf
endFunction
