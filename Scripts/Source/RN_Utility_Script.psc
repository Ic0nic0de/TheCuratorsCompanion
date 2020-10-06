scriptname RN_Utility_Script extends quest

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Script Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

import AhzMoreHud
import AhzMoreHudIE

import utility

RN_Utility_SafehouseContainerMonitor property SHContainerScript1 auto
RN_Utility_SafehouseContainerMonitor property SHContainerScript2 auto
RN_Utility_SafehouseContainerMonitor property SHContainerScript3 auto
RN_Utility_SafehouseContainerMonitor property SHContainerScript4 auto
RN_Utility_SafehouseContainerMonitor property SHContainerScript5 auto
RN_Utility_SafehouseContainerMonitor property SHContainerScript6 auto

RN_Utility_MCM property RN_MCM auto
RN_Utility_Mods property RN_Mod auto
RN_Utility_ArrayHolder property RN_Array auto
RN_Storage_Transfer property RN_Transfer auto
RN_Utility_PlayerInventoryMonitor property RN_Inventory auto

RN_Listener_Explore property RN_Explore auto
RN_Listener_Skills property RN_Skills auto
RN_Listener_Quest property RN_Quest auto
RN_Listener_Thane property RN_Thane auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Message Properties
message property DBM_ScanMuseum_Message auto
message property DBM_ScanMuseum_Finished_Message auto

message property ModConfigStartup auto
Message property ModConfigProgress Auto
Message property ModConfigFinished auto
message property ModConfigFinishedNoPatches auto

message property SetupComplete auto
message property ModStartup auto
message property ModStartupDone auto
message property ModStartup_UpdatingLists auto

message property UserSettingsLoaded auto
message property UserSettingsNone auto

message property moreHUDListRebuilt auto

bool bSettingup
bool bScanning
bool bScanAll
bool bUpdating
bool bMoreHUDListsCreated
bool bSetupStarted

;;Treasury 
miscobject property Gold001 auto

;;Player Ref 
objectreference property PlayerRef auto

int _OldPatchCount
int _OldCreationCount
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Formlist Properties ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Merged & Found Item list 1
formlist property DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged auto
formlist property DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Found auto

;;Merged & Found Item list 2
formlist property DBM_Section_HOH_LIB_Merged auto
formlist property DBM_Section_HOH_LIB_Found auto

;;MoreHud
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto
formlist property dbmMaster auto

;;Safehouse formlists
formlist property RN_Safehouse_Items_Merged auto
formlist property RN_Safehouse_Items_Found auto

;;Listeners
formlist property DBM_RN_QuestDisplays auto
formlist property DBM_RN_Quest_Stage_Displays auto
formlist property DBM_RN_ExplorationDisplays auto

;;Custom Storage
formlist property RN_TokenFormlist auto

;;Main Storage
formlist property _MuseumContainerList auto
formlist property _MuseumContainerList_WP auto
formlist property _SafehouseContainerList auto
formlist property _SafehouseContainerList_WP auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Global Variables --------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

globalvariable property RN_SupportedModCount auto
globalvariable property RN_SupportedCreationCount auto

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

globalvariable property GV_SectionHallofHeroes auto
globalvariable property GV_SectionDaedricGallery auto
globalvariable property GV_SectionHOLE auto

GlobalVariable Property RN_Installed_SafehouseGeneral Auto
GlobalVariable Property RN_Installed_TFC Auto
GlobalVariable Property RN_Installed_SafehousePlus Auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Patches -----------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Formlist Property RN_Patches_Installed auto
Formlist Property RN_Patches_Complete auto
Formlist Property RN_Patches_Count auto
Formlist Property RN_Patches_Total auto

Formlist Property RN_Creations_Installed auto
Formlist Property RN_Creations_Complete auto
Formlist Property RN_Creations_Count auto
Formlist Property RN_Creations_Total auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------- Start of Script -----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
Event OnInit()

	RN_TokenFormlist.AddForm(PlayerRef)
	_MuseumContainerList_WP.AddForm(PlayerRef)
	_SafehouseContainerList_WP.AddForm(PlayerRef)
	Wait(5)
	RunSetup()	
endEvent

;;-- Events ---------------------------------------

Event RunSetup()

	if RN_Setup_Finish.GetValue()		
		SetupComplete.Show()		
	else
	
		ModConfigStartup.Show() 
		RN_Setup_Start.setvalue(1)		
		bSetupStarted = True
		DBM_SortWait.setvalue(1)
		RN_Mod.CheckSupportedMods()
		
;;------------------------------------	

		while bSetupStarted	
			if RN_Setup_Done.GetValue() == RN_Setup_Registered.GetValue() 
				
				CreateMoreHudLists()
				InitGlobals()
				
				RN_Explore.OnPlayerLoadGame()	;; Fire off Exploration Listener.
				RN_Quest.OnPlayerLoadGame()		;; Fire off Quest Listener.
				RN_Thane.OnPlayerLoadGame()		;; Fire off Thane Listener.
				RN_Skills.OnPlayerLoadGame()	;; Fire off Skills Listener.		
				RN_Transfer.OnPlayerLoadGame()	;; Fire off Auto Transfer.
				RN_Inventory.OnPlayerLoadGame()	;; Fire off Inventory Manager.
				
				UpdateCurrentInstanceGlobal(RN_SupportedModCount)
				UpdateCurrentInstanceGlobal(RN_SupportedCreationCount)
	
				Int _Menu = ModConfigProgress.Show() 
				if _Menu == 0
					UpdateAllFound()
					ScanMuseum()	
				elseif _Menu == 1
					UpdateAllFound()	
				endIf

				RN_MCM.Begin_Config_Load()
				
				if RN_MCM._UserSettings
					UserSettingsLoaded.Show()
				else
					UserSettingsNone.Show()
				endIf
				
				if RN_SupportedModCount.GetValue() > 0 || RN_SupportedCreationCount.GetValue() > 0 				
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
						
			endIf
		endWhile	
	endIf
endEvent
				
;;-- Functions ---------------------------------------

function CreateMoreHudLists()		
		
	Int _Index = _MuseumContainerList.GetSize()	;;Check museum containers for displayed items.	
	While _Index 
		_Index -= 1
		ObjectReference _Container = _MuseumContainerList.GetAt(_Index) as ObjectReference
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
			
	_Index = RN_TokenFormlist.GetSize() ;; Check player and custom storage for found items.
	While _Index
		_Index -= 1
		ObjectReference _Container = RN_TokenFormlist.GetAt(_Index) as ObjectReference		
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

	if RN_Installed_SafehouseGeneral.GetValue() ; Check safehouse storage for displayed items.		
		
		SHContainerScript1.UpdateDisplays()
		SHContainerScript2.UpdateDisplays()
		SHContainerScript3.UpdateDisplays()
		SHContainerScript4.UpdateDisplays()
		SHContainerScript5.UpdateDisplays()
		SHContainerScript6.UpdateDisplays()
		
		if RN_Installed_SafehousePlus.GetValue()
			ObjectReference _DwemerDisplay = Game.GetFormFromFile(0x00A44, "DBM_SafehousePlus_Addon.esp") as ObjectReference
			if _DwemerDisplay
				(_DwemerDisplay as RN_Utility_SafehouseContainerMonitor).UpdateDisplays()
			endIf
		endIf	
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
	
endFunction

;;-- Events ---------------------------------------

Event InitGlobals()

	RN_Quest_Listener_Total.setvalue(0)
	RN_Exploration_Listener_Total.setvalue(0)
	
	RN_Quest_Listener_Total.Mod(DBM_RN_QuestDisplays.GetSize())
	RN_Quest_Listener_Total.Mod(DBM_RN_Quest_Stage_Displays.GetSize())
	RN_Exploration_Listener_Total.Mod(DBM_RN_ExplorationDisplays.GetSize())
	
	if (RN_Installed_TFC.GetValue())
		RN_Quest_Listener_Total.Mod(3) ;;[+1 Civil War] [+1 Dawnguard] [+1 The Bards] [-1 Dark Brotherhood] [+1 The Forgotten City] 
	else
		RN_Quest_Listener_Total.Mod(2) ;;[+1 Civil War] [+1 Dawnguard] [+1 The Bards] [-1 Dark Brotherhood]
	endIf
	
	Int _Index = 0
	Int _Length = RN_Array._Armory_Global_Total.length
	While _Index < _Length
		if _Index == 11
			RN_Array._Armory_Global_Total[_Index].SetValue(RN_Array._Armory_Formlist_Displays[_Index].GetSize() + 9)
		else
			RN_Array._Armory_Global_Total[_Index].SetValue(RN_Array._Armory_Formlist_Displays[_Index].GetSize())
		endIf
		_Index += 1
	endWhile

	 _Index = 0
	 _Length = RN_Array._Museum_Global_Total.length
	While _Index < _Length
		if _Index == 0
			RN_Array._Museum_Global_Total[_Index].SetValue(RN_Array._Museum_Formlist_Merged[_Index].GetSize() + 9)
		else
			RN_Array._Museum_Global_Total[_Index].SetValue(RN_Array._Museum_Formlist_Merged[_Index].GetSize())
		endIf
		_Index += 1
	endWhile
endEvent	
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Load Game Funcions ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
Function Maintenance()

	_OldPatchCount = RN_SupportedModCount.GetValue() as Int
	_OldCreationCount = RN_SupportedCreationCount.GetValue() as Int
		
	if RN_MCM.ShowStartup
		ModStartup.Show()
	endIf
	
	RN_Mod.CheckSupportedMods()
	
	if RN_Setup_Registered.GetValue()
		Wait(10)
	endIf
	
	RN_TokenFormlist.AddForm(PlayerRef)
	_SafehouseContainerList_WP.AddForm(PlayerRef)

;;--------------

	RN_Setup_Finish.setvalue(0)
	RN_Setup_Start.setvalue(1)	

	bSetupStarted = True
	DBM_SortWait.setvalue(1)

	while bSetupStarted		
		if RN_Setup_Done.GetValue() == RN_Setup_Registered.GetValue() 
		
			UpdateCurrentInstanceGlobal(RN_SupportedModCount)
			UpdateCurrentInstanceGlobal(RN_SupportedCreationCount)	
			
			if RN_SupportedModCount.GetValue() > _OldPatchCount ||  RN_SupportedCreationCount.GetValue() > _OldCreationCount
				ModStartup_UpdatingLists.Show()
				CreateMoreHudLists()
				UpdateAllFound()
				RN_MCM.Build_Arrays()
			endIf
			bSetupStarted = False
		endIf
	endWhile	
	
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
	DBM_SortWait.setvalue(0)

	if RN_MCM.ShowStartup
		ModStartupDone.Show()
	endIf
	
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Scan Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function ScanMuseum()
	
	if RN_MCM.ScanNotificationsval
		DBM_ScanMuseum_Message.Show()
	endIf
	
	bScanning = True
	DBM_SortWait.setvalue(1)

	SendModEvent("TCCScan")
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
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------- Update Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function UpdateAllFound()
		
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
endFunction		

;;-- Functions ---------------------------------------

Function UpdateTreasuryValue(ObjectReference _akContainer, GlobalVariable _akVariable)
	
	_akVariable.setvalue(0)
	
	Int _Index = _akContainer.GetNumItems()
	
	while _Index > 0
		_Index -= 1
		Form _Item = _akContainer.GetNthForm(_Index)
		Int _Count = _akContainer.GetItemCount(_Item)
		
		if _Item != Gold001
			_akVariable.Mod(_Item.GetGoldValue() * _Count)
		endIf
	endWhile
	
	_akVariable.Mod(_akContainer.GetItemCount(Gold001))	
endFunction

;;-- Functions ---------------------------------------

Function RebuildLists()
	
	Debug.Notification("The Curators Companion: Rebuilding moreHUD Lists...")
	
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
		endIf
		_Index += 1
	endWhile
		
	CreateMoreHudLists()
	
	Debug.Notification("The Curators Companion: moreHUD Lists Rebuilt & Ready")
	
	DBM_SortWait.SetValue(0)
endFunction

;;-- Functions ---------------------------------------

Function SetUpSafehouse()

	DBM_SortWait.setvalue(1)
	bSettingup = true
	
	Int _Index = _SafehouseContainerList.GetSize()
	While _Index
		_Index -= 1
		ObjectReference _Container = _SafehouseContainerList.GetAT(_Index) as ObjectReference
		RN_TokenFormlist.AddForm(_Container)
	endWhile
	
	SendModEvent("TCCSetup_SH")
	
	Debug.Notification("The Curators Companion: Adding Safehouse Integration...")
	
	Wait(5)
	
	while bSettingup	
		if RN_Safehouse_Done.GetValue() == RN_Safehouse_Registered.GetValue()	

			Int Index = 0
			Int ListSize = _SafehouseContainerList_WP.GetSize() ;;Check safehouse items found
			While Index < ListSize
				ObjectReference _Container = _SafehouseContainerList_WP.GetAt(Index) as ObjectReference
				Int Index2 = 0
				Int ContainerList = _Container.GetNumItems()
				while Index2 < ContainerList	
					Form _ItemRelic = _Container.GetNthForm(Index2)			
					if RN_Safehouse_Items_Merged.HasForm(_ItemRelic)
						if !RN_Safehouse_Items_Found.HasForm(_ItemRelic)
							RN_Safehouse_Items_Found.AddForm(_ItemRelic)
						endIf
					endIf
					Index2 += 1
				endWhile
				Index += 1
			endWhile

			Index = RN_TokenFormlist.GetSize() ;; Check player and custom storage for found items.
			While Index
				Index -= 1
				ObjectReference _Container = RN_TokenFormlist.GetAt(Index) as ObjectReference		
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
			
			SHContainerScript1.UpdateDisplays()
			SHContainerScript2.UpdateDisplays()
			SHContainerScript3.UpdateDisplays()
			SHContainerScript4.UpdateDisplays()
			SHContainerScript5.UpdateDisplays()
			SHContainerScript6.UpdateDisplays()	
			
			if RN_Installed_SafehousePlus.GetValue()
				ObjectReference _DwemerDisplay = Game.GetFormFromFile(0x00A44, "DBM_SafehousePlus_Addon.esp") as ObjectReference
				if _DwemerDisplay
					(_DwemerDisplay as RN_Utility_SafehouseContainerMonitor).UpdateDisplays()
				endIf
			endIf		
			
			InitGlobals()
			bSettingup = False
			DBM_SortWait.setvalue(0)
			RN_Safehouse_Done.setvalue(0)
			RN_Safehouse_Registered.setvalue(0)
			Debug.Notification("The Curators Companion: Safehouse Integration Done")
		endIf		
	endWhile
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ End of Main Script ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
