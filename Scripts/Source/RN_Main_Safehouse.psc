scriptName RN_Main_Safehouse extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM Property MCM Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Formlists to control item lists - Merged Formlist 1. (HOH, Lib)
formlist property TCC_ItemList_Safehouse auto ;;Merged Item List.
formlist property TCC_FoundList_Safehouse auto ;;Found Item List.

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Item Messagebox.
Message property DBM_FoundRelicMessageComplete_SH auto

;;Item Notifications.
Message property DBM_FoundRelicNotification_SH auto

;;Alias to force the item into for messages / notifications.
ReferenceAlias Property FoundAlias auto

;;Player Ref for Game.GetPlayer()
Objectreference Property PlayerRef Auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Found_Done Auto
GlobalVariable Property RN_found_Registered Auto

GlobalVariable Property RN_SafeouseContent_Installed Auto

;;Museum / Safehouse storage containers to check within several events.
Formlist property _SafehouseContainerList_WP auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Events ---------------------------------------

Event OnInit()

	RegisterForModEvent("TCCUpdate", "_onUpdate")
	AddInventoryEventFilters()
endEvent

;;-- Events ---------------------------------------

Event OnPlayerLoadGame()
	
	RegisterForModEvent("TCCUpdate", "_onUpdate")
	AddInventoryEventFilters()
endEvent
	
;;-- Events ---------------------------------------

Event AddInventoryEventFilters()

	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(TCC_ItemList_Safehouse as Form)
endEvent

;;-- Events ---------------------------------------		

Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		
	if TCC_ItemList_Safehouse.HasForm(akBaseItem) && !TCC_FoundList_Safehouse.HasForm(akBaseItem) && RN_SafeouseContent_Installed.GetValue()
		TCC_FoundList_Safehouse.AddForm(akBaseItem)
							
		if (MCM.ShowMuseumVal)
			ObjectReference FoundRelic = PlayerRef.PlaceAtMe(akBaseItem, 1, false, true)
			FoundAlias.ForceRefTo(FoundRelic)
			if (!MCM.ShowSimpleNotificationVal)
				DBM_FoundRelicMessageComplete_SH.Show()						
			else
				DBM_FoundRelicNotification_SH.Show()
			endIf
			FoundAlias.Clear()
			FoundRelic.Delete()
		endIf	
	endIf		
EndEvent		
	
;;-- Events ---------------------------------------	

Event _onUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	RN_found_Registered.Mod(1)
	
	TCCDebug.Log("Safehouse - Update Event Received...", 0)
	
	Int _Index = 0
	Int ListSize = _SafehouseContainerList_WP.GetSize()
	While _Index < ListSize
		ObjectReference _Container = _SafehouseContainerList_WP.GetAt(_Index) as ObjectReference
		Int Index2 = 0
		Int ContainerList = _Container.GetNumItems()
		while Index2 < ContainerList	
			Form ItemRelic = _Container.GetNthForm(Index2)			
			if TCC_ItemList_Safehouse.HasForm(ItemRelic)
				if !TCC_FoundList_Safehouse.HasForm(ItemRelic)
					TCC_FoundList_Safehouse.AddForm(ItemRelic)
				endIf
			endIf
			Index2 += 1
		endWhile
		_Index += 1
	endWhile
	
	RN_Found_Done.Mod(1)
	TCCDebug.Log("Safehouse - Update Event Completed", 0)
endEvent	