scriptName RN_SupportedMod_ImmWeap extends ReferenceAlias

Import Debug 

Import RN_Utility_Global

RN_Utility_MCM Property MCM Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Formlists to control item lists.
formlist property DBM_SectionArmoryImmersiveWeaponsAncientNordicItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsBladesItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsDaedricItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsDawnguardItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsDragonItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsDwarvenItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsEbonyItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsElvenItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsFalmerItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsGlassItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsIronItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsOrcishItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsSteelItems auto
formlist property DBM_SectionArmoryImmersiveWeaponsWolfItems auto
formlist property DBM_SectionDaedricGalleryImmersiveWeaponsItems auto
formlist property DBM_SectionHOHImmersiveWeaponsItems auto

;;Formlists to control item lists - Merged Formlist
formlist property Supported_Items_Merged auto ;;Merged Item List

;;Formlists to control item lists - MoreHUD
formlist property dbmNew auto
formlist property dbmMaster auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Display Refs --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;Display Ref List.
formlist property DBM_SectionArmoryImmersiveWeaponsAncientNordic auto
formlist property DBM_SectionArmoryImmersiveWeaponsBlades auto
formlist property DBM_SectionArmoryImmersiveWeaponsDaedric auto
formlist property DBM_SectionArmoryImmersiveWeaponsDawnguard auto
formlist property DBM_SectionArmoryImmersiveWeaponsDragon auto
formlist property DBM_SectionArmoryImmersiveWeaponsDwarven auto
formlist property DBM_SectionArmoryImmersiveWeaponsEbony auto
formlist property DBM_SectionArmoryImmersiveWeaponsElven auto
formlist property DBM_SectionArmoryImmersiveWeaponsFalmer auto
formlist property DBM_SectionArmoryImmersiveWeaponsGlass auto
formlist property DBM_SectionArmoryImmersiveWeaponsIron auto
formlist property DBM_SectionArmoryImmersiveWeaponsOrcish auto
formlist property DBM_SectionArmoryImmersiveWeaponsSteel auto
formlist property DBM_SectionArmoryImmersiveWeaponsWolf auto
formlist property DBM_SectionDaedricGalleryImmersiveWeapons auto
formlist property DBM_SectionHOHImmersiveWeapons auto

;Display Ref List - Formlists for Set Completion
formlist property DBM_SectionArmoryImmersiveWeaponsAncientNordic_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsBlades_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsDaedric_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsDawnguard_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsDragon_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsDwarven_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsEbony_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsElven_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsFalmer_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsGlass_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsIron_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsOrcish_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsSteel_Enabled auto
formlist property DBM_SectionArmoryImmersiveWeaponsWolf_Enabled auto
formlist property DBM_SectionDaedricGalleryImmersiveWeapons_Enabled auto
formlist property DBM_SectionHOHImmersiveWeapons_Enabled auto

;;Display Ref Lift - Merged Formlists
formlist property DBM_SectionArmory_IW_Displays_Merged auto;; Total amount of available displays from merged Formlist.
formlist property DBM_SectionArmory_IW_Displays_Enabled auto ;; Total amount of enabled Displays from merged formlist.

formlist property DBM_SectionDaedricGallery_Merged auto
formlist property DBM_SectionArmory_Displays_Merged auto
formlist property DBM_SectionHOH_Merged auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Collection Complete Notifications.
Message property DBM_SectionArmoryImmersiveWeaponsAncientNordic_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsBlades_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsDaedric_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsDawnguard_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsDragon_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsDwarven_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsEbony_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsElven_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsFalmer_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsGlass_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsIron_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsOrcish_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsSteel_Message auto
Message property DBM_SectionArmoryImmersiveWeaponsWolf_Message auto
Message property DBM_SectionDaedricGalleryImmersiveWeapons_Message auto
Message property DBM_SectionHOHImmersiveWeapons_Message auto

;;Set Complete Notifications.
Message property DBM_SectionArmoryImmersiveWeaponsAncientNordic_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsBlades_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsDaedric_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsDawnguard_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsDragon_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsDwarven_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsEbony_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsElven_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsFalmer_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsGlass_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsIron_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsOrcish_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsSteel_Notification auto
Message property DBM_SectionArmoryImmersiveWeaponsWolf_Notification auto
Message property DBM_SectionDaedricGalleryImmersiveWeapons_Notification auto
Message property DBM_SectionHOHImmersiveWeapons_Notification auto

;;Collection Complete Notifications.
Message Property DBM_IW_Complete_Message auto
Message property DBM_IW_Complete_Notification auto

;; Globals for set completion.
GlobalVariable Property DBM_GV_DaedricGalleryImmersiveWeapons Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsAncientNordic Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsBlades Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsDaedric Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsDawnguard Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsDragon Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsDwarven Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsEbony Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsElven Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsFalmer Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsGlass Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsIron Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsOrcish Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsSteel Auto
GlobalVariable Property DBM_GV_ImmersiveWeaponsWolf Auto
GlobalVariable Property DBM_GV_SectionHOHImmersiveWeapons Auto

;;Globals For Current Count.
GlobalVariable Property GV_DaedricGalleryImmersiveWeapons_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsAncientNordic_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsBlades_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsDaedric_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsDawnguard_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsDragon_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsDwarven_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsEbony_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsElven_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsFalmer_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsGlass_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsIron_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsOrcish_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsSteel_Count Auto
GlobalVariable Property GV_ImmersiveWeaponsWolf_Count Auto
GlobalVariable Property GV_SectionHOHImmersiveWeapons_Count Auto

;;Globals For Total Count.
GlobalVariable Property GV_DaedricGalleryImmersiveWeapons Auto
GlobalVariable Property GV_ImmersiveWeaponsAncientNordic Auto
GlobalVariable Property GV_ImmersiveWeaponsBlades Auto
GlobalVariable Property GV_ImmersiveWeaponsDaedric Auto
GlobalVariable Property GV_ImmersiveWeaponsDawnguard Auto
GlobalVariable Property GV_ImmersiveWeaponsDragon Auto
GlobalVariable Property GV_ImmersiveWeaponsDwarven Auto
GlobalVariable Property GV_ImmersiveWeaponsEbony Auto
GlobalVariable Property GV_ImmersiveWeaponsElven Auto
GlobalVariable Property GV_ImmersiveWeaponsFalmer Auto
GlobalVariable Property GV_ImmersiveWeaponsGlass Auto
GlobalVariable Property GV_ImmersiveWeaponsIron Auto
GlobalVariable Property GV_ImmersiveWeaponsOrcish Auto
GlobalVariable Property GV_ImmersiveWeaponsSteel Auto
GlobalVariable Property GV_ImmersiveWeaponsWolf Auto
GlobalVariable Property GV_SectionHOHImmersiveWeapons Auto

;; Globals for set completion.
GlobalVariable Property DBM_MC_GV_IW Auto
GlobalVariable Property GV_IW_Count Auto
GlobalVariable Property GV_IW Auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Setup_Done Auto
globalvariable property RN_Setup_Registered auto

GlobalVariable Property RN_Scan_Done Auto
globalvariable property RN_Scan_Registered auto

globalvariable property RN_SupportedModCount auto
Bool _setupDone

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event onInit()
	
	RegisterForModEvent("TCCSetup_Patches", "_onSetup")
	RegisterForModEvent("TCCScan", "_onScan")
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()
	
	RegisterForModEvent("TCCSetup_Patches", "_onSetup")
	RegisterForModEvent("TCCScan", "_onScan")	
endEvent	

;;-- Events ---------------------------------------	

Event _onSetup(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (RN_Utility_Script)

	_RunSetup()
endEvent

;;-- Events ---------------------------------------	

Event _RunSetup()
	
	RN_Setup_Registered.Mod(1)
	
	if !_setupDone
	
		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Received for: Immersive Weapons")
		endIf
		
		;;Merge Formlist.	
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsAncientNordicItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsBladesItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsDaedricItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsDawnguardItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsDragonItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsDwarvenItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsEbonyItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsElvenItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsFalmerItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsGlassItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsIronItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsOrcishItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsSteelItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryImmersiveWeaponsWolfItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionDaedricGalleryImmersiveWeaponsItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionHOHImmersiveWeaponsItems, Supported_Items_Merged, dbmNew, dbmMaster)
		
		;;Generates a total available display count (used for Section / Set Completion along with the original Display Formlists)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsAncientNordic, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsBlades, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsDaedric, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsDawnguard, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsDragon, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsDwarven, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsEbony, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsElven, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsFalmer, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsGlass, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsIron, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsOrcish, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsSteel, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsWolf, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionDaedricGalleryImmersiveWeapons, DBM_SectionArmory_IW_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionHOHImmersiveWeapons, DBM_SectionArmory_IW_Displays_Merged)
		
		;;Consolidate into room lists
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsAncientNordic, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsBlades, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsDaedric, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsDawnguard, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsDragon, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsDwarven, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsEbony, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsElven, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsFalmer, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsGlass, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsIron, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsOrcish, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsSteel, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryImmersiveWeaponsWolf, DBM_SectionArmory_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionDaedricGalleryImmersiveWeapons, DBM_SectionDaedricGallery_Merged)
		_onConsolidateDisplays(DBM_SectionHOHImmersiveWeapons, DBM_SectionHOH_Merged)


		GV_DaedricGalleryImmersiveWeapons.SetValue(DBM_SectionDaedricGalleryImmersiveWeapons.GetSize())
		GV_ImmersiveWeaponsAncientNordic.SetValue(DBM_SectionArmoryImmersiveWeaponsAncientNordic.GetSize())
		GV_ImmersiveWeaponsBlades.SetValue(DBM_SectionArmoryImmersiveWeaponsBlades.GetSize())
		GV_ImmersiveWeaponsDaedric.SetValue(DBM_SectionArmoryImmersiveWeaponsDaedric.GetSize())
		GV_ImmersiveWeaponsDawnguard.SetValue(DBM_SectionArmoryImmersiveWeaponsDawnguard.GetSize())
		GV_ImmersiveWeaponsDragon.SetValue(DBM_SectionArmoryImmersiveWeaponsDragon.GetSize())
		GV_ImmersiveWeaponsDwarven.SetValue(DBM_SectionArmoryImmersiveWeaponsDwarven.GetSize())
		GV_ImmersiveWeaponsEbony.SetValue(DBM_SectionArmoryImmersiveWeaponsEbony.GetSize())
		GV_ImmersiveWeaponsElven.SetValue(DBM_SectionArmoryImmersiveWeaponsElven.GetSize())
		GV_ImmersiveWeaponsFalmer.SetValue(DBM_SectionArmoryImmersiveWeaponsFalmer.GetSize())
		GV_ImmersiveWeaponsGlass.SetValue(DBM_SectionArmoryImmersiveWeaponsGlass.GetSize())
		GV_ImmersiveWeaponsIron.SetValue(DBM_SectionArmoryImmersiveWeaponsIron.GetSize())
		GV_ImmersiveWeaponsOrcish.SetValue(DBM_SectionArmoryImmersiveWeaponsOrcish.GetSize())
		GV_ImmersiveWeaponsSteel.SetValue(DBM_SectionArmoryImmersiveWeaponsSteel.GetSize())
		GV_ImmersiveWeaponsWolf.SetValue(DBM_SectionArmoryImmersiveWeaponsWolf.GetSize())
		GV_SectionHOHImmersiveWeapons.SetValue(DBM_SectionHOHImmersiveWeapons.GetSize())

		GV_IW.SetValue(DBM_SectionArmory_IW_Displays_Merged.GetSize())

		RN_Setup_Done.Mod(1)
		RN_SupportedModCount.Mod(1)
		_setupDone = True
		
		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Completed for: Immersive Weapons")
		endIf
		
	else
	
		RN_Setup_Done.Mod(1)
		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Already Completed for: Immersive Weapons")
		endIf
	endIf
	
endEvent

;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (DBM_RN_ScanHandler)
	
	RN_Scan_Registered.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Received for: Immersive Weapons")
	endIf
	
	If !DBM_MC_GV_IW.GetValue()
;;-----------		

		if (DBM_GV_ImmersiveWeaponsAncientNordic.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsAncientNordic, DBM_SectionArmoryImmersiveWeaponsAncientNordic_Enabled, GV_ImmersiveWeaponsAncientNordic_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsAncientNordic_Count, GV_ImmersiveWeaponsAncientNordic, DBM_GV_ImmersiveWeaponsAncientNordic) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsAncientNordic_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsAncientNordic_Message.Show()
					endif
				endif
		endIf
			
;;-----------

		if (DBM_GV_ImmersiveWeaponsBlades.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsBlades, DBM_SectionArmoryImmersiveWeaponsBlades_Enabled, GV_ImmersiveWeaponsBlades_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsBlades_Count, GV_ImmersiveWeaponsBlades, DBM_GV_ImmersiveWeaponsBlades) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsBlades_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsBlades_Message.Show()
					endif		
				endif
		endIf
		
	;;----------

		if (DBM_GV_ImmersiveWeaponsDaedric.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsDaedric, DBM_SectionArmoryImmersiveWeaponsDaedric_Enabled, GV_ImmersiveWeaponsDaedric_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsDaedric_Count, GV_ImmersiveWeaponsDaedric, DBM_GV_ImmersiveWeaponsDaedric) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsDaedric_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsDaedric_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsDawnguard.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsDawnguard, DBM_SectionArmoryImmersiveWeaponsDawnguard_Enabled, GV_ImmersiveWeaponsDawnguard_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsDawnguard_Count, GV_ImmersiveWeaponsDawnguard, DBM_GV_ImmersiveWeaponsDawnguard) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsDawnguard_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsDawnguard_Message.Show()
					endif	
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsDragon.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsDragon, DBM_SectionArmoryImmersiveWeaponsDragon_Enabled, GV_ImmersiveWeaponsDragon_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsDragon_Count, GV_ImmersiveWeaponsDragon, DBM_GV_ImmersiveWeaponsDragon) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsDragon_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsDragon_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsDwarven.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsDwarven, DBM_SectionArmoryImmersiveWeaponsDwarven_Enabled, GV_ImmersiveWeaponsDwarven_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsDwarven_Count, GV_ImmersiveWeaponsDwarven, DBM_GV_ImmersiveWeaponsDwarven) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsDwarven_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsDwarven_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsEbony.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsEbony, DBM_SectionArmoryImmersiveWeaponsEbony_Enabled, GV_ImmersiveWeaponsEbony_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsEbony_Count, GV_ImmersiveWeaponsEbony, DBM_GV_ImmersiveWeaponsEbony) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsEbony_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsEbony_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsElven.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsElven, DBM_SectionArmoryImmersiveWeaponsElven_Enabled, GV_ImmersiveWeaponsElven_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsElven_Count, GV_ImmersiveWeaponsElven, DBM_GV_ImmersiveWeaponsElven) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsElven_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsElven_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsFalmer.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsFalmer, DBM_SectionArmoryImmersiveWeaponsFalmer_Enabled, GV_ImmersiveWeaponsFalmer_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsFalmer_Count, GV_ImmersiveWeaponsFalmer, DBM_GV_ImmersiveWeaponsFalmer) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsFalmer_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsFalmer_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsGlass.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsGlass, DBM_SectionArmoryImmersiveWeaponsGlass_Enabled, GV_ImmersiveWeaponsGlass_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsGlass_Count, GV_ImmersiveWeaponsGlass, DBM_GV_ImmersiveWeaponsGlass) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsGlass_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsGlass_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsIron.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsIron, DBM_SectionArmoryImmersiveWeaponsIron_Enabled, GV_ImmersiveWeaponsIron_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsIron_Count, GV_ImmersiveWeaponsIron, DBM_GV_ImmersiveWeaponsIron) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsIron_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsIron_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsOrcish.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsOrcish, DBM_SectionArmoryImmersiveWeaponsOrcish_Enabled, GV_ImmersiveWeaponsOrcish_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsOrcish_Count, GV_ImmersiveWeaponsOrcish, DBM_GV_ImmersiveWeaponsOrcish) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsOrcish_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsOrcish_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsSteel.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsSteel, DBM_SectionArmoryImmersiveWeaponsSteel_Enabled, GV_ImmersiveWeaponsSteel_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsSteel_Count, GV_ImmersiveWeaponsSteel, DBM_GV_ImmersiveWeaponsSteel) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsSteel_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsSteel_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_ImmersiveWeaponsWolf.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsWolf, DBM_SectionArmoryImmersiveWeaponsWolf_Enabled, GV_ImmersiveWeaponsWolf_Count)
				if (CheckValueCount1(GV_ImmersiveWeaponsWolf_Count, GV_ImmersiveWeaponsWolf, DBM_GV_ImmersiveWeaponsWolf) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryImmersiveWeaponsWolf_Notification.Show()
					else
						DBM_SectionArmoryImmersiveWeaponsWolf_Message.Show()
					endif			
				endif
		endIf
			
;;-----------

		if (DBM_GV_DaedricGalleryImmersiveWeapons.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionDaedricGalleryImmersiveWeapons, DBM_SectionDaedricGalleryImmersiveWeapons_Enabled, GV_DaedricGalleryImmersiveWeapons_Count)
				if (CheckValueCount1(GV_DaedricGalleryImmersiveWeapons_Count, GV_DaedricGalleryImmersiveWeapons, DBM_GV_DaedricGalleryImmersiveWeapons) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionDaedricGalleryImmersiveWeapons_Notification.Show()
					else
						DBM_SectionDaedricGalleryImmersiveWeapons_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_SectionHOHImmersiveWeapons.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionHOHImmersiveWeapons, DBM_SectionHOHImmersiveWeapons_Enabled, GV_SectionHOHImmersiveWeapons_Count)
				if (CheckValueCount1(GV_SectionHOHImmersiveWeapons_Count, GV_SectionHOHImmersiveWeapons, DBM_GV_SectionHOHImmersiveWeapons) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionHOHImmersiveWeapons_Notification.Show()
					else
						DBM_SectionHOHImmersiveWeapons_Message.Show()
					endif			
				endif
		endIf
		
;;-----------

		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsAncientNordic, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count) ;;Check all formlists for Enabled displays, compare to merged formlist with total display count.
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsBlades, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsDaedric, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsDawnguard, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsDragon, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsDwarven, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsEbony, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsElven, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsFalmer, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsGlass, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsIron, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsOrcish, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsSteel, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionArmoryImmersiveWeaponsWolf, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionDaedricGalleryImmersiveWeapons, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
		_onDisplayCheck(DBM_SectionHOHImmersiveWeapons, DBM_SectionArmory_IW_Displays_Enabled, GV_IW_Count)
	
		if (CheckValueCount1(GV_IW_Count, GV_IW, DBM_MC_GV_IW) && (MCM.ShowSetCompleteVal))
			if (MCM.ShowSimpleNotificationVal)
				DBM_IW_Complete_Notification.Show()
			else
				DBM_IW_Complete_Message.Show()
			endif
		endif		
	endIf
	
	RN_Scan_Done.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Received for: Immersive Weapons")
	endIf
	
EndEvent



