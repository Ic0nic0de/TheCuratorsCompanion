scriptName RN_Main_Museum_EEHMISC extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM Property MCM Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Formlists to control item lists - Merged Formlist 2. (DAE, HOLE, HOO, NS, GH, HOS)
formlist property TCC_ItemList_Museum_2 auto ;;Merged Item List.

;Formlist to control item lists - Displayable Non-Unique Form ID's
formlist property TCC_ItemList_NonIcon auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Item Messagebox.
Message property DBM_NonIconMessage auto

;;Item Notifications.
Message property DBM_FoundRelicNotification auto
Message property DBM_FoundRelicNotification_SH auto

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
		AddInventoryEventFilter(TCC_ItemList_NonIcon as Form)
		AddInventoryEventFilter(TCC_ItemList_Museum_2 as Form)
	EndEvent
  
	Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)		
	EndEvent
endState

State Notify
	Event OnBeginState()
		RemoveAllInventoryEventFilters()
		AddInventoryEventFilter(TCC_ItemList_NonIcon as Form)
		AddInventoryEventFilter(TCC_ItemList_Museum_2 as Form)
	EndEvent
  
	Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		if TCC_ItemList_NonIcon.HasForm(akBaseItem)	
			ObjectReference FoundRelic = PlayerRef.PlaceAtMe(akBaseItem, 1, false, true)
			FoundAlias.ForceRefTo(FoundRelic)
			DBM_NonIconMessage.Show()
			FoundAlias.Clear()
			FoundRelic.Delete()	
		else
			if DBMNew.HasForm(akBaseItem) && !DBMFound.HasForm(akBaseItem) && !DBMDisp.HasForm(akBaseItem)	
				ObjectReference FoundRelic = PlayerRef.PlaceAtMe(akBaseItem, 1, false, true)
				FoundAlias.ForceRefTo(FoundRelic)
				DBM_FoundRelicNotification.Show()
				FoundAlias.Clear()
				FoundRelic.Delete()
			endIf
		endIf
	EndEvent
endState
