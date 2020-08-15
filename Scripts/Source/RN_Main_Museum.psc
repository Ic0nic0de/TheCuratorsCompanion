scriptName RN_Main_Museum extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM Property MCM Auto

RN_Utility_ArrayHolder property RN_Array auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


;;Formlists to control item lists - Merged Formlist 1. (HOH, Lib)
formlist property DBM_Section_HOH_LIB_Merged auto ;;Merged Item List.
formlist property DBM_Section_HOH_LIB_Found auto ;;Found Item List.

;;Formlists to control item lists - Merged Formlist 2. (DAE, HOLE, HOO, NS, GH, HOS)
formlist property DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged auto ;;Merged Item List.
formlist property DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Found auto ;;Found Item List.

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Display Refs --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;Display Ref List - Dragonborn Hall
formlist property DBM_SectionDBHallAchievements auto
formlist property DBM_SectionDBHallAchievements_Enabled auto

;Display Ref List - Hall Of Heroes
formlist property DBM_SectionHOH_Merged auto
formlist property DBM_SectionHOH_Merged_Enabled auto

;Display Ref List - Library
formlist property DBM_SectionLibrary_Merged auto
formlist property DBM_SectionLibrary_Merged_Enabled auto

;Display Ref List - Daedric Gallery
formlist property DBM_SectionDaedricGallery auto
formlist property DBM_SectionDaedricGallery_Enabled auto

;Display Ref List - Hall Of Lost Empires
formlist property DBM_SectionHOLE_Merged auto
formlist property DBM_SectionHOLE_Enabled auto

;Display Ref List - Hall Of Oddities
formlist property DBM_SectionHOOMainFloor auto
formlist property DBM_SectionHOOMainFloor_Enabled auto

;Display Ref List - Natural Science
formlist property DBM_SectionNS_Merged auto
formlist property DBM_SectionNS_Merged_Enabled auto

;Display Ref List - Hall Of Secrets
formlist property DBM_SectionHOSDisplays auto
formlist property DBM_SectionHOSDisplays_Enabled auto

;Display Ref List - Guildhouse
formlist property DBM_SectionGuildhouse auto
formlist property DBM_SectionGuildhouse_Enabled auto

;Display Ref List - Storeroom
formlist property DBM_SectionStoreRoomReserveVintages auto
formlist property DBM_SectionStoreRoomReserveVintages_Enabled auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Section Complete Notifications.
Message property DBM_SectionDBH_Completed_Notification auto
Message property DBM_SectionHOH_Completed_Notification auto
Message property DBM_SectionLibrary_Completed_Notification auto
Message property DBM_SectionDaedricGallery_Completed_Notification auto
Message property DBM_SectionHOLE_Completed_Notification auto
Message property DBM_SectionHOO_Completed_Notification auto
Message property DBM_SectionNS_Completed_Notification auto
Message property DBM_SectionHOS_Completed_Notification auto
Message property DBM_SectionGuildhouse_Completed_Notification auto
Message property DBM_SectionStoreroom_Completed_Notification auto

;;Section Complete Messages.
Message property DBM_SectionDBH_Completed_Message auto
Message property DBM_SectionHOH_Completed_Message auto
Message property DBM_SectionLibrary_Completed_Message auto
Message property DBM_SectionDaedricGallery_Completed_Message auto
Message property DBM_SectionHOLE_Completed_Message auto
Message property DBM_SectionHOO_Completed_Message auto
Message property DBM_SectionNS_Completed_Message auto
Message property DBM_SectionHOS_Completed_Message auto
Message property DBM_SectionGuildhouse_Completed_Message auto
Message property DBM_SectionStoreroom_Completed_Message auto

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

;; Globals For Set Completion.
GlobalVariable Property DBM_GV_SectionDragonbornHall Auto
GlobalVariable Property DBM_GV_SectionHallOfHeroes Auto
GlobalVariable Property DBM_GV_SectionLibrary Auto
GlobalVariable Property DBM_GV_SectionDaedricGallery Auto
GlobalVariable Property DBM_GV_SectionHOLE Auto
GlobalVariable Property DBM_GV_SectionHallOfOddities Auto
GlobalVariable Property DBM_GV_SectionNaturalScience Auto
GlobalVariable Property DBM_GV_SectionHallOfSecrets Auto
GlobalVariable Property DBM_GV_SectionGuildhouse Auto
GlobalVariable Property DBM_GV_SectionStoreroom Auto
GlobalVariable Property iMuseumSets Auto

;;Globals For Current Count.
GlobalVariable Property GV_SectionDragonbornHall_Count Auto
GlobalVariable Property GV_SectionHallOfHeroes_Count Auto
GlobalVariable Property GV_SectionLibrary_Count Auto
GlobalVariable Property GV_SectionDaedricGallery_Count Auto
GlobalVariable Property GV_SectionHOLE_Count Auto
GlobalVariable Property GV_SectionHallOfOddities_Count Auto
GlobalVariable Property GV_SectionNaturalScience_Count Auto
GlobalVariable Property GV_SectionHallOfSecrets_Count Auto
GlobalVariable Property GV_SectionGuildhouse_Count Auto
GlobalVariable Property GV_SectionStoreroom_Count Auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Scan_Done Auto
GlobalVariable Property RN_Found_Done Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Events ---------------------------------------

Event OnInit()
	RegisterForModEvent("RunMuseumUpdate", "_onRunMuseumUpdate")
	RegisterForModEvent("RunMuseumCheck", "_onRunMuseumCheck")
	AddInventoryEventFilters()
endEvent

;;-- Events ---------------------------------------

Event OnPlayerLoadGame()
	
	RegisterForModEvent("RunMuseumUpdate", "_onRunMuseumUpdate")
	RegisterForModEvent("RunMuseumCheck", "_onRunMuseumCheck")
	AddInventoryEventFilters()
endEvent
	
;;-- Events ---------------------------------------

Event AddInventoryEventFilters()

	RemoveAllInventoryEventFilters()
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
	
Event _onRunMuseumCheck(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (DBM_RN_ScanHandler)	

	If MCM.DevDebugVal
		Trace("_onModScan() Event Received for: Museum")
	endIf
	
;;----------
	
	if (DBM_GV_SectionDragonbornHall.GetValue()) == 0
		_onDisplayCheck(DBM_SectionDBHallAchievements, DBM_SectionDBHallAchievements_Enabled, GV_SectionDragonbornHall_Count)
			if (CheckListSizes2(DBM_SectionDBHallAchievements_Enabled, DBM_SectionDBHallAchievements, DBM_GV_SectionDragonbornHall, iMuseumSets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionDBH_Completed_Notification.Show()
				else
					DBM_SectionDBH_Completed_Message.Show()
				endif
			endif
	endIf
	
;;----------
	
	if (DBM_GV_SectionHallOfHeroes.GetValue()) == 0
		_onDisplayCheck(DBM_SectionHOH_Merged, DBM_SectionHOH_Merged_Enabled, GV_SectionHallOfHeroes_Count)
			if (CheckListSizes2(DBM_SectionHOH_Merged_Enabled, DBM_SectionHOH_Merged, DBM_GV_SectionHallOfHeroes, iMuseumSets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionHOH_Completed_Notification.Show()
				else
					DBM_SectionHOH_Completed_Message.Show()
				endif
			endif
	endIf
	
;;-----------
	
	if (DBM_GV_SectionLibrary.GetValue()) == 0
		_onDisplayCheck(DBM_SectionLibrary_Merged, DBM_SectionLibrary_Merged_Enabled, GV_SectionLibrary_Count)
			if (CheckListSizes2(DBM_SectionLibrary_Merged_Enabled, DBM_SectionLibrary_Merged, DBM_GV_SectionLibrary, iMuseumSets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionLibrary_Completed_Notification.Show()
				else
					DBM_SectionLibrary_Completed_Message.Show()
				endif
			endif
	endIf
	
;;-----------
	
	if (DBM_GV_SectionDaedricGallery.GetValue()) == 0
		_onDisplayCheck(DBM_SectionDaedricGallery, DBM_SectionDaedricGallery_Enabled, GV_SectionDaedricGallery_Count)
			if (CheckListSizes2(DBM_SectionDaedricGallery_Enabled, DBM_SectionDaedricGallery, DBM_GV_SectionDaedricGallery, iMuseumSets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionDaedricGallery_Completed_Notification.Show()
				else
					DBM_SectionDaedricGallery_Completed_Message.Show()
				endif
			endif
	endIf

;;-----------
	
	if (DBM_GV_SectionHOLE.GetValue()) == 0
		_onDisplayCheck(DBM_SectionHOLE_Merged, DBM_SectionHOLE_Enabled, GV_SectionHOLE_Count)
			if (CheckListSizes2(DBM_SectionHOLE_Enabled, DBM_SectionHOLE_Merged, DBM_GV_SectionHOLE, iMuseumSets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionHOLE_Completed_Notification.Show()
				else
					DBM_SectionHOLE_Completed_Message.Show()
				endif
			endif
	endIf
	
;;-----------
	
	if (DBM_GV_SectionHallOfOddities.GetValue()) == 0
		_onDisplayCheck(DBM_SectionHOOMainFloor, DBM_SectionHOOMainFloor_Enabled, GV_SectionHallOfOddities_Count)
			if (CheckListSizes2(DBM_SectionHOOMainFloor_Enabled, DBM_SectionHOOMainFloor, DBM_GV_SectionHallOfOddities, iMuseumSets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionHOO_Completed_Notification.Show()
				else
					DBM_SectionHOO_Completed_Message.Show()
				endif
			endif
	endIf
	
;;-----------
		
	if (DBM_GV_SectionNaturalScience.GetValue()) == 0
		_onDisplayCheck(DBM_SectionNS_Merged, DBM_SectionNS_Merged_Enabled, GV_SectionNaturalScience_Count)
			if (CheckListSizes2(DBM_SectionNS_Merged_Enabled, DBM_SectionNS_Merged, DBM_GV_SectionNaturalScience, iMuseumSets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionNS_Completed_Notification.Show()
				else
					DBM_SectionNS_Completed_Message.Show()
				endif
			endif
	endIf

;;-----------

	if (DBM_GV_SectionHallOfSecrets.GetValue()) == 0
		_onDisplayCheck(DBM_SectionHOSDisplays, DBM_SectionHOSDisplays_Enabled, GV_SectionHallOfSecrets_Count)
			if (CheckListSizes2(DBM_SectionHOSDisplays_Enabled, DBM_SectionHOSDisplays, DBM_GV_SectionHallOfSecrets, iMuseumSets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionHOS_Completed_Notification.Show()
				else
					DBM_SectionHOS_Completed_Message.Show()
				endif
			endif
	endIf
	
;;-----------

	if (DBM_GV_SectionGuildhouse.GetValue()) == 0
		_onDisplayCheck(DBM_SectionGuildhouse, DBM_SectionGuildhouse_Enabled, GV_SectionGuildhouse_Count)
			if (CheckListSizes2(DBM_SectionGuildhouse_Enabled, DBM_SectionGuildhouse, DBM_GV_SectionGuildhouse, iMuseumSets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionGuildhouse_Completed_Notification.Show()
				else
					DBM_SectionGuildhouse_Completed_Message.Show()
				endif
			endif
	endIf

;;-----------

	if (DBM_GV_SectionStoreroom.GetValue()) == 0
		_onDisplayCheck(DBM_SectionStoreRoomReserveVintages, DBM_SectionStoreRoomReserveVintages_Enabled, GV_SectionStoreroom_Count)
			if (CheckListSizes2(DBM_SectionStoreRoomReserveVintages_Enabled, DBM_SectionStoreRoomReserveVintages, DBM_GV_SectionStoreroom, iMuseumSets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionStoreroom_Completed_Notification.Show()
				else
					DBM_SectionStoreroom_Completed_Message.Show()
				endif
			endif
	endIf
	
	RN_Scan_Done.Mod(1)
	
	If MCM.DevDebugVal
		Trace("_onModScan() Event Completed for: Museum")
	endIf
	
endEvent
