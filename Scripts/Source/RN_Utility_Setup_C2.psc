scriptName RN_Utility_Setup_C2 extends Quest

Import RN_Utility_Global

RN_Utility_ArrayHolder property RN_Array auto

;Display Ref List - Armory
formlist property DBM_SectionArmory_Displays_Merged auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Setup_Done Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("RunSetup_C2", "OnRunSetup_C2")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("RunSetup_C2", "OnRunSetup_C2")
endFunction

;;-- Functions ---------------------------------------

function OnRunSetup_C2(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)

	;;Merge Armory Display Lists
	Int _Index = 0 	
	Int _Length = RN_Array._Armory_Formlist_Displays.length
	While _Index < _Length
		_onConsolidateDisplays(RN_Array._Armory_Formlist_Displays[_Index], DBM_SectionArmory_Displays_Merged)
		_Index += 1
	endWhile

	RN_Setup_Done.Mod(1)
endFunction
