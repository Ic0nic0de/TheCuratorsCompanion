ScriptName RN_SupportedMod_Alias extends referencealias

Import Debug

RN_Utility_MCM property MCM auto

;;Alias to force the base item into.
ReferenceAlias property RN_Alias_Found auto

;;Formlists to control merged and found lists
formlist property Supported_Items_Merged auto
formlist property Supported_Items_Found auto

;;Player Ref for Game.GetPlayer().
ObjectReference property PlayerRef auto

;;Check if Museum Intro is Complete.
Quest property DBM_MuseumIntro auto

;;Item Messagebox.
Message property DBM_FoundRelicMessage auto
Message property DBM_FoundRelicMessageComplete auto

;;Item Notifications.
Message property DBM_FoundRelicNotification auto

;; Global for ModEvent Return.
GlobalVariable property RN_Found_Done auto
GlobalVariable Property RN_found_Registered Auto

;;Museum storage containers to check within several events.
formlist property _MuseumContainerList_WP auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																			;; Script Start
;;-- Events ---------------------------------------		

Event onInit()

	RegisterForModEvent("TCCUpdate", "_onUpdate")	
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()

	RegisterForModEvent("TCCUpdate", "_onUpdate")	
endEvent

;;-- Events ---------------------------------------	

Event onItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)	

	if Supported_Items_Merged.HasForm(akBaseItem) && !Supported_Items_Found.HasForm(akBaseItem)
		Supported_Items_Found.AddForm(akBaseItem)
				
		if (MCM.ShowModsVal)
			ObjectReference FoundRelic = PlayerRef.PlaceAtMe(akBaseItem, 1, false, true)
			RN_Alias_Found.ForceRefTo(FoundRelic)
			ShowMessages()
			RN_Alias_Found.Clear()
			FoundRelic.Delete()
		endIf
	endIf
endEvent	

;;-- Events ---------------------------------------		

Event ShowMessages()
	
	if (!MCM.ShowSimpleNotificationVal)
		if (DBM_MuseumIntro.IsCompleted())
			DBM_FoundRelicMessageComplete.Show()
		else
			DBM_FoundRelicMessage.Show()
		endIf						
	else
		DBM_FoundRelicNotification.Show()
	endIf

endEvent

;;-- Events ---------------------------------------		

Event _onUpdate(string eventName, string strArg, float numArg, Form sender) ;; automatic Call from (RN_Utility_Script)

	RN_found_Registered.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Update Event Received for: Supported Mods")
	endIf

	Int _Index = _MuseumContainerList_WP.GetSize()
	While _Index 
		_Index -= 1
		ObjectReference _Container = _MuseumContainerList_WP.GetAt(_Index) as ObjectReference
		Int Index2 = _Container.GetNumItems()
		while Index2
			Index2 -=1		
			Form ItemRelic = _Container.GetNthForm(Index2)			
			if Supported_Items_Merged.HasForm(ItemRelic) && !Supported_Items_Found.HasForm(ItemRelic)
				Supported_Items_Found.AddForm(ItemRelic)
			endIf	
		endWhile
	endWhile
	
	RN_Found_Done.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Update Event Completed for: Supported Mods")
	endIf
	
endEvent
