scriptName RN_Main_Armory extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM Property MCM auto

RN_Utility_ArrayHolder property RN_Array auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Formlists to control item lists.
formlist property DBM_SectionArmoryAncientNordItems auto
formlist property DBM_SectionArmoryBladesItems auto
formlist property DBM_SectionArmoryDaedricItems auto
formlist property DBM_SectionArmoryDawnguardItems auto
formlist property DBM_SectionArmoryDragonItems auto
formlist property DBM_SectionArmoryDwarvenItems auto
formlist property DBM_SectionArmoryEbonyItems auto
formlist property DBM_SectionArmoryElvenItems auto
formlist property DBM_SectionArmoryExtraDisplaysItems auto
formlist property DBM_SectionArmoryFalmerItems auto
formlist property DBM_SectionArmoryForswornItems auto
formlist property DBM_SectionArmoryGlassItems auto
formlist property DBM_SectionArmoryGuardArmorDisplayItems auto
formlist property DBM_SectionArmoryIronItems auto
formlist property DBM_SectionArmoryNordicItems auto
formlist property DBM_SectionArmoryOrcishItems auto
formlist property DBM_SectionArmorySnowElfItems auto
formlist property DBM_SectionArmoryStalhrimItems auto
formlist property DBM_SectionArmorySteelItems auto
formlist property DBM_SectionArmoryThaneWeaponsItems auto
formlist property DBM_SectionArmoryThaneWeaponsItemsAlt auto
formlist property DBMTWR_AllItems auto

;;Formlists to control item lists - Merged Formlist
formlist property DBM_SectionArmory_Merged auto ;;Merged Item List.
formlist property DBM_SectionArmory_Found auto ;;Found Item List

;;Formlists to control item lists - MoreHUD
formlist property dbmNew auto
formlist property dbmMaster auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Display Refs --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;Display Ref List.
formlist property DBM_SectionArmoryAncientNord auto
formlist property DBM_SectionArmoryBlades auto
formlist property DBM_SectionArmoryDaedric auto
formlist property DBM_SectionArmoryDawnguard auto
formlist property DBM_SectionArmoryDragon auto
formlist property DBM_SectionArmoryDwarven auto
formlist property DBM_SectionArmoryEbony auto
formlist property DBM_SectionArmoryElven auto
formlist property DBM_SectionArmoryExtraDisplays auto
formlist property DBM_SectionArmoryFalmer auto
formlist property DBM_SectionArmoryForsworn auto
formlist property DBM_SectionArmoryGlass auto
formlist property DBM_SectionArmoryGuardArmorDisplay_Modified auto
formlist property DBM_SectionArmoryIron auto
formlist property DBM_SectionArmoryNordic auto
formlist property DBM_SectionArmoryOrcish auto
formlist property DBM_SectionArmorySnowElf auto
formlist property DBM_SectionArmoryStalhrim auto
formlist property DBM_SectionArmorySteel auto
formlist property DBM_SectionArmoryThaneWeapons auto

;Display Ref List - Formlists for Set Completion
formlist property DBM_SectionArmoryAncientNord_Enabled auto
formlist property DBM_SectionArmoryBlades_Enabled auto
formlist property DBM_SectionArmoryDaedric_Enabled auto
formlist property DBM_SectionArmoryDawnguard_Enabled auto
formlist property DBM_SectionArmoryDragon_Enabled auto
formlist property DBM_SectionArmoryDwarven_Enabled auto
formlist property DBM_SectionArmoryEbony_Enabled auto
formlist property DBM_SectionArmoryElven_Enabled auto
formlist property DBM_SectionArmoryExtraDisplays_Enabled auto
formlist property DBM_SectionArmoryFalmer_Enabled auto
formlist property DBM_SectionArmoryForsworn_Enabled auto
formlist property DBM_SectionArmoryGlass_Enabled auto
formlist property DBM_SectionArmoryGuardArmorDisplay_Enabled auto
formlist property DBM_SectionArmoryIron_Enabled auto
formlist property DBM_SectionArmoryNordic_Enabled auto
formlist property DBM_SectionArmoryOrcish_Enabled auto
formlist property DBM_SectionArmorySnowElf_Enabled auto
formlist property DBM_SectionArmoryStalhrim_Enabled auto
formlist property DBM_SectionArmorySteel_Enabled auto
formlist property DBM_SectionArmoryThaneWeapons_Enabled auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Collection Complete Messages.
Message property DBM_SectionArmoryAncientNord_Complete_Message auto
Message property DBM_SectionArmoryBlades_Complete_Message auto
Message property DBM_SectionArmoryDaedric_Complete_Message auto
Message property DBM_SectionArmoryDawnguard_Complete_Message auto
Message property DBM_SectionArmoryDragon_Complete_Message auto
Message property DBM_SectionArmoryDwarven_Complete_Message auto
Message property DBM_SectionArmoryEbony_Complete_Message auto
Message property DBM_SectionArmoryElven_Complete_Message auto
Message property DBM_SectionArmoryExtraDisplays_Complete_Message auto
Message property DBM_SectionArmoryFalmer_Complete_Message auto
Message property DBM_SectionArmoryForsworn_Complete_Message auto
Message property DBM_SectionArmoryGlass_Complete_Message auto
Message property DBM_SectionArmoryGuardArmorDisplay_Complete_Message auto
Message property DBM_SectionArmoryIron_Complete_Message auto
Message property DBM_SectionArmoryNordic_Complete_Message auto
Message property DBM_SectionArmoryOrcish_Complete_Message auto
Message property DBM_SectionArmorySnowElf_Complete_Message auto
Message property DBM_SectionArmoryStalhrim_Complete_Message auto
Message property DBM_SectionArmorySteel_Complete_Message auto
Message property DBM_SectionArmoryThaneWeapons_Complete_Message auto

;;Collection Complete Notifications.
Message property DBM_SectionArmoryAncientNord_Complete_Notification auto
Message property DBM_SectionArmoryBlades_Complete_Notification auto
Message property DBM_SectionArmoryDaedric_Complete_Notification auto
Message property DBM_SectionArmoryDawnguard_Complete_Notification auto
Message property DBM_SectionArmoryDragon_Complete_Notification auto
Message property DBM_SectionArmoryDwarven_Complete_Notification auto
Message property DBM_SectionArmoryEbony_Complete_Notification auto
Message property DBM_SectionArmoryElven_Complete_Notification auto
Message property DBM_SectionArmoryExtraDisplays_Complete_Notification auto
Message property DBM_SectionArmoryFalmer_Complete_Notification auto
Message property DBM_SectionArmoryForsworn_Complete_Notification auto
Message property DBM_SectionArmoryGlass_Complete_Notification auto
Message property DBM_SectionArmoryGuardArmorDisplay_Complete_Notification auto
Message property DBM_SectionArmoryIron_Complete_Notification auto
Message property DBM_SectionArmoryNordic_Complete_Notification auto
Message property DBM_SectionArmoryOrcish_Complete_Notification auto
Message property DBM_SectionArmorySnowElf_Complete_Notification auto
Message property DBM_SectionArmoryStalhrim_Complete_Notification auto
Message property DBM_SectionArmorySteel_Complete_Notification auto
Message property DBM_SectionArmoryThaneWeapons_Complete_Notification auto

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

;; Globals for set completion.
GlobalVariable Property DBM_GV_SectionArmoryAncientNord Auto
GlobalVariable Property DBM_GV_SectionArmoryBlades Auto
GlobalVariable Property DBM_GV_SectionArmoryDaedric Auto
GlobalVariable Property DBM_GV_SectionArmoryDawnguard Auto
GlobalVariable Property DBM_GV_SectionArmoryDragon Auto
GlobalVariable Property DBM_GV_SectionArmoryDwarven Auto
GlobalVariable Property DBM_GV_SectionArmoryEbony Auto
GlobalVariable Property DBM_GV_SectionArmoryElven Auto
GlobalVariable Property DBM_GV_SectionArmoryExtraDisplays Auto
GlobalVariable Property DBM_GV_SectionArmoryFalmer Auto
GlobalVariable Property DBM_GV_SectionArmoryForsworn Auto
GlobalVariable Property DBM_GV_SectionArmoryGlass Auto
GlobalVariable Property DBM_GV_SectionArmoryGuardArmorDisplay Auto
GlobalVariable Property DBM_GV_SectionArmoryIron Auto
GlobalVariable Property DBM_GV_SectionArmoryNordic Auto
GlobalVariable Property DBM_GV_SectionArmoryOrcish Auto
GlobalVariable Property DBM_GV_SectionArmorySnowElf Auto
GlobalVariable Property DBM_GV_SectionArmoryStalhrim Auto
GlobalVariable Property DBM_GV_SectionArmorySteel Auto
GlobalVariable Property DBM_GV_SectionArmoryThaneWeapons Auto
GlobalVariable Property iArmorySets Auto

;;Globals For Total Count.
GlobalVariable Property GV_ArmoryAncientNord Auto
GlobalVariable Property GV_ArmoryBlades Auto
GlobalVariable Property GV_ArmoryDaedric Auto
GlobalVariable Property GV_ArmoryDawnguard Auto
GlobalVariable Property GV_ArmoryDragon Auto
GlobalVariable Property GV_ArmoryDwarven Auto
GlobalVariable Property GV_ArmoryEbony Auto
GlobalVariable Property GV_ArmoryElven Auto
GlobalVariable Property GV_ArmoryExtraDisplays Auto
GlobalVariable Property GV_ArmoryFalmer Auto
GlobalVariable Property GV_ArmoryForsworn Auto
GlobalVariable Property GV_ArmoryGlass Auto
GlobalVariable Property GV_ArmoryGuardArmor Auto
GlobalVariable Property GV_ArmoryIron Auto
GlobalVariable Property GV_ArmoryNordic Auto
GlobalVariable Property GV_ArmoryOrcish Auto
GlobalVariable Property GV_ArmorySnowElf Auto
GlobalVariable Property GV_ArmoryStalhrim Auto
GlobalVariable Property GV_ArmorySteel Auto
GlobalVariable Property GV_ArmoryThane Auto

;;Globals For Current Count.
GlobalVariable Property GV_ArmoryAncientNord_Count Auto
GlobalVariable Property GV_ArmoryBlades_Count Auto
GlobalVariable Property GV_ArmoryDaedric_Count Auto
GlobalVariable Property GV_ArmoryDawnguard_Count Auto
GlobalVariable Property GV_ArmoryDragon_Count Auto
GlobalVariable Property GV_ArmoryDwarven_Count Auto
GlobalVariable Property GV_ArmoryEbony_Count Auto
GlobalVariable Property GV_ArmoryElven_Count Auto
GlobalVariable Property GV_ArmoryExtraDisplays_Count Auto
GlobalVariable Property GV_ArmoryFalmer_Count Auto
GlobalVariable Property GV_ArmoryForsworn_Count Auto
GlobalVariable Property GV_ArmoryGlass_Count Auto
GlobalVariable Property GV_ArmoryGuardArmor_Count Auto
GlobalVariable Property GV_ArmoryIron_Count Auto
GlobalVariable Property GV_ArmoryNordic_Count Auto
GlobalVariable Property GV_ArmoryOrcish_Count Auto
GlobalVariable Property GV_ArmorySnowElf_Count Auto
GlobalVariable Property GV_ArmoryStalhrim_Count Auto
GlobalVariable Property GV_ArmorySteel_Count Auto
GlobalVariable Property GV_ArmoryThane_Count Auto
	
;; Global for ModEvent Return.
GlobalVariable Property RN_Setup_Done Auto
GlobalVariable Property RN_Scan_Done Auto
GlobalVariable Property RN_Found_Done Auto

ObjectReference Property DBMDawnstarHelmDISP Auto
ObjectReference Property DBMEastmarchHelmDISP Auto
ObjectReference Property DBMFalkreathHelmDISP Auto
ObjectReference Property DBMHjaalmarchHelmDISP Auto
ObjectReference Property DBMMarkarthHelmDISP Auto
ObjectReference Property DBMRiftHelmDISP Auto
ObjectReference Property DBMSolitudeHelmDISP Auto
ObjectReference Property DBMWhiterunHelmDISP Auto
ObjectReference Property DBMWinterholdHelmDISP Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Events ---------------------------------------

Event OnInit()

	RegisterForModEvent("RunArmorySetup", "_onRunArmorySetup")	
	RegisterForModEvent("RunArmoryUpdate", "_onRunArmoryUpdate")	
	RegisterForModEvent("RunArmoryCheck", "_onRunArmoryCheck")
	
	
endEvent

;;-- Events ---------------------------------------

Event OnPlayerLoadGame()

	RegisterForModEvent("RunArmorySetup", "_onRunArmorySetup")	
	RegisterForModEvent("RunArmoryUpdate", "_onRunArmoryUpdate")
	RegisterForModEvent("RunArmoryCheck", "_onRunArmoryCheck")
endEvent

;;-- Events ---------------------------------------

Event _onRunArmorySetup(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (DBM_RN_SetupScript)
	
	;;Merge Formlist.
	_onConsolidateItems(DBM_SectionArmoryAncientNordItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryBladesItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryDaedricItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryDawnguardItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryDragonItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryDwarvenItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryEbonyItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryElvenItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryExtraDisplaysItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryFalmerItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryForswornItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryGlassItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryGuardArmorDisplayItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryIronItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryNordicItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryOrcishItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmorySnowElfItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryStalhrimItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmorySteelItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryThaneWeaponsItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBM_SectionArmoryThaneWeaponsItemsAlt, DBM_SectionArmory_Merged, dbmNew, dbmMaster)
	_onConsolidateItems(DBMTWR_AllItems, DBM_SectionArmory_Merged, dbmNew, dbmMaster)

	GV_ArmoryAncientNord.SetValue(DBM_SectionArmoryAncientNord.GetSize())
	GV_ArmoryBlades.SetValue(DBM_SectionArmoryBlades.GetSize())
	GV_ArmoryDaedric.SetValue(DBM_SectionArmoryDaedric.GetSize())
	GV_ArmoryDawnguard.SetValue(DBM_SectionArmoryDawnguard.GetSize())
	GV_ArmoryDragon.SetValue(DBM_SectionArmoryDragon.GetSize())
	GV_ArmoryDwarven.SetValue(DBM_SectionArmoryDwarven.GetSize())
	GV_ArmoryEbony.SetValue(DBM_SectionArmoryEbony.GetSize())
	GV_ArmoryElven.SetValue(DBM_SectionArmoryElven.GetSize())
	GV_ArmoryExtraDisplays.SetValue(DBM_SectionArmoryExtraDisplays.GetSize())
	GV_ArmoryFalmer.SetValue(DBM_SectionArmoryFalmer.GetSize())
	GV_ArmoryForsworn.SetValue(DBM_SectionArmoryForsworn.GetSize())
	GV_ArmoryGlass.SetValue(DBM_SectionArmoryGlass.GetSize())
	GV_ArmoryGuardArmor.SetValue(DBM_SectionArmoryGuardArmorDisplay_Modified.GetSize() + 9)
	GV_ArmoryIron.SetValue(DBM_SectionArmoryIron.GetSize())
	GV_ArmoryNordic.SetValue(DBM_SectionArmoryNordic.GetSize())
	GV_ArmoryOrcish.SetValue(DBM_SectionArmoryOrcish.GetSize())
	GV_ArmorySnowElf.SetValue(DBM_SectionArmorySnowElf.GetSize())
	GV_ArmoryStalhrim.SetValue(DBM_SectionArmoryStalhrim.GetSize())
	GV_ArmorySteel.SetValue(DBM_SectionArmorySteel.GetSize())
	GV_ArmoryThane.SetValue(DBM_SectionArmoryThaneWeapons.GetSize())
	
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(DBM_SectionArmory_Merged as Form)
	RN_Setup_Done.Mod(1)
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

Event _onRunArmoryUpdate(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	If MCM.DevDebugVal
		Trace("_onModUpdate() Event Received for: Armory")
	endIf
	
	Int Index = RN_Array._MuseumContainerArray_WP.length	
	While Index 
		Index -= 1		
		Int Index2 = RN_Array._MuseumContainerArray_WP[Index].GetNumItems()		
		while Index2
			Index2 -=1	
			Form ItemRelic = RN_Array._MuseumContainerArray_WP[Index].GetNthForm(index2)
			if DBM_SectionArmory_Merged.HasForm(ItemRelic) && !DBM_SectionArmory_Found.HasForm(ItemRelic)
				DBM_SectionArmory_Found.AddForm(ItemRelic)
			endIf	
		endWhile
	endWhile
	
	RN_Found_Done.Mod(1)

	If MCM.DevDebugVal
		Trace("_onModUpdate() Event Completed for: Armory")
	endIf
	
endEvent	
			
;;-- Events ---------------------------------------

Event _onRunArmoryCheck(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	If MCM.DevDebugVal
		Trace("_onModScan() Event Received for: Armory")
	endIf
	
	if (DBM_GV_SectionArmoryAncientNord.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryAncientNord, DBM_SectionArmoryAncientNord_Enabled, GV_ArmoryAncientNord_Count)
			if (CheckListSizes2(DBM_SectionArmoryAncientNord_Enabled, DBM_SectionArmoryAncientNord, DBM_GV_SectionArmoryAncientNord, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryAncientNord_Complete_Notification.Show()
				else
					DBM_SectionArmoryAncientNord_Complete_Message.Show()
				endif	
			endif
	endIf
		
;;-----------		
		
	if (DBM_GV_SectionArmoryBlades.GetValue()) == 0
		_onDisplayCheck(DBM_SectionArmoryBlades, DBM_SectionArmoryBlades_Enabled, GV_ArmoryBlades_Count)
			if (CheckListSizes2(DBM_SectionArmoryBlades_Enabled, DBM_SectionArmoryBlades, DBM_GV_SectionArmoryBlades, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryBlades_Complete_Notification.Show()
				else
					DBM_SectionArmoryBlades_Complete_Message.Show()
				endif
			endif
	endIf
		
;;-----------			
	
	if (DBM_GV_SectionArmoryDaedric.GetValue()) == 0
		_onDisplayCheck(DBM_SectionArmoryDaedric, DBM_SectionArmoryDaedric_Enabled, GV_ArmoryDaedric_Count)
			if (CheckListSizes2(DBM_SectionArmoryDaedric_Enabled, DBM_SectionArmoryDaedric, DBM_GV_SectionArmoryDaedric, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryDaedric_Complete_Notification.Show()
				else
					DBM_SectionArmoryDaedric_Complete_Message.Show()
				endif
			endif
	endIf
		
;;-----------		
			
	if (DBM_GV_SectionArmoryDawnguard.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryDawnguard, DBM_SectionArmoryDawnguard_Enabled, GV_ArmoryDawnguard_Count)
			if (CheckListSizes2(DBM_SectionArmoryDawnguard_Enabled, DBM_SectionArmoryDawnguard, DBM_GV_SectionArmoryDawnguard, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryDawnguard_Complete_Notification.Show()
				else
					DBM_SectionArmoryDawnguard_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		

	if (DBM_GV_SectionArmoryDragon.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryDragon, DBM_SectionArmoryDragon_Enabled, GV_ArmoryDragon_Count)
			if (CheckListSizes2(DBM_SectionArmoryDragon_Enabled, DBM_SectionArmoryDragon, DBM_GV_SectionArmoryDragon, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryDragon_Complete_Notification.Show()
				else
					DBM_SectionArmoryDragon_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		

	if (DBM_GV_SectionArmoryDwarven.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryDwarven, DBM_SectionArmoryDwarven_Enabled, GV_ArmoryDwarven_Count)
			if (CheckListSizes2(DBM_SectionArmoryDwarven_Enabled, DBM_SectionArmoryDwarven, DBM_GV_SectionArmoryDwarven, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryDwarven_Complete_Notification.Show()
				else
					DBM_SectionArmoryDwarven_Complete_Message.Show()
				endif
			endif
	endIf
	
;;-----------		

	if (DBM_GV_SectionArmoryEbony.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryEbony, DBM_SectionArmoryEbony_Enabled, GV_ArmoryEbony_Count)
			if (CheckListSizes2(DBM_SectionArmoryEbony_Enabled, DBM_SectionArmoryEbony, DBM_GV_SectionArmoryEbony, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryEbony_Complete_Notification.Show()
				else
					DBM_SectionArmoryEbony_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		

	if (DBM_GV_SectionArmoryElven.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryElven, DBM_SectionArmoryElven_Enabled, GV_ArmoryElven_Count)
			if (CheckListSizes2(DBM_SectionArmoryElven_Enabled, DBM_SectionArmoryElven, DBM_GV_SectionArmoryElven, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryElven_Complete_Notification.Show()
				else
					DBM_SectionArmoryElven_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		
		
	if (DBM_GV_SectionArmoryExtraDisplays.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryExtraDisplays, DBM_SectionArmoryExtraDisplays_Enabled, GV_ArmoryExtraDisplays_Count)
			if (CheckListSizes2(DBM_SectionArmoryExtraDisplays_Enabled, DBM_SectionArmoryExtraDisplays, DBM_GV_SectionArmoryExtraDisplays, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryExtraDisplays_Complete_Notification.Show()
				else
					DBM_SectionArmoryExtraDisplays_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		

	if (DBM_GV_SectionArmoryFalmer.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryFalmer, DBM_SectionArmoryFalmer_Enabled, GV_ArmoryFalmer_Count)
			if (CheckListSizes2(DBM_SectionArmoryFalmer_Enabled, DBM_SectionArmoryFalmer, DBM_GV_SectionArmoryFalmer, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryFalmer_Complete_Notification.Show()
				else
					DBM_SectionArmoryFalmer_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		

	if (DBM_GV_SectionArmoryForsworn.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryForsworn, DBM_SectionArmoryForsworn_Enabled, GV_ArmoryForsworn_Count)
			if (CheckListSizes2(DBM_SectionArmoryForsworn_Enabled, DBM_SectionArmoryForsworn, DBM_GV_SectionArmoryForsworn, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryForsworn_Complete_Notification.Show()
				else
					DBM_SectionArmoryForsworn_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------	

	if (DBM_GV_SectionArmoryGlass.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryGlass, DBM_SectionArmoryGlass_Enabled, GV_ArmoryGlass_Count)
			if (CheckListSizes2(DBM_SectionArmoryGlass_Enabled, DBM_SectionArmoryGlass, DBM_GV_SectionArmoryGlass, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryGlass_Complete_Notification.Show()
				else
					DBM_SectionArmoryGlass_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------	

	if (DBM_GV_SectionArmoryGuardArmorDisplay.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryGuardArmorDisplay_Modified, DBM_SectionArmoryGuardArmorDisplay_Enabled, GV_ArmoryGuardArmor_Count)	
		
		if !DBM_SectionArmoryGuardArmorDisplay_Enabled.HasForm(DBMDawnstarHelmDISP) && !DBMDawnstarHelmDISP.IsDisabled()
			DBM_SectionArmoryGuardArmorDisplay_Enabled.AddForm(DBMDawnstarHelmDISP)
			GV_ArmoryGuardArmor_Count.Mod(1)
		endIf
		
		if !DBM_SectionArmoryGuardArmorDisplay_Enabled.HasForm(DBMEastmarchHelmDISP) && !DBMEastmarchHelmDISP.IsDisabled()	
			DBM_SectionArmoryGuardArmorDisplay_Enabled.AddForm(DBMEastmarchHelmDISP)
			GV_ArmoryGuardArmor_Count.Mod(1)
		endIf
		
		if !DBM_SectionArmoryGuardArmorDisplay_Enabled.HasForm(DBMFalkreathHelmDISP) && !DBMFalkreathHelmDISP.IsDisabled()	
			DBM_SectionArmoryGuardArmorDisplay_Enabled.AddForm(DBMFalkreathHelmDISP)
			GV_ArmoryGuardArmor_Count.Mod(1)
		endIf
		
		if !DBM_SectionArmoryGuardArmorDisplay_Enabled.HasForm(DBMHjaalmarchHelmDISP) && !DBMHjaalmarchHelmDISP.IsDisabled()	
			DBM_SectionArmoryGuardArmorDisplay_Enabled.AddForm(DBMHjaalmarchHelmDISP)
			GV_ArmoryGuardArmor_Count.Mod(1)
		endIf
		
		if !DBM_SectionArmoryGuardArmorDisplay_Enabled.HasForm(DBMMarkarthHelmDISP) && !DBMMarkarthHelmDISP.IsDisabled()	
			DBM_SectionArmoryGuardArmorDisplay_Enabled.AddForm(DBMMarkarthHelmDISP)
			GV_ArmoryGuardArmor_Count.Mod(1)
		endIf
		
		if !DBM_SectionArmoryGuardArmorDisplay_Enabled.HasForm(DBMRiftHelmDISP) && !DBMRiftHelmDISP.IsDisabled()	
			DBM_SectionArmoryGuardArmorDisplay_Enabled.AddForm(DBMRiftHelmDISP)
			GV_ArmoryGuardArmor_Count.Mod(1)
		endIf
		
		if !DBM_SectionArmoryGuardArmorDisplay_Enabled.HasForm(DBMSolitudeHelmDISP) && !DBMSolitudeHelmDISP.IsDisabled()	
			DBM_SectionArmoryGuardArmorDisplay_Enabled.AddForm(DBMSolitudeHelmDISP)
			GV_ArmoryGuardArmor_Count.Mod(1)
		endIf
		
		if !DBM_SectionArmoryGuardArmorDisplay_Enabled.HasForm(DBMWhiterunHelmDISP) && !DBMWhiterunHelmDISP.IsDisabled()	
			DBM_SectionArmoryGuardArmorDisplay_Enabled.AddForm(DBMWhiterunHelmDISP)
			GV_ArmoryGuardArmor_Count.Mod(1)
		endIf
		
		if !DBM_SectionArmoryGuardArmorDisplay_Enabled.HasForm(DBMWinterholdHelmDISP) && !DBMWinterholdHelmDISP.IsDisabled()	
			DBM_SectionArmoryGuardArmorDisplay_Enabled.AddForm(DBMWinterholdHelmDISP)
			GV_ArmoryGuardArmor_Count.Mod(1)
		endIf		
		
		if (CheckListSizes2(DBM_SectionArmoryGuardArmorDisplay_Enabled, DBM_SectionArmoryGuardArmorDisplay_Modified, DBM_GV_SectionArmoryGuardArmorDisplay, iArmorySets) && (MCM.ShowSetCompleteVal))	
			if (MCM.ShowSimpleNotificationVal)
				DBM_SectionArmoryGuardArmorDisplay_Complete_Notification.Show()
			else
				DBM_SectionArmoryGuardArmorDisplay_Complete_Message.Show()
			endif
		endif
	endIf

;;-----------		
		
	if (DBM_GV_SectionArmoryIron.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryIron, DBM_SectionArmoryIron_Enabled, GV_ArmoryIron_Count)
			if (CheckListSizes2(DBM_SectionArmoryIron_Enabled, DBM_SectionArmoryIron, DBM_GV_SectionArmoryIron, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryIron_Complete_Notification.Show()
				else
					DBM_SectionArmoryIron_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		

	if (DBM_GV_SectionArmoryNordic.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryNordic, DBM_SectionArmoryNordic_Enabled, GV_ArmoryNordic_Count)
			if (CheckListSizes2(DBM_SectionArmoryNordic_Enabled, DBM_SectionArmoryNordic, DBM_GV_SectionArmoryNordic, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryNordic_Complete_Notification.Show()
				else
					DBM_SectionArmoryNordic_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------			

	if (DBM_GV_SectionArmoryOrcish.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryOrcish, DBM_SectionArmoryOrcish_Enabled, GV_ArmoryOrcish_Count)
			if (CheckListSizes2(DBM_SectionArmoryOrcish_Enabled, DBM_SectionArmoryOrcish, DBM_GV_SectionArmoryOrcish, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryOrcish_Complete_Notification.Show()
				else
					DBM_SectionArmoryOrcish_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		

	if (DBM_GV_SectionArmorySnowElf.GetValue()) == 0
		_onDisplayCheck(DBM_SectionArmorySnowElf, DBM_SectionArmorySnowElf_Enabled, GV_ArmorySnowElf_Count)
			if (CheckListSizes2(DBM_SectionArmorySnowElf_Enabled, DBM_SectionArmorySnowElf, DBM_GV_SectionArmorySnowElf, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmorySnowElf_Complete_Notification.Show()
				else
					DBM_SectionArmorySnowElf_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		

	if (DBM_GV_SectionArmoryStalhrim.GetValue()) == 0
		_onDisplayCheck(DBM_SectionArmoryStalhrim, DBM_SectionArmoryStalhrim_Enabled, GV_ArmoryStalhrim_Count)	
			if (CheckListSizes2(DBM_SectionArmoryStalhrim_Enabled, DBM_SectionArmoryStalhrim, DBM_GV_SectionArmoryStalhrim, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryStalhrim_Complete_Notification.Show()
				else
					DBM_SectionArmoryStalhrim_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		

	if (DBM_GV_SectionArmorySteel.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmorySteel, DBM_SectionArmorySteel_Enabled, GV_ArmorySteel_Count)
			if (CheckListSizes2(DBM_SectionArmorySteel_Enabled, DBM_SectionArmorySteel, DBM_GV_SectionArmorySteel, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmorySteel_Complete_Notification.Show()
				else
					DBM_SectionArmorySteel_Complete_Message.Show()
				endif
			endif
	endIf

;;-----------		

	if (DBM_GV_SectionArmoryThaneWeapons.GetValue()) == 0	
		_onDisplayCheck(DBM_SectionArmoryThaneWeapons, DBM_SectionArmoryThaneWeapons_Enabled, GV_ArmoryThane_Count)
			if (CheckListSizes2(DBM_SectionArmoryThaneWeapons_Enabled, DBM_SectionArmoryThaneWeapons, DBM_GV_SectionArmoryThaneWeapons, iArmorySets) && (MCM.ShowSetCompleteVal))
				if (MCM.ShowSimpleNotificationVal)
					DBM_SectionArmoryThaneWeapons_Complete_Notification.Show()
				else
					DBM_SectionArmoryThaneWeapons_Complete_Message.Show()
				endif
			endif
	endIf
	
	RN_Scan_Done.Mod(1)
	
	If MCM.DevDebugVal
		Trace("_onModScan() Event Completed for: Armory")
	endIf
	
endEvent		
