scriptname RN_Utility_Script extends quest

import AhzMoreHud
import AhzMoreHudIE

import utility

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

message property UserSettingsLoaded auto
message property UserSettingsNone auto

bool bScanning
bool bScanAll
bool bUpdating
bool bMoreHUDListsCreated
bool bSetupStarted

formlist property DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Merged auto
formlist property DBM_Section_DG_HOLE_HOO_NS_GH_HOS_Found auto

formlist property DBM_Section_HOH_LIB_Merged auto
formlist property DBM_Section_HOH_LIB_Found auto

;;MoreHud
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto

formlist property DBM_ReplicaBaseItems auto
formlist property DBM_ReplicaItems auto

;;Listeners
formlist property DBM_RN_QuestDisplays auto
formlist property DBM_RN_Quest_Stage_Displays auto
formlist property DBM_RN_ExplorationDisplays auto

;;Custom Storage
formlist property RN_TokenFormlist auto

;;Treasury 
miscobject property Gold001 auto

;;Player Ref 
objectreference property PlayerRef auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Global Variables ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

globalvariable property RN_SupportedModCount auto

globalvariable property RN_moreHUD_Option auto

globalvariable property DBM_SortWait auto

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
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------- Start of Script -----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
function OnInit()
	
	RN_Debug_Access.SetValue(RandomInt(0, 250))
	RN_Debug_Randomiser.SetValue(RandomInt(251, 500))
	RN_TokenFormlist.AddForm(PlayerRef)
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
		RN_Setup_Start.SetValue(1)	
	
		bSetupStarted = True
		DBM_SortWait.setvalue(1)
		RN_Mod.CheckSupportedMods()
		RN_Array.CreatePatchArray()
		
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
			if RN_Array._bPatches[_Index]
				SendModEvent(RN_Array._Patches[_Index])
				RN_Setup_Sent.Mod(1)
				RN_SupportedModCount.Mod(1)
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
				
		
	RN_MoreHud_Option.SetValue(1)	
	
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

	RN_Quest_Listener_Total.Mod(DBM_RN_QuestDisplays.GetSize())
	RN_Quest_Listener_Total.Mod(DBM_RN_Quest_Stage_Displays.GetSize())
	RN_Exploration_Listener_Total.Mod(DBM_RN_ExplorationDisplays.GetSize())
	
	if (RN_Mod.XX_ForgottenL)
		RN_Quest_Listener_Total.Mod(3) ;;[+1 Civil War] [+1 Dawnguard] [+1 The Bards] [-1 Dark Brotherhood] [+1 The Forgotten City] 
	else
		RN_Quest_Listener_Total.Mod(2) ;;[+1 Civil War] [+1 Dawnguard] [+1 The Bards] [-1 Dark Brotherhood]
	endIf
	
	UpdateCurrentInstanceGlobal(RN_SupportedModCount)
	
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
	
	if RN_SupportedModCount.GetValue() > 0 				
		ModConfigFinished.Show()		;;Setup Finished - Ready to use.
	else
		ModConfigFinishedNoPatches.Show()
	endIf
	
	RN_Setup_Start.setvalue(0)
	RN_Setup_Finish.setvalue(1)
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
	
	RN_Debug_Access.SetValue(Utility.RandomInt(0, 250))
	RN_Debug_Randomiser.SetValue(Utility.RandomInt(251, 500))
	
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

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Scan Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function ScanAll()
	
	bScanAll = True
	DBM_SortWait.SetValue(1)
	DBM_ScanMuseum_Message.Show()
	SendModEvent("RunMuseumCheck")
	SendModEvent("RunArmoryCheck")
	RN_Scan_Sent.Mod(2)
	ScanMods()						
endFunction

;;-- Functions ---------------------------------------
		
function ScanMuseum()
			
	bScanning = True	
	DBM_SortWait.SetValue(1)
	DBM_ScanMuseum_Message.Show()
	SendModEvent("RunMuseumCheck")
	RN_Scan_Sent.Mod(1)
	
	while bScanning	
		if RN_Scan_Done.GetValue() == RN_Scan_Sent.GetValue()			
			bScanning = False
			
			RN_Scan_Done.SetValue(0)
			RN_Scan_Sent.SetValue(0)
			DBM_SortWait.SetValue(0)
			DBM_ScanMuseum_Finished_Message.Show()		
		endIf		
	endWhile	
endFunction

;;-- Functions ---------------------------------------
		
function ScanArmory()
	
	bScanning = True
	DBM_SortWait.SetValue(1)
	DBM_ScanMuseum_Message.Show()
	SendModEvent("RunArmoryCheck")
	RN_Scan_Sent.Mod(1)


	while bScanning	
		if RN_Scan_Done.GetValue() == RN_Scan_Sent.GetValue()			
			bScanning = False
			
			RN_Scan_Done.SetValue(0)
			RN_Scan_Sent.SetValue(0)
			DBM_SortWait.SetValue(0)
			DBM_ScanMuseum_Finished_Message.Show()		
		endIf		
	endWhile		
endFunction

;;-- Functions ---------------------------------------
		
function ScanMods()
	
	bScanning = True
	DBM_SortWait.SetValue(1)
	
	if !bScanAll		
		DBM_ScanMuseum_Message.Show()		
	endIf

	Int _Index = 0
	Int _ArraySize = RN_Array._ModScan.length
		While _Index < _ArraySize	
			if RN_Array._bPatches[_Index] && RN_Array._GVComplete[_Index].GetValue() == 0
				SendModEvent(RN_Array._ModScan[_Index])
				RN_Scan_Sent.Mod(1)
			endIf
			_Index +=1
		endWhile
		
;;------------------------------------

	while bScanning	
		if RN_Scan_Done.GetValue() == RN_Scan_Sent.GetValue()			
			bScanning = False
			bScanAll = False
			
			RN_Scan_Done.SetValue(0)
			RN_Scan_Sent.SetValue(0)
			DBM_SortWait.SetValue(0)
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
	DBM_SortWait.SetValue(1)
	
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
			DBM_SortWait.SetValue(0)
			RN_Found_Done.SetValue(0)
			RN_Found_Sent.SetValue(0)
		endIf		
	endWhile
endFunction		

;;-- Functions ---------------------------------------

Function UpdateTreasuryValue(ObjectReference _akContainer, GlobalVariable _akVariable)
	
	_akVariable.SetValue(0)
	
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

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ End of Script -----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------