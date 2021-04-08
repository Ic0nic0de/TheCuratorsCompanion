ScriptName RN_Main_SupportedMods extends referencealias

Import Debug

RN_Utility_MCM property MCM auto

;;Alias to force the base item into.
ReferenceAlias property FoundAlias auto

;;Formlists to control merged and found lists
formlist property TCC_ItemList_Patches auto

;;Player Ref for Game.GetPlayer().
ObjectReference property PlayerRef auto

;;Check if Museum Intro is Complete.
Quest property DBM_MuseumIntro auto

;;Item Notifications.
Message property DBM_FoundRelicNotification auto

;;MoreHud
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto

Auto State Silent
	Event OnBeginState()
		RemoveAllInventoryEventFilters()
		AddInventoryEventFilter(TCC_ItemList_Patches as Form)
	EndEvent
	
	Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)	
	EndEvent
endState	

State Notify
	Event OnBeginState()
		RemoveAllInventoryEventFilters()
		AddInventoryEventFilter(TCC_ItemList_Patches as Form)
	EndEvent

	Event onItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)			
		if DBMNew.HasForm(akBaseItem) && !DBMFound.HasForm(akBaseItem) && !DBMDisp.HasForm(akBaseItem)		
			ObjectReference FoundRelic = PlayerRef.PlaceAtMe(akBaseItem, 1, false, true)
			FoundAlias.ForceRefTo(FoundRelic)
			DBM_FoundRelicNotification.Show()
			FoundAlias.Clear()
			FoundRelic.Delete()
		endIf
	endEvent
endState	
