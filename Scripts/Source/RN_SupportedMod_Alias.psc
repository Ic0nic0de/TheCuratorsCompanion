ScriptName RN_SupportedMod_Alias extends referencealias

Import Debug

RN_Utility_MCM property MCM auto

RN_Utility_ArrayHolder property RN_Array auto

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

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
																			;; Script Start
;;-- Events ---------------------------------------		

Event onInit()

	RegisterForModEvent("RunModsUpdate", "_onModUpdate")	
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()

	RegisterForModEvent("RunModsUpdate", "_onModUpdate")	
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

Event _onModUpdate(string eventName, string strArg, float numArg, Form sender) ;; automatic Call from (RN_Utility_Script)
	
	If MCM.DevDebugVal
		Trace("_onModUpdate() Event Received for: Supported Mods")
	endIf
	
	Int Index = RN_Array._MuseumContainerArray_WP.length
	
	While Index 
		Index -= 1		
		Int Index2 = RN_Array._MuseumContainerArray_WP[Index].GetNumItems()
		while Index2
			Index2 -=1		
			Form ItemRelic = RN_Array._MuseumContainerArray_WP[Index].GetNthForm(index2)
			if Supported_Items_Merged.HasForm(ItemRelic) && !Supported_Items_Found.HasForm(ItemRelic)
				Supported_Items_Found.AddForm(ItemRelic)
			endIf	
		endWhile
	endWhile
	
	RN_Found_Done.Mod(1)
	
	If MCM.DevDebugVal
		Trace("_onModUpdate() Event Completed for: Supported Mods")
	endIf
	
endEvent
