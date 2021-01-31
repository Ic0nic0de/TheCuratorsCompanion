scriptName RN_Main_Safehouse extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM Property MCM Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Formlists to control item lists - Merged Formlist 1. (HOH, Lib)
formlist property TCC_ItemList_Safehouse auto ;;Merged Item List.

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

;;MoreHud
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto

Auto State Silent
	Event OnBeginState()
		RemoveAllInventoryEventFilters()
		AddInventoryEventFilter(TCC_ItemList_Safehouse as Form)
	EndEvent
	
	Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)	
	EndEvent
endState	

State Notify
	Event OnBeginState()
		RemoveAllInventoryEventFilters()
		AddInventoryEventFilter(TCC_ItemList_Safehouse as Form)
	EndEvent
	
	Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)			
		if DBMNew.HasForm(akBaseItem) && !DBMFound.HasForm(akBaseItem) && !DBMDisp.HasForm(akBaseItem)
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
	EndEvent
endState	
	