scriptName RN_Main_Museum extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM Property MCM Auto

RN_Utility_ArrayHolder property RN_Array auto

RN_Utility_Mods property RN_Mod auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;;Formlists to control item lists - Merged Formlist 1. (HOH, Lib)
formlist property DBM_Section_HOH_LIB_Merged auto ;;Merged Item List.
formlist property DBM_Section_HOH_LIB_Found auto ;;Found Item List.

;;Formlists to control item lists - Merged Formlist 1. (HOH, Lib)
formlist property RN_Safehouse_Items_Merged auto ;;Merged Item List.
formlist property RN_Safehouse_Items_Found auto ;;Found Item List.

;;Formlists to control item lists - Merged Formlist 2. (DAE, HOLE, HOO, NS, GH, HOS)
formlist property DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged auto ;;Merged Item List.
formlist property DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Found auto ;;Found Item List.

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Item Messagebox.
Message property DBM_FoundRelicMessage auto
Message property DBM_FoundRelicMessageComplete auto
Message property DBM_FoundRelicMessageComplete_SH auto

;;Item Notifications.
Message property DBM_FoundRelicNotification auto
Message property DBM_FoundRelicNotification_SH auto

;;Alias to force the item into for messages / notifications.
ReferenceAlias Property RN_Alias_Found auto

;;Check if Museum Intro is Complete.
Quest Property DBM_MuseumIntro Auto

;;Player Ref for Game.GetPlayer()
Objectreference Property PlayerRef Auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Found_Done Auto
GlobalVariable property RN_SupportedCreationCount auto
GlobalVariable Property iMuseumSets Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Events ---------------------------------------

Event OnInit()
	RegisterForModEvent("RunMuseumUpdate", "_onRunMuseumUpdate")
	RegisterForModEvent("RunSafehouseUpdate", "_onRunSafehouseUpdate")
	AddInventoryEventFilters()
endEvent

;;-- Events ---------------------------------------

Event OnPlayerLoadGame()
	
	RegisterForModEvent("RunMuseumUpdate", "_onRunMuseumUpdate")
	RegisterForModEvent("RunSafehouseUpdate", "_onRunSafehouseUpdate")
	AddInventoryEventFilters()
endEvent
	
;;-- Events ---------------------------------------

Event AddInventoryEventFilters()

	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(RN_Safehouse_Items_Merged as Form)
	AddInventoryEventFilter(DBM_Section_HOH_LIB_Merged as Form)
	AddInventoryEventFilter(DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged as Form)	
endEvent

;;-- Events ---------------------------------------		

Event OnItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
					
	if DBM_Section_HOH_LIB_Merged.HasForm(akBaseItem) && !DBM_Section_HOH_LIB_Found.HasForm(akBaseItem) 
		DBM_Section_HOH_LIB_Found.AddForm(akBaseItem)
						
		if (MCM.ShowMuseumVal)
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
		
	elseif DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged.HasForm(akBaseItem) && !DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Found.HasForm(akBaseItem) 
		DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Found.AddForm(akBaseItem)	
						
		if (MCM.ShowMuseumVal)
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
		
	elseif RN_Safehouse_Items_Merged.HasForm(akBaseItem) && !RN_Safehouse_Items_Found.HasForm(akBaseItem) && MCM.Safehouse_Configured	
		RN_Safehouse_Items_Found.AddForm(akBaseItem)
							
		if (MCM.ShowMuseumVal)
			ObjectReference FoundRelic = PlayerRef.PlaceAtMe(akBaseItem, 1, false, true)
			RN_Alias_Found.ForceRefTo(FoundRelic)
			if (!MCM.ShowSimpleNotificationVal)
				DBM_FoundRelicMessageComplete_SH.Show()						
			else
				DBM_FoundRelicNotification_SH.Show()
			endIf
			RN_Alias_Found.Clear()
			FoundRelic.Delete()
		endIf	
	endIf		
EndEvent		
	
;;-- Events ---------------------------------------	

Event _onRunMuseumUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	If MCM.DevDebugVal
		Trace("_onModUpdate() Event Received for: Museum")
	endIf
	
	Int Index = RN_Array._MuseumContainerArray_WP.length
	While Index 
		Index -= 1		
		Int Index2 = RN_Array._MuseumContainerArray_WP[Index].GetNumItems()
		while Index2
			Index2 -=1		
			Form ItemRelic = RN_Array._MuseumContainerArray_WP[Index].GetNthForm(index2)			
			if DBM_Section_HOH_LIB_Merged.HasForm(ItemRelic)
				if !DBM_Section_HOH_LIB_Found.HasForm(ItemRelic)
					DBM_Section_HOH_LIB_Found.AddForm(ItemRelic)
				endIf
			
			elseif DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged.HasForm(ItemRelic)
				if !DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Found.HasForm(ItemRelic)
					DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Found.AddForm(ItemRelic)
				endIf
			endIf	
		endWhile
	endWhile
	
	RN_Found_Done.Mod(1)
	
	If MCM.DevDebugVal
		Trace("_onModUpdate() Event Completed for: Museum")
	endIf
	
endEvent	

;;-- Events ---------------------------------------	

Event _onRunSafehouseUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	If MCM.DevDebugVal
		Trace("_onModUpdate() Event Received for: Safehouse")
	endIf
	
	Int Index = 0
	Int ListSize = RN_Array._SafehouseContainerList_WP.GetSize()
	While Index < ListSize
		ObjectReference _Container = RN_Array._SafehouseContainerList_WP.GetAt(Index) as ObjectReference
		Int Index2 = 0
		Int ContainerList = _Container.GetNumItems()
		while Index2 < ContainerList	
			Form ItemRelic = _Container.GetNthForm(Index2)			
			if RN_Safehouse_Items_Merged.HasForm(ItemRelic)
				if !RN_Safehouse_Items_Found.HasForm(ItemRelic)
					RN_Safehouse_Items_Found.AddForm(ItemRelic)
				endIf
			endIf
			Index2 += 1
		endWhile
		Index += 1
	endWhile
	
	RN_Found_Done.Mod(1)
	
	If MCM.DevDebugVal
		Trace("_onModUpdate() Event Completed for: Safehouse")
	endIf
	
endEvent
