scriptname RN_Utility_MCM extends SKI_ConfigBase

import FISSFactory

import AhzmoreHUD
import AhzmoreHUDIE

import utility

RN_Utility_Script property RN_Utility auto

RN_Utility_Mods property RN_Mod auto

RN_Storage_Transfer property RN_Transfer auto

RN_Utility_QuestTracker_MCM property RN_Tracker auto

DBM_ReplicaHandler property ReplicaHandler auto

RN_Utility_ArrayHolder property RN_Array auto

RN_Utility_QuestTracker_Arrays property RN_Tracker_Array auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; String Returns
string[] MCM_Strings
string[] PagesList
string InputBox = "Enter Password"
string Status_Return

;; Scan Variables
bool bScanning = false
globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Sent auto

;; Debug Variables
int inputOID_I
message property moreHUDListRebuilt auto
globalvariable property RN_Debug_Access auto
globalvariable property RN_Debug_Randomiser auto

;; Player Ref for Game.GetPlayer()
objectreference property PlayerRef auto

;; location Properties
location property DBM_DragonbornGalleryLocation auto
location property DBM_GuildHouseSolitudeLocation auto

;; Storage Options
spell property RN_Storage_Spell auto
globalvariable property CustomContainer auto

;; Treasury Value
quest property DBM_Excavation02 auto
quest property DBM_DHQuest auto

;; moreHUD
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto
formlist property dbmMaster auto
formlist property RN_TokenFormlist_NoShipment auto
globalvariable property RN_moreHUD_Option auto

;; Formlists to control merged and found lists
formlist property Supported_Items_Merged auto
formlist property Supported_Items_Found auto

string[] moreHUDChoiceList 
int IndexmoreHUD = 0
int moreHUDOptions

;; Custom Storage
formlist property RN_TokenFormlist auto
formlist property DBM_ReplicaBaseItems auto
formlist property DBM_ReplicaItems auto

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

bool property ShowLocationOverrideVal auto hidden ;;Debug Disable location Checks
bool iRelicLocationDebug = false

bool property ShowStorageSpellOverideVal auto hidden ;;Debug Disable spell Checks
bool iRelicSpellDebug = false

bool property StorageSpellVal auto hidden ;;Storage spell Value
bool iRelicStorageOptions = false

bool property AutoTransferRelics auto hidden ;;auto Transfer To Storage Container
bool iRelicStorageTransfer = false

bool property AllowWeapon auto hidden ;;auto Transfer To Storage Container
bool Transfer_Weapon = false

bool property AllowArmor auto hidden ;;auto Transfer To Storage Container
bool Transfer_Armor = false

bool property AllowBook auto hidden ;;auto Transfer To Storage Container
bool Transfer_Book = false

bool property AllowPotion auto hidden ;;auto Transfer To Storage Container
bool Transfer_Potion = false

bool property AllowKey auto hidden ;;auto Transfer To Storage Container
bool Transfer_Key = false

bool property AllowGems auto hidden ;;auto Transfer To Storage Container
bool Transfer_Gems = false

bool property AllowMisc auto hidden ;;auto Transfer To Storage Container
bool Transfer_Misc = false

bool property DevDebugVal auto hidden ;; Debug alerts for Dev usage.
bool Dev_Alerts = false

bool property ShowStartup = true auto hidden ;; Shows Startup Messages
bool iRelicShowStartup = false

Int property PrepTransfer auto hidden ;; Prep Station transfer settings.
bool PrepStationTransfer = false

bool property ReplicaTag auto hidden
bool ReplicaTagging = false

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
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnConfigInit()
	
	RN_Thane_Listener_Total.SetValue(9)
	RN_Skills_Listener_Total.SetValue(6)
	CustomContainer.SetValue(1)
	AddDynamicPagesList()
EndEvent

;-- Events --------------------------------

Event AddDynamicPagesList()

	ModName = "LOTD: The Curators Companion"
	PagesList = new String[11]
	PagesList[0] = "General Settings"
	PagesList[1] = "Scan & Advanced"
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
	InitMCMStrings()
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

;-- Events --------------------------------

Event InitMCMStrings()

	MCM_Strings = new string[28]
	MCM_Strings[0] = "Developed By (Ic0n)Ic0de"
	MCM_Strings[1] = "Version 2.1.1"
	MCM_Strings[2] = "<font color='#750e0e'>Invalid Version</font>"
	MCM_Strings[3] = "<font color='#750e0e'>Not Found</font>"
	MCM_Strings[4] = "Complete"
	MCM_Strings[5] = "Scan"
	MCM_Strings[6] = "Hide"
	MCM_Strings[7] = "Disabled"
	MCM_Strings[8] = "Enabled"
	MCM_Strings[9] = "Add Spell"
	MCM_Strings[10] = "Remove Spell"
	MCM_Strings[11] = "Default Message"
	MCM_Strings[12] = "Simple Notification"
	MCM_Strings[13] = "Access"
	MCM_Strings[14] = "<font color='#2b6320'>Authorised</font>"
	MCM_Strings[15] = "Enter Password"
	MCM_Strings[16] = "Load Preset"
	MCM_Strings[17] = "FISS Not Found"
	MCM_Strings[18] = "Save Preset"
	MCM_Strings[19] = "Reload MCM"
	MCM_Strings[20] = "Show"
	MCM_Strings[21] = "Locked"
	MCM_Strings[22] = "Requires Perk"
	MCM_Strings[23] = "Setting Up"
	MCM_Strings[24] = "Update Figures Now"
	MCM_Strings[25] = "<font color='#2b6320'>Installed</font>"
	MCM_Strings[26] = "Restore"
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
		AddTextOptionST("RefreshMCM", "Something not working?", MCM_Strings[19], 0)
		
		SetCursorPosition(1)			
		AddHeaderOption("Mod Info:")
		AddTextOption("Thanks for using The Curators Companion, a full", "", 0)
		AddTextOption("featured add-on for Legacy of the Dragonborn.", "", 0)
		AddEmptyOption()
		AddTextOption("", MCM_Strings[0], 0)
		AddTextOption("", MCM_Strings[1], 0)		
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

	if CurrentPage == "Scan & Advanced"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("moreHUD Settings:")
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017 || SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
			AddMenuOptionST("moreHUDOptions", "moreHUD Icon Settings:", moreHUDChoiceList[IndexmoreHUD])	
		else
			AddtextOption("moreHUD Icon Settings:", MCM_Strings[3])
		endif
		AddTextOptionST("ReplicaTagging", "moreHUD Advanced Tagging:", self.GetReplicaTaggingOptions(), 0)
		
		AddEmptyOption()
		
		AddHeaderOption("Museum Scan:")
		AddTextOptionST("ScanAll", "Scan Displays (All Displays)", MCM_Strings[5], 0)
		AddTextOptionST("ScanMuseum", "Scan Displays (Museum)", MCM_Strings[5], 0)
		
		if RN_SupportedModCount.GetValue() > 0
			AddTextOptionST("ScanMods", "Scan Displays (Mods)", MCM_Strings[5], 0)
		else
			AddTextOptionST("ScanMods", "Scan Displays (Mods)", "No Patches Found", 1)
		endIf

		if RN_SupportedCreationCount.GetValue() > 0
			AddTextOptionST("ScanCreations", "Scan Displays (Creations)", MCM_Strings[5], 0)
		else
			AddTextOptionST("ScanCreations", "Scan Displays (Creations)", "No Creations Found", 1)
		endIf
		
		SetCursorPosition(1)
		
		AddHeaderOption("General Settings:")
		AddTextOptionST("PrepStationTransfer", "Prep Station Settings:", self.GetPrepStationOptions(), 0)
		AddTextOptionST("iRelicShowStartup", "Startup Notifications:", self.GetShowStartup(), 0)		
		
		AddEmptyOption()
		
		AddHeaderOption("Scan Info:")
		AddTextOption("You can run these scans to update the info and figures", "", 0)
		AddTextOption("within the MCM, the mod will automatically update all", "", 0)
		AddTextOption("the required information during the scan and check for", "", 0)
		AddTextOption("any completed sets or Museum sections.", "", 0)	
			
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
		
			 if DBM_ArcSkill.GetValue() >= 5 || ShowStorageSpellOverideVal 
				AddTextOptionST("iRelicStorageOptions", "Relic Storage Container:", self.GetStorageOptions(), 0)
			else
				AddTextOptionST("iRelicStorageOptions", "Relic Storage Container:", self.GetStorageOptions(), 1)
			endIf
			
			if StorageSpellVal 
				AddTextOptionST("iRelicStorageTransfer", "Auto Relic Storage:", self.GetTransferOptions(), 0)
			else
				AddTextOptionST("iRelicStorageTransfer", "Auto Relic Storage:", self.GetTransferOptions(), 1)
			endIf
		
		
		AddEmptyOption()
		AddHeaderOption("Auto Storage Options:")
			if !StorageSpellVal || !AutoTransferRelics
				AddToggleOptionST("Transfer_Weapon", "Weapons", AllowWeapon, 1)
				AddToggleOptionST("Transfer_Armor", "Armor", AllowArmor, 1)
				AddToggleOptionST("Transfer_Book", "Books", AllowBook, 1)
				AddToggleOptionST("Transfer_Gems", "Gems & Soul Gems", AllowGems, 1)
				AddToggleOptionST("Transfer_Potion", "Potions", AllowPotion, 1)
				AddToggleOptionST("Transfer_Key", "Keys", AllowKey, 1)
				AddToggleOptionST("Transfer_Misc", "Misc Items", AllowMisc, 1)
			else
				AddToggleOptionST("Transfer_Weapon", "Weapons", AllowWeapon, 0)
				AddToggleOptionST("Transfer_Armor", "Armor", AllowArmor, 0)
				AddToggleOptionST("Transfer_Book", "Books", AllowBook, 0)
				AddToggleOptionST("Transfer_Gems", "Gems & Soul Gems", AllowGems, 0)
				AddToggleOptionST("Transfer_Potion", "Potions", AllowPotion, 0)
				AddToggleOptionST("Transfer_Key", "Keys", AllowKey, 0)	
				AddToggleOptionST("Transfer_Misc", "Misc Items", AllowMisc, 0)
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
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		if (DBM_SortWait.GetValue())
			AddHeaderOption("Information:")
			AddTextOption("This Page is currently unavailable due to an on-going", "", 0)
			AddTextOption("process, this could include:", "", 0)
			AddEmptyOption()
			AddTextOption("-Mod Setup.", "", 0)
			AddTextOption("-Display Scanning features.", "", 0)
			AddTextOption("-Sorting via Prep Station.", "", 0)
			AddTextOption("-Sorting via Display Drop-Off.", "", 0)
			AddEmptyOption()
			AddTextOption("Please exit the MCM and wait for the current operation", "", 0)
			AddTextOption("to finish.", "", 0)			
			SetCursorPosition(1)
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddTextOption("'Patience is the calm acceptance that things can happen", "", 0)
			AddTextOption("in a different order than the one you have in your mind'", "", 0)
			AddTextOption("                                   -David G. Allen", "", 0)		
		else		
			AddHeaderOption("Museum Sections:")	
			Int _Index = 0
			Int _Length = RN_Array._Museum_Section_names.length
			While _Index < _Length 
			
				if RN_Array._Museum_Global_Complete[_Index].GetValue() == 1
					AddTextOption(RN_Array._Museum_Section_names[_Index], MCM_Strings[4], 1)
				else
					AddTextOption(RN_Array._Museum_Section_names[_Index], self.GetCurrentCount(RN_Array._Museum_Global_Count[_Index], RN_Array._Museum_Global_Total[_Index]), 0)
				endIf
				_Index += 1
				
				if _Index == 8 && RN_SupportedCreationCount.GetValue() == 0
					_Index += 1
				endIf
				
				if _Index == 11 && RN_Mod.XX_SafehouseL == false
					_Index += 1
				endIf
			endWhile
			
			AddEmptyOption()
			AddHeaderOption("Museum Displays:")
			
			if (RN_Quest_Listener_Complete.GetValue()) == 1
				AddTextOption("Quest Displays:", MCM_Strings[4], 1)
			else
				AddTextOption("Quest Displays:", self.GetCurrentCount(RN_Quest_Listener_Count, RN_Quest_Listener_Total), 0)
			endIf			

			if (RN_Exploration_Listener_Complete.GetValue()) == 1
				AddTextOption("Exploration Displays:", MCM_Strings[4], 1)
			else
				AddTextOption("Exploration Displays:", self.GetCurrentCount(RN_Exploration_Listener_Count, RN_Exploration_Listener_Total), 0)
			endIf

			if (RN_Skills_Listener_Complete.GetValue()) == 1
				AddTextOption("Skills Displays:", MCM_Strings[4], 1)
			else
				AddTextOption("Skills Displays:", self.GetCurrentCount(RN_Skills_Listener_Count, RN_Skills_Listener_Total), 0)
			endIf

			if (RN_Thane_Listener_Complete.GetValue()) == 1
				AddTextOption("Thane of the Holds:", MCM_Strings[4], 1)
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
			if RN_Mod.XX_SafehouseL
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
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Armory Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Event AddArmorySetsPage()

	if CurrentPage == "Armory Sections"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)				
		if (DBM_SortWait.GetValue())
			AddHeaderOption("Information:")
			AddTextOption("This Page is currently unavailable due to an on-going", "", 0)
			AddTextOption("process, this could include:", "", 0)
			AddEmptyOption()
			AddTextOption("-Mod Setup.", "", 0)
			AddTextOption("-Display Scanning features.", "", 0)
			AddTextOption("-Sorting via Prep Station.", "", 0)
			AddTextOption("-Sorting via Display Drop-Off.", "", 0)
			AddEmptyOption()
			AddTextOption("Please exit the MCM and wait for the current operation", "", 0)
			AddTextOption("to finish.", "", 0)			
			SetCursorPosition(1)
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddTextOption("'Patience is the calm acceptance that things can happen", "", 0)
			AddTextOption("in a different order than the one you have in your mind'", "", 0)
			AddTextOption("                                   -David G. Allen", "", 0)			
		else

			AddHeaderOption("Armory Sets:")
			Int _Index = 0
			Int _Length = RN_Array._Armory_Section_names.length
			While _Index < _Length 
			
				if RN_Array._Armory_Global_Complete[_Index].GetValue() == 1
					AddTextOption(RN_Array._Armory_Section_names[_Index], MCM_Strings[4], 1)
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
			
			if (RN_Mod.XX_HeavyArmL)
				AddHeaderOption("Heavy Armory Sets:")
				
				_Index = 0
				_Length = RN_Array._HeavyArmory_Section_names.length
				While _Index < _Length 
				
					if RN_Array._HeavyArmory_Global_Complete[_Index].GetValue() == 1
						AddTextOption(RN_Array._HeavyArmory_Section_names[_Index], MCM_Strings[4], 1)
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
			
			if (RN_Mod.XX_HeavyArmL)
				SetCursorPosition(48)
			else
				SetCursorPosition(24)
			endIf
			
			if (RN_Mod.XX_ImmWeapL)
				AddHeaderOption("Immersive Weapons Sets:")
				
				_Index = 0
				_Length = RN_Array._ImmersiveWeapons_Section_names.length
				While _Index < _Length 
				
					if RN_Array._ImmersiveWeapons_Global_Complete[_Index].GetValue() == 1
						AddTextOption(RN_Array._ImmersiveWeapons_Section_names[_Index], MCM_Strings[4], 1)
					else
						AddTextOption(RN_Array._ImmersiveWeapons_Section_names[_Index], self.GetCurrentCount(RN_Array._ImmersiveWeapons_Global_Count[_Index], RN_Array._ImmersiveWeapons_Global_Total[_Index]), 0)
					endIf
					_Index +=1
					
					if _Index == _Length / 2
						if (RN_Mod.XX_HeavyArmL) 
							SetCursorPosition(49)
						else
							SetCursorPosition(25)
						endIf
						AddHeaderOption("Completed: " + self.GetCurrentIWCount(iImmWeapSets) + " Sets")
					endIf
				endWhile
			endIf
		endIf
	endIf
endEvent		

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------Mods Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddCompletedModsPage()

	if CurrentPage == "Supported Mods"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)		
		if (DBM_SortWait.GetValue())
			AddHeaderOption("Information:")
			AddTextOption("This Page is currently unavailable due to an on-going", "", 0)
			AddTextOption("process, this could include:", "", 0)
			AddEmptyOption()
			AddTextOption("-Mod Setup.", "", 0)
			AddTextOption("-Display Scanning features.", "", 0)
			AddTextOption("-Sorting via Prep Station.", "", 0)
			AddTextOption("-Sorting via Display Drop-Off.", "", 0)
			AddEmptyOption()
			AddTextOption("Please exit the MCM and wait for the current operation", "", 0)
			AddTextOption("to finish.", "", 0)			
			SetCursorPosition(1)
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddTextOption("'Patience is the calm acceptance that things can happen", "", 0)
			AddTextOption("in a different order than the one you have in your mind'", "", 0)
			AddTextOption("                                   -David G. Allen", "", 0)			
		else
			AddHeaderOption("Installed Patches:")

			if RN_SupportedModCount.GetValue() > 0

				Int _Index = 0
				While _Index < RN_Array._PatchName.length
				
					if RN_Array._bPatches[_Index]
						if RN_Array._GVComplete[_Index].GetValue() == 1
							AddTextOption(RN_Array._PatchName[_Index], MCM_Strings[4], 1)
						else
							AddTextOption(RN_Array._PatchName[_Index], self.GetCurrentCount(RN_Array._PatchCount[_Index], RN_Array._PatchTotal[_Index]), 0)
						endIf
					endIf
					_Index +=1
				endWhile					
			else
				AddTextOption("No Patches Installed", "", 1)
			endIf

			SetCursorPosition(1)
			AddHeaderOption("Page Information:")
			AddTextOption("This page lists all the installed and supported mods.", "", 0)
			AddEmptyOption()
			AddTextOption("As you collect and display your items, the page will", "", 0)
			AddTextOption("keep track of your progess.", "", 0)
			AddEmptyOption()			
			AddTextOption("Run the Mods Scan from the MCM or Prep station to", "", 0)
			AddTextOption("update the current figures.", "", 0)
			AddEmptyOption()
			AddTextOption("Completed ", self.GetCurrentCount(iModComplete, RN_SupportedModCount) + " Supported Mods", 0)			
		endIf
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------Creations Page --------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddCompletedCreationsPage()

	if CurrentPage == "Supported Creations"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)		
		if (DBM_SortWait.GetValue())
			AddHeaderOption("Information:")
			AddTextOption("This Page is currently unavailable due to an on-going", "", 0)
			AddTextOption("process, this could include:", "", 0)
			AddEmptyOption()
			AddTextOption("-Mod Setup.", "", 0)
			AddTextOption("-Display Scanning features.", "", 0)
			AddTextOption("-Sorting via Prep Station.", "", 0)
			AddTextOption("-Sorting via Display Drop-Off.", "", 0)
			AddEmptyOption()
			AddTextOption("Please exit the MCM and wait for the current operation", "", 0)
			AddTextOption("to finish.", "", 0)			
			SetCursorPosition(1)
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddTextOption("'Patience is the calm acceptance that things can happen", "", 0)
			AddTextOption("in a different order than the one you have in your mind'", "", 0)
			AddTextOption("                                   -David G. Allen", "", 0)			
		else
			AddHeaderOption("Installed Creations:")
			
			if RN_SupportedCreationCount.GetValue() > 0

				Int _Index = 0
				While _Index < RN_Array._CreationName.length
				
					if RN_Array._bCreations[_Index]
						if RN_Array._GVCreationComplete[_Index].GetValue() == 1
							AddTextOption(RN_Array._CreationName[_Index], MCM_Strings[4], 1)
						else
							AddTextOption(RN_Array._CreationName[_Index], self.GetCurrentCount(RN_Array._CreationCount[_Index], RN_Array._CreationTotal[_Index]), 0)
						endIf
					endIf
					_Index +=1
				endWhile					
			else
				AddTextOption("No Creations Installed", "", 1)
			endIf

			SetCursorPosition(1)
			AddHeaderOption("Page Information:")
			AddTextOption("This page lists all installed and supported Creations.", "", 0)
			AddEmptyOption()
			AddTextOption("As you collect and display your items, the page will", "", 0)
			AddTextOption("keep track of your progess.", "", 0)
			AddEmptyOption()			
			AddTextOption("Run the Mods Scan from the MCM or Prep station to", "", 0)
			AddTextOption("update the current figures.", "", 0)
			AddEmptyOption()
			AddTextOption("Completed ", self.GetCurrentCount(iCreationComplete, RN_SupportedCreationCount) + " Supported Creations", 0)			
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
		
		inputOID_I = AddInputOption("Debug Options:", InputBox)
		AddEmptyOption()
		
		if (RN_Debug_Access.GetValue()) == (RN_Debug_Randomiser.GetValue())
			
			AddToggleOptionST("iRelicLocationDebug", "Disable Location Checks", ShowLocationOverrideVal)
			AddToggleOptionST("iRelicSpellDebug", "Disable Spell Requirements", ShowStorageSpellOverideVal)
			AddToggleOptionST("Dev_Alerts", "Developer Debugging", DevDebugVal)
			
			AddEmptyOption()
			AddHeaderOption("moreHUD Debug:")
			AddTextOption("moreHUD new count:", dbmNew.GetSize() As Int, 0)
			AddTextOption("moreHUD found count:", dbmFound.GetSize() As Int, 0)
			AddTextOption("moreHUD Displayed count:", dbmDisp.GetSize() As Int, 0)
			AddTextOption("moreHUD total Count:", dbmMaster.GetSize() As Int, 0)
			AddEmptyOption()
			AddTextOptionST("RevertLists", "Reset moreHUD Lists", "", 0)
			AddTextOptionST("RebuildLists", "Rebuild moreHUD Items", "", 0)
			AddEmptyOption()
			AddHeaderOption("Items Debug:")
			AddTextOption("Supported Mods Merged count:", Supported_Items_Merged.GetSize() As Int, 0)
			AddTextOption("Supported Mods Found count:", Supported_Items_Found.GetSize() As Int, 0)			
			
		else
		
			AddTextOption("This mods debug options have been password protected", "", 0)
			AddTextOption("due to the nature of the tasks they perform.", "", 0)
			AddEmptyOption()
			AddTextOption("Users should have absolutely no reason to use them", "", 0)
			AddTextOption("so they have been locked, if you require support or", "", 0)
			AddTextOption("help with an issue please reach out to me on Nexus.", "", 0)	
		endIf
		
		SetCursorPosition(1)
		
		AddHeaderOption("Mod Requirements:")

		if SKSE.GetPluginVersion("fisses") > 0
		
			AddTextOption("FISSES:", MCM_Strings[25] + " [" + SKSE.GetPluginVersion("fisses") + "]", 0)
			
		else
		
			AddTextOption("FISSES:", MCM_Strings[3], 0)
			
		endIf

		if SKSE.GetVersion() > 0
			Int fSKSE = SKSE.GetVersion() * 10000 + SKSE.GetVersionMinor() * 100 + SKSE.GetVersionBeta()
			AddTextOption("SKSE:", MCM_Strings[25] + " [" + fSKSE + "]", 0)
			
		else
		
			AddTextOption("SKSE:", MCM_Strings[3], 0)
			
		endIf

		if (RN_Mod.XX_SkyUI)
		
			AddTextOption("SkyUI:", MCM_Strings[25] + " [5.2SE]", 0)
			
		else
		
			AddTextOption("SkyUI:", MCM_Strings[3], 0)
			
		endIf	
		
		AddEmptyOption()
		AddHeaderOption("Icon Support:")
		
		;;<font color='COLORHERE'>$FF_Sandbox</font>
		
		;;#2b6320 - Green
		;;#750e0e - Red
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
		
			AddTextOption("moreHUD:", MCM_Strings[25] + " [" + SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") + "]", 0)
			
		elseif SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") < 30800
		
			AddTextOption("moreHUD:", MCM_Strings[2], 0)
		
		else
			
			AddTextOption("moreHUD:", MCM_Strings[3], 0)
			
		endIf
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017
		
			AddTextOption("moreHUD Inventory Edition:", MCM_Strings[25] + " [" + SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") + "]", 0)
			
		elseif SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") < 10017
		
			AddTextOption("moreHUD Inventory Edition:", MCM_Strings[2], 0)
		
		else
		
			AddTextOption("moreHUD Inventory Edition:", MCM_Strings[3], 0)
			
		endIf

	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General States------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state RefreshMCM

	function OnSelectST()
	
			ShowMessage("Please exit MCM and re-enter again to see changes", false, "Ok")
			SetTitleText("===PLEASE WAIT===")
			AddDynamicPagesList()	
			RN_Tracker_Array._Build_Quest_Toggles()
			RN_Tracker_Array._Build_Quest_Arrays()
			ForcePageReset()
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

String function GetConfigSaveString()
	
		if (RN_Mod.XX_FissL)
			Status_Return = MCM_Strings[18]
		else
			Status_Return = MCM_Strings[17]
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
		
	fiss.saveBool("Museum Notifications", ShowMuseumVal)
	fiss.saveBool("Armory Notifications", ShowArmoryVal)
	fiss.saveBool("Supported Mods Notifications", ShowModsVal)
	fiss.saveBool("Show Section/Set Complete Notifications", ShowSetCompleteVal)
	fiss.saveBool("Show Basic Notifications", ShowSimpleNotificationVal)
	fiss.saveBool("Museum Display Listener", ShowListenerVal)
	
	fiss.saveBool("Show startup notifications", ShowStartup)
	
	fiss.saveBool("Safe Storage Spell", StorageSpellVal)
	fiss.saveBool("Relic Transfer", AutoTransferRelics)
	fiss.saveInt("Prep Station Transfer", PrepTransfer) 
	
	fiss.saveBool("AllowWeapon", AllowWeapon)
	fiss.saveBool("AllowArmor", AllowArmor)
	fiss.saveBool("AllowBook", AllowBook)
	fiss.saveBool("AllowPotion", AllowPotion)
	fiss.saveBool("AllowKey", AllowKey)
	fiss.saveBool("AllowGems", AllowGems)	
	fiss.saveBool("AllowMisc", AllowMisc)	
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017 || SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800	
		fiss.saveInt("moreHUDOption", IndexmoreHUD)		
	endIf
	
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

state Config_Load

	Event OnSelectST()
		
		Begin_Config_Load()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Load user settings from Config File (Requires FISS)")
	EndEvent
endState

String function GetConfigLoadString()

		if (RN_Mod.XX_FissL)
			Status_Return = MCM_Strings[16]
		else
			Status_Return = MCM_Strings[17]
		endIf
	return Status_Return
endFunction	

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

	return MCM_Strings[26]
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

	return MCM_Strings[16]
endFunction	

;-- Load States / Function --------------------------------

Function Begin_Config_Load()
FISSInterface fiss = FISSFactory.getFISS()
	
	_UserSettings = false
	
	If !fiss && IsInMenuMode()
		self.ShowMessage("FISS not installed, unable to load user settings from config file", false, "Ok")
			return
	endIf
	
	fiss.beginLoad("TheCuratorsCompanion_Config.xml")	
	
	ShowMuseumVal = fiss.loadBool("Museum Notifications")
	ShowArmoryVal = fiss.loadBool("Armory Notifications")
	ShowModsVal = fiss.loadBool("Supported Mods Notifications")
	ShowSetCompleteVal = fiss.loadBool("Show Section/Set Complete Notifications")
	ShowSimpleNotificationVal = fiss.loadBool("Show Basic Notifications")
	ShowListenerVal = fiss.loadBool("Museum Display Listener")
	ShowStartup = fiss.loadBool("Show startup notifications")	

	StorageSpellVal= fiss.loadBool("Safe Storage Spell")
		if !StorageSpellVal
			if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
				(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
			endIf
			
		elseif StorageSpellVal
			if (!Game.GetPlayer().HasSpell(RN_Storage_Spell))
				(Game.GetPlayer().AddSpell(RN_Storage_Spell))
			endif	
		endIf
			
	AutoTransferRelics = fiss.loadBool("Relic Transfer")
		if AutoTransferRelics
			RN_Transfer.GoToState("")
			
		else
			RN_Transfer.GoToState("Disabled")
		endIf
	
	PrepTransfer = fiss.loadInt("Prep Station Transfer") 	
	AllowWeapon = fiss.loadBool("AllowWeapon")
	AllowArmor = fiss.loadBool("AllowArmor")
	AllowBook = fiss.loadBool("AllowBook")
	AllowPotion = fiss.loadBool("AllowPotion")
	AllowKey = fiss.loadBool("AllowKey")
	AllowGems = fiss.loadBool("AllowGems")
	AllowMisc = fiss.loadBool("AllowMisc")
	
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

Function Begin_Config_Default()

	ShowMuseumVal = True
	ShowArmoryVal = True
	ShowModsVal = True
	ShowSetCompleteVal = True
	ShowSimpleNotificationVal = True
	ShowListenerVal = True
	ShowLocationOverrideVal = False
	ShowStorageSpellOverideVal = False
	DevDebugVal = False
	ShowStartup = True
	PrepTransfer = 1
	
	StorageSpellVal = False
	if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
		(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
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
	AllowPotion = False
	AllowKey = False
	AllowGems = False
	AllowMisc = False
	
	RN_Tracker._bSpoilers = false
	RN_Tracker._HideIncomplete = false
	
	RN_Tracker._Helgen_Index = 0
	RN_Tracker._Legacy_Index = 0
	
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
	ShowLocationOverrideVal = False
	ShowStorageSpellOverideVal = False
	DevDebugVal = False
	ShowStartup = False
	PrepTransfer = 1
	
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
		AllowPotion = True
		AllowKey = True
		AllowGems = True
		AllowMisc = True
		
		StorageSpellVal = True
		if !(Game.GetPlayer().HasSpell(RN_Storage_Spell))
			(Game.GetPlayer().AddSpell(RN_Storage_Spell))
		endIf
		
	else
		AutoTransferRelics = False
		RN_Transfer.GoToState("Disabled")
		AllowWeapon = False
		AllowArmor = False
		AllowBook = False
		AllowPotion = False
		AllowKey = False
		AllowGems = False
		AllowMisc = False
		StorageSpellVal = False
		if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
			(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
		endIf
	endIf
	
	RN_Tracker._bSpoilers = True
	RN_Tracker._HideIncomplete = false
	
	if IsInMenuMode()
		ForcePageReset()
	endIf
endFunction

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Museum Scan Options--------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state ScanAll

	function OnSelectST()	
	
	PlayerRef.GetCurrentLocation()	
		if (PlayerRef.IsInLocation(DBM_DragonbornGalleryLocation)) || (PlayerRef.IsInLocation(DBM_GuildHouseSolitudeLocation)) && (PlayerRef.IsInInterior()) || ShowLocationOverrideVal	
		
			if ShowMessage("This will start the process of Scanning all available sections for completed sets... do you want to scan now?", true, "Scan", "Cancel")
				ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")
				RN_Utility.ScanAll()
			endIf
		else	
			ShowMessage("You must be inside the Museum to carry out this operation.", false, "OK")
				return
		endIf
	endFunction

	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum for all displayed items from the Museum, Armory add-on and any installed mods then update the listings within this mod.")
	endFunction
endState

;;------------------------------

state ScanMuseum

	function OnSelectST()
	
	PlayerRef.GetCurrentLocation()	
		if (PlayerRef.IsInLocation(DBM_DragonbornGalleryLocation)) || (PlayerRef.IsInLocation(DBM_GuildHouseSolitudeLocation)) && (PlayerRef.IsInInterior()) || ShowLocationOverrideVal		
			if ShowMessage("This will start the process of Scanning the Museum for completed sets... do you want to scan now?", true, "Scan", "Cancel")
				ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")
				RN_Utility.ScanMuseum()
			endIf
		else	
			ShowMessage("You must be inside the Museum to carry out this operation.", false, "OK")
				return
		endIf
	endFunction

	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum & Armory for all displayed items and update the listings within this mod.")
	endFunction
endState

;;-------------------------------

state ScanMods

	function OnSelectST()	
	
	PlayerRef.GetCurrentLocation()	
		if (PlayerRef.IsInLocation(DBM_DragonbornGalleryLocation)) || (PlayerRef.IsInLocation(DBM_GuildHouseSolitudeLocation)) && (PlayerRef.IsInInterior()) || ShowLocationOverrideVal
		
			if ShowMessage("This will start the process of Scanning the Museum for completed sets from supported mods... do you want to scan now?", true, "Scan", "Cancel")
				ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")
				RN_Utility.ScanMods()
			endIf
		else	
			ShowMessage("You must be inside the Museum to carry out this operation.", false, "OK")
				return
		endIf
	endFunction


	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum for all displayed items from supported mods and update the listings within this mod.")
	endFunction
endState

;;-------------------------------

state ScanCreations

	function OnSelectST()	
	
	PlayerRef.GetCurrentLocation()	
		if (PlayerRef.IsInLocation(DBM_DragonbornGalleryLocation)) || (PlayerRef.IsInLocation(DBM_GuildHouseSolitudeLocation)) && (PlayerRef.IsInInterior()) || ShowLocationOverrideVal
		
			if ShowMessage("This will start the process of Scanning the Museum for completed sets from supported creations... do you want to scan now?", true, "Scan", "Cancel")
				ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")
				RN_Utility.ScanCreations()
			endIf
		else	
			ShowMessage("You must be inside the Museum to carry out this operation.", false, "OK")
				return
		endIf
	endFunction


	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum for all displayed items from supported creations and update the listings within this mod.")
	endFunction
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Debug Options -------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state iRelicLocationDebug ;;Debug Options

	Event OnSelectST()
	
		ShowLocationOverrideVal = !ShowLocationOverrideVal
		SetToggleOptionValueST(ShowLocationOverrideVal)
		ForcePageReset()		
	EndEvent
	
	Event OnDefaultST()
	
		ShowLocationOverrideVal = false
		SetToggleOptionValueST(ShowLocationOverrideVal)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Disables Museum Scanner Location / Cell restrictions -- NOT FOR PLAYER USE\n Default: OFF")
	EndEvent
endState

;;-------------------------------

state iRelicSpellDebug ;;Debug Options

	Event OnSelectST()
	
		ShowStorageSpellOverideVal = !ShowStorageSpellOverideVal
		SetToggleOptionValueST(ShowStorageSpellOverideVal)
			
		if ShowStorageSpellOverideVal
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
					AllowPotion = FALSE
					AllowMisc= FALSE
				endIf
			endIf
		endIf	

		ForcePageReset()
	EndEvent
	
	Event OnDefaultST()
	
		ShowStorageSpellOverideVal = false
		SetToggleOptionValueST(ShowStorageSpellOverideVal)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Disables storage spell restrictions -- NOT FOR PLAYER USE\n Default: OFF")
	EndEvent
endState

state Dev_Alerts ;;Debug Options

	Event OnSelectST()
	
		DevDebugVal = !DevDebugVal
		SetToggleOptionValueST(DevDebugVal)	
	EndEvent
	
	Event OnDefaultST()
	
		DevDebugVal = false
		SetToggleOptionValueST(DevDebugVal)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Enables Developer Debugging Alerts -- NOT FOR PLAYER USE\n Default: OFF")
	EndEvent
endState

;;-------------------------------

event OnOptionInputOpen(int option)
	if (option == inputOID_I)
		;SetInputDialogStartText(InputBox)
	endIf
endEvent

;;-------------------------------

event OnOptionInputAccept(int option, string value)
	if (option == inputOID_I)
		InputBox = value
		SetInputOptionValue(inputOID_I, value)
		self.CheckPassword()
	endIf
endEvent

;;-------------------------------

event CheckPassword()
	if InputBox == MCM_Strings[13] as string
		InputBox = MCM_Strings[14]
		EnableDebugAccess()
		ForcePageReset()
	else
		self.ShowMessage("Incorrect Password, Please try again.", false, "Ok")
		InputBox = MCM_Strings[15]
		DisableDebugAccess()
		ForcePageReset()
	endIf
endEvent

;;-------------------------------

function EnableDebugAccess()
	
	RN_Debug_Access.SetValue(RN_Debug_Randomiser.GetValue())
endFunction

;;-------------------------------
		
function DisableDebugAccess()

	RN_Debug_Access.SetValue(Utility.RandomInt(0, 250))
	RN_Debug_Randomiser.SetValue(Utility.RandomInt(251, 500))
endFunction

;;-------------------------------

state RevertLists

	Event OnSelectST()
		
		if self.ShowMessage("This will revert the moreHUD new / found / displayed formlists to 0, do you want to revert now?", true, "Revert", "Cancel")
		
			dbmNew.revert()
			dbmFound.revert()
			dbmDisp.revert()
			forcepagereset()
			
		endIf
		
	EndEvent

	Event OnHighlightST()

		SetInfoText("This option will revert the dbmNew / dbmFound / dbmDisp formlists -- NOT FOR PLAYER USE")
	EndEvent
endState

;;-------------------------------

state RebuildLists

	Event OnSelectST()
		
		if self.ShowMessage("This will rebuild and update the moreHUD lists for all new / found / displayed items, do you want to rebuild now?", true, "Rebuild", "Cancel")
			ShowMessage("Please exit the MCM and wait for a completion message", false, "Ok")
			
			DBM_SortWait.SetValue(1)
			
			Int _Index = dbmMaster.GetSize()
			While _Index > 0
				_Index -= 1
				form _item = dbmMaster.GetAt(_Index) as form
				dbmNew.AddForm(_item)
			endWhile
				
			RN_Utility.CreateMoreHudLists()
			
			moreHUDListRebuilt.Show()
			
			DBM_SortWait.SetValue(0)
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
			Status_Return = MCM_Strings[7]
		elseif ShowSetCompleteVal	
			Status_Return = MCM_Strings[8]
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetCompleteNotificationsString()

	if !ShowSetCompleteVal
		Status_Return = MCM_Strings[7]
	elseif ShowSetCompleteVal	
		Status_Return = MCM_Strings[8]
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
			Status_Return = MCM_Strings[11]
		elseif ShowSimpleNotificationVal	
			Status_Return = MCM_Strings[12]
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetNotificationsString()

	if !ShowSimpleNotificationVal
		Status_Return = MCM_Strings[11]
	elseif ShowSimpleNotificationVal	
		Status_Return = MCM_Strings[12]
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
			Status_Return = MCM_Strings[20]
		elseif ShowStartup	
			Status_Return = MCM_Strings[6]
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetShowStartup()

	if !ShowStartup
		Status_Return = MCM_Strings[20]
	elseif ShowStartup	
		Status_Return = MCM_Strings[6]
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
						AllowPotion = FALSE
						AllowMisc= FALSE
					endIf
				Status_Return = MCM_Strings[9]
			endIf
			
		elseif StorageSpellVal
			if (!Game.GetPlayer().HasSpell(RN_Storage_Spell))
				(Game.GetPlayer().AddSpell(RN_Storage_Spell))
				Status_Return = MCM_Strings[10]
			endif	
		endIf	
	return Status_Return 
endFunction

;;-------------------------------
	
String function GetStorageOptions()
	
	if DBM_ArcSkill.GetValue() < 5 && !ShowStorageSpellOverideVal
		Status_Return = MCM_Strings[21]
		StorageSpellVal = FALSE
	elseif !StorageSpellVal
		Status_Return = MCM_Strings[9]		
	elseif StorageSpellVal
		Status_Return = MCM_Strings[10]
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

		self.SetInfoText("Choose which container(s) to check for displayable items when using the 'Transfer Relics' option at the Prep station.\n Default: All Custom Storage")
	EndEvent
endState

;;-------------------------------
	
String function SetPrepStationOptions()	

	if PrepTransfer == 0
		Status_Return = "Custom Storage"
		
	elseif PrepTransfer == 1
		Status_Return = "Custom Storage & Player"

	elseif PrepTransfer == 2
		Status_Return = "Relic Storage Container"
		
	endIf	
	
return Status_Return 
endFunction
	
;;-------------------------------
	
String function GetPrepStationOptions()
	
	if PrepTransfer == 0
		Status_Return = "Custom Storage"
		
	elseif PrepTransfer == 1
		Status_Return = "Custom Storage & Player"

	elseif PrepTransfer == 2
		Status_Return = "Relic Storage Container"
		
	endIf	
	
return Status_Return 
endFunction	

;;-------------------------------
	
String function SetTransferOptions()	

	if !AutoTransferRelics
		Status_Return = MCM_Strings[7]
	elseif AutoTransferRelics
		Status_Return = MCM_Strings[8]				
	endIf	
return Status_Return 
endFunction
	
;;-------------------------------
	
String function GetTransferOptions()
	
	if !StorageSpellVal
		Status_Return = MCM_Strings[21]
		AutoTransferRelics = FALSE
	elseif !AutoTransferRelics
		Status_Return = MCM_Strings[7]			
	elseif AutoTransferRelics
		Status_Return = MCM_Strings[8]				
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

		self.SetInfoText("Automatically transfer displayable potions to the Relic Storage Container when picked up.\n Default: Disabled")
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
		Status_Return = MCM_Strings[7]
	elseif ShowMuseumVal	
		Status_Return = MCM_Strings[8]
	endIf
	return Status_Return
endfunction

;;-------------------------------
			
String function GetMuseumNotificationsString()

	if !ShowMuseumVal
		Status_Return = MCM_Strings[7]
	elseif ShowMuseumVal	
		Status_Return = MCM_Strings[8]
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
		Status_Return = MCM_Strings[7]
	elseif ShowArmoryVal	
		Status_Return = MCM_Strings[8]
	endIf
		return Status_Return
endfunction

;;-------------------------------
		
String function GetArmoryNotificationsString()

	if !ShowArmoryVal		
		Status_Return = MCM_Strings[7]
	elseif ShowArmoryVal	
		Status_Return = MCM_Strings[8]
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
		Status_Return = MCM_Strings[7]
	elseif ShowModsVal	
		Status_Return = MCM_Strings[8]
	endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetModsNotificationsString()

	if !ShowModsVal
		Status_Return = MCM_Strings[7]
	elseif ShowModsVal	
		Status_Return = MCM_Strings[8]
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
		Status_Return = MCM_Strings[7]
	elseif ShowListenerVal	
		Status_Return = MCM_Strings[8]
	endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetListenerString()

	if !ShowListenerVal
		Status_Return = MCM_Strings[7]
	elseif ShowListenerVal	
		Status_Return = MCM_Strings[8]
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

;;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Advanced tagging ----------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state ReplicaTagging ;;Replica Tagging

	Event OnSelectST()
		ReplicaTag = !ReplicaTag
		
		
		if self.ShowMessage("=== The Curators Companion ===" + "\n" + "\nEnabling Advanced Tagging will cause a noticeable increase in the amount of time it takes for icons to update, it is also not recommended to use 'Take All' on a large number of items" + "\n" + "\nEnabling / Disabling this feature may take a while, you will receive a message when the process has completed", true, "Ok", "Cancel")
			self.SetTextOptionValueST(Self.SetReplicaTaggingOptions(), false, "")
			ShowMessage("Please exit the MCM and wait for the process to complete", false, "Ok")
			
			if ReplicaTag
				
				dbmDisp.Revert()
				
				Int _Index = RN_Array._MuseumContainerArray.length	;;Check museum containers for displayed items.	
				While _Index 
					_Index -= 1
					Int _Index2 = RN_Array._MuseumContainerArray[_Index].GetNumItems()
					while _Index2
						_Index2 -= 1		
						Form _ItemRelic = RN_Array._MuseumContainerArray[_Index].GetNthForm(_Index2)
						if dbmMaster.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
							dbmDisp.AddForm(_ItemRelic)
							processForm(_ItemRelic, true)
						endIf
					endWhile
				endWhile
				
				dbmFound.Revert()

				_Index = RN_TokenFormlist.GetSize() ;; Check player and custom storage for found items.
				While _Index
					_Index -= 1
					ObjectReference _Container = RN_TokenFormlist.GetAt(_Index) as ObjectReference		
					Int _Index2 = _Container.GetNumItems()
					While _Index2
						_Index2 -= 1
						Form _ItemRelic = _Container.GetNthForm(_Index2)
						if !dbmNew.HasForm(_ItemRelic) && dbmMaster.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
							dbmFound.AddForm(_ItemRelic)
							processForm(_ItemRelic, false)
						endIf
					endWhile
				endWhile	
				
			elseif !ReplicaTag
				
				dbmDisp.Revert()
				
				Int _Index = RN_Array._MuseumContainerArray.length	;;Check museum containers for displayed items.	
				While _Index 
					_Index -= 1
					Int _Index2 = RN_Array._MuseumContainerArray[_Index].GetNumItems()
					while _Index2
						_Index2 -= 1		
						Form _ItemRelic = RN_Array._MuseumContainerArray[_Index].GetNthForm(_Index2)
						if dbmMaster.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
							dbmDisp.AddForm(_ItemRelic)
						endIf
					endWhile
				endWhile			

				dbmFound.Revert()
				
				_Index = RN_TokenFormlist.GetSize() ;; Check player and custom storage for found items.
				While _Index
					_Index -= 1
					ObjectReference _Container = RN_TokenFormlist.GetAt(_Index) as ObjectReference		
					Int _Index2 = _Container.GetNumItems()
					While _Index2
						_Index2 -= 1
						Form _ItemRelic = _Container.GetNthForm(_Index2)
						if !dbmNew.HasForm(_ItemRelic) && dbmMaster.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
							dbmFound.AddForm(_ItemRelic)
						endIf
					endWhile
				endWhile	
				
			endIf
			
			if ReplicaTag
				Debug.MessageBox("=== The Curators Companion ===" + "\n" + "\nAdvanced Tagging Enabled")
			else
				Debug.MessageBox("=== The Curators Companion ===" + "\n" + "\nAdvanced Tagging Disabled")
			endIf
		endIf	
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("EXPERIMENTAL FEATURE\nWhen an item is found or displayed with Advanced Tagging Enabled, the scripts will attempt to update the Icons for both the Base Item and the Replica\n Default: Disabled")
	EndEvent
endState


;;-- Functions ---------------------------------------

function processForm(form _ItemRelic, bool _Displayed)
	
	if _Displayed
	
		if DBM_ReplicaBaseItems.HasForm(_ItemRelic)
			dbmDisp.AddForm(ReplicaHandler.GetReplica(_ItemRelic))
		elseif DBM_ReplicaItems.HasForm(_ItemRelic)
			dbmDisp.AddForm(ReplicaHandler.GetOriginal(_ItemRelic))
		endIf
		
	else
	
		if DBM_ReplicaBaseItems.HasForm(_ItemRelic)
			dbmFound.AddForm(ReplicaHandler.GetReplica(_ItemRelic))
		elseif DBM_ReplicaItems.HasForm(_ItemRelic)
			dbmFound.AddForm(ReplicaHandler.GetOriginal(_ItemRelic))
		endIf
		
	endIf
endFunction

;;-------------------------------

String function SetReplicaTaggingOptions()

		if !ReplicaTag		
			Status_Return = MCM_Strings[7]	
		elseif ReplicaTag	
			Status_Return = MCM_Strings[8]
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetReplicaTaggingOptions()

	if !ReplicaTag
		Status_Return = MCM_Strings[7]
	elseif ReplicaTag	
		Status_Return = MCM_Strings[8]
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

string function GetCurrentMuseumCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	Int Total_Room = 11
		
		if RN_SupportedCreationCount.GetValue() > 0
			Total_Room += 1
		endIf
		
		if RN_Mod.XX_SafehouseL
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
		Status_Return = MCM_Strings[21]
		return Status_Return 
	endIf
endFunction

;;-------------------------------

String function GetTreasuryCountString3()
	
	if DBM_Excavation02.IsCompleted()
		Status_Return = RN_Treasury_Count3.GetValue() As Int
		return Status_Return
	else
		Status_Return = MCM_Strings[21]
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

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script End ------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
