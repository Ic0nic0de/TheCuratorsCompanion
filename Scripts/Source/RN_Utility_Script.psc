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

RN_Utility_Mods property RN_Mod auto

RN_Utility_ArrayHolder property RN_Array auto

RN_Utility_PlayerInventoryMonitor property RN_Inventory auto

RN_Storage_Transfer property RN_Transfer auto

RN_Utility_MCM property RN_MCM auto

RN_Listener_Explore property RN_Explore auto
RN_Listener_Quest property RN_Quest auto
RN_Listener_Thane property RN_Thane auto
RN_Listener_Skills property RN_Skills auto

DBM_ReplicaHandler property ReplicaHandler auto

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

;;Replica Formlists
formlist property DBM_ReplicaBaseItems auto
formlist property DBM_ReplicaItems auto

;;Safehouse formlists
formlist property RN_Safehouse_Items_Merged auto
formlist property RN_Safehouse_Items_Found auto

;;Listeners
formlist property DBM_RN_QuestDisplays auto
formlist property DBM_RN_Quest_Stage_Displays auto
formlist property DBM_RN_ExplorationDisplays auto

;;Custom Storage
formlist property RN_TokenFormlist auto
formlist property _SafehouseContainerList_WP auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Global Variables --------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

globalvariable property RN_SupportedModCount auto
globalvariable property RN_SupportedCreationCount auto

globalvariable property RN_moreHUD_Option auto

globalvariable property DBM_SortWait auto

globalvariable property RN_Safehouse_Sent auto
globalvariable property RN_Safehouse_Done auto

globalvariable property RN_Setup_Start auto
globalvariable property RN_Setup_Done auto
globalvariable property RN_Setup_Sent auto
globalvariable property RN_Setup_Finish auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Sent auto

globalvariable property RN_Found_Done auto
globalvariable property RN_Found_Sent auto

globalvariable property RN_Debug_Access auto
globalvariable property RN_Debug_Randomiser auto

globalvariable property RN_Quest_Listener_Total auto
globalvariable property RN_Exploration_Listener_Total auto

globalvariable property GV_SectionHallofHeroes auto
globalvariable property GV_SectionDaedricGallery auto
globalvariable property GV_SectionHOLE auto

GlobalVariable Property RN_Installed_SafehouseGeneral Auto
GlobalVariable Property RN_Installed_TFC Auto
GlobalVariable Property RN_Installed_SafehousePlus Auto
GlobalVariable Property RN_Installed_Chrysamere Auto
GlobalVariable Property RN_Installed_DawnfangDuskfang Auto
GlobalVariable Property RN_Installed_DivineCrusader Auto
GlobalVariable Property RN_Installed_NetchLeatherArmor Auto
GlobalVariable Property RN_Installed_SaintsL Auto
GlobalVariable Property RN_Installed_SunderWraithguard Auto
GlobalVariable Property RN_Installed_StaffofHasedoki Auto
GlobalVariable Property RN_Installed_StendarrsHammer Auto
GlobalVariable Property RN_Installed_Shadowrend_Boethiah Auto
GlobalVariable Property RN_Installed_DeadMansDread_Standalone Auto
GlobalVariable Property RN_Installed_DeadMansDread_Oblivion Auto	

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------- Start of Script -----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
function OnInit()
	
	RN_Debug_Access.setvalue(RandomInt(0, 250))
	RN_Debug_Randomiser.setvalue(RandomInt(251, 500))
	RN_TokenFormlist.AddForm(PlayerRef)
	_SafehouseContainerList_WP.AddForm(PlayerRef)
	Wait(5.0)
	RunSetup()	
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Setup Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event RunSetup()

	if RN_Setup_Finish.GetValue()
		
		SetupComplete.Show()
		
	else
	
		ModConfigStartup.Show() 
		RN_Setup_Start.setvalue(1)	
	
		bSetupStarted = True
		DBM_SortWait.setvalue(1)
		RN_Mod.CheckSupportedMods()
		
		Int _Index = 0
		Int _ArraySize = RN_Array._ModSetup.length
		While _Index < _ArraySize
			SendModEvent(RN_Array._ModSetup[_Index])
			RN_Setup_Sent.Mod(1)
			_Index +=1
		endWhile
		
		_Index = 0
		_ArraySize = RN_Array._Patches.length
		While _Index < _ArraySize	
			if RN_Array._bPatches[_Index].GetValue() && !RN_Array._GVComplete[_Index].GetValue()
				SendModEvent(RN_Array._Patches[_Index])
				RN_Setup_Sent.Mod(1)
			endIf
			_Index +=1
		endWhile

		_Index = 0
		_ArraySize = RN_Array._Creations.length
		While _Index < _ArraySize	
			if RN_Array._bCreations[_Index].GetValue() && !RN_Array._GVCreationComplete[_Index].GetValue()
				SendModEvent(RN_Array._Creations[_Index])
				RN_Setup_Sent.Mod(1)
			endIf
			_Index +=1
		endWhile
		
;;------------------------------------	

		while bSetupStarted		
			if RN_Setup_Done.GetValue() == RN_Setup_Sent.GetValue() 
				
				CreateMoreHudLists()	
				InitGlobals()
				FireScripts()
				FinishSetup()
				bSetupStarted = False
						
			endIf
		endWhile	
	endIf
endEvent
				
;;-- Functions ---------------------------------------

function CreateMoreHudLists()		
		
	Int _Index = RN_Array._MuseumContainerArray.length	;;Check museum containers for displayed items.	
	While _Index 
		_Index -= 1
		Int _Index2 = RN_Array._MuseumContainerArray[_Index].GetNumItems()
		while _Index2
			_Index2 -= 1		
			Form _ItemRelic = RN_Array._MuseumContainerArray[_Index].GetNthForm(_Index2)
			if dbmNew.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic) || dbmFound.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic) 
				processForm(_ItemRelic, true)
			endIf
		endWhile
	endWhile
	
	if RN_Installed_SafehouseGeneral.GetValue()
		Int Index = 0
		Int ListSize = RN_Array._SafehouseContainerList.GetSize()
		While Index < ListSize
			ObjectReference _Container = RN_Array._SafehouseContainerList.GetAt(Index) as ObjectReference
			Int Index2 = 0
			Int ContainerList = _Container.GetNumItems()
			while Index2 < ContainerList	
				Form _ItemRelic = _Container.GetNthForm(Index2)			
				if dbmNew.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic) || dbmFound.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic) 
					processForm(_ItemRelic, true)
				endIf
				Index2 += 1
			endWhile
			Index += 1
		endWhile
	endIF
			
	_Index = RN_TokenFormlist.GetSize() ;; Check player and custom storage for found items.
	While _Index
		_Index -= 1
		ObjectReference _Container = RN_TokenFormlist.GetAt(_Index) as ObjectReference		
		Int _Index2 = _Container.GetNumItems()
		While _Index2
			_Index2 -= 1
			Form _ItemRelic = _Container.GetNthForm(_Index2)
			if dbmNew.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
				processForm(_ItemRelic, false)
			endIf
		endWhile
	endWhile
				
		
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

;;-- Functions ---------------------------------------

function processForm(form _ItemRelic, bool _Displayed)

	updateFormlists(_ItemRelic, _Displayed)
	
	if RN_MCM.ReplicaTag 	
		if DBM_ReplicaBaseItems.HasForm(_ItemRelic)											;; If the item being processed is a "Base Item" ...				
			updateFormlists(ReplicaHandler.GetReplica(_ItemRelic), _Displayed)				;; ... we also need to process the replica
				
		elseif DBM_ReplicaItems.HasForm(_ItemRelic)											;; If the item being processed is a "Replica" ...
			updateFormlists(ReplicaHandler.GetOriginal(_ItemRelic), _Displayed)				;; ... we also need to process the original

		endIf
	endIf
	
endFunction

;;-- Functions ---------------------------------------

function updateFormlists(form _ItemRelic, bool _Displayed)

	if _Displayed
		dbmNew.RemoveAddedForm(_ItemRelic)
		dbmFound.RemoveAddedForm(_ItemRelic)
		dbmDisp.AddForm(_ItemRelic)
		
	else
		dbmNew.RemoveAddedForm(_ItemRelic)
		dbmFound.AddForm(_ItemRelic)
	endIf
	
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
	
	UpdateCurrentInstanceGlobal(RN_SupportedModCount)
	UpdateCurrentInstanceGlobal(RN_SupportedCreationCount)
	
	RN_Setup_Done.setvalue(0)
	RN_Setup_Sent.setvalue(0)	
	DBM_SortWait.setvalue(0)
endEvent

;;-- Events ---------------------------------------

Event FireScripts()

	RN_Explore.OnPlayerLoadGame()	;; Fire off Exploration Listener.
	RN_Quest.OnPlayerLoadGame()		;; Fire off Quest Listener.
	RN_Thane.OnPlayerLoadGame()		;; Fire off Thane Listener.
	RN_Skills.OnPlayerLoadGame()	;; Fire off Skills Listener.		
	RN_Transfer.OnPlayerLoadGame()	;; Fire off Auto Transfer.
	RN_Inventory.OnPlayerLoadGame()	;; Fire off Inventory Manager.
endEvent

;;-- Events ---------------------------------------

Event FinishSetup()
	
	UpdateGlobalsforCC()
	
	Int _Menu = ModConfigProgress.Show() 
	if _Menu == 0
		UpdateAllFound()
		ScanAll()
			
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
		ModConfigFinished.Show()		;;Setup Finished - Ready to use.
	else
		ModConfigFinishedNoPatches.Show()
	endIf
	
	RN_Setup_Start.setvalue(0)
	RN_Setup_Finish.setvalue(1)
endEvent

;;-- Events ---------------------------------------

Event UpdateGlobalsforCC()

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
	
	if RN_Installed_Chrysamere.GetValue() ;;Chrysamere
		GV_SectionHallofHeroes.Mod(-1)
	endIf
	
	if RN_Installed_DawnfangDuskfang.GetValue() ;;Dawnfang & Duskfang
		GV_SectionHallofHeroes.Mod(-1)
	endIf
	
	if RN_Installed_DeadMansDread_Standalone.GetValue() ;;Dead Mans Dread
		GV_SectionHallofHeroes.Mod(-1)
	endIf

	if RN_Installed_DeadMansDread_Oblivion.GetValue() ;;Dead Mans Dread
		GV_SectionHallofHeroes.Mod(-2)
	endIf
	
	if RN_Installed_DivineCrusader.GetValue() ;;Divine Crusader
		GV_SectionHallofHeroes.Mod(-7)
	endif

	if RN_Installed_NetchLeatherArmor.GetValue() ;;Netch Leather Armor
		GV_SectionHallofHeroes.Mod(-1)
	endif

	if RN_Installed_SaintsL.GetValue() ;;Saints & Seducers
		GV_SectionDaedricGallery.Mod(-1)
	endif

	if RN_Installed_Shadowrend_Boethiah.GetValue() ;;Shadowrend
		GV_SectionDaedricGallery.Mod(-1)
	endif	
	
	if RN_Installed_StaffofHasedoki.GetValue() ;;Staff of Hasedoki
		GV_SectionHallofHeroes.Mod(-1)
	endif	
	
	if RN_Installed_StendarrsHammer.GetValue() ;;Stendarrs Hammer
		GV_SectionHallofHeroes.Mod(-1)
	endif
	
	if RN_Installed_SunderWraithguard.GetValue() ;;Sunder & Wraithguard
		GV_SectionHOLE.Mod(-2)
	endif
endEvent	
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Load Game Funcions ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
Function Maintenance()
	
	if RN_MCM.ShowStartup
		ModStartup.Show()
	endIf
	
	Utility.Wait(5)
	
	RN_Mod.CheckSupportedMods()
	
	RN_TokenFormlist.AddForm(PlayerRef)
	_SafehouseContainerList_WP.AddForm(PlayerRef)
	
	RN_Debug_Access.setvalue(Utility.RandomInt(0, 250))
	RN_Debug_Randomiser.setvalue(Utility.RandomInt(251, 500))

;;--------------
	RN_Setup_Finish.setvalue(0)
	RN_Setup_Start.setvalue(1)	

	bSetupStarted = True
	DBM_SortWait.setvalue(1)

	
	_OldPatchCount = RN_SupportedModCount.GetValue() as Int
	_OldCreationCount = RN_SupportedCreationCount.GetValue() as Int
	
	Int _Index = 0
	Int _ArraySize = RN_Array._Patches.length
	While _Index < _ArraySize	
		if (RN_Array._bPatches[_Index].GetValue()) && (RN_Array._GVComplete[_Index].GetValue() == 0)
			SendModEvent(RN_Array._Patches[_Index])
			RN_Setup_Sent.Mod(1)
		endIf
		_Index +=1
	endWhile

	_Index = 0
	_ArraySize = RN_Array._Creations.length
	While _Index < _ArraySize	
		if RN_Array._bCreations[_Index].GetValue() && RN_Array._GVCreationComplete[_Index].GetValue() == 0
			SendModEvent(RN_Array._Creations[_Index])
			RN_Setup_Sent.Mod(1)
		endIf
		_Index +=1
	endWhile
	
	WaitForMaintenance()	
	
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
	
	UpdateGlobalsforCC()
	
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

	if RN_MCM.ShowStartup
		ModStartupDone.Show()
	endIf
	
endFunction

Event WaitForMaintenance()

	while bSetupStarted		
		if RN_Setup_Done.GetValue() == RN_Setup_Sent.GetValue() 
	
			if RN_SupportedModCount.GetValue() > _OldPatchCount ||  RN_SupportedCreationCount.GetValue() > _OldCreationCount
				ModStartup_UpdatingLists.Show()
				CreateMoreHudLists()
				UpdateAllFound()
			endIf
	
			InitGlobals()
			bSetupStarted = False
			RN_Setup_Start.setvalue(0)
			RN_Setup_Finish.setvalue(1)
			
		endIf
	endWhile
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Scan Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function ScanAll()
	
	DBM_ScanMuseum_Message.Show()
	
	bScanAll = True
	bScanning = True
	DBM_SortWait.setvalue(1)
	
	ScanMuseum()
	if RN_SupportedModCount.GetValue() > 0
		ScanMods()
	endIf
	
	if RN_SupportedCreationCount.GetValue() > 0
		ScanCreations()
	endIf
	
	FinishScan()
	
endFunction

;;-- Functions ---------------------------------------
		
function ScanMuseum()

	if !bScanAll		
		DBM_ScanMuseum_Message.Show()
		bScanning = True
		DBM_SortWait.setvalue(1)		
	endIf
	
	Int _Index = 0
	Int _Length = RN_Array._Museum_Scan_EventNames.length
	While _Index < _Length
		SendModEvent(RN_Array._Museum_Scan_EventNames[_Index])
		RN_Scan_Sent.Mod(1)
		_Index += 1
		
		if _Index == 9 && !RN_SupportedCreationCount.GetValue() || _Index == 12 && !RN_Installed_SafehouseGeneral.GetValue()
			_Index += 1
		endIf	
	endWhile
	
	if !bScanAll	
		FinishScan()
	endIf	
endFunction

;;-- Functions ---------------------------------------
		
function ScanMods()
	
	if !bScanAll		
		DBM_ScanMuseum_Message.Show()
		bScanning = True
		DBM_SortWait.setvalue(1)		
	endIf
	
	Int _Index = 0
	Int _ArraySize = RN_Array._ModScan.length
		While _Index < _ArraySize	
			if RN_Array._bPatches[_Index].GetValue() && RN_Array._GVComplete[_Index].GetValue() == 0
				SendModEvent(RN_Array._ModScan[_Index])
				RN_Scan_Sent.Mod(1)
			endIf
			_Index +=1
		endWhile
		
	if !bScanAll	
		FinishScan()
	endIf		
endFunction

;;-- Functions ---------------------------------------
		
function ScanCreations()

	
	if !bScanAll		
		DBM_ScanMuseum_Message.Show()
		bScanning = True
		DBM_SortWait.setvalue(1)		
	endIf
	
	Int _Index = 0
	Int _ArraySize = RN_Array._CreationScan.length
		While _Index < _ArraySize	
			if RN_Array._bCreations[_Index].GetValue() && RN_Array._GVCreationComplete[_Index].GetValue() == 0
				SendModEvent(RN_Array._CreationScan[_Index])
				RN_Scan_Sent.Mod(1)
			endIf
			_Index +=1
		endWhile
		
	if !bScanAll	
		FinishScan()
	endIf
endFunction

;;-- Functions ---------------------------------------

function FinishScan()

	while bScanning	
		if RN_Scan_Done.GetValue() == RN_Scan_Sent.GetValue()			
			bScanning = False
			bScanAll = False
			
			RN_Scan_Done.setvalue(0)
			RN_Scan_Sent.setvalue(0)
			DBM_SortWait.setvalue(0)
			DBM_ScanMuseum_Finished_Message.Show()		
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
	
	Int _Index = 0
	Int _ArraySize = RN_Array._ModUpdate.length
	While _Index < _ArraySize
		SendModEvent(RN_Array._ModUpdate[_Index])
		RN_Found_Sent.Mod(1)
		_Index +=1
	endWhile

;;------------------------------------
		
	while bUpdating	
		if RN_Found_Done.GetValue() == RN_Found_Sent.GetValue()		
			bUpdating = False
			DBM_SortWait.setvalue(0)
			RN_Found_Done.setvalue(0)
			RN_Found_Sent.setvalue(0)
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

Function FullReset()
	
	if bSetupStarted
		RN_Setup_Done.SetValue(RN_Setup_Sent.GetValue())
	endIf
	
	RN_Setup_Start.setvalue(0)	
	RN_Setup_Finish.setvalue(0)
	RN_Setup_Sent.setvalue(0)
	RN_Setup_Done.setvalue(0)
	DBM_SortWait.setvalue(0)
	bSetupStarted = false
	bMoreHUDListsCreated = false
	
	Utility.Wait(5.0)
	RunSetup()
	RebuildLists()
	Debug.Notification("The Curators Companion: Mod Reset Complete")
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
	
	SendModEvent("RunSetup_D")
	SendModEvent("RunSetup_D1")
	RN_Safehouse_Sent.Mod(2)
	
	if RN_Installed_SafehousePlus.GetValue()
		SendModEvent("RunSafehousePlusSetup")
		SendModEvent("RunSafehousePlusSetup_D")
		RN_Safehouse_Sent.Mod(2)
	endIf
	
	Debug.Notification("The Curators Companion: Adding Safehouse Integration...")
	WaitForSafehouseSetup()
endFunction

;;-------------------------------

Function WaitForSafehouseSetup()

	while bSettingup	
		if RN_Safehouse_Sent.GetValue() == RN_Safehouse_Done.GetValue()	

			Int Index = 0
			Int ListSize = RN_Array._SafehouseContainerList.GetSize() ;;Update moreHUD icons on safehouse items
			While Index < ListSize
				ObjectReference _Container = RN_Array._SafehouseContainerList.GetAt(Index) as ObjectReference
				Int Index2 = 0
				Int ContainerList = _Container.GetNumItems()
				while Index2 < ContainerList	
					Form _ItemRelic = _Container.GetNthForm(Index2)			
					if dbmNew.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic) || dbmFound.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic) 
						processForm(_ItemRelic, true)
					endIf
					Index2 += 1
				endWhile
				Index += 1
			endWhile
		
			Index = 0
			ListSize = RN_Array._SafehouseContainerList_WP.GetSize() ;;Check safehouse items found
			While Index < ListSize
				ObjectReference _Container = RN_Array._SafehouseContainerList_WP.GetAt(Index) as ObjectReference
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
						processForm(_ItemRelic, false)
					endIf
				endWhile
			endWhile
			
			if RN_Installed_SafehousePlus.GetValue()
				SHContainerScript1.GoToState("")
				SHContainerScript2.GoToState("")
				SHContainerScript3.GoToState("")
				SHContainerScript4.GoToState("")
				SHContainerScript5.GoToState("")
				SHContainerScript6.GoToState("")
			endIF
			
			UpdateGlobalsforCC()
			bSettingup = False
			DBM_SortWait.setvalue(0)
			RN_Safehouse_Sent.setvalue(0)
			RN_Safehouse_Done.setvalue(0)
			Debug.Notification("The Curators Companion: Safehouse Integration Done")
		endIf		
	endWhile
endFunction	

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ End of Script -----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------