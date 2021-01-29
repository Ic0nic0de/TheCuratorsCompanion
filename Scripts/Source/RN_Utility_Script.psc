scriptname RN_Utility_Script extends quest

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Script Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

import AhzMoreHud
import AhzMoreHudIE

import utility

RN_Utility_MCM property RN_MCM auto
RN_Storage_Transfer property RN_Transfer auto
RN_Utility_InventoryMonitor1 property RN_Inv1 auto
RN_Utility_InventoryMonitor2 property RN_Inv2 Auto
RN_Utility_InventoryMonitorSH property RN_InvSH auto
RN_Utility_InventoryMonitorARM property RN_InvArm auto
RN_Utility_InventoryMonitor_Patches property RN_InvPatch auto
RN_Listener_Explore property RN_Explore auto
RN_Listener_Skills property RN_Skills auto
RN_Listener_Quest property RN_Quest auto
RN_Listener_Thane property RN_Thane auto

ObjectReference Property TCC_Achievements_Xmarker auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Message Properties
message property DBM_ScanMuseum_Message auto
message property DBM_ScanMuseum_Finished_Message auto

message property ModConfigStartup auto
Message property ModConfigFinished auto
message property ModConfigFinishedNoPatches auto

message property ModUpdateStartup auto
Message property ModUpdateFinished auto

message property SetupComplete auto
message property ModStartup auto
message property ModStartupDone auto
message property ModStartup_UpdatingLists auto

message property UserSettingsLoaded auto
message property UserSettingsNone auto
message property TCC_UniquesSetupFinished auto
message property moreHUDListRebuilt auto

message property TCC_SafehouseSetupFinished auto

bool bSettingup
bool bScanning
bool bScanAll
bool bUpdating
bool bMoreHUDListsCreated
bool bSetupStarted
Bool bMaintenance

;;Do Not Fill this property.
objectreference property DBM_CloaksStorage auto

;;Player Ref 
objectreference property PlayerRef auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Formlist Properties ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Merged & Found Item list 1
formlist property TCC_ItemList_Museum_2 auto
formlist property TCC_FoundList_Museum_2 auto

;;Merged & Found Item list 2
formlist property TCC_ItemList_Museum_1 auto
formlist property TCC_FoundList_Museum_1 auto

;;MoreHud
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto
formlist property dbmMaster auto

;;Safehouse formlists
formlist property TCC_ItemList_Safehouse auto
formlist property TCC_FoundList_Safehouse auto

;;Listeners
formlist property DBM_RN_QuestDisplays auto
formlist property DBM_RN_Quest_Stage_Displays auto
formlist property DBM_RN_ExplorationDisplays auto
formlist property TCC_DisplayList_Paintings auto
formlist property TCC_DisplayList_DibellaStatues auto

;;Custom Storage
formlist property TCC_TokenList auto

;;Main Storage
formlist property _MuseumContainerList auto
formlist property _MuseumContainerList_WP auto
formlist property _SafehouseContainerList auto
formlist property _SafehouseContainerList_WP auto

Formlist property _Armory_Formlist_Displays auto
Formlist property _Armory_Global_Total auto

Formlist property _Museum_Formlist_Merged auto
Formlist property _Museum_Global_Total auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Global Variables --------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

globalvariable property RN_SupportedModCount auto
globalvariable property RN_CustomModCount auto
globalvariable property RN_SupportedSafehouseCount auto
globalvariable property RN_SupportedPatchTotal auto
globalvariable property RN_moreHUD_Option auto

globalvariable property DBM_SortWait auto

globalvariable property RN_Setup_Start auto
globalvariable property RN_Setup_Done auto
globalvariable property RN_Setup_Finish auto
globalvariable property RN_Setup_Registered auto

globalvariable property RN_Safehouse_Done auto
globalvariable property RN_Safehouse_Registered auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

globalvariable property RN_Found_Done auto
globalvariable property RN_found_Registered auto

globalvariable property RN_Quest_Listener_Total auto
globalvariable property RN_Exploration_Listener_Total auto
globalvariable property RN_Museum_Paintings_Total auto
globalvariable property RN_Museum_Dibella_Statues_Total auto

globalvariable property GV_SectionHallofHeroes auto
globalvariable property GV_SectionDaedricGallery auto
globalvariable property GV_SectionHOLE auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------- Start of Script -----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
Event OnInit()

	RunSetup()	
endEvent
	
;;-- Events ---------------------------------------

Event RunSetup()

	if RN_Setup_Finish.GetValue()
		TCCDebug.Log("Utility - Setup already completed with " + RN_Setup_Finish.GetValue(), 0)	
		SetupComplete.Show()	
	else
		
		TCCDebug.Log("Utility - Setup Started", 0)
		DBM_SortWait.setvalue(1)
		RN_Setup_Start.setvalue(1)
		bSetupStarted = True	
		
		RN_MCM.Build_Arrays()
		
		SendModEvent("TCCSetup_Patches")
		
		if RN_MCM.Achievements_Enabled
			SendModEvent("TCCSetup_Uniques")
		endIf
		
		While Utility.IsInMenuMode()
			Wait(2)
		endWhile
		
		ModConfigStartup.Show() 
		
		AddPlayerToFormlists()
		Wait(5)
		
;;------------------------------------	

		while bSetupStarted	
			if RN_Setup_Done.GetValue() == RN_Setup_Registered.GetValue() 
				CreateMoreHudLists()
				InitGlobals()
				
				RN_Explore.OnPlayerLoadGame()		;; Fire off Exploration Listener.
				RN_Quest.OnPlayerLoadGame()			;; Fire off Quest Listener.
				RN_Thane.OnPlayerLoadGame()			;; Fire off Thane Listener.
				RN_Skills.OnPlayerLoadGame()		;; Fire off Skills Listener.		
				RN_Transfer.OnPlayerLoadGame()		;; Fire off Auto Transfer.
				RN_Inv1.OnPlayerLoadGame()			;; Fire off Inventory Manager.
				RN_Inv2.OnPlayerLoadGame()			;; Fire off Inventory Manager.
				RN_InvSH.OnPlayerLoadGame()   		;; Fire off Inventory Manager. (Safehouse)
				RN_InvArm.OnPlayerLoadGame() 		;; Fire off Inventory Manager. (Armory)
				RN_InvPatch.OnPlayerLoadGame()		;; Fire off Inventory Manager. (Patches)
				
				RN_MCM.BuildPatchArray(true, true)
				
				UpdateCurrentInstanceGlobal(RN_SupportedModCount)
				UpdateCurrentInstanceGlobal(RN_CustomModCount)
				UpdateCurrentInstanceGlobal(RN_SupportedSafehouseCount)
				
				SendModEvent("TCCUpdate_Counts")
				
				if RN_MCM.Achievements_Enabled
					SendModEvent("TCCUpdate_Counts_Uniques")
				endIf
				
				Wait(5)
				
				UpdateAllFound()	

				RN_MCM.Begin_Config_Load()
				
				if RN_MCM._UserSettings
					UserSettingsLoaded.Show()
				else
					UserSettingsNone.Show()
				endIf
				
				if RN_SupportedModCount.GetValue() > 0 || RN_SupportedSafehouseCount.GetValue() > 0 || RN_CustomModCount.GetValue() > 0
					RN_SupportedPatchTotal.SetValue(RN_SupportedModCount.GetValue() as Int + RN_CustomModCount.GetValue() as Int) 
					UpdateCurrentInstanceGlobal(RN_SupportedPatchTotal)
					ModConfigFinished.Show()
				else
					ModConfigFinishedNoPatches.Show()
				endIf
				
				RN_Setup_Start.setvalue(0)
				RN_Setup_Finish.setvalue(1)		
				RN_Setup_Done.setvalue(0)
				RN_Setup_Registered.setvalue(0)
				DBM_SortWait.setvalue(0)				
				bSetupStarted = False
				RN_MCM.UpdateReq = False		
			endIf
		endWhile	
	endIf
	TCCDebug.Log("Utility - Initial Mod Setup Finished", 0)
endEvent

;;-- Functions ---------------------------------------

Event AddPlayerToFormlists()
	TCC_TokenList.AddForm(PlayerRef)
	_MuseumContainerList_WP.AddForm(PlayerRef)
	_SafehouseContainerList_WP.AddForm(PlayerRef)
	
	if !TCC_TokenList.HasForm(PlayerRef) || !_MuseumContainerList_WP.HasForm(PlayerRef) || !_SafehouseContainerList_WP.HasForm(PlayerRef)
		TCCDebug.Log("Utility - Unable to find PlayerRef in Formlist", 2)
	endIf
		
	SendModEvent("Update_TokenArray", "Updating Token Array")
endEvent
				
;;-- Functions ---------------------------------------

function CreateMoreHudLists()		
	
	TCCDebug.Log("Utility - Updating moreHUD Lists...", 0)
	
	Int _Index = _MuseumContainerList.GetSize()	;;Check museum containers for displayed items.	
	While _Index 
		_Index -= 1
		ObjectReference _Container = _MuseumContainerList.GetAt(_Index) as ObjectReference
		TCCDebug.Log("Utility - Updating items in [" + _Container.GetBaseObject().GetName() + "]" + _Container, 0)
		Int _Index2 = _Container.GetNumItems()
		while _Index2
			_Index2 -= 1		
			Form _ItemRelic = _Container.GetNthForm(_Index2)
			if dbmNew.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic) || dbmFound.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic) 
				dbmNew.RemoveAddedForm(_ItemRelic)
				dbmFound.RemoveAddedForm(_ItemRelic)
				dbmDisp.AddForm(_ItemRelic)
			endIf
		endWhile
	endWhile
			
	_Index = TCC_TokenList.GetSize() ;; Check player and custom storage for found items.
	While _Index
		_Index -= 1
		ObjectReference _Container = TCC_TokenList.GetAt(_Index) as ObjectReference		
		TCCDebug.Log("Utility - Updating items in [" + _Container.GetBaseObject().GetName() + "]" + _Container, 0)
		Int _Index2 = _Container.GetNumItems()
		While _Index2
			_Index2 -= 1
			Form _ItemRelic = _Container.GetNthForm(_Index2)
			if dbmNew.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
				dbmNew.RemoveAddedForm(_ItemRelic)
				dbmFound.AddForm(_ItemRelic)
			endIf
		endWhile
	endWhile

	if (RN_MCM.GetSafehouseOptions() == "Enabled") ; Check safehouse storage for displayed items.		
		sendmodevent("SH_Update")
	endIf				
		
	RN_MoreHud_Option.setvalue(1)	
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017	
		AhzMoreHudIE.RegisterIconFormList("dbmNew", dbmNew)
		AhzMoreHudIE.RegisterIconFormList("dbmDisp", dbmDisp)
		AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
	endIf
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
		AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
		AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
		AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
	endIf
	
	bMoreHUDListsCreated = true
	
	TCCDebug.Log("Utility - moreHUD Lists Updated", 0)
endFunction

;;-- Events ---------------------------------------

Event InitGlobals()

	RN_Quest_Listener_Total.setvalue(0)
	RN_Exploration_Listener_Total.setvalue(0)
	RN_Museum_Paintings_Total.setvalue(0)
	RN_Museum_Dibella_Statues_Total.setvalue(0)
	
	RN_Quest_Listener_Total.Mod(DBM_RN_QuestDisplays.GetSize())
	RN_Quest_Listener_Total.Mod(DBM_RN_Quest_Stage_Displays.GetSize())
	RN_Exploration_Listener_Total.Mod(DBM_RN_ExplorationDisplays.GetSize())
	RN_Museum_Paintings_Total.Mod(TCC_DisplayList_Paintings.GetSize())
	RN_Museum_Dibella_Statues_Total.Mod(TCC_DisplayList_DibellaStatues.GetSize())
	
	if (Game.GetModByName("LOTD_TCC_TFC.esp") != 255)
		RN_Quest_Listener_Total.Mod(3) ;;[+1 Civil War] [+1 Dawnguard] [+1 The Bards] [-1 Dark Brotherhood] [+1 The Forgotten City] 
	else
		RN_Quest_Listener_Total.Mod(2) ;;[+1 Civil War] [+1 Dawnguard] [+1 The Bards] [-1 Dark Brotherhood]
	endIf
	
	Int _Index = 0
	Int _Length = _Armory_Global_Total.GetSize()
	While _Index < _Length
		Formlist _DisplayList = _Armory_Formlist_Displays.GetAt(_Index) as Formlist
		GlobalVariable _Total = _Armory_Global_Total.GetAt(_Index) as GlobalVariable	
		if _Index == 11
			_Total.SetValue(_DisplayList.GetSize() + 9)
		elseif _Index == 19
			_Total.SetValue(_DisplayList.GetSize() - 6)
		else
			_Total.SetValue(_DisplayList.GetSize())
		endIf
		_Index += 1
	endWhile

	_Index = 0
	_Length = _Museum_Global_Total.GetSize()
	While _Index < _Length
		Formlist _DisplayList = _Museum_Formlist_Merged.GetAt(_Index) as Formlist
		GlobalVariable _Total = _Museum_Global_Total.GetAt(_Index) as GlobalVariable	
		if _Index == 0
			_Total.SetValue(_DisplayList.GetSize() + 3)
		else
			_Total.SetValue(_DisplayList.GetSize())
		endIf
		_Index += 1
	endWhile
	
	if (Game.GetModByName("LOTD_TCC_Cloaks.esp") != 255)
		DBM_CloaksStorage = Game.GetFormFromFile(2122, "DBM_CloaksofSkyrim_Patch.esp") as objectreference
		TCCDebug.Log("Utility - Found Cloaks Storage - " + DBM_CloaksStorage.GetBaseObject().GetName(), 0)
	endIf
endEvent
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Load Game Funcions ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
Function Maintenance()
	
	bMaintenance = false
	
	While !bMaintenance
	
		RegisterForSingleUpdate(2.0)
		Wait(3.0)
	endWhile
endFunction

Event onUpdate()
	
	bMaintenance = true
	if RN_MCM.ShowStartup
		ModStartup.Show()
	endIf
	
	AddPlayerToFormlists()
	
	RN_Setup_Finish.setvalue(0)
	RN_Setup_Start.setvalue(1)	

	DBM_SortWait.setvalue(1)
	bSetupStarted = True
	
	SendModEvent("TCCSetup_Patches")
	
	if RN_MCM.Achievements_Enabled
		SendModEvent("TCCSetup_Uniques")
	endIf
		
	if (RN_MCM.GetSafehouseOptions() == "Enabled") ; Check safehouse storage for displayed items.		
		sendmodevent("TCCSetup_SH")
	endIf	
	
	Wait(5)
	
	while bSetupStarted		
		if RN_Setup_Done.GetValue() == RN_Setup_Registered.GetValue() && RN_Safehouse_Done.GetValue() == RN_Safehouse_Registered.GetValue()
			
			if RN_MCM.UpdateReq
				TCCDebug.Log("Utility - Installing new patch(es)", 0)
				ModStartup_UpdatingLists.Show()
				CreateMoreHudLists()
				UpdateAllFound()
				RN_MCM.BuildPatchArray(true, true)
				RN_MCM.UpdateReq = False
			endIf
			bSetupStarted = False
		endIf
	endWhile	

	SendModEvent("TCCUpdate_Counts")
	
	if RN_MCM.Achievements_Enabled
		SendModEvent("TCCUpdate_Counts_Uniques")
	endIf	
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017
		if !bMoreHUDListsCreated
			CreateMoreHudLists()	
		endIf
		
		if (RN_MoreHud_Option.GetValue()) == 1				
			AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
			AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
			AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
		
		elseif (RN_MoreHud_Option.GetValue()) == 2			
			AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
			AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")		
			AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
				
		elseif (RN_MoreHud_Option.GetValue()) == 3		
			AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")		
			AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
			AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)		

		elseif (RN_MoreHud_Option.GetValue()) == 4			
			AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
			AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
			AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
		
		elseif (RN_MoreHud_Option.GetValue()) == 5				
			AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
			AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")
			AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")	
				
		endIf
	endIf	

	if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
		if !bMoreHUDListsCreated
			CreateMoreHudLists()	
		endIf
		
		if (RN_MoreHud_Option.GetValue()) == 1	
			AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
			AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
			AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)	
		
		elseif (RN_MoreHud_Option.GetValue()) == 2
			AhzmoreHUD.UnRegisterIconFormList("dbmFound")
			AhzmoreHUD.UnRegisterIconFormList("dbmDisp")		
			AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
				
		elseif (RN_MoreHud_Option.GetValue()) == 3
			AhzmoreHUD.UnRegisterIconFormList("dbmDisp")		
			AhzmoreHUD.UnRegisterIconFormList("dbmNew")
			AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)	

		elseif (RN_MoreHud_Option.GetValue()) == 4
			AhzmoreHUD.UnRegisterIconFormList("dbmNew")
			AhzmoreHUD.UnRegisterIconFormList("dbmFound")
			AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
		
		elseif (RN_MoreHud_Option.GetValue()) == 5
			AhzmoreHUD.UnRegisterIconFormList("dbmNew")
			AhzmoreHUD.UnRegisterIconFormList("dbmDisp")
			AhzmoreHUD.UnRegisterIconFormList("dbmFound")	
				
		endIf
	endIf

	InitGlobals()
	
	RN_Setup_Start.setvalue(0)
	RN_Setup_Finish.setvalue(1)		
	RN_Setup_Done.setvalue(0)
	RN_Setup_Registered.setvalue(0)	
	RN_Safehouse_Registered.setvalue(0)
	RN_Safehouse_Done.setvalue(0)
	DBM_SortWait.setvalue(0)	
	
	if RN_MCM.ShowStartup
		ModStartupDone.Show()
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Scan Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function ScanMuseum()
	
	TCCDebug.Log("Utility - Scanning Museum...", 0)
	
	if RN_MCM.ScanNotificationsval
		DBM_ScanMuseum_Message.Show()
	endIf
	
	bScanning = True
	DBM_SortWait.setvalue(1)

	SendModEvent("TCCScan")
	
	if RN_MCM.Achievements_Enabled
		SendModEvent("TCCScan_Uniques")
		TCCDebug.Log("Utility - Scanning Uniques...", 0)
	endIf
	
	FinishScan(5)
endFunction

;;-- Functions ---------------------------------------

function FinishScan(Int _Wait)
	
	Wait(_Wait)
	
	while bScanning	
		if RN_Scan_Done.GetValue() == RN_Scan_Registered.GetValue()			
			bScanning = False
			
			RN_Scan_Done.setvalue(0)
			DBM_SortWait.setvalue(0)
			RN_Scan_Registered.setvalue(0)
			if RN_MCM.ScanNotificationsval
				DBM_ScanMuseum_Finished_Message.Show()
			endIf
		endIf		
	endWhile
	
	TCCDebug.Log("Utility - Museum Scan Finished", 0)
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------- Update Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function UpdateAllFound()
	
	TCCDebug.Log("Utility - Updating all found items...", 0)
	
	bUpdating = True
	DBM_SortWait.setvalue(1)
	
	SendModEvent("TCCUpdate")	
	FinishUpdate(5)
endFunction

;;-- Functions ---------------------------------------

function FinishUpdate(Int _Wait)
	
	Wait(_Wait)
	
	while bUpdating	
		if RN_Found_Done.GetValue() == RN_Found_Registered.GetValue()	
			
			RN_Found_Done.setvalue(0)
			DBM_SortWait.setvalue(0)
			RN_Found_Registered.setvalue(0)
			bUpdating = False
		endIf		
	endWhile
	
	TCCDebug.Log("Utility - Completed update", 0)
endFunction		

;;-- Functions ---------------------------------------

Function RebuildLists()
	
	TCCDebug.Log("Utility - Rebuild moreHUD Lists Request Received...", 0)
	
	Debug.Notification("The Curators Companion: Rebuilding moreHUD Lists...")
	Debug.Notification("The Curators Companion: Do not add / remove any items from inventory")
	
	DBM_SortWait.SetValue(1)
	
	dbmNew.revert()
	dbmFound.revert()
	dbmDisp.revert()	
			
	Int _Total = dbmMaster.GetSize()
	Int _Index = 0
	While _Index < _Total
		form _item = dbmMaster.GetAt(_Index) as form
		dbmNew.AddForm(_item)	
		if _Index == 500 || _Index == 1000 || _Index == 1500 || _Index == 2000 || _Index == 2500 || _Index == 3000 || _Index == 3500 || _Index == 4000
			Debug.Notification("The Curators Companion: Rebuilding moreHUD Lists... (" + _Index + " / " + _Total + ")")
			Debug.Notification("The Curators Companion: Do not add / remove any items from inventory")
		endIf
		_Index += 1
	endWhile
		
	CreateMoreHudLists()

	DBM_SortWait.SetValue(0)
	
	Debug.Notification("The Curators Companion: moreHUD Lists Rebuilt & Ready")
	TCCDebug.Log("Utility - Rebuild moreHUD Lists Request Completed", 0)
	TCCDebug.Log("Utility - dbmNew = " + dbmNew.GetSize() as Int, 0)
	TCCDebug.Log("Utility - dbmFound = " + dbmFound.GetSize() as Int, 0)
	TCCDebug.Log("Utility - dbmDisp = " + dbmDisp.GetSize() as Int, 0)
	TCCDebug.Log("Utility - dbmMaster = " + dbmMaster.GetSize() as Int, 0)
endFunction

;;-- Functions ---------------------------------------

Function SetUpSafehouse()
	
	TCCDebug.Log("Utility - Enable Safehouse Request Received...", 0)
	
	DBM_SortWait.setvalue(1)
	bSettingup = true
	
	Int _Index = _SafehouseContainerList.GetSize()
	While _Index
		_Index -= 1
		ObjectReference _Container = _SafehouseContainerList.GetAT(_Index) as ObjectReference
		TCC_TokenList.AddForm(_Container)
		TCCDebug.Log("Utility - Added Safehouse Container " +  _Container.GetBaseObject().GetName() + " to TCC_TokenList", 0)
	endWhile
	SendModEvent("Update_TokenArray", "Updating Token Array")
	SendModEvent("TCCSetup_SH")
	
	Debug.Notification("The Curators Companion: Adding Safehouse Integration...")
	
	Wait(5)
	
	while bSettingup	
		if RN_Safehouse_Done.GetValue() == RN_Safehouse_Registered.GetValue()	

			Int Index = 0
			Int ListSize = _SafehouseContainerList_WP.GetSize() ;;Check safehouse items found
			While Index < ListSize
				ObjectReference _Container = _SafehouseContainerList_WP.GetAt(Index) as ObjectReference
				TCCDebug.Log("Utility - Updating items in [" + _Container.GetBaseObject().GetName() + "]" + _Container, 0)
				Int Index2 = 0
				Int ContainerList = _Container.GetNumItems()
				while Index2 < ContainerList	
					Form _ItemRelic = _Container.GetNthForm(Index2)			
					if TCC_ItemList_Safehouse.HasForm(_ItemRelic)
						if !TCC_FoundList_Safehouse.HasForm(_ItemRelic)
							TCC_FoundList_Safehouse.AddForm(_ItemRelic)
						endIf
					endIf
					Index2 += 1
				endWhile
				Index += 1
			endWhile
			
			Index = TCC_TokenList.GetSize() ;; Check player and custom storage for found items.
			While Index
				Index -= 1
				ObjectReference _Container = TCC_TokenList.GetAt(Index) as ObjectReference	
				TCCDebug.Log("Utility - Updating items in [" + _Container.GetBaseObject().GetName() + "]" + _Container, 0)				
				Int _Index2 = _Container.GetNumItems()
				While _Index2
					_Index2 -= 1
					Form _ItemRelic = _Container.GetNthForm(_Index2)
					if dbmNew.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
						dbmNew.RemoveAddedForm(_ItemRelic)
						dbmFound.AddForm(_ItemRelic)
					endIf
				endWhile
			endWhile
			
			sendmodevent("SH_Update")	
			
			Wait(5)
			
			InitGlobals()
			bSettingup = False
			DBM_SortWait.setvalue(0)
			RN_Safehouse_Done.setvalue(0)
			RN_Safehouse_Registered.setvalue(0)
			TCC_SafehouseSetupFinished.Show()
		endIf		
	endWhile
	
	TCCDebug.Log("Utility - Enable Safehouse Request Completed", 0)
endFunction

;;-- Functions ---------------------------------------

Event SetUpAchievements()
	
	TCCDebug.Log("Utility - Enable Achievements Request Received...", 0)	
	
	DBM_SortWait.setvalue(1)
	RN_Setup_Start.setvalue(1)
	bSetupStarted = True
	Debug.Notification("The Curators Companion: Enabling Achievements System...")
	SendModEvent("TCCSetup_Uniques")
	Wait(5)
	
	while bSetupStarted	
		if RN_Setup_Done.GetValue() == RN_Setup_Registered.GetValue() 
			CreateMoreHudLists()
			InitGlobals()
			SendModEvent("TCCUpdate_Counts_Uniques")
			
			TCC_Achievements_Xmarker.Enable()
	
			RN_Setup_Start.setvalue(0)
			RN_Setup_Done.setvalue(0)
			RN_Setup_Registered.setvalue(0)
			DBM_SortWait.setvalue(0)				
			bSetupStarted = False
			TCC_UniquesSetupFinished.Show()
		endIf
	endWhile

	TCCDebug.Log("Utility - Enable Achievements Request Completed", 0)	
endEvent

;;-- Functions ---------------------------------------

Event UpdatePatches()
	
	TCCDebug.Log("Utility - Update Patch(es) request received...", 0)	
	DBM_SortWait.setvalue(1)
	RN_Setup_Start.setvalue(1)
	bSetupStarted = True
	
	RN_SupportedModCount.setvalue(0)
	RN_CustomModCount.setvalue(0)
	
	SendModEvent("TCCUpdate_Patches")
	
	if RN_MCM.Achievements_Enabled
		SendModEvent("TCCUpdate_Uniques")
	endIf	
	
	ModUpdateStartup.Show()
	Wait(5)
	
	while bSetupStarted	
		if RN_Setup_Done.GetValue() == RN_Setup_Registered.GetValue() 
			RN_MCM.BuildPatchArray(true, true)
			RebuildLists()	
			InitGlobals()
			
			SendModEvent("TCCUpdate_Counts")
			
			if RN_MCM.Achievements_Enabled
				SendModEvent("TCCUpdate_Counts_Uniques")
			endIf	
			
			ModUpdateFinished.Show()
			
			RN_Setup_Start.setvalue(0)
			RN_Setup_Done.setvalue(0)
			RN_Setup_Registered.setvalue(0)
			DBM_SortWait.setvalue(0)				
			bSetupStarted = False	
		endIf
	endWhile
	TCCDebug.Log("Utility - Update Patch(es) request Completed", 0)
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ End of Main Script ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
