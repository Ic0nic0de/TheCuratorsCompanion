scriptname RN_Utility_Script extends quest

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Script Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

import AhzMoreHud
import AhzMoreHudIE

import utility

RN_Utility_MCM property RN_MCM auto
RN_Utility_PropManager property Util auto
RN_PatchAPI property API auto
RN_Utility_Setup property setupscript auto

DBM_ReplicaHandler property ReplicaHandler auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;Message Properties
message property DBM_ScanMuseum_Message auto
message property DBM_ScanMuseum_Finished_Message auto

message property ModStartup auto
message property ModStartupDone auto

message property ModStartup_UpdatingLists auto
Message property ModConfigFinished auto

bool bSettingup
bool bScanning
bool bMoreHUDListsCreated
bool Maintaining

;;Do Not Fill this property.
objectreference property DBM_CloaksStorage auto

;;Player Ref 
objectreference property PlayerRef auto

;Relic Storage Spells
Book Property RN_RSC_SpellTome auto
Book Property RN_TransferContainer_SpellTome auto
Leveleditem Property LItemSpellTomes00AllSpells auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Formlist Properties ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;MoreHud
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto
formlist property dbmMaster auto

;;Replica Formlists
formlist property DBM_ReplicaBaseItems auto
formlist property DBM_ReplicaItems auto

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

Formlist property _Armory_Formlist_Displays auto
Formlist property _Armory_Global_Total auto

Formlist property _Museum_Formlist_Merged auto
Formlist property _Museum_Global_Total auto
Formlist property _Museum_Global_Edits auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Global Variables --------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

globalvariable property RN_moreHUD_Option auto
globalvariable property DBM_SortWait auto

globalvariable property RN_Setup_Start auto
globalvariable property RN_Setup_Finish auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

globalvariable property RN_Quest_Listener_Total auto
globalvariable property RN_Exploration_Listener_Total auto
globalvariable property RN_Museum_Paintings_Total auto
globalvariable property RN_Museum_Dibella_Statues_Total auto

globalvariable property GV_SectionHallofHeroes auto
globalvariable property GV_SectionDaedricGallery auto
globalvariable property GV_SectionHOLE auto

bool property SetupMainDone auto hidden


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
		
		LItemSpellTomes00AllSpells.AddForm(RN_RSC_SpellTome, 1 , 1)
		LItemSpellTomes00AllSpells.AddForm(RN_TransferContainer_SpellTome, 1 , 1)
	
		if RN_Setup_Finish.GetValue()
			TCCDebug.Log("Utility - Setup already completed with " + RN_Setup_Finish.GetValue(), 0)	
		else
			
			DBM_SortWait.setvalue(1)
			RN_Setup_Start.setvalue(1)
			
			Wait(10)
			
			API.CheckPatches()
			while !SetupMainDone
				Wait(2)
			endWhile
			
			RN_MCM.Build_Arrays()
			ManageLists()

			CreateMoreHudLists()
			InitGlobals()
					
			SendModEvent("FireScripts")
			
			API.UpdateCounts()
			RN_MCM.BuildPatchArray(true, false)
			API.UpdateArrays()
			

			RN_MCM.Begin_Config_Load()

			RN_Setup_Start.setvalue(0)
			RN_Setup_Finish.setvalue(1)		
			DBM_SortWait.setvalue(0)				
			API.UnregisteredPatch = false	
			
			While IsInMenuMode()
				Wait(1)
			endWhile
		endIf

		TCCDebug.Log("Utility - Initial Mod Setup Finished", 0)
		
		ModConfigFinished.Show(API.SupportedModHandlers.Find(none))
		
		GoToState("Running")
	endevent
endstate

;;-- Functions ---------------------------------------

function ManageLists()

	TCC_TokenList.AddForm(PlayerRef)
	_MuseumContainerList_WP.AddForm(PlayerRef)
		
	SendModEvent("Update_TokenArray", "Updating Token Array")
endfunction
				
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
				if RN_MCM.ReplicaTag 
					ProcessReplica(_ItemRelic, true)
				endif
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
				if RN_MCM.ReplicaTag 
					ProcessReplica(_ItemRelic, false)
				endif
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
	
	TCCDebug.Log("Utility - moreHUD Lists Updated", 0)
endFunction

function ProcessReplica(form _ItemRelic, bool Museum)

	if DBM_ReplicaBaseItems.HasForm(_ItemRelic)
		if Museum
			dbmNew.RemoveAddedForm(ReplicaHandler.GetReplica(_ItemRelic))
			dbmFound.RemoveAddedForm(ReplicaHandler.GetReplica(_ItemRelic))
			dbmDisp.AddForm(ReplicaHandler.GetReplica(_ItemRelic))
		else
			dbmNew.RemoveAddedForm(ReplicaHandler.GetReplica(_ItemRelic))
			dbmFound.AddForm(ReplicaHandler.GetReplica(_ItemRelic))		
		endif
			
	elseif DBM_ReplicaItems.HasForm(_ItemRelic)	
		if Museum
			dbmNew.RemoveAddedForm(ReplicaHandler.GetOriginal(_ItemRelic))
			dbmFound.RemoveAddedForm(ReplicaHandler.GetOriginal(_ItemRelic))
			dbmDisp.AddForm(ReplicaHandler.GetOriginal(_ItemRelic))
		else
			dbmNew.RemoveAddedForm(ReplicaHandler.GetOriginal(_ItemRelic))
			dbmFound.AddForm(ReplicaHandler.GetOriginal(_ItemRelic))		
		endif
	endIf
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

		TCCDebug.Log("Utility - Found Cloaks Storage - " + DBM_CloaksStorage.GetBaseObject().GetName(), 0)
	endif
endfunction
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Load Game Funcions ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
Function Maintenance()
	
	if Maintaining
		TCCDebug.Log("Utility - Maintenance function already running - (exiting)", 0)
	else
		RegisterForSingleUpdate(1)
	endif
endFunction

Event onUpdate()
	
	;float ftimeStart = Utility.GetCurrentRealTime()

	Maintaining = true
	
	if RN_MCM.ShowStartup 
		ModStartup.Show()
	endIf
	
	RN_Setup_Finish.setvalue(0)
	RN_Setup_Start.setvalue(1)
	DBM_SortWait.setvalue(1)
	
	if API.UnregisteredPatch
		ModStartup_UpdatingLists.Show()
		Wait(5)
		API.CheckPatches()
		API.UpdateCounts()
		InitGlobals()
		CreateMoreHudLists()
		RN_MCM.BuildPatchArray(true, true)
		API.UnregisteredPatch = False
		ModConfigFinished.Show(API.SupportedModHandlers.Find(none))
	endif
	
	ManageLists()
	InitIcons()
	
	RN_Setup_Start.setvalue(0)
	RN_Setup_Finish.setvalue(1)			
	DBM_SortWait.setvalue(0)	
	
	SendModEvent("FireScripts")
	
	if RN_MCM.ShowStartup 
		ModStartupDone.Show()
	endIf
	Maintaining = false
	
	;float ftimeEnd = Utility.GetCurrentRealTime()
	;Debug.Notification("Update Script took " + (ftimeEnd - ftimeStart) + " seconds to run")
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Scan Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function ScanMuseum()
	
	TCCDebug.Log("Utility - Scanning Museum...", 0)
	While IsInMenuMode()
		Wait(1)
	endWhile
	DBM_ScanMuseum_Message.Show()
	
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
			While IsInMenuMode()
				Wait(1)
			endWhile
			DBM_ScanMuseum_Finished_Message.Show()
		endIf		
	endWhile
	
	TCCDebug.Log("Utility - Museum Scan Finished", 0)
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------- Update Functions ----------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

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

		if (_Index % 500 == 0) 
			Debug.Notification("The Curators Companion: Rebuilding moreHUD lists... (" + _Index + " / " + _Total + ")")
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

function EnableReplica()
	Debug.Notification("The Curators Companion: Updating Replica moreHUD Icons...")
	DBM_SortWait.setvalue(1)
	CreateMoreHudLists()
	DBM_SortWait.setvalue(0)
	Debug.Notification("The Curators Companion: Replica moreHUD Icons Updated")
endfunction

;;-- Functions ---------------------------------------

function DisableReplica()
	Debug.Notification("The Curators Companion: Updating Replica moreHUD Icons...")
	DBM_SortWait.setvalue(1)
	RebuildLists()
	DBM_SortWait.setvalue(0)
	Debug.Notification("The Curators Companion: Replica moreHUD Icons Updated")
endfunction

;;-- Functions ---------------------------------------

function InitIcons()

	if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017		
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
endfunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ End of Main Script ------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


