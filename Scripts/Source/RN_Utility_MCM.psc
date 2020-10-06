scriptname RN_Utility_MCM extends SKI_ConfigBase

import FISSFactory

import AhzmoreHUD
import AhzmoreHUDIE

import utility

RN_Utility_autoScan property RN_AutoScan auto

RN_Utility_Script property RN_Utility auto

RN_Utility_Mods property RN_Mod auto

RN_Storage_Transfer property RN_Transfer auto

RN_Utility_QuestTracker_MCM property RN_Tracker auto

RN_Utility_ArrayHolder property RN_Array auto

RN_Utility_QuestTracker_Arrays property RN_Tracker_Array auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; String Returns
string[] PagesList
string Status_Return

bool Token_Vis
bool Safehouse_Enabled 

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

String Property _ModVersion auto

;; Player Ref for Game.GetPlayer()
objectreference property PlayerRef auto

;; Storage Options
spell property RN_Storage_Spell auto
spell property RN_Storage_Summon_Spell auto
globalvariable property CustomContainer auto

;; Treasury Value
quest property DBM_Excavation02 auto
quest property DBM_DHQuest auto

;; moreHUD
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto
formlist property dbmMaster auto
formlist property RN_Safehouse_Items_Merged auto
formlist property RN_TokenFormlist_NoShipment auto
globalvariable property RN_moreHUD_Option auto

string[] moreHUDChoiceList 
int IndexmoreHUD = 0
int moreHUDOptions

;; DBM Debug
globalvariable property DBM_DebuggingON auto
quest property DBM_Debugging auto

;; Custom Storage
formlist property RN_TokenFormlist auto

bool property _UserSettings auto hidden

;; bool Properties
bool property ShowMuseumVal = true auto hidden ;;Museum Notifications
bool iRelicMuseumNotifications = false

bool property ShowArmoryVal = true auto hidden ;;Armory Notifications
bool iRelicArmoryNotifications = false

bool property ShowModsVal = true auto hidden ;;Supported Mod Notifications
bool iRelicModsNotifications = false

bool property ShowSetCompleteVal = true auto hidden ;;Section / Set Completion Notifications
bool iRelicSetCompleteNotifications = false

bool property ShowSimpleNotificationVal = true auto hidden ;;Simple Notification (No MessageBox)
bool iRelicSimpleNotifications = false

bool property ShowListenerVal = true auto hidden ;;Notifications for Display Listeners
bool iRelicListenerNotifications = false

bool property StorageSpellVal auto hidden ;;Storage spell Value
bool iRelicStorageOptions = false

bool property SummonSpellVal auto hidden ;;Summon Type Value
bool iRelicStorageSummon = false

bool property AutoTransferRelics auto hidden ;;auto Transfer To Storage Container
bool iRelicStorageTransfer = false

bool property AllowWeapon auto hidden ;;auto Transfer To Storage Container
bool Transfer_Weapon = false

bool property AllowArmor auto hidden ;;auto Transfer To Storage Container
bool Transfer_Armor = false

bool property AllowBook auto hidden ;;auto Transfer To Storage Container
bool Transfer_Book = false

bool property AllowKey auto hidden ;;auto Transfer To Storage Container
bool Transfer_Key = false

bool property AllowGems auto hidden ;;auto Transfer To Storage Container
bool Transfer_Gems = false

bool property AllowMisc auto hidden ;;auto Transfer To Storage Container
bool Transfer_Misc = false

bool property AllowPotion auto hidden ;;auto Transfer To Storage Container
bool Transfer_Potion = false

bool property DevDebugVal auto hidden ;; Debug alerts for Dev usage.
bool Dev_Alerts = false

bool property ShowStartup = true auto hidden ;; Shows Startup Messages
bool iRelicShowStartup = false

Int property PrepTransfer auto hidden ;; Prep Station transfer settings.
bool PrepStationTransfer = false

bool property ScanNotificationsval auto hidden ;; Museum Scan Notifications
bool property autoScanVal auto hidden ;; Auto Museum Scan
int property _ScanInterval auto ;; museum scan interval

;; Globals for Complete Set Listings.
globalvariable property iMuseumSets auto
globalvariable property iArmorySets auto
globalvariable property iImmWeapSets auto
globalvariable property iHeavyArmSets auto
globalvariable property iModComplete auto
globalvariable property iCreationComplete auto
globalvariable property iDisplaySectionComplete auto
globalvariable property RN_SupportedModCount auto
globalvariable property RN_SupportedCreationCount auto

;; General Globals
globalvariable property DBM_ArcSkill auto
globalvariable property DBM_SortWait auto
globalvariable property RN_Setup_Start auto
globalvariable property RN_Token_Visibility auto

globalvariable property RN_Installed_SafehouseGeneral auto
globalvariable property RN_Installed_SkyUI auto
globalvariable property RN_Installed_Fiss auto
globalvariable property RN_Installed_ImmWeap auto
globalvariable property RN_Installed_HeavyArm auto

;; Treasury Globals
globalvariable property RN_Total_Value auto
globalvariable property RN_Treasury_Count auto
globalvariable property RN_Treasury_Count2 auto
globalvariable property RN_Treasury_Count3 auto

;;Globals for Display Listener
globalvariable property RN_Quest_Listener_Total auto
globalvariable property RN_Quest_Listener_Count auto
globalvariable property RN_Quest_Listener_Complete auto

globalvariable property RN_Exploration_Listener_Total auto
globalvariable property RN_Exploration_Listener_Count auto
globalvariable property RN_Exploration_Listener_Complete auto

globalvariable property RN_Thane_Listener_Total auto
globalvariable property RN_Thane_Listener_Count auto
globalvariable property RN_Thane_Listener_Complete auto

globalvariable property RN_Skills_Listener_Total auto
globalvariable property RN_Skills_Listener_Count auto
globalvariable property RN_Skills_Listener_Complete auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Patches -----------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Formlist Property RN_Patches_Installed auto
Formlist Property RN_Patches_Complete auto
Formlist Property RN_Patches_Count auto
Formlist Property RN_Patches_Total auto

GlobalVariable[] RN_Patches_Installed_Array
GlobalVariable[] RN_Patches_Complete_Array
GlobalVariable[] RN_Patches_Count_Array
GlobalVariable[] RN_Patches_Total_Array
String[]  RN_Patches_Name

Formlist Property RN_Creations_Installed auto
Formlist Property RN_Creations_Complete auto
Formlist Property RN_Creations_Count auto
Formlist Property RN_Creations_Total auto

GlobalVariable[] RN_Creations_Installed_Array
GlobalVariable[] RN_Creations_Complete_Array
GlobalVariable[] RN_Creations_Count_Array
GlobalVariable[] RN_Creations_Total_Array
String[]  RN_Creations_Name

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnConfigInit()
	
	RN_Thane_Listener_Total.SetValue(9)
	RN_Skills_Listener_Total.SetValue(6)
	CustomContainer.SetValue(1)
	AddDynamicPagesList()
	Build_Arrays()
EndEvent

;-- Events --------------------------------

Event AddDynamicPagesList()

	ModName = "LOTD: The Curators Companion"
	PagesList = new String[11]
	PagesList[0] = "General Settings"
	PagesList[1] = "moreHUD & Scan"
	PagesList[2] = "Relic Storage"
	PagesList[3] = ""
	PagesList[4] = "~~Completion~~"
	PagesList[5] = "Museum Sections"
	PagesList[6] = "Armory Sections"
	PagesList[7] = "Supported Mods"
	PagesList[8] = "Supported Creations"
	PagesList[9] = ""
	PagesList[10] = "Debug Options"
	
	Int Q = 0
	Int x = 11
	
  Pages = Utility.CreateStringArray(x)
  Int index = x
  While index >= 1
    index -= 1 
    Pages[index] = PagesList[index]  
  EndWhile
EndEvent	

;-- Events --------------------------------

Event OnPageReset(string page)

	if page == ""
		LoadCustomContent("TCC/CuratorSplash.swf", 50, -32)
	else
		UnloadCustomContent()
	endIf
	
	AddSettingsPage()
	AddAdvancedPage()
	AddRelicStoragePage()
	AddMuseumSetsPage()
	AddArmorySetsPage()
	AddCompletedModsPage()
	AddCompletedCreationsPage()
	AddDebugPage()
	InitmoreHUDChoiceList()
EndEvent

;-- Events --------------------------------

Event InitmoreHUDChoiceList()

	moreHUDChoiceList = new string[5]
	moreHUDChoiceList[0] = "Show All Icons"
	moreHUDChoiceList[1] = "Show New Icons"
	moreHUDChoiceList[2] = "Show Found Icons"
	moreHUDChoiceList[3] = "Show Displayed Icons"
	moreHUDChoiceList[4] = "Hide All Icons"
EndEvent

	;;<font color='COLORHERE'>

	;;</font>

	;;#2b6320 - Green
	;;#750e0e - Red
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Settings Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
Event AddSettingsPage()

	if CurrentPage == "General Settings"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("Notification Settings:")	
		AddTextOptionST("iRelicMuseumNotifications", "Museum Items:", self.GetMuseumNotificationsString(), 0)
		AddTextOptionST("iRelicArmoryNotifications", "Armory Items:", self.GetArmoryNotificationsString(), 0)	
		
		if RN_SupportedModCount.GetValue() > 0 || RN_SupportedCreationCount.GetValue() > 0
			AddTextOptionST("iRelicModsNotifications", "Creations & Mods Items:", self.GetModsNotificationsString(), 0)
		else
			AddTextOptionST("iRelicModsNotifications", "Creations & Mods Items:", "No Patches Found", 1)
		endIF
		
		AddTextOptionST("iRelicListenerNotifications", "Exploration & Quest Displays:", self.GetListenerString(), 0)
		AddTextOptionST("iRelicSetCompleteNotifications", "Collection / Set Completion:", self.GetCompleteNotificationsString(), 0)
		AddEmptyOption()		
		AddHeaderOption("General Settings:")
		AddTextOptionST("iRelicSimpleNotifications", "Notification Style:", self.GetNotificationsString(), 0)
		AddTextOptionST("iRelicShowStartup", "Startup Notifications:", self.GetShowStartup(), 0)	
		AddTextOptionST("PrepStationTransfer", "Prep Station Settings:", self.GetPrepStationOptions(), 0)

		AddTextOptionST("RefreshMCM", "Something not working?", "Reload MCM", 0)
		
		SetCursorPosition(1)			
		AddHeaderOption("Mod Info:")
		AddTextOption("Thanks for using The Curators Companion, a full", "", 0)
		AddTextOption("featured add-on for Legacy of the Dragonborn.", "", 0)
		AddEmptyOption()
		AddTextOption("", "Developed By (Ic0n)Ic0de", 0)
		AddTextOption("", _ModVersion, 0)		
		AddEmptyOption()
		AddHeaderOption("Profile Settings:")
		AddTextOptionST("Config_Save", "FISS - User Profile", self.GetConfigSaveString(), 0)
		AddTextOptionST("Config_Load", "FISS - User Profile", self.GetConfigLoadString(), 0)
		AddTextOptionST("Config_Author", "Developers Preset", self.GetConfigAuthorString(), 0)
		AddTextOptionST("Config_Default", "Restore Defaults", self.GetConfigDefaultString(), 0)	
			
	endif
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Settings Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
Event AddAdvancedPage()

	if CurrentPage == "moreHUD & Scan"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("moreHUD Settings:")
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017 || SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
			AddMenuOptionST("moreHUDOptions", "moreHUD Icon Settings:", moreHUDChoiceList[IndexmoreHUD])	
		else
			AddtextOption("moreHUD Icon Settings:", "<font color='#750e0e'>Not Found</font>")
		endif
		
		if Safehouse_Enabled
			AddTextOptionST("Safehouse_Disp", "moreHUD Safehouse Integration:", self.GetSafehouseOptions(), 1)
		elseif RN_Setup_Start.GetValue()
			AddTextOptionST("Safehouse_Disp", "moreHUD Safehouse Integration:", "Wait For Setup...", 1)
		else
			AddTextOptionST("Safehouse_Disp", "moreHUD Safehouse Integration:", self.GetSafehouseOptions(), 0)
		endIf

		SetCursorPosition(1)

		AddHeaderOption("Museum Scan:")
		AddTextOptionST("ScanType", "Museum Scan Type", self.GetScanType(), 0)
		AddTextOptionST("ScanNotifications", "Museum Scan Notifications", self.GetScanNotification(), 0)
		if autoScanVal
			AddSliderOptionST("autoScanInterval", "Museum Scan Interval (Minutes)", _ScanInterval)	
		elseif !autoScanVal
			AddTextOptionST("ScanMuseum", "Museum Scan (Manual)", "Scan Now", 0)
		endIf	
	endif
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Settings Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
Event AddRelicStoragePage()

	if CurrentPage == "Relic Storage"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("Relic Storage Settings:")
		
			 if DBM_ArcSkill.GetValue() >= 5 
				AddTextOptionST("iRelicStorageOptions", "Relic Storage Container:", self.GetStorageOptions(), 0)
			else
				AddTextOptionST("iRelicStorageOptions", "Relic Storage Container:", self.GetStorageOptions(), 1)
			endIf

			 if DBM_ArcSkill.GetValue() >= 5 && StorageSpellVal 
				AddTextOptionST("iRelicStorageSummon", "Container Access Type:", self.GetSummonOptions(), 0)
			else
				AddTextOptionST("iRelicStorageSummon", "Container Access Type:", self.GetSummonOptions(), 1)
			endIf
			
			if StorageSpellVal 
				AddTextOptionST("iRelicStorageTransfer", "Auto Relic Storage:", self.GetTransferOptions(), 0)
			else
				AddTextOptionST("iRelicStorageTransfer", "Auto Relic Storage:", self.GetTransferOptions(), 1)
			endIf
		
		AddTextOptionST("Token_Visibility", "Storage Token Crafting:", self.GetTokenVisibility(), 0)
		AddEmptyOption()
		AddHeaderOption("Auto Storage Options:")
			if !StorageSpellVal || !AutoTransferRelics	
				AddToggleOptionST("Transfer_Armor", "Armor", AllowArmor, 1)
				AddToggleOptionST("Transfer_Book", "Books", AllowBook, 1)
				AddToggleOptionST("Transfer_Gems", "Gems", AllowGems, 1)
				AddToggleOptionST("Transfer_Key", "Keys", AllowKey, 1)
				AddToggleOptionST("Transfer_Misc", "Misc Items", AllowMisc, 1)
				AddToggleOptionST("Transfer_Potion", "Potions", AllowPotion, 1)
				AddToggleOptionST("Transfer_Weapon", "Weapons", AllowWeapon, 1)
			else
				AddToggleOptionST("Transfer_Armor", "Armor", AllowArmor, 0)
				AddToggleOptionST("Transfer_Book", "Books", AllowBook, 0)
				AddToggleOptionST("Transfer_Gems", "Gems", AllowGems, 0)
				AddToggleOptionST("Transfer_Key", "Keys", AllowKey, 0)
				AddToggleOptionST("Transfer_Misc", "Misc Items", AllowMisc, 0)
				AddToggleOptionST("Transfer_Potion", "Potions", AllowPotion, 0)
				AddToggleOptionST("Transfer_Weapon", "Weapons", AllowWeapon, 0)
			endIf
		
		SetCursorPosition(1)
		AddHeaderOption("Custom Storage Containers: (" + CustomContainer.GetValue() as int + "/6)")
		
		Int _IndexOpt = 0
		ObjectReference _Container
		String _ContainerLocation
		
		Int _Index = RN_TokenFormlist_NoShipment.GetSize()
		While _Index
			_Index -= 1
			_Container = RN_TokenFormlist_NoShipment.GetAt(_Index) as ObjectReference				
			_ContainerLocation = _Container.GetCurrentLocation().GetName()
				if !_ContainerLocation
					_ContainerLocation = _Container.GetparentCell().GetName()
					if !_ContainerLocation
						_ContainerLocation = "Unknown Location"
					endIf
				endIf

			_IndexOpt = AddTextOption(_Container.GetDisplayName(), _ContainerLocation, 0)
		endWhile
		
		AddEmptyOption()
		AddTextOptionST("ShowCustomContainerInfo", "Custom Storage Info:", "Show Information", 0)
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Museum Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddMuseumSetsPage()

	if CurrentPage == "Museum Sections"
		BuildTotals(iMuseumSets, RN_Array._Museum_Global_Complete)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)	
		AddHeaderOption("Museum Sections:")	
				
		Int _Index = 0
		Int _Length = RN_Array._Museum_Section_names.length
		While _Index < _Length 
			if RN_Array._Museum_Global_Complete[_Index].GetValue() == 1
				if RN_Array._Museum_Global_Total[_Index].GetValue() > RN_Array._Museum_Global_Count[_Index].GetValue() 
					RN_Array._Museum_Global_Complete[_Index].SetValue(0)
				else
					AddTextOption(RN_Array._Museum_Section_names[_Index], "Complete", 1)
				endIF
			elseif RN_Scan_Registered.GetValue()
				AddTextOption(RN_Array._Museum_Section_names[_Index], "Updating...", 1)
			else
				AddTextOption(RN_Array._Museum_Section_names[_Index], self.GetCurrentCount(RN_Array._Museum_Global_Count[_Index], RN_Array._Museum_Global_Total[_Index]), 0)
			endIf
			_Index += 1
			
			if _Index == 8 && !RN_SupportedCreationCount.GetValue()
				_Index += 1
			endIf
			
			if _Index == 11 && !RN_Installed_SafehouseGeneral.GetValue()
				_Index += 1
			endIf
			
		endWhile
			
		AddEmptyOption()
		AddHeaderOption("Museum Displays:")
		
		if (RN_Quest_Listener_Complete.GetValue()) == 1
			AddTextOption("Quest Displays:", "Complete", 1)
		else
			AddTextOption("Quest Displays:", self.GetCurrentCount(RN_Quest_Listener_Count, RN_Quest_Listener_Total), 0)
		endIf			

		if (RN_Exploration_Listener_Complete.GetValue()) == 1
			AddTextOption("Exploration Displays:", "Complete", 1)
		else
			AddTextOption("Exploration Displays:", self.GetCurrentCount(RN_Exploration_Listener_Count, RN_Exploration_Listener_Total), 0)
		endIf

		if (RN_Skills_Listener_Complete.GetValue()) == 1
			AddTextOption("Skills Displays:", "Complete", 1)
		else
			AddTextOption("Skills Displays:", self.GetCurrentCount(RN_Skills_Listener_Count, RN_Skills_Listener_Total), 0)
		endIf

		if (RN_Thane_Listener_Complete.GetValue()) == 1
			AddTextOption("Thane of the Holds:", "Complete", 1)
		else
			AddTextOption("Thane of the Holds:", self.GetCurrentCount(RN_Thane_Listener_Count, RN_Thane_Listener_Total), 0)
		endIf
		
		AddEmptyOption()
		AddHeaderOption("Player Wealth:")
		AddTextOption("Safehouse Treasury Value:", RN_Treasury_Count.GetValue() as Int, 0)
		AddTextOption("Deepholme Treasury Value:", Self.GetTreasuryCountString2(), 0)
		AddTextOption("Karagas' Tower Treasury Value:", Self.GetTreasuryCountString3(), 0)
		
		SetCursorPosition(1)
		AddHeaderOption("Page Information:")
		AddTextOption("This page lists all Museum sections that can be completed.", "", 0)
		AddEmptyOption()
		AddTextOption("As you collect and display your items, the page will keep", "", 0)
		AddTextOption("track of your progess.", "", 0)
		AddEmptyOption()
		AddTextOption("Running the Museum Scan from the MCM or Prep Station", "", 0)
		AddTextOption("will scan the Museum and Armory for items on display", "", 0)
		AddTextOption("then update the figures in the MCM, it is recommended", "", 0)
		AddTextOption("to scan after using the Prep Station to display items", "", 0)
		if RN_SupportedCreationCount.GetValue() > 0
			AddEmptyOption()
		endIf
		if RN_Installed_SafehouseGeneral.GetValue()
			AddEmptyOption()
		endIf
		AddEmptyOption()			
		AddTextOption("Completed:", self.GetCurrentMuseumCount(iMuseumSets), 0)
		AddEmptyOption()
		AddHeaderOption("Display Information:")
		AddTextOption("This section automatically updates and tracks the", "", 0)
		AddTextOption("displays being added to the Museum as a result of", "", 0)
		AddTextOption("quest completion, Exploration and skill levelling.", "", 0)
		AddTextOption("Completed:", self.GetDisplaySectionCount(iDisplaySectionComplete), 0)
		AddEmptyOption()
		AddHeaderOption("Wealth Information:")
		AddTextOption("This section tracks the amount of Gold within the treasury", "", 0)
		AddTextOption("rooms, the figures update after adding / removing Gold.", "", 0)
		AddTextOption("Total value:", self.GetTotalTreasuryValue(RN_Treasury_Count, RN_Treasury_Count2, RN_Treasury_Count3), 0)
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Armory Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Event AddArmorySetsPage()

	if CurrentPage == "Armory Sections"
		BuildTotals(iArmorySets, RN_Array._Armory_Global_Complete)
		BuildTotals(iHeavyArmSets, RN_Array._HeavyArmory_Global_Complete)
		BuildTotals(iImmWeapSets, RN_Array._ImmersiveWeapons_Global_Complete)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)						
		AddHeaderOption("Armory Sets:")
		Int _Index = 0
		Int _Length = RN_Array._Armory_Section_names.length
		While _Index < _Length 
		
			if RN_Array._Armory_Global_Complete[_Index].GetValue() == 1
				AddTextOption(RN_Array._Armory_Section_names[_Index], "Complete", 1)
			elseif RN_Scan_Registered.GetValue()
				AddTextOption(RN_Array._Armory_Section_names[_Index], "Updating...", 1)
			else
				AddTextOption(RN_Array._Armory_Section_names[_Index], self.GetCurrentCount(RN_Array._Armory_Global_Count[_Index], RN_Array._Armory_Global_Total[_Index]), 0)
			endIf
			_Index +=1
			
			if _Index == _Length / 2
				AddEmptyOption()
				SetCursorPosition(1)
				AddHeaderOption("Completed: " + self.GetCurrentArmoryCount(iArmorySets) + " Sets")
			endIf
		endWhile
		
		SetCursorPosition(24)
		
		if (RN_Installed_HeavyArm.GetValue())
			AddHeaderOption("Heavy Armory Sets:")
			
			_Index = 0
			_Length = RN_Array._HeavyArmory_Section_names.length
			While _Index < _Length 
			
				if RN_Array._HeavyArmory_Global_Complete[_Index].GetValue() == 1
					AddTextOption(RN_Array._HeavyArmory_Section_names[_Index], "Complete", 1)
				elseif RN_Scan_Registered.GetValue()
					AddTextOption(RN_Array._HeavyArmory_Section_names[_Index], "Updating...", 1)
				else
					AddTextOption(RN_Array._HeavyArmory_Section_names[_Index], self.GetCurrentCount(RN_Array._HeavyArmory_Global_Count[_Index], RN_Array._HeavyArmory_Global_Total[_Index]), 0)
				endIf
				_Index +=1
				
				if _Index == _Length / 2 + 1
					SetCursorPosition(25)
					AddHeaderOption("Completed: " + self.GetCurrentHACount(iHeavyArmSets) + " Sets")
				endIf
			endWhile
		endIf
		
		if (RN_Installed_HeavyArm.GetValue())
			SetCursorPosition(48)
		else
			SetCursorPosition(24)
		endIf
		
		if (RN_Installed_ImmWeap.GetValue())
			AddHeaderOption("Immersive Weapons Sets:")
			
			_Index = 0
			_Length = RN_Array._ImmersiveWeapons_Section_names.length
			While _Index < _Length 
			
				if RN_Array._ImmersiveWeapons_Global_Complete[_Index].GetValue() == 1
					AddTextOption(RN_Array._ImmersiveWeapons_Section_names[_Index], "Complete", 1)
				elseif RN_Scan_Registered.GetValue()
					AddTextOption(RN_Array._ImmersiveWeapons_Section_names[_Index], "Updating...", 1)
				else
					AddTextOption(RN_Array._ImmersiveWeapons_Section_names[_Index], self.GetCurrentCount(RN_Array._ImmersiveWeapons_Global_Count[_Index], RN_Array._ImmersiveWeapons_Global_Total[_Index]), 0)
				endIf
				_Index +=1
				
				if _Index == _Length / 2
					if (RN_Installed_HeavyArm.GetValue()) 
						SetCursorPosition(49)
					else
						SetCursorPosition(25)
					endIf
					AddHeaderOption("Completed: " + self.GetCurrentIWCount(iImmWeapSets) + " Sets")
				endIf
			endWhile
		endIf
	endIf
endEvent		

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------Mods Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddCompletedModsPage()

	if CurrentPage == "Supported Mods"
		BuildTotals(iModComplete, RN_Patches_Complete_Array)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)				
		AddHeaderOption("Supported Mods:")		
		if RN_SupportedModCount.GetValue() > 0	
			Int _IndexOpt = 0
			Int _Index = 0
			While _Index < RN_Patches_Name.length
			
				if RN_Patches_Installed_Array[_Index].GetValue()
					if RN_Patches_Complete_Array[_Index].GetValue()
						AddTextOption(RN_Patches_Name[_Index], "Complete", 1)
						_IndexOpt += 1
				
					elseif RN_Scan_Registered.GetValue()
						AddTextOption(RN_Patches_Name[_Index], "Updating...", 1)
						_IndexOpt += 1
						
					else
						AddTextOption(RN_Patches_Name[_Index], self.GetCurrentCount(RN_Patches_Count_Array[_Index], RN_Patches_Total_Array[_Index]), 0)
						_IndexOpt += 1
					endIf
				endIf
				_Index +=1
					
				if _IndexOpt == (RN_SupportedModCount.GetValue() as Int / 2)
					SetCursorPosition(1)
					AddHeaderOption("Completed: " + self.GetCurrentCount(iModComplete, RN_SupportedModCount) + " Supported Mods", 0)
				endIf
			endWhile					
		else
			AddTextOption("No Patches Installed", "", 1)
		endIf		
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------Creations Page --------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddCompletedCreationsPage()

	if CurrentPage == "Supported Creations"
		BuildTotals(iCreationComplete, RN_Creations_Complete_Array)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)		
		AddHeaderOption("Supported Creations:")
		if RN_SupportedCreationCount.GetValue() > 0
			Int _IndexOpt = 0
			Int _Index = 0
			While _Index < RN_Creations_Name.length
			
				if RN_Creations_Installed_Array[_Index].GetValue()
					if RN_Creations_Complete_Array[_Index].GetValue()
						AddTextOption(RN_Creations_Name[_Index], "Complete", 1)
						_IndexOpt += 1
					
					elseif RN_Scan_Registered.GetValue()
						AddTextOption(RN_Creations_Name[_Index], "Updating...", 1)
						_IndexOpt += 1
						
					else
						AddTextOption(RN_Creations_Name[_Index], self.GetCurrentCount(RN_Creations_Count_Array[_Index], RN_Creations_Total_Array[_Index]), 0)
						_IndexOpt += 1
					endIf
				endIf
				_Index +=1
				
				if _IndexOpt == (RN_SupportedCreationCount.GetValue() as Int / 2)
					SetCursorPosition(1)
					AddHeaderOption("Completed: " + self.GetCurrentCount(iCreationComplete, RN_SupportedCreationCount) + " Supported Creations", 0)
				endIf
			endWhile						
		else
			AddTextOption("No Creations Installed", "", 1)
		endIf		
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------- Debug Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddDebugPage()

	if CurrentPage == "Debug Options"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("Debug Options:")
		
		AddToggleOptionST("Dev_Alerts", "Developer Debugging", DevDebugVal)
		AddTextOptionST("Scan_Debug", "Reset Museum Scanner", "", 0)
		AddEmptyOption()
		AddEmptyOption()
		AddHeaderOption("moreHUD Debug:")
		AddTextOption("moreHUD new count:", dbmNew.GetSize() As Int, 0)
		AddTextOption("moreHUD found count:", dbmFound.GetSize() As Int, 0)
		AddTextOption("moreHUD Displayed count:", dbmDisp.GetSize() As Int, 0)
		AddTextOption("moreHUD total Count:", dbmMaster.GetSize() As Int, 0)
		AddEmptyOption()
		AddTextOptionST("RebuildLists", "Rebuild moreHUD Items Lists", "Rebuild", 0)
			
		SetCursorPosition(1)
		
		AddHeaderOption("Mod Requirements:")

		if SKSE.GetPluginVersion("fisses") > 0
		
			AddTextOption("FISSES:", "<font color='#2b6320'>Installed</font>" + " [" + SKSE.GetPluginVersion("fisses") + "]", 0)
			
		else
		
			AddTextOption("FISSES:", "<font color='#750e0e'>Not Found</font>", 0)
			
		endIf

		if SKSE.GetVersion() > 0
			Int fSKSE = SKSE.GetVersion() * 10000 + SKSE.GetVersionMinor() * 100 + SKSE.GetVersionBeta()
			AddTextOption("SKSE:", "<font color='#2b6320'>Installed</font>" + " [" + fSKSE + "]", 0)
			
		else
		
			AddTextOption("SKSE:", "<font color='#750e0e'>Not Found</font>", 0)
			
		endIf

		if (RN_Installed_SkyUI.GetValue())
		
			AddTextOption("SkyUI:", "<font color='#2b6320'>Installed</font>" + " [5.2SE]", 0)
			
		else
		
			AddTextOption("SkyUI:", "<font color='#750e0e'>Not Found</font>", 0)
			
		endIf	
		
		AddEmptyOption()
		AddHeaderOption("Icon Support:")
		
		;;<font color='COLORHERE'>$FF_Sandbox</font>
		
		;;#2b6320 - Green
		;;#750e0e - Red
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
		
			AddTextOption("moreHUD:", "<font color='#2b6320'>Installed</font>" + " [" + SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") + "]", 0)
			
		elseif SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") < 30800
		
			AddTextOption("moreHUD:", "<font color='#750e0e'>Invalid Version</font>", 0)
		
		else
			
			AddTextOption("moreHUD:", "<font color='#750e0e'>Not Found</font>", 0)
			
		endIf
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017
		
			AddTextOption("moreHUD Inventory Edition:", "<font color='#2b6320'>Installed</font>" + " [" + SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") + "]", 0)
			
		elseif SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") < 10017
		
			AddTextOption("moreHUD Inventory Edition:", "<font color='#750e0e'>Invalid Version</font>", 0)
		
		else
		
			AddTextOption("moreHUD Inventory Edition:", "<font color='#750e0e'>Not Found</font>", 0)
			
		endIf

	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General States------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state RefreshMCM

	function OnSelectST()
	
			ShowMessage("Please exit MCM and re-enter again to see changes", false, "Ok")
			bool bRefresh = True
			SetTitleText("===PLEASE WAIT===")
			While bRefresh
				If !IsInMenuMode()
					RN_Mod.CheckSupportedMods()
					Build_Arrays()
					AddDynamicPagesList()		
					RN_Tracker_Array._Build_Quest_Toggles()
					RN_Tracker_Array._Build_Quest_Arrays()
					Debug.Notification("The Curators Companion: MCM Rebuilt")
					bRefresh = false
				endIf
			endWhile
	endFunction

	function OnHighlightST()

		self.SetInfoText("Force refresh Mod list and reload the MCM - use if installed mods don't automatically show up.")
	endFunction
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------ Config Save / Load -------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state Config_Save

	Event OnSelectST()
	
		Begin_Config_Save()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Save current settings to Config File (Requires FISS)")
	EndEvent
endState

state Config_Load

	Event OnSelectST()
		
		Begin_Config_Load()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Load user settings from Config File (Requires FISS)")
	EndEvent
endState

String function GetConfigSaveString()
	
		if (RN_Installed_Fiss.GetValue())
			Status_Return = "Save Preset"
		else
			Status_Return = "FISS Not Found"
		endIf
	return Status_Return
endFunction	

String function GetConfigLoadString()

		if (RN_Installed_Fiss.GetValue())
			Status_Return = "Load Preset"
		else
			Status_Return = "FISS Not Found"
		endIf
	return Status_Return
endFunction	

;-- Save States / Function --------------------------------

Function Begin_Config_Save()
FISSInterface fiss = FISSFactory.getFISS()

	If !fiss
		self.ShowMessage("FISS not installed, unable to save user settings to config file", false, "Ok")
			return
	endIf
	
	fiss.beginSave("TheCuratorsCompanion_Config.xml", "LOTD:The Curators Companion")
	
	;;General Settings
	fiss.saveBool("Museum Notifications", ShowMuseumVal)
	fiss.saveBool("Armory Notifications", ShowArmoryVal)
	fiss.saveBool("Supported Mods Notifications", ShowModsVal)
	fiss.saveBool("Show Section/Set Complete Notifications", ShowSetCompleteVal)
	fiss.saveBool("Show Basic Notifications", ShowSimpleNotificationVal)
	fiss.saveBool("Museum Display Listener", ShowListenerVal)
	
	;;Scan & Advanced Page
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017 || SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800	
		fiss.saveInt("moreHUDOption", IndexmoreHUD)		
	endIf
	fiss.saveBool("Show startup notifications", ShowStartup)
	fiss.saveInt("Prep Station Transfer", PrepTransfer)
	fiss.saveBool("ScanNotificationsval", ScanNotificationsval)
	fiss.saveBool("AutoScanVal", AutoScanVal)
	fiss.saveInt("_ScanInterval", _ScanInterval)
	
	;;Relic Storage Page
	fiss.saveBool("Safe Storage Spell", StorageSpellVal)
	fiss.saveBool("Summon Type", SummonSpellVal)
	fiss.saveBool("Relic Transfer", AutoTransferRelics)
	fiss.saveBool("TokenCrafting", Token_Vis)
	fiss.saveBool("AllowWeapon", AllowWeapon)
	fiss.saveBool("AllowArmor", AllowArmor)
	fiss.saveBool("AllowBook", AllowBook)
	fiss.saveBool("AllowKey", AllowKey)
	fiss.saveBool("AllowGems", AllowGems)	
	fiss.saveBool("AllowMisc", AllowMisc)	
	fiss.saveBool("AllowPotion", AllowPotion)
	
	;;Quest Tracker
	fiss.saveBool("Show Spoilers", RN_Tracker._bSpoilers)
	fiss.saveBool("Hide Incomplete", RN_Tracker._HideIncomplete)
	fiss.saveInt("Helgen Option", RN_Tracker._Helgen_Index)
	fiss.saveInt("Legacy Option", RN_Tracker._Legacy_Index)
	
	string saveResult = fiss.endSave()
		If (saveResult != "")
			self.ShowMessage("Fiss Save Error - Please check the log", false, "Ok")
		else
			self.ShowMessage("User settings saved successfully to Config file", false, "Ok")
		endIf
EndFunction

;-- Load States / Function --------------------------------

Function Begin_Config_Load()
FISSInterface fiss = FISSFactory.getFISS()
	
	_UserSettings = false
	
	If !fiss && IsInMenuMode()
		self.ShowMessage("FISS not installed, unable to load user settings from config file", false, "Ok")
			return
	endIf
	
	fiss.beginLoad("TheCuratorsCompanion_Config.xml")	
	
	;;General Settings
	ShowMuseumVal = fiss.loadBool("Museum Notifications")
	ShowArmoryVal = fiss.loadBool("Armory Notifications")
	ShowModsVal = fiss.loadBool("Supported Mods Notifications")
	ShowSetCompleteVal = fiss.loadBool("Show Section/Set Complete Notifications")
	ShowSimpleNotificationVal = fiss.loadBool("Show Basic Notifications")
	ShowListenerVal = fiss.loadBool("Museum Display Listener")
	
	;;Scan & Advanced Page
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017
	
		IndexmoreHUD = fiss.loadInt("moreHUDOption")

		if IndexmoreHUD == 0
			RN_moreHUD_Option.SetValue(1)
			AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
			AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
			AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
			
		elseif IndexmoreHUD == 1
			RN_moreHUD_Option.SetValue(2)
			AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
			AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")		
			AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)

		elseif IndexmoreHUD == 2
			RN_moreHUD_Option.SetValue(3)
			AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")		
			AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
			AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
			
		elseif IndexmoreHUD == 3
			RN_moreHUD_Option.SetValue(4)
			AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
			AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
			AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)	

		elseif IndexmoreHUD == 4
			RN_moreHUD_Option.SetValue(5)
			AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
			AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")
			AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
			
		endIf	
			
	endif

	if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
	
		IndexmoreHUD = fiss.loadInt("moreHUDOption")

		if IndexmoreHUD == 0
			RN_moreHUD_Option.SetValue(1)
			AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
			AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
			AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
			
		elseif IndexmoreHUD == 1
			RN_moreHUD_Option.SetValue(2)
			AhzmoreHUD.UnRegisterIconFormList("dbmFound")
			AhzmoreHUD.UnRegisterIconFormList("dbmDisp")		
			AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)

		elseif IndexmoreHUD == 2
			RN_moreHUD_Option.SetValue(3)
			AhzmoreHUD.UnRegisterIconFormList("dbmDisp")		
			AhzmoreHUD.UnRegisterIconFormList("dbmNew")
			AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
			
		elseif IndexmoreHUD == 3
			RN_moreHUD_Option.SetValue(4)
			AhzmoreHUD.UnRegisterIconFormList("dbmNew")
			AhzmoreHUD.UnRegisterIconFormList("dbmFound")
			AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)

		elseif IndexmoreHUD == 4
			RN_moreHUD_Option.SetValue(5)
			AhzmoreHUD.UnRegisterIconFormList("dbmNew")
			AhzmoreHUD.UnRegisterIconFormList("dbmDisp")
			AhzmoreHUD.UnRegisterIconFormList("dbmFound")
			
		endIf	
			
	endif	
	
	ShowStartup = fiss.loadBool("Show startup notifications")	
	PrepTransfer = fiss.loadInt("Prep Station Transfer")

	ScanNotificationsval = fiss.loadBool("ScanNotificationsval")
	_ScanInterval = fiss.loadInt("_ScanInterval")
	AutoScanVal = fiss.loadBool("AutoScanVal")
	If AutoScanVal
		RN_AutoScan.UpdateInt(_ScanInterval)
	else
		RN_AutoScan.UpdateInt(0)
	endIf
	
	;;Relic Storage Page
	
	
	if DBM_ArcSkill.GetValue() >= 5
		StorageSpellVal = fiss.loadBool("Safe Storage Spell")	
		if !StorageSpellVal
			if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
				(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
			
			elseif(Game.GetPlayer().HasSpell(RN_Storage_Summon_Spell))
				(Game.GetPlayer().RemoveSpell(RN_Storage_Summon_Spell))
			endIf
		
			AutoTransferRelics = False
			RN_Transfer.GoToState("Disabled")
			
			AllowWeapon = False
			AllowArmor = False
			AllowBook = False
			AllowKey = False
			AllowGems = False
			AllowMisc = False
			AllowPotion = False		

		elseif StorageSpellVal
			if (!Game.GetPlayer().HasSpell(RN_Storage_Spell)) && SummonSpellVal
				(Game.GetPlayer().AddSpell(RN_Storage_Spell))
				
			elseif (!Game.GetPlayer().HasSpell(RN_Storage_Summon_Spell)) && !SummonSpellVal
				(Game.GetPlayer().AddSpell(RN_Storage_Summon_Spell))
			endif
		
			AllowWeapon = fiss.loadBool("AllowWeapon")
			AllowArmor = fiss.loadBool("AllowArmor")
			AllowBook = fiss.loadBool("AllowBook")
			AllowKey = fiss.loadBool("AllowKey")
			AllowGems = fiss.loadBool("AllowGems")
			AllowMisc = fiss.loadBool("AllowMisc")
			AllowPotion = fiss.loadBool("AllowPotion")		
			AutoTransferRelics = fiss.loadBool("Relic Transfer")
			if AutoTransferRelics && DBM_ArcSkill.GetValue() >= 5
				RN_Transfer.GoToState("")
			else
				RN_Transfer.GoToState("Disabled")
			endIf
		endIf
	
	else
		StorageSpellVal = false
		(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
		(Game.GetPlayer().RemoveSpell(RN_Storage_Summon_Spell))
		AutoTransferRelics = False
		RN_Transfer.GoToState("Disabled")
		AllowWeapon = False
		AllowArmor = False
		AllowBook = False
		AllowKey = False
		AllowGems = False
		AllowMisc = False
		AllowPotion = False			
	endIf
				
	SummonSpellVal = fiss.loadBool("Summon Type")	
	Token_Vis = fiss.loadBool("TokenCrafting")
	if 	Token_Vis
		RN_Token_Visibility.SetValue(1)
	else
		RN_Token_Visibility.SetValue(0)
	endIf
			
	;;Quest Tracker
	RN_Tracker._bSpoilers = fiss.loadBool("Show Spoilers")
	RN_Tracker._HideIncomplete = fiss.loadBool("Hide Incomplete")
	
	RN_Tracker._Helgen_Index = fiss.loadInt("Helgen Option")
	RN_Tracker._Legacy_Index = fiss.loadInt("Legacy Option")
	
	string loadResult = fiss.endLoad()
		If (loadResult != "")
			if IsInMenuMode()
				self.ShowMessage("Fiss Load Error - No config file found", false, "Ok")
			endIf
			_UserSettings = false
			Begin_Config_Default()
		else
			if IsInMenuMode()
				self.ShowMessage("User settings loaded successfully from Config file", false, "Ok")
				ForcePageReset()
			endIF
			_UserSettings = true
		endIf
EndFunction	


;-- Load States / Function --------------------------------

state Config_Default

	Event OnSelectST()
	
		 if self.ShowMessage("This will Restore all MCM options back to default including moreHUD icons... do you want to Restore now?", true, "Restore", "Cancel")
			Begin_Config_Default()
		endIf
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Restore MCM Options To Default")
	EndEvent
endState

String function GetConfigDefaultString()

	return "Restore"
endFunction	

;-- Load States / Function --------------------------------

state Config_Author

	Event OnSelectST()
	
		 if self.ShowMessage("This will set all MCM options to the Developers preferred setup, limited notifications, full moreHUD support and a less invasive but still full featured preset... do you want to configure now?", true, "Configure", "Cancel")
			Begin_Config_Author()
		endIf
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Configuration profile for the Developers personal and preferred setup")
	EndEvent
endState

String function GetConfigAuthorString()

	return "Load Preset"
endFunction	

;-- Load States / Function --------------------------------

Function Begin_Config_Default()

	ShowMuseumVal = True
	ShowArmoryVal = True
	ShowModsVal = True
	ShowSetCompleteVal = True
	ShowSimpleNotificationVal = True
	ShowListenerVal = True
	ShowStartup = True
	PrepTransfer = 1
	SummonSpellVal = False
	StorageSpellVal = False	
	if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
		(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
	elseif (Game.GetPlayer().HasSpell(RN_Storage_Summon_Spell))
		(Game.GetPlayer().RemoveSpell(RN_Storage_Summon_Spell))
	endIf
	
	IndexmoreHUD = 0
	
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
			AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
			AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
			AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
		endIf
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017	
			AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
			AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
			AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
		endIf
	
	AutoTransferRelics = False
	RN_Transfer.GoToState("Disabled")
	
	AllowWeapon = False
	AllowArmor = False
	AllowBook = False
	AllowKey = False
	AllowGems = False
	AllowMisc = False
	AllowPotion = False
	
	ScanNotificationsval = True
	_ScanInterval = 10
	AutoScanVal = True
	RN_AutoScan.UpdateInt(_ScanInterval)
	
	RN_Tracker._bSpoilers = false
	RN_Tracker._HideIncomplete = false
	
	RN_Tracker._Helgen_Index = 0
	RN_Tracker._Legacy_Index = 0
	
	Token_Vis = True
	RN_Token_Visibility.SetValue(1)

	if IsInMenuMode()
		ForcePageReset()
	endIf
endFunction

;-- Load States / Function --------------------------------

Function Begin_Config_Author()

	ShowMuseumVal = False
	ShowArmoryVal = False
	ShowModsVal = False
	ShowSetCompleteVal = True
	ShowSimpleNotificationVal = True
	ShowListenerVal = True
	ShowStartup = True
	PrepTransfer = 1
	SummonSpellVal = False
	Token_Vis = True
	RN_Token_Visibility.SetValue(1)

	
	IndexmoreHUD = 0
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
		AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
		AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
		AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
	endIf
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017	
		AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
		AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
		AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
	endIf
	
	if DBM_ArcSkill.GetValue() >= 5
		AutoTransferRelics = True
		RN_Transfer.GoToState("")
		AllowWeapon = True
		AllowArmor = True
		AllowBook = True
		AllowKey = True
		AllowGems = True
		AllowMisc = True
		AllowPotion = True
		
		StorageSpellVal = True
		if (!Game.GetPlayer().HasSpell(RN_Storage_Spell)) && SummonSpellVal
			(Game.GetPlayer().AddSpell(RN_Storage_Spell))
			
		elseif (!Game.GetPlayer().HasSpell(RN_Storage_Summon_Spell)) && !SummonSpellVal
			(Game.GetPlayer().AddSpell(RN_Storage_Summon_Spell))
		endIf
	else
		AutoTransferRelics = False
		RN_Transfer.GoToState("Disabled")
		AllowWeapon = False
		AllowArmor = False
		AllowBook = False
		AllowKey = False
		AllowGems = False
		AllowMisc = False
		AllowPotion = FALSE
		StorageSpellVal = False
		if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
			(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
		elseif (Game.GetPlayer().HasSpell(RN_Storage_Summon_Spell))
			(Game.GetPlayer().RemoveSpell(RN_Storage_Summon_Spell))
		endIf
	endIf

	ScanNotificationsval = True
	_ScanInterval = 5
	AutoScanVal = True
	RN_AutoScan.UpdateInt(_ScanInterval)
	
	RN_Tracker._bSpoilers = True
	RN_Tracker._HideIncomplete = false
	
	if IsInMenuMode()
		ForcePageReset()
	endIf
endFunction

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Museum Scan Options--------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state ScanType

	Event OnSelectST()
	
		autoScanVal = !autoScanVal
		SetTextOptionValueST(SetScanType(), false, "")
		ForcePageReset()		
	EndEvent

	function OnHighlightST()

		SetInfoText("Toggle to select between Manual / Automatic Scanning")
	endFunction
endState

;;-------------------------------

String function SetScanType()

		if !autoScanVal	
			RN_AutoScan.UpdateInt(0)
			Status_Return = "Manual"
		elseif autoScanVal
			RN_AutoScan.UpdateInt(_ScanInterval)
			Status_Return = "Automatic"
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetScanType()

	if !autoScanVal
		Status_Return = "Manual"
	elseif autoScanVal	
		Status_Return = "Automatic"
	endIf
	return Status_Return
endFunction	
	
;;------------------------------

state ScanMuseum

	function OnSelectST()
		
		if ShowMessage("This will start the process of Scanning the Museum for completed sets... do you want to scan now?", true, "Scan", "Cancel")
			ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")
			RN_Utility.ScanMuseum()
		endIf
	endFunction

	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum & Armory for all displayed items and update the listings within this mod.")
	endFunction
endState

;;------------------------------

state autoScanInterval ; Museum scan slider.

	event OnSliderOpenST()
		SetSliderDialogStartValue(_ScanInterval)
		SetSliderDialogRange(0, 60)
		SetSliderDialogInterval(1)
	endEvent

	event OnSliderAcceptST(float a_value)
		_ScanInterval = a_value as int
		SetSliderOptionValueST(_ScanInterval)
		RN_AutoScan.UpdateInt(_ScanInterval)
	endEvent

	event OnDefaultST()
		_ScanInterval = 10
		SetSliderOptionValueST(_ScanInterval)
		RN_AutoScan.UpdateInt(_ScanInterval)
	endEvent

	event OnHighlightST()
		SetInfoText("Use this slider to set the interval between automatic museum scans - Set to 0 to turn off.\n Default: 10 Minutes")
	endEvent
	
endState

;;------------------------------

state ScanNotifications

	Event OnSelectST()
	
		ScanNotificationsval = !ScanNotificationsval
		SetTextOptionValueST(SetScanNotification(), false, "")
		forcepagereset()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Enables / Disables Museum Scanner Notifications\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetScanNotification()

		if !ScanNotificationsval		
			Status_Return = "Disabled"
		elseif ScanNotificationsval	
			Status_Return = "Enabled"
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetScanNotification()

	if !ScanNotificationsval
		Status_Return = "Disabled"
	elseif ScanNotificationsval	
		Status_Return = "Enabled"
	endIf
	return Status_Return
endFunction	

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Debug Options -------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-------------------------------

state Dev_Alerts ;;Debug Options

	Event OnSelectST()
	
		DevDebugVal = !DevDebugVal
		DBM_DebuggingON.setvalue(1)
		DBM_Debugging.Start()
		SetToggleOptionValueST(DevDebugVal)	
	EndEvent
	
	Event OnDefaultST()
	
		DevDebugVal = false
		SetToggleOptionValueST(DevDebugVal)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Enables Developer Debugging Messages to the LegacyoftheDragonborn.log file\n Default: OFF")
	EndEvent
endState

;;-------------------------------

state Scan_Debug

	Event OnSelectST()
	
		if self.ShowMessage("This will reset the current Museum scan and reset the scanner, do you want to reset now?", true, "Reset", "Cancel")
			RN_Scan_Done.SetValue(RN_Scan_Registered.GetValue())
			
			autoScanVal = True
			_ScanInterval = 10
			RN_AutoScan.UpdateInt(_ScanInterval)
			
			DBM_SortWait.setvalue(0)
			ForcePageReset()
		endIf
		
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Resets the Museum Scanner")
	EndEvent
endState

;;-------------------------------

state RebuildLists

	Event OnSelectST()
	
		if IsInMenuMode()
			if self.ShowMessage("This will rebuild and update the moreHUD lists for all new / found / displayed items, do you want to rebuild now?", true, "Rebuild", "Cancel")
				
				ShowMessage("Please exit the MCM and wait for a completion message", false, "Ok")
				RN_Utility.RebuildLists()
			endIF
		endIf
	EndEvent

	Event OnHighlightST()

		SetInfoText("This option will rebuild the moreHUD lists -- NOT FOR PLAYER USE")
	EndEvent
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Mod Toggle Options --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state iRelicSetCompleteNotifications

	Event OnSelectST()
		ShowSetCompleteVal = !ShowSetCompleteVal 
		
		self.SetTextOptionValueST(Self.SetCompleteNotificationsString(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("This option will display notifications when the player collects all displayable items from a given Set, collection or Museum Section.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetCompleteNotificationsString()

		if !ShowSetCompleteVal		
			Status_Return = "Disabled"
		elseif ShowSetCompleteVal	
			Status_Return = "Enabled"
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetCompleteNotificationsString()

	if !ShowSetCompleteVal
		Status_Return = "Disabled"
	elseif ShowSetCompleteVal	
		Status_Return = "Enabled"
	endIf
	return Status_Return
endFunction	

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Notifications Options -----------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state iRelicSimpleNotifications ;;Simple Notifications


	Event OnSelectST()
		ShowSimpleNotificationVal = !ShowSimpleNotificationVal 
		
		self.SetTextOptionValueST(Self.SetNotificationsString(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Display a basic notification in the corner of the screen instead of the default pop-up message box.\n Default: Simple")
	EndEvent
endState

;;-------------------------------

String function SetNotificationsString()

		if !ShowSimpleNotificationVal		
			Status_Return = "Default Message"
		elseif ShowSimpleNotificationVal	
			Status_Return = "Simple Notification"
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetNotificationsString()

	if !ShowSimpleNotificationVal
		Status_Return = "Default Message"
	elseif ShowSimpleNotificationVal	
		Status_Return = "Simple Notification"
	endIf
	return Status_Return
endFunction	

;;-------------------------------

state iRelicShowStartup ;;Show Startup Notifications


	Event OnSelectST()
		ShowStartup = !ShowStartup 
		
		self.SetTextOptionValueST(Self.SetShowStartup(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Hides the startup notifications when loading in.\n Default: Shown")
	EndEvent
endState

;;-------------------------------

String function SetShowStartup()

		if !ShowStartup		
			Status_Return = "Messages Hidden"
		elseif ShowStartup	
			Status_Return = "Messages Shown"
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetShowStartup()

	if !ShowStartup
		Status_Return = "Messages Hidden"
	elseif ShowStartup	
		Status_Return = "Messages Shown"
	endIf
	return Status_Return
endFunction	

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------------- Storage Options -----------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
state iRelicStorageOptions ;;Storage Spell
	
	Event OnSelectST()
		StorageSpellVal = !StorageSpellVal 
			
		self.SetTextOptionValueST(Self.SetStorageOptions(), false, "")
		ForcePagereset()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Adds the spell for the Relic Storage Container to the player.\n The container is inaccessible until the player has reached an overall Archaeology level of 5")
	EndEvent
endState		

;;-------------------------------
	
String function SetStorageOptions()	

		if !StorageSpellVal
			if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
				(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
					if AutoTransferRelics
						AutoTransferRelics = FALSE
						RN_Transfer.GoToState("Disabled")
						AllowWeapon = FALSE
						AllowArmor = FALSE
						AllowBook = FALSE
						AllowGems = FALSE
						AllowKey = FALSE
						AllowMisc= FALSE
						AllowPotion = FALSE
					endIf
				Status_Return = "Add Spell"
			
			elseif (Game.GetPlayer().HasSpell(RN_Storage_Summon_Spell))
				(Game.GetPlayer().RemoveSpell(RN_Storage_Summon_Spell))
					if AutoTransferRelics
						AutoTransferRelics = FALSE
						RN_Transfer.GoToState("Disabled")
						AllowWeapon = FALSE
						AllowArmor = FALSE
						AllowBook = FALSE
						AllowGems = FALSE
						AllowKey = FALSE
						AllowMisc= FALSE
						AllowPotion = FALSE
					endIf
				Status_Return = "Add Spell"
			endIf
		
		elseif StorageSpellVal
			if (!Game.GetPlayer().HasSpell(RN_Storage_Spell)) && SummonSpellVal
				(Game.GetPlayer().AddSpell(RN_Storage_Spell))
				
			elseif (!Game.GetPlayer().HasSpell(RN_Storage_Summon_Spell)) && !SummonSpellVal
				(Game.GetPlayer().AddSpell(RN_Storage_Summon_Spell))
				Status_Return = "Remove Spell"
			endif	
		endIf	
	return Status_Return 
endFunction

;;-------------------------------
	
String function GetStorageOptions()
	
	if DBM_ArcSkill.GetValue() < 5
		Status_Return = "Locked"
		StorageSpellVal = FALSE
	elseif !StorageSpellVal
		Status_Return = "Add Spell"		
	elseif StorageSpellVal
		Status_Return = "Remove Spell"
	endIf
		return Status_Return
endFunction	

;;-------------------------------

state iRelicStorageSummon ;;Storage Spell
	
	Event OnSelectST()
		SummonSpellVal = !SummonSpellVal 
			
		self.SetTextOptionValueST(Self.SetSummonOptions(), false, "")
		ForcePagereset()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Toggle to choose how you want to access the Relic Storage Container")
	EndEvent
endState

;;-------------------------------
	
String function SetSummonOptions()	

		if !SummonSpellVal
			(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
			(Game.GetPlayer().AddSpell(RN_Storage_Summon_Spell))
			Status_Return = "Summon Chest"
		
		elseif SummonSpellVal
			(Game.GetPlayer().RemoveSpell(RN_Storage_Summon_Spell))
			(Game.GetPlayer().AddSpell(RN_Storage_Spell))
			Status_Return = "Cloud Access"		
		endIf

	return Status_Return 
endFunction

;;-------------------------------
	
String function GetSummonOptions()
	
	if DBM_ArcSkill.GetValue() < 5
		Status_Return = "Locked"
	elseif !SummonSpellVal
		Status_Return = "Summon Chest"
	elseif SummonSpellVal
		Status_Return = "Cloud Access"
	endIf
		return Status_Return
endFunction	

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------------- Storage Transfer Options ---------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
state iRelicStorageTransfer ;;Storage Transfer
	
	Event OnSelectST()
		AutoTransferRelics = !AutoTransferRelics 
			
		if AutoTransferRelics
			RN_Transfer.GoToState("")
			
		else
			RN_Transfer.GoToState("Disabled")
		endIf
		
		self.SetTextOptionValueST(Self.SetTransferOptions(), false, "")
		ForcePagereset()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically moves displayable items from the player inventory to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState	

;;-------------------------------

state PrepStationTransfer ;;Prep Station Storage Transfer
	
	Event OnSelectST()
	
		if PrepTransfer == 0
		
			PrepTransfer = 1
			
		elseif PrepTransfer == 1
		
			PrepTransfer = 2
			
		elseif PrepTransfer == 2
		
			PrepTransfer = 0
		endif

		self.SetTextOptionValueST(Self.SetPrepStationOptions(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Choose which container(s) to check for displayable items when using the 'Transfer Relics' option at the Prep station.\n Default: All Storage")
	EndEvent
endState

;;-------------------------------
	
String function SetPrepStationOptions()	

	if PrepTransfer == 0
		Status_Return = "Custom Storage"
		
	elseif PrepTransfer == 1
		Status_Return = "All Storage"

	elseif PrepTransfer == 2
		Status_Return = "Relic Storage"
		
	endIf	
	
return Status_Return 
endFunction
	
;;-------------------------------
	
String function GetPrepStationOptions()
	
	if PrepTransfer == 0
		Status_Return = "Custom Storage"
		
	elseif PrepTransfer == 1
		Status_Return = "All Storage"

	elseif PrepTransfer == 2
		Status_Return = "Relic Storage"
		
	endIf	
	
return Status_Return 
endFunction	

;;-------------------------------
	
String function SetTransferOptions()	

	if !AutoTransferRelics
		Status_Return = "Disabled"
	elseif AutoTransferRelics
		Status_Return = "Enabled"				
	endIf	
return Status_Return 
endFunction
	
;;-------------------------------
	
String function GetTransferOptions()
	
	if !StorageSpellVal
		Status_Return = "Locked"
		AutoTransferRelics = FALSE
	elseif !AutoTransferRelics
		Status_Return = "Disabled"			
	elseif AutoTransferRelics
		Status_Return = "Enabled"				
	endIf	
return Status_Return 
endFunction	

;;-------------------------------

state ShowCustomContainerInfo ;;Storage Transfer
	
	Event OnSelectST()
		
		ShowMessage("Custom Storage Info" + "\n" + "\n The 'Curators Storage Token' can be crafted from the forges located around Skyrim, drop the token into any container or follower to add them to the custom storage list, drop another token into the container or follower to remove them from the list.", false, "Ok")
	EndEvent
endState

;;-------------------------------

state Token_Visibility ;;Token Visibility

	Event OnSelectST()
		Token_Vis = !Token_Vis
		SetToggleOptionValueST(Self.SetTokenVisibility(), false, "")
		ForcePageReset()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Toggle to show / hide the Curators Storage Token crafting recipe at the Forge / Smelter.")
	EndEvent
	
endState

;;-------------------------------
	
String function SetTokenVisibility()	

	if !Token_Vis
		RN_Token_Visibility.SetValue(0)
		Status_Return = "Hidden"
		
	elseif Token_Vis
		RN_Token_Visibility.SetValue(1)
		Status_Return = "Visible"
	endIf
	
	return Status_Return 
endFunction
	
;;-------------------------------
	
String function GetTokenVisibility()
	
	if !Token_Vis
		Status_Return = "Hidden"
		
	elseif Token_Vis
		Status_Return = "Visible"
	endIf
	
	return Status_Return 
endFunction	

;;-------------------------------

state Transfer_Weapon

	Event OnSelectST()
		AllowWeapon = !AllowWeapon
			SetToggleOptionValueST(AllowWeapon)
	EndEvent
	
	Event OnDefaultST()
		AllowWeapon = false
		SetToggleOptionValueST(AllowWeapon)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable weapons to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Armor

	Event OnSelectST()
		AllowArmor = !AllowArmor
			SetToggleOptionValueST(AllowArmor)
	EndEvent
	
	Event OnDefaultST()
		AllowArmor = false
		SetToggleOptionValueST(AllowArmor)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable armor to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Book

	Event OnSelectST()
		AllowBook = !AllowBook
			SetToggleOptionValueST(AllowBook)
	EndEvent
	
	Event OnDefaultST()
		AllowBook = false
		SetToggleOptionValueST(AllowBook)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable books to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Key

	Event OnSelectST()
		AllowKey = !AllowKey
			SetToggleOptionValueST(AllowKey)
	EndEvent
	
	Event OnDefaultST()
		AllowKey = false
		SetToggleOptionValueST(AllowKey)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable keys to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Gems

	Event OnSelectST()
		AllowGems = !AllowGems
			SetToggleOptionValueST(AllowGems)
	EndEvent
	
	Event OnDefaultST()
		AllowGems = false
		SetToggleOptionValueST(AllowGems)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable gems and soul gems to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Misc

	Event OnSelectST()
		AllowMisc = !AllowMisc
			SetToggleOptionValueST(AllowMisc)
	EndEvent
	
	Event OnDefaultST()
		AllowMisc = false
		SetToggleOptionValueST(AllowMisc)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable Misc Items to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Potion

	Event OnSelectST()
		AllowPotion = !AllowPotion
			SetToggleOptionValueST(AllowPotion)
	EndEvent
	
	Event OnDefaultST()
		AllowPotion = false
		SetToggleOptionValueST(AllowPotion)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable Potions & Poisons to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Section Toggles------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state iRelicMuseumNotifications

	Event OnSelectST()
		ShowMuseumVal = !ShowMuseumVal 
		
		self.SetTextOptionValueST(Self.SetMuseumNotificationsString(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Show Notifications when picking up a displayable item for the Museum.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetMuseumNotificationsString()

	if !ShowMuseumVal		
		Status_Return = "Disabled"
	elseif ShowMuseumVal	
		Status_Return = "Enabled"
	endIf
	return Status_Return
endfunction

;;-------------------------------
			
String function GetMuseumNotificationsString()

	if !ShowMuseumVal
		Status_Return = "Disabled"
	elseif ShowMuseumVal	
		Status_Return = "Enabled"
	endIf
	return Status_Return
endFunction	

;;-------------------------------

state iRelicArmoryNotifications

	Event OnSelectST()
		ShowArmoryVal = !ShowArmoryVal 
		
		self.SetTextOptionValueST(Self.SetArmoryNotificationsString(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Show Notifications when picking up a displayable item for the Armory.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetArmoryNotificationsString()

	if !ShowArmoryVal		
		Status_Return = "Disabled"
	elseif ShowArmoryVal	
		Status_Return = "Enabled"
	endIf
		return Status_Return
endfunction

;;-------------------------------
		
String function GetArmoryNotificationsString()

	if !ShowArmoryVal		
		Status_Return = "Disabled"
	elseif ShowArmoryVal	
		Status_Return = "Enabled"
	endIf
		return Status_Return
endFunction	

;;-------------------------------

state iRelicModsNotifications

	Event OnSelectST()
		ShowModsVal = !ShowModsVal 
		
		self.SetTextOptionValueST(self.SetModsNotificationsString(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Show Notifications when picking up a displayable item from any installed & Supported Mods.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetModsNotificationsString()

	if !ShowModsVal		
		Status_Return = "Disabled"
	elseif ShowModsVal	
		Status_Return = "Enabled"
	endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetModsNotificationsString()

	if !ShowModsVal
		Status_Return = "Disabled"
	elseif ShowModsVal	
		Status_Return = "Enabled"
	endIf
		return Status_Return
endFunction	

;;-------------------------------

state iRelicListenerNotifications
	
	function OnSelectST()
	
		ShowListenerVal = !ShowListenerVal 
		self.SetTextOptionValueST(self.SetListenerString(), false, "")			
	EndFunction

	Event OnHighlightST()

		self.SetInfoText("Enable to show notifications for quest, skills and exploration displays in the Museum.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetListenerString()

	if !ShowListenerVal		
		Status_Return = "Disabled"
	elseif ShowListenerVal	
		Status_Return = "Enabled"
	endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetListenerString()

	if !ShowListenerVal
		Status_Return = "Disabled"
	elseif ShowListenerVal	
		Status_Return = "Enabled"
	endIf
		return Status_Return
endFunction	

;;-------------------------------

state moreHUDOptions

	event OnMenuOpenST()
		SetMenuDialogStartIndex(IndexmoreHUD)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(moreHUDChoiceList)
	endEvent

	event OnMenuAcceptST(int index)
		IndexmoreHUD = Index
		SetMenuOptionValueST(moreHUDOptions, moreHUDChoiceList[IndexmoreHUD])
			
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017
			if Index == 0
				RN_moreHUD_Option.SetValue(1)
				AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
				AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
				AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif Index == 1
				RN_moreHUD_Option.SetValue(2)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)

			elseif Index == 2
				RN_moreHUD_Option.SetValue(3)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
				AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif Index == 3
				RN_moreHUD_Option.SetValue(4)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
				AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)		

			elseif Index == 4
				RN_moreHUD_Option.SetValue(5)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")				
				
			endIf
		endIf
			
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
			if Index == 0
				RN_moreHUD_Option.SetValue(1)
				AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
				AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
				AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif Index == 1
				RN_moreHUD_Option.SetValue(2)
				AhzmoreHUD.UnRegisterIconFormList("dbmFound")
				AhzmoreHUD.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)

			elseif Index == 2
				RN_moreHUD_Option.SetValue(3)
				AhzmoreHUD.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUD.UnRegisterIconFormList("dbmNew")
				AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif Index == 3
				RN_moreHUD_Option.SetValue(4)
				AhzmoreHUD.UnRegisterIconFormList("dbmNew")
				AhzmoreHUD.UnRegisterIconFormList("dbmFound")
				AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)		

			elseif Index == 4
				RN_moreHUD_Option.SetValue(5)
				AhzmoreHUD.UnRegisterIconFormList("dbmNew")
				AhzmoreHUD.UnRegisterIconFormList("dbmDisp")
				AhzmoreHUD.UnRegisterIconFormList("dbmFound")				
				
			endIf
		endIf
			
		ForcePageReset()
	endEvent

	event OnDefaultST()
		IndexmoreHUD = 0
		SetMenuOptionValueST(moreHUDChoiceList[IndexmoreHUD])
	endEvent

	event OnHighlightST()
		SetInfoText("Use this menu to customize which icons are displayed in the UI.\n Default: New & Displayed")
	endEvent
endState

;;-------------------------------

state Safehouse_Disp
	
	function OnSelectST()
	
		Safehouse_Enabled = !Safehouse_Enabled 
		
		if Safehouse_Enabled
			if self.ShowMessage("This will Enable moreHUD icons and functionality for all standard Safehouse displays, do you want to enable now?", true, "Enable", "Cancel")
				self.SetTextOptionValueST(self.SetSafehouseOptions(), false, "")
				RN_Utility.SetUpSafehouse()
				RN_Installed_SafehouseGeneral.SetValue(1)
			endIf
		endIF			
	EndFunction

	Event OnHighlightST()

		self.SetInfoText("Enable this to show moreHUD icons and add functionality to general Safehouse items.\n Default: Disabled \n (THIS FEATURE CAN NOT BE DISABLED ONCE TURNED ON)")
	EndEvent
endState

;;-------------------------------

String function SetSafehouseOptions()

	if !Safehouse_Enabled		
		Status_Return = "Disabled"
	elseif Safehouse_Enabled	
		Status_Return = "Enabled"
	endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetSafehouseOptions()

	if !Safehouse_Enabled
		Status_Return = "Disabled"
	elseif Safehouse_Enabled	
		Status_Return = "Enabled"
	endIf
		return Status_Return
endFunction	

;;--------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Return Strings -------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------

string function GetCurrentCount(GlobalVariable akVariable, GlobalVariable akVariableB)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	Int Total_Count = (akVariableB.GetValue()) as Int
	
		Status_Return = (Current_Count + "/" + Total_Count)
	return Status_Return
endFunction

;;-------------------------------

Event BuildTotals(globalvariable akvariable, globalvariable[] array)

	akvariable.setvalue(0)
	Int _Index = array.length
	while _Index
		_Index -= 1
		If array[_Index].GetValue()
			akvariable.Mod(1)
		endIF
	endWhile
endEvent

;;-------------------------------

string function GetCurrentMuseumCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	Int Total_Room = 11
		
		if RN_SupportedCreationCount.GetValue() > 0
			Total_Room += 1
		endIf

		if RN_Installed_SafehouseGeneral.GetValue()
			Total_Room += 1
		endIf
		
		Status_Return = (Current_Count + "/" + Total_Room + " Sections")
	return Status_Return
endFunction

;;-------------------------------

string function GetDisplaySectionCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/4 Sections")
	return Status_Return
endFunction

;;-------------------------------

string function GetCurrentArmoryCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/20")
	return Status_Return
endFunction

;;-------------------------------

string function GetCurrentIWCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/16")
	return Status_Return
endFunction	

;;-------------------------------

string function GetCurrentHACount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/19")
	return Status_Return
endFunction	

;;-------------------------------

String function GetTreasuryCountString2()

	if DBM_DHQuest.IsCompleted()
		Status_Return = RN_Treasury_Count2.GetValue() As Int
		return Status_Return
	else
		Status_Return = "Locked"
		return Status_Return 
	endIf
endFunction

;;-------------------------------

String function GetTreasuryCountString3()
	
	if DBM_Excavation02.IsCompleted()
		Status_Return = RN_Treasury_Count3.GetValue() As Int
		return Status_Return
	else
		Status_Return = "Locked"
		return Status_Return 
	endIf
endFunction

;;-------------------------------

String function GetTotalTreasuryValue(GlobalVariable akvariable1, GlobalVariable akvariable2, GlobalVariable akvariable3)

	RN_Total_Value.SetValue(0)
	RN_Total_Value.Mod(akvariable1.GetValue() As Int)
		if DBM_DHQuest.IsCompleted()
			RN_Total_Value.Mod(akvariable2.GetValue() As Int)
		endIf
		
		if DBM_Excavation02.IsCompleted()
			RN_Total_Value.Mod(akvariable3.GetValue() As Int)	
		endIf
			Status_Return = RN_Total_Value.GetValue() As Int
		return Status_Return
endFunction

;;-------------------------------

Event Build_Arrays()	
	
	Int _Index
	
	RN_Patches_Count_Array = new globalvariable[53]
	_Index = 0
	While _Index < RN_Patches_Count.GetSize()
		globalvariable akvariable = RN_Patches_Count.GetAt(_Index) as globalvariable
		RN_Patches_Count_Array[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Patches_Total_Array = new globalvariable[53]
	_Index = 0
	While _Index < RN_Patches_Total.GetSize()
		globalvariable akvariable = RN_Patches_Total.GetAt(_Index) as globalvariable
		RN_Patches_Total_Array[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Patches_Complete_Array = new globalvariable[53]
	_Index = 0
	While _Index < RN_Patches_Complete.GetSize()
		globalvariable akvariable = RN_Patches_Complete.GetAt(_Index) as globalvariable
		RN_Patches_Complete_Array[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Patches_Installed_Array = new globalvariable[53]
	_Index = 0
	While _Index < RN_Patches_Installed.GetSize()
		globalvariable akvariable = RN_Patches_Installed.GetAt(_Index) as globalvariable
		RN_Patches_Installed_Array[_Index] = akvariable
		_Index += 1
	endWhile

;;-------------------------------

	RN_Creations_Count_Array = new globalvariable[40]
	_Index = 0
	While _Index < RN_Creations_Count.GetSize()
		globalvariable akvariable = RN_Creations_Count.GetAt(_Index) as globalvariable
		RN_Creations_Count_Array[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Creations_Total_Array = new globalvariable[40]
	_Index = 0
	While _Index < RN_Creations_Total.GetSize()
		globalvariable akvariable = RN_Creations_Total.GetAt(_Index) as globalvariable
		RN_Creations_Total_Array[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Creations_Complete_Array = new globalvariable[40]
	_Index = 0
	While _Index < RN_Creations_Complete.GetSize()
		globalvariable akvariable = RN_Creations_Complete.GetAt(_Index) as globalvariable
		RN_Creations_Complete_Array[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Creations_Installed_Array = new globalvariable[40]
	_Index = 0
	While _Index < RN_Creations_Installed.GetSize()
		globalvariable akvariable = RN_Creations_Installed.GetAt(_Index) as globalvariable
		RN_Creations_Installed_Array[_Index] = akvariable
		_Index += 1
	endWhile
	
	RN_Patches_Name = new string[53]
	RN_Patches_Name[0] = "Aetherium Armor and Weapons"
	RN_Patches_Name[1] = "Amulets of Skyrim"
	RN_Patches_Name[2] = "Animated Armory"
	RN_Patches_Name[3] = "Artifacts of Boethiah"
	RN_Patches_Name[4] = "Artifacts of Skyrim"
	RN_Patches_Name[5] = "Bad Gremlins Collectables"
	RN_Patches_Name[6] = "Cloaks of Skyrim"
	RN_Patches_Name[7] = "Clockwork"
	RN_Patches_Name[8] = "Dawnguard Arsenal"
	RN_Patches_Name[9] = "Dwemer Spectres"
	RN_Patches_Name[10] = "Falskaar"
	RN_Patches_Name[11] = "Follower: Auri"
	RN_Patches_Name[12] = "Follower: Inigo"
	RN_Patches_Name[13] = "Follower: Kaidan"
	RN_Patches_Name[14] = "Follower: M'rissi"
	RN_Patches_Name[15] = "Fossil Mining"
	RN_Patches_Name[16] = "The Gray Cowl Of Nocturnal"
	RN_Patches_Name[17] = "Guard Armor Replacer"
	RN_Patches_Name[18] = "Heavy Armory"
	RN_Patches_Name[19] = "Helgen Reborn"
	RN_Patches_Name[20] = "Ice Blade of the Monarch"
	RN_Patches_Name[21] = "Immersive College Of Winterhold"
	RN_Patches_Name[22] = "Immersive Armors"
	RN_Patches_Name[23] = "Immersive Weapons"
	RN_Patches_Name[24] = "Inn Soaps"
	RN_Patches_Name[25] = "Interesting NPC's"
	RN_Patches_Name[26] = "Jaysus Swords"
	RN_Patches_Name[27] = "konahrik's accoutrements"
	RN_Patches_Name[28] = "Kthonia's Weapon Pack"
	RN_Patches_Name[29] = "Moonpath To Elsweyr"
	RN_Patches_Name[30] = "Moon And Star"
	RN_Patches_Name[31] = "New Treasure Hunt"
	RN_Patches_Name[32] = "Oblivion Artifacts"
	RN_Patches_Name[33] = "Path of the Revanant"
	RN_Patches_Name[34] = "Project AHO"
	RN_Patches_Name[35] = "Royal Armory"
	RN_Patches_Name[36] = "Ruins Edge"
	RN_Patches_Name[37] = "Skyrim Sewers"
	RN_Patches_Name[38] = "Skyrim Underground"
	RN_Patches_Name[39] = "Skyrim Unique Treasures"
	RN_Patches_Name[40] = "Staff of Sheogorath"
	RN_Patches_Name[41] = "Teldryn Serious"
	RN_Patches_Name[42] = "The Brotherhood of Old"
	RN_Patches_Name[43] = "The Forgotten City"
	RN_Patches_Name[44] = "The Wheels Of Lull"
	RN_Patches_Name[45] = "Tools of Kagrenac"
	RN_Patches_Name[46] = "Treasure Hunter"
	RN_Patches_Name[47] = "Undeath"
	RN_Patches_Name[48] = "Vigilant."
	RN_Patches_Name[49] = "Volkihar Knight"
	RN_Patches_Name[50] = "Wintersun"
	RN_Patches_Name[51] = "Wyrmstooth"
	RN_Patches_Name[52] = "Zim's Thane Weapons"	

	RN_Creations_Name = new string[40]
	RN_Creations_Name[0] = "Adventurer's Backpack"
	RN_Creations_Name[1] = "Alternate Armors - Daedric Mail"
	RN_Creations_Name[2] = "Alternate Armors - Dragonscale"
	RN_Creations_Name[3] = "Alternate Armors - Dwarven Mail"
	RN_Creations_Name[4] = "Alternate Armors - Ebony Plate"
	RN_Creations_Name[5] = "Alternate Armors - Elven Hunter"
	RN_Creations_Name[6] = "Alternate Armors - Stalhrim Fur"
	RN_Creations_Name[7] = "Alternate Armors - Steel Soldier"
	RN_Creations_Name[8] = "Arcane Accessories"
	RN_Creations_Name[9] = "Arcane Archer Pack"
	RN_Creations_Name[10] = "Arms of Chaos"
	RN_Creations_Name[11] = "Bone Wolf"
	RN_Creations_Name[12] = "Camping"
	RN_Creations_Name[13] = "Civil War Champions"
	RN_Creations_Name[14] = "Dawnfang & Duskfang"
	RN_Creations_Name[15] = "Dead Man's Dread"
	RN_Creations_Name[16] = "Divine Crusader"
	RN_Creations_Name[17] = "Dwarven Armored Mudcrab"
	RN_Creations_Name[18] = "Elite Crossbows"
	RN_Creations_Name[19] = "Expanded Crossbow Pack"
	RN_Creations_Name[20] = "Forgotten Seasons"
	RN_Creations_Name[21] = "Goblins"
	RN_Creations_Name[22] = "Netch Leather Armor"
	RN_Creations_Name[23] = "Nix-Hound"
	RN_Creations_Name[24] = "Nordic Jewelry"
	RN_Creations_Name[25] = "Pets of Skyrim"
	RN_Creations_Name[26] = "Plague of the Dead"
	RN_Creations_Name[27] = "Rare Curios"
	RN_Creations_Name[28] = "Ruin's Edge"
	RN_Creations_Name[29] = "Saints & Seducers"
	RN_Creations_Name[30] = "Saturalia Holiday Pack"
	RN_Creations_Name[31] = "Shadowrend"
	RN_Creations_Name[32] = "Spell Knight Armor"
	RN_Creations_Name[33] = "Staff of Hasedoki"
	RN_Creations_Name[34] = "Staff of Sheogorath"
	RN_Creations_Name[35] = "Stendarr's Hammer"
	RN_Creations_Name[36] = "The Gray Cowl Returns!"
	RN_Creations_Name[37] = "Umbra"
	RN_Creations_Name[38] = "Vigil Enforcer Armor Set"
	RN_Creations_Name[39] = "Wild Horses"
endEvent

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script End ------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
