scriptName RN_Main_Armory extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM Property MCM auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Formlists to control item lists - Merged Formlist
formlist property TCC_ItemList_Armory auto ;;Merged Item List.

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Item Notifications.
Message property DBM_FoundRelicNotification auto

;;Alias to force the item into for messages / notifications.
ReferenceAlias Property FoundAlias auto

;;Check if Museum Intro is Complete.
Quest Property DBM_MuseumIntro Auto

;;Player Ref for Game.GetPlayer()
Objectreference Property PlayerRef Auto

;;MoreHud
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto

Auto State Silent
    Event OnBeginState()
		RemoveAllInventoryEventFilters()
		AddInventoryEventFilter(TCC_ItemList_Armory as Form)
    EndEvent
  
	Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)	
	EndEvent
endState


State Notify
    Event OnBeginState()
		RemoveAllInventoryEventFilters()
		AddInventoryEventFilter(TCC_ItemList_Armory as Form)
	EndEvent
  
	Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		if DBMNew.HasForm(akBaseItem) && !DBMFound.HasForm(akBaseItem) && !DBMDisp.HasForm(akBaseItem)		
			ObjectReference FoundRelic = PlayerRef.PlaceAtMe(akBaseItem, 1, false, true)
			FoundAlias.ForceRefTo(FoundRelic)
			DBM_FoundRelicNotification.Show()
			FoundAlias.Clear()
			FoundRelic.Delete()
		endif
	EndEvent	
endState		
