scriptName RN_Main_Museum_EEHMISC extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM Property MCM Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Formlists to control item lists - Merged Formlist 2. (DAE, HOLE, HOO, NS, GH, HOS)
formlist property TCC_ItemList_Museum_2 auto ;;Merged Item List.
formlist property TCC_FoundList_Museum_2 auto ;;Found Item List.

;Formlist to control item lists - Displayable Non-Unique Form ID's
formlist property TCC_ItemList_NonIcon auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Item Messagebox.
Message property DBM_NonIconMessage auto
Message property DBM_FoundRelicMessage auto
Message property DBM_FoundRelicMessageComplete auto

;;Item Notifications.
Message property DBM_FoundRelicNotification auto
Message property DBM_FoundRelicNotification_SH auto

;;Alias to force the item into for messages / notifications.
ReferenceAlias Property FoundAlias auto

;;Check if Museum Intro is Complete.
Quest Property DBM_MuseumIntro Auto

;;Player Ref for Game.GetPlayer()
Objectreference Property PlayerRef Auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Found_Done Auto
GlobalVariable Property RN_found_Registered Auto

;;Museum / Safehouse storage containers to check within several events.
formlist property _MuseumContainerList_WP auto

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
	AddInventoryEventFilter(TCC_ItemList_NonIcon as Form)
	AddInventoryEventFilter(TCC_ItemList_Museum_2 as Form)	
endEvent

;;-- Events ---------------------------------------		

Auto State Silent
	Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		TCC_FoundList_Museum_2.AddForm(akBaseItem)		
	EndEvent
endState

State Notify
	Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
		
		if TCC_ItemList_NonIcon.HasForm(akBaseItem)	
			ObjectReference FoundRelic = PlayerRef.PlaceAtMe(akBaseItem, 1, false, true)
			FoundAlias.ForceRefTo(FoundRelic)
			DBM_NonIconMessage.Show()
			FoundAlias.Clear()
			FoundRelic.Delete()
			
		else
			TCC_FoundList_Museum_2.AddForm(akBaseItem)	
			ObjectReference FoundRelic = PlayerRef.PlaceAtMe(akBaseItem, 1, false, true)
			FoundAlias.ForceRefTo(FoundRelic)
			if (!MCM.ShowSimpleNotificationVal)
				if (DBM_MuseumIntro.IsCompleted())
					DBM_FoundRelicMessageComplete.Show()
				else
					DBM_FoundRelicMessage.Show()
				endIf						
			else
				DBM_FoundRelicNotification.Show()
			endIf
			FoundAlias.Clear()
			FoundRelic.Delete()
		endIf		
	EndEvent
endState
	
;;-- Events ---------------------------------------	

Event _onUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	RN_found_Registered.Mod(1)
	
	TCCDebug.Log("Museum 2 - Update Event Received...", 0)
	
	Int _Index = _MuseumContainerList_WP.GetSize()
	While _Index 
		_Index -= 1
		ObjectReference _Container = _MuseumContainerList_WP.GetAt(_Index) as ObjectReference
		Int Index2 = _Container.GetNumItems()
		while Index2
			Index2 -=1		
			Form ItemRelic = _Container.GetNthForm(Index2)			
			if TCC_ItemList_Museum_2.HasForm(ItemRelic)
				if !TCC_FoundList_Museum_2.HasForm(ItemRelic)
					TCC_FoundList_Museum_2.AddForm(ItemRelic)
				endIf
			endIf	
		endWhile
	endWhile
	
	RN_Found_Done.Mod(1)
	TCCDebug.Log("Museum 2 - Update Event Competed", 0)
endEvent	