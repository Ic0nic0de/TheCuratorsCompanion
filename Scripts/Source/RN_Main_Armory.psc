scriptName RN_Main_Armory extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM Property MCM auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Formlists to control item lists - Merged Formlist
formlist property DBM_SectionArmory_Merged auto ;;Merged Item List.
formlist property DBM_SectionArmory_Found auto ;;Found Item List

;;Formlists to control item lists - MoreHUD
formlist property dbmNew auto
formlist property dbmMaster auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Item Messagebox.
Message property DBM_FoundRelicMessage auto
Message property DBM_FoundRelicMessageComplete auto

;;Item Notifications.
Message property DBM_FoundRelicNotification auto

;;Alias to force the item into for messages / notifications.
ReferenceAlias Property RN_Alias_Found auto

;;Check if Museum Intro is Complete.
Quest Property DBM_MuseumIntro Auto

;;Player Ref for Game.GetPlayer()
Objectreference Property PlayerRef Auto

;; Global for ModEvent Return.
GlobalVariable Property RN_found_Registered Auto
GlobalVariable Property RN_Found_Done Auto

;;Museum storage containers to check within several events.
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
	AddInventoryEventFilter(DBM_SectionArmory_Merged as Form)
endEvent

;;-- Events ---------------------------------------

Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
			
	if DBM_SectionArmory_Merged.HasForm(akBaseItem) && !DBM_SectionArmory_Found.HasForm(akBaseItem) 
		DBM_SectionArmory_Found.AddForm(akBaseItem)	
		
		if (MCM.ShowArmoryVal)
			ObjectReference FoundRelic = PlayerRef.PlaceAtMe(akBaseItem, 1, false, true)
			RN_Alias_Found.ForceRefTo(FoundRelic)
			if (!MCM.ShowSimpleNotificationVal)
				if (DBM_MuseumIntro.IsCompleted())
					DBM_FoundRelicMessageComplete.Show()
				else
					DBM_FoundRelicMessage.Show()
				endIf						
			else
				DBM_FoundRelicNotification.Show()
			endIf
			RN_Alias_Found.Clear()
			FoundRelic.Delete()
		endIf
	endIf
EndEvent	

;;-- Events ---------------------------------------

Event _onUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)
	
	RN_found_Registered.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Update Event Received for: Armory")
	endIf

	Int _Index = _MuseumContainerList_WP.GetSize()
	While _Index 
		_Index -= 1
		ObjectReference _Container = _MuseumContainerList_WP.GetAt(_Index) as ObjectReference
		Int Index2 = _Container.GetNumItems()
		while Index2
			Index2 -=1		
			Form ItemRelic = _Container.GetNthForm(Index2)			
			if DBM_SectionArmory_Merged.HasForm(ItemRelic) && !DBM_SectionArmory_Found.HasForm(ItemRelic)
				DBM_SectionArmory_Found.AddForm(ItemRelic)
			endIf		
		endWhile
	endWhile
	
	RN_Found_Done.Mod(1)

	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Update Event Completed for: Armory")
	endIf
	
endEvent			
