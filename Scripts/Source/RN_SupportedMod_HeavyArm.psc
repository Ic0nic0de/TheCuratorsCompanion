scriptName RN_SupportedMod_HeavyArm extends ReferenceAlias

Import Debug 

Import RN_Utility_Global

RN_Utility_MCM Property MCM Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Item Lists ----------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Formlists to control item lists.
formlist property DBM_SectionArmoryHAAncientNordicItems auto
formlist property DBM_SectionArmoryHABladesItems auto
formlist property DBM_SectionArmoryHADaedricItems auto
formlist property DBM_SectionArmoryHADawnguardItems auto
formlist property DBM_SectionArmoryHADragonItems auto
formlist property DBM_SectionArmoryHADwarvenItems auto
formlist property DBM_SectionArmoryHAEbonyItems auto
formlist property DBM_SectionArmoryHAElvenItems auto
formlist property DBM_SectionArmoryHAFalmerItems auto
formlist property DBM_SectionArmoryHAForswornItems auto
formlist property DBM_SectionArmoryHAGlassItems auto
formlist property DBM_SectionArmoryHAImperialItems auto
formlist property DBM_SectionArmoryHAIronItems auto
formlist property DBM_SectionArmoryHANordHeroItems auto
formlist property DBM_SectionArmoryHANordicItems auto
formlist property DBM_SectionArmoryHAOrcishItems auto
formlist property DBM_SectionArmoryHASilverItems auto
formlist property DBM_SectionArmoryHAStalhrimItems auto
formlist property DBM_SectionArmoryHASteelItems auto

;;Formlists to control item lists - Merged Formlist
formlist property Supported_Items_Merged auto ;;Merged Item List.

;;Formlists to control item lists - MoreHUD
formlist property dbmNew auto
formlist property dbmMaster auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Display Refs --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;Display Ref List.
formlist property DBM_SectionArmoryHAAncientNordic auto
formlist property DBM_SectionArmoryHABlades auto
formlist property DBM_SectionArmoryHADaedric auto
formlist property DBM_SectionArmoryHADawnguard auto
formlist property DBM_SectionArmoryHADragon auto
formlist property DBM_SectionArmoryHADwarven auto
formlist property DBM_SectionArmoryHAEbony auto
formlist property DBM_SectionArmoryHAElven auto
formlist property DBM_SectionArmoryHAFalmer auto
formlist property DBM_SectionArmoryHAForsworn auto
formlist property DBM_SectionArmoryHAGlass auto
formlist property DBM_SectionArmoryHAImperial auto
formlist property DBM_SectionArmoryHAIron auto
formlist property DBM_SectionArmoryHANordHero auto
formlist property DBM_SectionArmoryHANordic auto
formlist property DBM_SectionArmoryHAOrcish auto
formlist property DBM_SectionArmoryHASilver auto
formlist property DBM_SectionArmoryHAStalhrim auto
formlist property DBM_SectionArmoryHASteel auto

;Display Ref List - Formlists for Set Completion
formlist property DBM_SectionArmoryHAAncientNordic_Enabled auto
formlist property DBM_SectionArmoryHABlades_Enabled auto
formlist property DBM_SectionArmoryHADaedric_Enabled auto
formlist property DBM_SectionArmoryHADawnguard_Enabled auto
formlist property DBM_SectionArmoryHADragon_Enabled auto
formlist property DBM_SectionArmoryHADwarven_Enabled auto
formlist property DBM_SectionArmoryHAEbony_Enabled auto
formlist property DBM_SectionArmoryHAElven_Enabled auto
formlist property DBM_SectionArmoryHAFalmer_Enabled auto
formlist property DBM_SectionArmoryHAForsworn_Enabled auto
formlist property DBM_SectionArmoryHAGlass_Enabled auto
formlist property DBM_SectionArmoryHAImperial_Enabled auto
formlist property DBM_SectionArmoryHAIron_Enabled auto
formlist property DBM_SectionArmoryHANordHero_Enabled auto
formlist property DBM_SectionArmoryHANordic_Enabled auto
formlist property DBM_SectionArmoryHAOrcish_Enabled auto
formlist property DBM_SectionArmoryHASilver_Enabled auto
formlist property DBM_SectionArmoryHAStalhrim_Enabled auto
formlist property DBM_SectionArmoryHASteel_Enabled auto

;;Display Ref Lift - Merged Formlists
formlist property DBM_SectionArmory_HA_Displays_Merged auto;; Total amount of available displays from merged Formlist.
formlist property DBM_SectionArmory_HA_Displays_Enabled auto ;; Total amount of enabled Displays from merged formlist.
formlist property DBM_SectionArmory_Displays_Merged auto 

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Set Complete Messages.
Message property DBM_SectionArmoryHAAncientNordic_Message auto
Message property DBM_SectionArmoryHABlades_Message auto
Message property DBM_SectionArmoryHADaedric_Message auto
Message property DBM_SectionArmoryHADawnguard_Message auto
Message property DBM_SectionArmoryHADragon_Message auto
Message property DBM_SectionArmoryHADwarven_Message auto
Message property DBM_SectionArmoryHAEbony_Message auto
Message property DBM_SectionArmoryHAElven_Message auto
Message property DBM_SectionArmoryHAFalmer_Message auto
Message property DBM_SectionArmoryHAForsworn_Message auto
Message property DBM_SectionArmoryHAGlass_Message auto
Message property DBM_SectionArmoryHAImperial_Message auto
Message property DBM_SectionArmoryHAIron_Message auto
Message property DBM_SectionArmoryHANordHero_Message auto
Message property DBM_SectionArmoryHANordic_Message auto
Message property DBM_SectionArmoryHAOrcish_Message auto
Message property DBM_SectionArmoryHASilver_Message auto
Message property DBM_SectionArmoryHAStalhrim_Message auto
Message property DBM_SectionArmoryHASteel_Message auto

;;Set Complete Notifications.
Message property DBM_SectionArmoryHAAncientNordic_Notification auto
Message property DBM_SectionArmoryHABlades_Notification auto
Message property DBM_SectionArmoryHADaedric_Notification auto
Message property DBM_SectionArmoryHADawnguard_Notification auto
Message property DBM_SectionArmoryHADragon_Notification auto
Message property DBM_SectionArmoryHADwarven_Notification auto
Message property DBM_SectionArmoryHAEbony_Notification auto
Message property DBM_SectionArmoryHAElven_Notification auto
Message property DBM_SectionArmoryHAFalmer_Notification auto
Message property DBM_SectionArmoryHAForsworn_Notification auto
Message property DBM_SectionArmoryHAGlass_Notification auto
Message property DBM_SectionArmoryHAImperial_Notification auto
Message property DBM_SectionArmoryHAIron_Notification auto
Message property DBM_SectionArmoryHANordHero_Notification auto
Message property DBM_SectionArmoryHANordic_Notification auto
Message property DBM_SectionArmoryHAOrcish_Notification auto
Message property DBM_SectionArmoryHASilver_Notification auto
Message property DBM_SectionArmoryHAStalhrim_Notification auto
Message property DBM_SectionArmoryHASteel_Notification auto

;;Collection Complete Notifications.
Message Property DBM_SectionArmoryHA_Total_Message auto
Message property DBM_SectionArmoryHA_Total_Notification auto

;; Globals for set completion.
GlobalVariable Property DBM_GV_SectionArmoryHAAncientNordic Auto
GlobalVariable Property DBM_GV_SectionArmoryHABlades Auto
GlobalVariable Property DBM_GV_SectionArmoryHADaedric Auto
GlobalVariable Property DBM_GV_SectionArmoryHADawnguard Auto
GlobalVariable Property DBM_GV_SectionArmoryHADragon Auto
GlobalVariable Property DBM_GV_SectionArmoryHADwarven Auto
GlobalVariable Property DBM_GV_SectionArmoryHAEbony Auto
GlobalVariable Property DBM_GV_SectionArmoryHAElven Auto
GlobalVariable Property DBM_GV_SectionArmoryHAFalmer Auto
GlobalVariable Property DBM_GV_SectionArmoryHAForsworn Auto
GlobalVariable Property DBM_GV_SectionArmoryHAGlass Auto
GlobalVariable Property DBM_GV_SectionArmoryHAImperial Auto
GlobalVariable Property DBM_GV_SectionArmoryHAIron Auto
GlobalVariable Property DBM_GV_SectionArmoryHANordHero Auto
GlobalVariable Property DBM_GV_SectionArmoryHANordic Auto
GlobalVariable Property DBM_GV_SectionArmoryHAOrcish Auto
GlobalVariable Property DBM_GV_SectionArmoryHASilver Auto
GlobalVariable Property DBM_GV_SectionArmoryHAStalhrim Auto
GlobalVariable Property DBM_GV_SectionArmoryHASteel Auto

;;Globals For Current Count.
GlobalVariable Property GV_SectionArmoryHAAncientNordic_Count Auto
GlobalVariable Property GV_SectionArmoryHABlades_Count Auto
GlobalVariable Property GV_SectionArmoryHADaedric_Count Auto
GlobalVariable Property GV_SectionArmoryHADawnguard_Count Auto
GlobalVariable Property GV_SectionArmoryHADragon_Count Auto
GlobalVariable Property GV_SectionArmoryHADwarven_Count Auto
GlobalVariable Property GV_SectionArmoryHAEbony_Count Auto
GlobalVariable Property GV_SectionArmoryHAElven_Count Auto
GlobalVariable Property GV_SectionArmoryHAFalmer_Count Auto
GlobalVariable Property GV_SectionArmoryHAForsworn_Count Auto
GlobalVariable Property GV_SectionArmoryHAGlass_Count Auto
GlobalVariable Property GV_SectionArmoryHAImperial_Count Auto
GlobalVariable Property GV_SectionArmoryHAIron_Count Auto
GlobalVariable Property GV_SectionArmoryHANordHero_Count Auto
GlobalVariable Property GV_SectionArmoryHANordic_Count Auto
GlobalVariable Property GV_SectionArmoryHAOrcish_Count Auto
GlobalVariable Property GV_SectionArmoryHASilver_Count Auto
GlobalVariable Property GV_SectionArmoryHAStalhrim_Count Auto
GlobalVariable Property GV_SectionArmoryHASteel_Count Auto

;;Globals For Total Count.
GlobalVariable Property GV_SectionArmoryHAAncientNordic Auto
GlobalVariable Property GV_SectionArmoryHABlades Auto
GlobalVariable Property GV_SectionArmoryHADaedric Auto
GlobalVariable Property GV_SectionArmoryHADawnguard Auto
GlobalVariable Property GV_SectionArmoryHADragon Auto
GlobalVariable Property GV_SectionArmoryHADwarven Auto
GlobalVariable Property GV_SectionArmoryHAEbony Auto
GlobalVariable Property GV_SectionArmoryHAElven Auto
GlobalVariable Property GV_SectionArmoryHAFalmer Auto
GlobalVariable Property GV_SectionArmoryHAForsworn Auto
GlobalVariable Property GV_SectionArmoryHAGlass Auto
GlobalVariable Property GV_SectionArmoryHAImperial Auto
GlobalVariable Property GV_SectionArmoryHAIron Auto
GlobalVariable Property GV_SectionArmoryHANordHero Auto
GlobalVariable Property GV_SectionArmoryHANordic Auto
GlobalVariable Property GV_SectionArmoryHAOrcish Auto
GlobalVariable Property GV_SectionArmoryHASilver Auto
GlobalVariable Property GV_SectionArmoryHAStalhrim Auto
GlobalVariable Property GV_SectionArmoryHASteel Auto

;; Globals for set completion.
GlobalVariable Property DBM_MC_GV_HA Auto
GlobalVariable Property GV_Heavy_Count Auto
GlobalVariable Property GV_Heavy Auto

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
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Received for: Heavy Armory")
		endIf
	
		;;Merge Formlist.
		_onConsolidateItems(DBM_SectionArmoryHAAncientNordicItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHABladesItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHADaedricItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHADawnguardItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHADragonItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHADwarvenItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHAEbonyItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHAElvenItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHAFalmerItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHAForswornItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHAGlassItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHAImperialItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHAIronItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHANordHeroItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHANordicItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHAOrcishItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHASilverItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHAStalhrimItems, Supported_Items_Merged, dbmNew, dbmMaster)
		_onConsolidateItems(DBM_SectionArmoryHASteelItems, Supported_Items_Merged, dbmNew, dbmMaster)
		
		;;Generates a total available display count (used for Section / Set Completion along with the original Display Formlists)
		_onConsolidateDisplays(DBM_SectionArmoryHAAncientNordic, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHABlades, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHADaedric, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHADawnguard, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHADragon, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHADwarven, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHAEbony, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHAElven, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHAFalmer, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHAForsworn, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHAGlass, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHAImperial, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHAIron, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHANordHero, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHANordic, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHAOrcish, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHASilver, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHAStalhrim, DBM_SectionArmory_HA_Displays_Merged)
		_onConsolidateDisplays(DBM_SectionArmoryHASteel, DBM_SectionArmory_HA_Displays_Merged)
		
		_onConsolidateDisplays(DBM_SectionArmory_HA_Displays_Merged, DBM_SectionArmory_Displays_Merged)
		
		GV_SectionArmoryHAAncientNordic.SetValue(DBM_SectionArmoryHAAncientNordic.GetSize())
		GV_SectionArmoryHABlades.SetValue(DBM_SectionArmoryHABlades.GetSize())
		GV_SectionArmoryHADaedric.SetValue(DBM_SectionArmoryHADaedric.GetSize())
		GV_SectionArmoryHADawnguard.SetValue(DBM_SectionArmoryHADawnguard.GetSize())
		GV_SectionArmoryHADragon.SetValue(DBM_SectionArmoryHADragon.GetSize())
		GV_SectionArmoryHADwarven.SetValue(DBM_SectionArmoryHADwarven.GetSize())
		GV_SectionArmoryHAEbony.SetValue(DBM_SectionArmoryHAEbony.GetSize())
		GV_SectionArmoryHAElven.SetValue(DBM_SectionArmoryHAElven.GetSize())
		GV_SectionArmoryHAFalmer.SetValue(DBM_SectionArmoryHAFalmer.GetSize())
		GV_SectionArmoryHAForsworn.SetValue(DBM_SectionArmoryHAForsworn.GetSize())
		GV_SectionArmoryHAGlass.SetValue(DBM_SectionArmoryHAGlass.GetSize())
		GV_SectionArmoryHAImperial.SetValue(DBM_SectionArmoryHAImperial.GetSize())
		GV_SectionArmoryHAIron.SetValue(DBM_SectionArmoryHAIron.GetSize())
		GV_SectionArmoryHANordHero.SetValue(DBM_SectionArmoryHANordHero.GetSize())
		GV_SectionArmoryHANordic.SetValue(DBM_SectionArmoryHANordic.GetSize())
		GV_SectionArmoryHAOrcish.SetValue(DBM_SectionArmoryHAOrcish.GetSize())
		GV_SectionArmoryHASilver.SetValue(DBM_SectionArmoryHASilver.GetSize())
		GV_SectionArmoryHAStalhrim.SetValue(DBM_SectionArmoryHAStalhrim.GetSize())
		GV_SectionArmoryHASteel.SetValue(DBM_SectionArmoryHASteel.GetSize())
		
		GV_Heavy.SetValue(DBM_SectionArmory_HA_Displays_Merged.GetSize())
				
		RN_Setup_Done.Mod(1)
		RN_SupportedModCount.Mod(1)
		_setupDone = True
		
		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Completed for: Heavy Armory")
		endIf
		
	else
		
		RN_Setup_Done.Mod(1)
		If MCM.DevDebugVal
			DBMDebug.Log(GetOwningQuest(), "TCC: Setup Event Already Completed for: Heavy Armory")
		endIf
	endIf
endEvent	

;;-- Events ---------------------------------------		

Event _onScan(string eventName, string strArg, float numArg, Form sender) ;;Automatic Call from (DBM_RN_ScanHandler)
	
	RN_Scan_Registered.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Received for: Heavy Armory")
	endIf
	
	if !DBM_MC_GV_HA.GetValue()
	
;;-----------

		if (DBM_GV_SectionArmoryHAAncientNordic.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHAAncientNordic, DBM_SectionArmoryHAAncientNordic_Enabled, GV_SectionArmoryHAAncientNordic_Count)
				if (CheckValueCount1(GV_SectionArmoryHAAncientNordic_Count, GV_SectionArmoryHAAncientNordic, DBM_GV_SectionArmoryHAAncientNordic) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHAAncientNordic_Notification.Show()
					else
						DBM_SectionArmoryHAAncientNordic_Message.Show()
					endif
				endif
		endIf
			
;;-----------

		if (DBM_GV_SectionArmoryHABlades.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHABlades, DBM_SectionArmoryHABlades_Enabled, GV_SectionArmoryHABlades_Count)	
				if (CheckValueCount1(GV_SectionArmoryHABlades_Count, GV_SectionArmoryHABlades, DBM_GV_SectionArmoryHABlades) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHABlades_Notification.Show()
					else
						DBM_SectionArmoryHABlades_Message.Show()
					endif		
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHADaedric.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHADaedric, DBM_SectionArmoryHADaedric_Enabled, GV_SectionArmoryHADaedric_Count)
				if (CheckValueCount1(GV_SectionArmoryHADaedric_Count, GV_SectionArmoryHADaedric, DBM_GV_SectionArmoryHADaedric) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHADaedric_Notification.Show()
					else
						DBM_SectionArmoryHADaedric_Message.Show()
					endif	
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHADawnguard.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryHADawnguard, DBM_SectionArmoryHADawnguard_Enabled, GV_SectionArmoryHADawnguard_Count)
				if (CheckValueCount1(GV_SectionArmoryHADawnguard_Count, GV_SectionArmoryHADawnguard, DBM_GV_SectionArmoryHADawnguard) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHADawnguard_Notification.Show()
					else
						DBM_SectionArmoryHADawnguard_Message.Show()
					endif			
				endif
		endIf

;;-----------	

		if (DBM_GV_SectionArmoryHADragon.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHADragon, DBM_SectionArmoryHADragon_Enabled, GV_SectionArmoryHADragon_Count)
				if (CheckValueCount1(GV_SectionArmoryHADragon_Count, GV_SectionArmoryHADragon, DBM_GV_SectionArmoryHADragon) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHADragon_Notification.Show()
					else
						DBM_SectionArmoryHADragon_Message.Show()
					endif		
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHADwarven.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryHADwarven, DBM_SectionArmoryHADwarven_Enabled, GV_SectionArmoryHADwarven_Count)
				if (CheckValueCount1(GV_SectionArmoryHADwarven_Count, GV_SectionArmoryHADwarven, DBM_GV_SectionArmoryHADwarven) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHADwarven_Notification.Show()
					else
						DBM_SectionArmoryHADwarven_Message.Show()
					endif			
				endif
		endIf

;;-----------

		

		if (DBM_GV_SectionArmoryHAEbony.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryHAEbony, DBM_SectionArmoryHAEbony_Enabled, GV_SectionArmoryHAEbony_Count)
				if (CheckValueCount1(GV_SectionArmoryHAEbony_Count, GV_SectionArmoryHAEbony, DBM_GV_SectionArmoryHAEbony) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHAEbony_Notification.Show()
					else
						DBM_SectionArmoryHAEbony_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHAElven.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryHAElven, DBM_SectionArmoryHAElven_Enabled, GV_SectionArmoryHAElven_Count)
				if (CheckValueCount1(GV_SectionArmoryHAElven_Count, GV_SectionArmoryHAElven, DBM_GV_SectionArmoryHAElven) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHAElven_Notification.Show()
					else
						DBM_SectionArmoryHAElven_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHAFalmer.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHAFalmer, DBM_SectionArmoryHAFalmer_Enabled, GV_SectionArmoryHAFalmer_Count)
				if (CheckValueCount1(GV_SectionArmoryHAFalmer_Count, GV_SectionArmoryHAFalmer, DBM_GV_SectionArmoryHAFalmer) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHAFalmer_Notification.Show()
					else
						DBM_SectionArmoryHAFalmer_Message.Show()
					endif				
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHAForsworn.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryHAForsworn, DBM_SectionArmoryHAForsworn_Enabled, GV_SectionArmoryHAForsworn_Count)
				if (CheckValueCount1(GV_SectionArmoryHAForsworn_Count, GV_SectionArmoryHAForsworn, DBM_GV_SectionArmoryHAForsworn) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHAForsworn_Notification.Show()
					else
						DBM_SectionArmoryHAForsworn_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHAGlass.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHAGlass, DBM_SectionArmoryHAGlass_Enabled, GV_SectionArmoryHAGlass_Count)
				if (CheckValueCount1(GV_SectionArmoryHAGlass_Count, GV_SectionArmoryHAGlass, DBM_GV_SectionArmoryHAGlass) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHAGlass_Notification.Show()
					else
						DBM_SectionArmoryHAGlass_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHAImperial.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryHAImperial, DBM_SectionArmoryHAImperial_Enabled, GV_SectionArmoryHAImperial_Count)
				if (CheckValueCount1(GV_SectionArmoryHAImperial_Count, GV_SectionArmoryHAImperial, DBM_GV_SectionArmoryHAImperial) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHAImperial_Notification.Show()
					else
						DBM_SectionArmoryHAImperial_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHAIron.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHAIron, DBM_SectionArmoryHAIron_Enabled, GV_SectionArmoryHAIron_Count)
				if (CheckValueCount1(GV_SectionArmoryHAIron_Count, GV_SectionArmoryHAIron, DBM_GV_SectionArmoryHAIron) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHAIron_Notification.Show()
					else
						DBM_SectionArmoryHAIron_Message.Show()
					endif				
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHANordHero.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHANordHero, DBM_SectionArmoryHANordHero_Enabled, GV_SectionArmoryHANordHero_Count)
				if (CheckValueCount1(GV_SectionArmoryHANordHero_Count, GV_SectionArmoryHANordHero, DBM_GV_SectionArmoryHANordHero) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHANordHero_Notification.Show()
					else
						DBM_SectionArmoryHANordHero_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHANordic.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHANordic, DBM_SectionArmoryHANordic_Enabled, GV_SectionArmoryHANordic_Count)
				if (CheckValueCount1(GV_SectionArmoryHANordic_Count, GV_SectionArmoryHANordic, DBM_GV_SectionArmoryHANordic) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHANordic_Notification.Show()
					else
						DBM_SectionArmoryHANordic_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHAOrcish.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHAOrcish, DBM_SectionArmoryHAOrcish_Enabled, GV_SectionArmoryHAOrcish_Count)
				if (CheckValueCount1(GV_SectionArmoryHAOrcish_Count, GV_SectionArmoryHAOrcish, DBM_GV_SectionArmoryHAOrcish) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHAOrcish_Notification.Show()
					else
						DBM_SectionArmoryHAOrcish_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHASilver.GetValue()) == 0	
			_onDisplayCheck(DBM_SectionArmoryHASilver, DBM_SectionArmoryHASilver_Enabled, GV_SectionArmoryHASilver_Count)
				if (CheckValueCount1(GV_SectionArmoryHASilver_Count, GV_SectionArmoryHASilver, DBM_GV_SectionArmoryHASilver) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHASilver_Notification.Show()
					else
						DBM_SectionArmoryHASilver_Message.Show()
					endif			
				endif
		endIf

;;-----------

		if (DBM_GV_SectionArmoryHAStalhrim.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHAStalhrim, DBM_SectionArmoryHAStalhrim_Enabled, GV_SectionArmoryHAStalhrim_Count)	
				if (CheckValueCount1(GV_SectionArmoryHAStalhrim_Count, GV_SectionArmoryHAStalhrim, DBM_GV_SectionArmoryHAStalhrim) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHAStalhrim_Notification.Show()
					else
						DBM_SectionArmoryHAStalhrim_Message.Show()
					endif			
				endif
		endIf
			
;;-----------

		if (DBM_GV_SectionArmoryHASteel.GetValue()) == 0
			_onDisplayCheck(DBM_SectionArmoryHASteel, DBM_SectionArmoryHASteel_Enabled, GV_SectionArmoryHASteel_Count)
				if (CheckValueCount1(GV_SectionArmoryHASteel_Count, GV_SectionArmoryHASteel, DBM_GV_SectionArmoryHASteel) && (MCM.ShowSetCompleteVal))
					if (MCM.ShowSimpleNotificationVal)
						DBM_SectionArmoryHASteel_Notification.Show()
					else
						DBM_SectionArmoryHASteel_Message.Show()
					endif			
				endif
		endIf	

;;-----------
		
		_onDisplayCheck(DBM_SectionArmoryHAAncientNordic, DBM_SectionArmory_HA_Displays_Enabled , GV_Heavy_Count) ;;Check all formlists for Enabled displays, compare to merged formlist with total display count.
		_onDisplayCheck(DBM_SectionArmoryHABlades, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHADaedric, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHADawnguard, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHADragon, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHADwarven, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHAEbony, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHAElven, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHAFalmer, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHAForsworn, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHAGlass, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHAImperial, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHAIron, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHANordHero, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHANordic, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHAOrcish, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHASilver, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHAStalhrim, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		_onDisplayCheck(DBM_SectionArmoryHASteel, DBM_SectionArmory_HA_Displays_Enabled, GV_Heavy_Count)
		
		if (CheckValueCount1(GV_Heavy_Count, GV_Heavy, DBM_MC_GV_HA) && (MCM.ShowSetCompleteVal))
			if (MCM.ShowSimpleNotificationVal)
				DBM_SectionArmoryHA_Total_Notification.Show()
			else
				DBM_SectionArmoryHA_Total_Message.Show()
			endif
		endif
	endIf
		
	RN_Scan_Done.Mod(1)	

	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Completed for: Heavy Armory")
	endIf
	
EndEvent
