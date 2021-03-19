scriptname RN_Utility_Script extends quest

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Script Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

import AhzMoreHud
import AhzMoreHudIE

import utility

RN_Utility_MCM property RN_MCM auto

ObjectReference Property TCC_Achievements_Xmarker auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Message Properties
message property DBM_ScanMuseum_Message auto
message property DBM_ScanMuseum_Finished_Message auto

Message property ModConfigFinished auto

message property ModUpdateStartup auto
Message property ModUpdateFinished auto

message property ModStartup auto
message property ModStartupDone auto
message property ModStartup_UpdatingLists auto

message property TCC_UniquesSetupFinished auto
message property moreHUDListRebuilt auto

message property TCC_SafehouseSetupFinished auto

bool bSettingup
bool bScanning
bool bScanAll
bool bMoreHUDListsCreated
Bool bMaintenance

;;Do Not Fill this property.
objectreference property DBM_CloaksStorage auto

;;Player Ref 
objectreference property PlayerRef auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Formlist Properties ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;MoreHud
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto
formlist property dbmMaster auto

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
Formlist property _Museum_Global_Edits auto

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
	
	GoToState("initialsetup")
	RegisterForSingleUpdate(2)	
endEvent
	
;;-- Events ---------------------------------------

State initialsetup

	Event OnUpdate()
		if RN_Setup_Finish.GetValue()
			if !RN_MCM.advdebug
				TCCDebug.Log("Utility - Setup already completed with " + RN_Setup_Finish.GetValue(), 0)	
			endif
		else
			if !RN_MCM.advdebug
				TCCDebug.Log("Utility - Setup Started", 0)
			endif
			DBM_SortWait.setvalue(1)
			RN_Setup_Start.setvalue(1)
			SendModEvent("TCCSetup_Patches")
			
			if RN_MCM.Achievements_Enabled
				SendModEvent("TCCSetup_Uniques")
			endIf
			
			RN_MCM.Build_Arrays()
			AddPlayerToFormlists()

			while RN_Setup_Start.GetValue()	
				if RN_Setup_Done.GetValue() == RN_Setup_Registered.GetValue() 
					CreateMoreHudLists()
					InitGlobals()
					
					SendModEvent("FireScripts")
					
					RN_MCM.BuildPatchArray(true, true)
					
					SendModEvent("TCCUpdate_Counts")

					RN_MCM.Begin_Config_Load()

					RN_Setup_Start.setvalue(0)
					RN_Setup_Finish.setvalue(1)		
					RN_Setup_Done.setvalue(0)
					RN_Setup_Registered.setvalue(0)
					DBM_SortWait.setvalue(0)				
					RN_MCM.UpdateReq = False	
					if !RN_MCM.advdebug
						TCCDebug.Log("Utility - Initial Mod Setup Finished", 0)
					endif
					
					While IsInMenuMode()
						Wait(1)
					endWhile
					
					ModConfigFinished.Show((RN_SupportedModCount.GetValue() as Int) + (RN_CustomModCount.GetValue() as Int) + (RN_SupportedSafehouseCount.GetValue() as Int))
				endIf
			endWhile	
		endIf
		GoToState("Running")
	endevent
endstate

;;-- Functions ---------------------------------------

function AddPlayerToFormlists()

	TCC_TokenList.AddForm(PlayerRef)
	_MuseumContainerList_WP.AddForm(PlayerRef)
	_SafehouseContainerList_WP.AddForm(PlayerRef)
	
	if !TCC_TokenList.HasForm(PlayerRef) || !_MuseumContainerList_WP.HasForm(PlayerRef) || !_SafehouseContainerList_WP.HasForm(PlayerRef)
		if !RN_MCM.advdebug
			TCCDebug.Log("Utility - Unable to find PlayerRef in Formlist", 2)
		endif
	endIf
		
	SendModEvent("Update_TokenArray", "Updating Token Array")
endfunction
				
;;-- Functions ---------------------------------------

function CreateMoreHudLists()		
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Updating moreHUD Lists...", 0)
	endif
	
	Int _Index = _MuseumContainerList.GetSize()	;;Check museum containers for displayed items.	
	While _Index 
		_Index -= 1
		ObjectReference _Container = _MuseumContainerList.GetAt(_Index) as ObjectReference
		if !RN_MCM.advdebug
			TCCDebug.Log("Utility - Updating items in [" + _Container.GetBaseObject().GetName() + "]" + _Container, 0)
		endif
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
		if !RN_MCM.advdebug
			TCCDebug.Log("Utility - Updating items in [" + _Container.GetBaseObject().GetName() + "]" + _Container, 0)
		endif
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

	if (RN_MCM.Safehouse_Enabled) ; Check safehouse storage for displayed items.		
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
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - moreHUD Lists Updated", 0)
	endif
endFunction

;;-- Events ---------------------------------------

function InitGlobals()

	RN_Quest_Listener_Total.setvalue(0)
	RN_Exploration_Listener_Total.setvalue(0)
	RN_Museum_Paintings_Total.setvalue(0)
	RN_Museum_Dibella_Statues_Total.setvalue(0)
	
	RN_Quest_Listener_Total.Mod(DBM_RN_QuestDisplays.GetSize())
	RN_Quest_Listener_Total.Mod(DBM_RN_Quest_Stage_Displays.GetSize())
	RN_Exploration_Listener_Total.Mod(DBM_RN_ExplorationDisplays.GetSize())
	RN_Museum_Paintings_Total.Mod(TCC_DisplayList_Paintings.GetSize())
	RN_Museum_Dibella_Statues_Total.Mod(TCC_DisplayList_DibellaStatues.GetSize())

	if (Game.GetModByName("LOTD_TCC_Vigilant.esp") != 255)
		RN_Quest_Listener_Total.Mod(4)
	endIf
	
	if (Game.GetModByName("LOTD_TCC_TFC.esp") != 255)
		RN_Quest_Listener_Total.Mod(1)
	endIf

	RN_Quest_Listener_Total.Mod(2) ;;[+1 Civil War] [+1 Dawnguard] [+1 The Bards] [-1 Dark Brotherhood]
	
	Int _Index = 0
	Int _Length = _Armory_Global_Total.GetSize()
	While _Index < _Length
		Formlist _DisplayList = _Armory_Formlist_Displays.GetAt(_Index) as Formlist
		GlobalVariable _Total = _Armory_Global_Total.GetAt(_Index) as GlobalVariable	
		if _Index == 11 ;; Guard Armor List (Add Helms)
			_Total.SetValue(_DisplayList.GetSize() + 9)
		elseif _Index == 19 ;; Remove Thane Weapon Variants
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
		GlobalVariable _Edit = _Museum_Global_Edits.GetAt(_Index) as GlobalVariable
		if _Index == 0
			_Total.SetValue((_DisplayList.GetSize() - _Edit.GetValue()) + 3)
		else
			_Total.SetValue(_DisplayList.GetSize() - _Edit.GetValue())
		endIf
		_Index += 1
	endWhile
	
	if (Game.GetModByName("LOTD_TCC_Cloaks.esp") != 255)
		DBM_CloaksStorage = Game.GetFormFromFile(2122, "DBM_CloaksofSkyrim_Patch.esp") as objectreference
		if !RN_MCM.advdebug
			TCCDebug.Log("Utility - Found Cloaks Storage - " + DBM_CloaksStorage.GetBaseObject().GetName(), 0)
		endIf
	endif
endfunction
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Load Game Funcions ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
Function Maintenance()

	if RN_Setup_Done.GetValue() > RN_Setup_Registered.GetValue() || RN_Safehouse_Done.GetValue() > RN_Safehouse_Registered.GetValue()
		if !RN_MCM.advdebug
			TCCDebug.Log("Utility - Error Detected on load - (auto correcting)", 2)
		endif
		RN_Setup_Done.SetValue(RN_Setup_Registered.GetValue())
	endIf
	
	bMaintenance = false
	
	While !bMaintenance
		RegisterForSingleUpdate(2.0)
		Wait(3.0)
	endWhile
endFunction

Event onUpdate()
	
	bMaintenance = true
	if RN_MCM.ShowStartup 
		While IsInMenuMode()
			Wait(1)
		endWhile
		ModStartup.Show()
	endIf
	
	AddPlayerToFormlists()
	
	RN_Setup_Finish.setvalue(0)
	RN_Setup_Start.setvalue(1)	

	DBM_SortWait.setvalue(1)
	
	SendModEvent("TCCSetup_Patches")
	
	if RN_MCM.Achievements_Enabled
		SendModEvent("TCCSetup_Uniques")
	endIf
		
	if (RN_MCM.Safehouse_Enabled) ; Check safehouse storage for displayed items.		
		sendmodevent("TCCSetup_SH")
	endIf	
	
	Wait(5)
	
	while RN_Setup_Start.GetValue()		
		if RN_Setup_Done.GetValue() == RN_Setup_Registered.GetValue() && RN_Safehouse_Done.GetValue() == RN_Safehouse_Registered.GetValue()
			
			if RN_MCM.UpdateReq
				if !RN_MCM.advdebug
					TCCDebug.Log("Utility - Installing new patch(es)", 0)
				endif
				
				While IsInMenuMode()
					Wait(1)
				endWhile
				
				ModStartup_UpdatingLists.Show()

				CreateMoreHudLists()
				RN_MCM.BuildPatchArray(true, true)
				RN_MCM.UpdateReq = False
			endIf
			RN_Setup_Start.setvalue(0)
		endIf
	endWhile	

	SendModEvent("TCCUpdate_Counts")
	
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
	
	RN_Setup_Finish.setvalue(1)		
	RN_Setup_Done.setvalue(0)
	RN_Setup_Registered.setvalue(0)	
	RN_Safehouse_Registered.setvalue(0)
	RN_Safehouse_Done.setvalue(0)
	DBM_SortWait.setvalue(0)	
	
	SendModEvent("FireScripts")
	
	if RN_MCM.ShowStartup 
		While IsInMenuMode()
			Wait(1)
		endWhile
		ModStartupDone.Show()
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Scan Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function ScanMuseum()
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Scanning Museum...", 0)
	endif

	if RN_MCM.ScanNotificationsval 
		While IsInMenuMode()
			Wait(1)
		endWhile
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
				While IsInMenuMode()
					Wait(1)
				endWhile
				DBM_ScanMuseum_Finished_Message.Show()
			endif
		endIf		
	endWhile
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Museum Scan Finished", 0)
	endif
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------- Update Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

;;-- Functions ---------------------------------------

Function RebuildLists()
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Rebuild moreHUD Lists Request Received...", 0)
	endif
	
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

		if (_Index % 500 == 0) 
			Debug.Notification("The Curators Companion: Rebuilding moreHUD Lists... (" + _Index + " / " + _Total + ")")
			Debug.Notification("The Curators Companion: Do not add / remove any items from inventory")
		endIf
		_Index += 1
	endWhile
		
	CreateMoreHudLists()

	DBM_SortWait.SetValue(0)
	
	Debug.Notification("The Curators Companion: moreHUD Lists Rebuilt & Ready")
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Rebuild moreHUD Lists Request Completed", 0)
		TCCDebug.Log("Utility - dbmNew = " + dbmNew.GetSize() as Int, 0)
		TCCDebug.Log("Utility - dbmFound = " + dbmFound.GetSize() as Int, 0)
		TCCDebug.Log("Utility - dbmDisp = " + dbmDisp.GetSize() as Int, 0)
		TCCDebug.Log("Utility - dbmMaster = " + dbmMaster.GetSize() as Int, 0)
	endif
endFunction

;;-- Functions ---------------------------------------

Function SetUpSafehouse()
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Enable Safehouse Request Received...", 0)
	endif
	
	DBM_SortWait.setvalue(1)
	bSettingup = true
	
	Int _Index = _SafehouseContainerList.GetSize()
	While _Index
		_Index -= 1
		ObjectReference _Container = _SafehouseContainerList.GetAT(_Index) as ObjectReference
		TCC_TokenList.AddForm(_Container)
		if !RN_MCM.advdebug
			TCCDebug.Log("Utility - Added Safehouse Container " +  _Container.GetBaseObject().GetName() + " to TCC_TokenList", 0)
		endif
	endWhile
	SendModEvent("Update_TokenArray", "Updating Token Array")
	SendModEvent("TCCSetup_SH")
	
	Debug.Notification("The Curators Companion: Adding Safehouse Integration...")
	
	Wait(5)
	
	while bSettingup	
		if RN_Safehouse_Done.GetValue() == RN_Safehouse_Registered.GetValue()	
			
		Int	Index = TCC_TokenList.GetSize() ;; Check player and custom storage for found items.
			While Index
				Index -= 1
				ObjectReference _Container = TCC_TokenList.GetAt(Index) as ObjectReference	
				if !RN_MCM.advdebug
					TCCDebug.Log("Utility - Updating items in [" + _Container.GetBaseObject().GetName() + "]" + _Container, 0)				
				endif
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
			While IsInMenuMode()
				Wait(1)
			endWhile
			TCC_SafehouseSetupFinished.Show()
		endIf		
	endWhile
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Enable Safehouse Request Completed", 0)
	endif
endFunction

;;-- Functions ---------------------------------------

function SetUpAchievements()
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Enable Achievements Request Received...", 0)	
	endif
	
	DBM_SortWait.setvalue(1)
	RN_Setup_Start.setvalue(1)
	Debug.Notification("The Curators Companion: Enabling Achievements System...")
	SendModEvent("TCCSetup_Uniques")
	Wait(5)
	
	while RN_Setup_Start.GetValue()	
		if RN_Setup_Done.GetValue() == RN_Setup_Registered.GetValue() 
			CreateMoreHudLists()
			InitGlobals()
			TCC_Achievements_Xmarker.Enable()
			
			SendModEvent("TCCUpdate_Counts")
	
			RN_Setup_Start.setvalue(0)
			RN_Setup_Done.setvalue(0)
			RN_Setup_Registered.setvalue(0)
			DBM_SortWait.setvalue(0)
			while IsInMenuMode()
				Wait(1)
			endwhile	
			TCC_UniquesSetupFinished.Show()
		endIf
	endWhile
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Enable Achievements Request Completed", 0)	
	endif
endfunction

;;-- Functions ---------------------------------------

function UpdatePatches()
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Update Patch(es) request received...", 0)	
	endif
	DBM_SortWait.setvalue(1)
	RN_Setup_Start.setvalue(1)
	
	RN_SupportedModCount.setvalue(0)
	RN_CustomModCount.setvalue(0)

	Int Index = 0
	While Index < _Museum_Global_Edits.GetSize()
		GlobalVariable _Var = _Museum_Global_Edits.GetAt(Index) as GlobalVariable
		if Index == 1
			_Var.SetValue(2)
		elseif Index == 2
			_Var.SetValue(5)
		elseif Index == 4
			_Var.SetValue(12)
		else
			_Var.SetValue(0)
		endIf
		Index += 1
	endWhile
	
	SendModEvent("TCCUpdate_Patches")
	
	While IsInMenuMode()
		Wait(1)
	endWhile
	
	ModUpdateStartup.Show()
	Wait(5)
	
	while RN_Setup_Start.GetValue()	
		if RN_Setup_Done.GetValue() == RN_Setup_Registered.GetValue() 
			RN_MCM.BuildPatchArray(true, true)
			RebuildLists()	
			InitGlobals()
			SendModEvent("TCCUpdate_Counts")
			RN_Setup_Start.setvalue(0)
			RN_Setup_Done.setvalue(0)
			RN_Setup_Registered.setvalue(0)
			DBM_SortWait.setvalue(0)
			While IsInMenuMode()
				Wait(1)
			endWhile
			ModUpdateFinished.Show()
		endIf
	endWhile
	
	if !RN_MCM.advdebug
		TCCDebug.Log("Utility - Update Patch(es) request Completed", 0)
	endif
endfunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ End of Main Script ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


