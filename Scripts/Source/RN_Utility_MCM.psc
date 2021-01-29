scriptname RN_Utility_MCM extends SKI_ConfigBase

import FISSFactory

import AhzmoreHUD
import AhzmoreHUDIE

import utility
import RN_Utility_Global

RN_Utility_autoScan property RN_AutoScan auto

RN_Utility_Script property RN_Utility auto

RN_Storage_Transfer property RN_Transfer auto

RN_Utility_QuestTracker_MCM property RN_Tracker auto

RN_Utility_QuestTracker_Arrays property RN_Tracker_Array auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; String Returns
string[] PagesList
string Status_Return

bool property UpdateReq Auto

bool Token_Vis
bool Safehouse_Enabled 
bool Ach_Highlight
bool property RUI auto hidden
bool property TOV auto hidden
bool Property Achievements_Enabled auto hidden
bool Property Ach_Perks auto hidden

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

;; Player Ref for Game.GetPlayer()
objectreference property PlayerRef auto

;; Storage Options
globalvariable property CustomContainer auto

;; Treasury Value
quest property DBM_Excavation02 auto
quest property DBM_DHQuest auto

;; moreHUD
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto
formlist property dbmMaster auto
formlist property TCC_ItemList_Safehouse auto
formlist property TCC_TokenList_NoShipmentCrates auto
globalvariable property RN_moreHUD_Option auto

string[] moreHUDChoiceList 
int IndexmoreHUD = 0
int moreHUDOptions

string[] AchievementSoundList
int property IndexSounds auto hidden
int SoundListOptions

string[] AttributeList
int property IndexAttribute auto hidden
int AttributeListOptions

bool property _UserSettings auto hidden

;; bool Properties
bool property ShowMuseumVal = true auto hidden ;;Museum Notifications
bool property ShowArmoryVal = true auto hidden ;;Armory Notifications
bool property ShowModsVal = true auto hidden ;;Supported Mod Notifications
bool property ShowSetCompleteVal = true auto hidden ;;Section / Set Completion Notifications
bool property ShowSimpleNotificationVal = true auto hidden ;;Simple Notification (No MessageBox)
bool property ShowListenerVal = true auto hidden ;;Notifications for Display Listeners
bool property Restricted auto hidden ;;Storage Restriction Value
bool property AutoTransferRelics auto hidden ;;auto Transfer To Storage Container
bool property AllowWeapon auto hidden ;;auto Transfer To Storage Container
bool property AllowArmor auto hidden ;;auto Transfer To Storage Container
bool property AllowBook auto hidden ;;auto Transfer To Storage Container
bool property AllowKey auto hidden ;;auto Transfer To Storage Container
bool property AllowGems auto hidden ;;auto Transfer To Storage Container
bool property AllowMisc auto hidden ;;auto Transfer To Storage Container
bool property AllowPotion auto hidden ;;auto Transfer To Storage Container
bool property ShowStartup = true auto hidden ;; Shows Startup Messages

Int property PrepTransfer auto hidden ;; Prep Station transfer settings.

bool property ScanNotificationsval auto hidden ;; Museum Scan Notifications
bool property autoScanVal auto hidden ;; Auto Museum Scan
int property _ScanInterval auto ;; museum scan interval

bool property Ach_Notify = true auto hidden
bool property Ach_Visual = true auto hidden

;Relic Storage
Book Property RN_RSC_SpellTome auto
Spell Property RN_Storage_Summon_Spell auto
Leveleditem Property LItemSpellTomes00AllSpells auto

;; Globals for Complete Set Listings.
globalvariable property iMuseumSets auto
globalvariable property iArmorySets auto
globalvariable property iImmWeapSets auto
globalvariable property iHeavyArmSets auto
globalvariable property iModComplete auto
globalvariable property iCustomComplete auto
globalvariable property iDisplaySectionComplete auto
globalvariable property RN_SupportedModCount auto
globalvariable property RN_CustomModCount auto
globalvariable property RN_CreationClubContent_Installed auto
globalvariable property RN_SafeouseContent_Installed auto

;; General Globals
globalvariable property DBM_SortWait auto
globalvariable property RN_Setup_Done auto
globalvariable property RN_Setup_Start auto
globalvariable property RN_Setup_Registered auto
globalvariable property RN_Token_Visibility auto

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

globalvariable property RN_Museum_Paintings_Total auto
globalvariable property RN_Museum_Paintings_Count auto
globalvariable property RN_Museum_Paintings_Complete auto

globalvariable property RN_Museum_Dibella_Statues_Total auto
globalvariable property RN_Museum_Dibella_Statues_Count auto
globalvariable property RN_Museum_Dibella_Statues_Complete auto

globalvariable property RN_Achievements_Listener_Total auto
globalvariable property RN_Achievements_Listener_Count auto
globalvariable property RN_Achievements_Listener_Complete auto

GlobalVariable Property RN_Ach01Complete Auto
GlobalVariable Property RN_Ach02Complete Auto
GlobalVariable Property RN_Ach03Complete Auto
GlobalVariable Property RN_Ach04Complete Auto
GlobalVariable Property RN_Ach05Complete Auto
GlobalVariable Property RN_Ach06Complete Auto
GlobalVariable Property RN_Ach07Complete Auto
GlobalVariable Property RN_Ach08Complete Auto
GlobalVariable Property RN_Ach09Complete Auto
GlobalVariable Property RN_Ach10Complete Auto
GlobalVariable Property RN_Ach11Complete Auto
GlobalVariable Property RN_Ach12Complete Auto
GlobalVariable Property RN_Ach13Complete Auto
GlobalVariable Property RN_Ach14Complete Auto
GlobalVariable Property RN_Ach15Complete Auto
GlobalVariable Property RN_Ach16Complete Auto
GlobalVariable Property RN_Ach17Complete Auto
GlobalVariable Property RN_Ach18Complete Auto
GlobalVariable Property RN_Ach19Complete Auto
GlobalVariable Property RN_Ach20Complete Auto
GlobalVariable Property RN_Ach21Complete Auto
GlobalVariable Property RN_Ach22Complete Auto
GlobalVariable Property RN_Ach23Complete Auto
GlobalVariable Property RN_Ach24Complete Auto
GlobalVariable Property RN_Ach25Complete Auto
GlobalVariable Property RN_Ach26Complete Auto
GlobalVariable Property RN_Ach27Complete Auto
GlobalVariable Property RN_Ach28Complete Auto
GlobalVariable Property RN_Ach29Complete Auto
GlobalVariable Property RN_Ach30Complete Auto
GlobalVariable Property RN_Ach31Complete Auto
GlobalVariable Property RN_Ach32Complete Auto
GlobalVariable Property RN_Ach33Complete Auto
GlobalVariable Property RN_Ach34Complete Auto

Formlist property _Museum_Global_Complete auto
Formlist property _Museum_Global_Count auto
Formlist property _Museum_Global_Total auto
GlobalVariable[] RN_Museum_Global_Complete 
GlobalVariable[] RN_Museum_Global_Count 
GlobalVariable[] RN_Museum_Global_Total 
String[] _Museum_Section_names

Formlist property _Armory_Global_Complete auto
Formlist property _Armory_Global_Count auto
Formlist property _Armory_Global_Total auto
GlobalVariable[] RN_Armory_Global_Complete
GlobalVariable[] RN_Armory_Global_Count
GlobalVariable[] RN_Armory_Global_Total
String[] _Armory_Section_names

formlist property RN_Achievement_Globals auto
globalvariable[] RN_Ach_Globals
string[] RN_Ach_StateName
string[] RN_Ach_AchName

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Patches -----------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

GlobalVariable[] RN_Patches_Complete_Array
GlobalVariable[] RN_Patches_Count_Array
GlobalVariable[] RN_Patches_Total_Array
String[]  RN_Patches_Name

GlobalVariable[] RN_Custom_Complete_Array
GlobalVariable[] RN_Custom_Count_Array
GlobalVariable[] RN_Custom_Total_Array
String[]  RN_Custom_Name

GlobalVariable[] RN_Section_Complete_Array
GlobalVariable[] RN_Section_Count_Array
GlobalVariable[] RN_Section_Total_Array
String[]  RN_Section_Name
Int Index_Section

GlobalVariable[] RN_Section2_Complete_Array
GlobalVariable[] RN_Section2_Count_Array
GlobalVariable[] RN_Section2_Total_Array
String[]  RN_Section2_Name
Int Index_Section2

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnConfigInit()
	
	Build_Arrays()
	AddDynamicPagesList()
	LItemSpellTomes00AllSpells.AddForm(RN_RSC_SpellTome, 1 , 1)
EndEvent

;-- Events --------------------------------

Event AddDynamicPagesList()

	ModName = "LOTD: The Curators Companion"
	PagesList = new String[12]
	PagesList[0] = "General Settings"
	PagesList[1] = "moreHUD & Scan"
	PagesList[2] = "Relic Storage"
	PagesList[3] = "Achievements"
	PagesList[4] = " "
	PagesList[5] = "~~Completion~~"
	PagesList[6] = "Museum Sections"
	PagesList[7] = "Armory Sections"
	PagesList[8] = "Official Patches"		

	Int Q = 0
	Int x = 9

	if RN_CustomModCount.GetValue()
		Q = PagesList.Find("")	
			PagesList[Q] = "Custom Patches"
		x += 1
	endif

	Q = PagesList.Find("")	
		PagesList[Q] = " "
	x += 1	
		
	Q = PagesList.Find("")	
		PagesList[Q] = "Debug Options"
	x += 1
	
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
	
	AddDynamicPagesList()
	AddSettingsPage()
	AddAdvancedPage()
	AddRelicStoragePage()
	AddAchievementsPage()
	AddMuseumSetsPage()
	AddArmorySetsPage()
	AddCompletedModsPage()
	AddCustomModsPage()
	AddDebugPage()
	InitmoreHUDChoiceList()
	InitAchievementSoundList()
	InitAttributeList()
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

Event InitAchievementSoundList()

	AchievementSoundList = new string[3]
	AchievementSoundList[0] = "Default Sound FX"
	AchievementSoundList[1] = "Crowd Cheer FX"
	AchievementSoundList[2] = "No Sound FX"
EndEvent

;-- Events --------------------------------

Event InitAttributeList()

	AttributeList = new string[5]
	AttributeList[0] = "No Attribute Reward"
	AttributeList[1] = "Increase Magicka"
	AttributeList[2] = "Increase Health"
	AttributeList[3] = "Increase Stamina"
	AttributeList[4] = "Random Attribute"
EndEvent
	
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
		
		if RN_SupportedModCount.GetValue() > 0 || RN_CustomModCount.GetValue() > 0
			AddTextOptionST("iRelicModsNotifications", "Patch(es) Items:", self.GetModsNotificationsString(), 0)
		else
			AddTextOptionST("iRelicModsNotifications", "Patch(es) Items:", "No Patches Found", 1)
		endIF
		
		AddTextOptionST("iRelicListenerNotifications", "Listeners:", self.GetListenerString(), 0)
		AddTextOptionST("iRelicSetCompleteNotifications", "Collection / Set Completion:", self.GetCompleteNotificationsString(), 0)
		AddEmptyOption()		
		AddHeaderOption("General Settings:")
		AddTextOptionST("iRelicSimpleNotifications", "Notification Style:", self.GetNotificationsString(), 0)
		AddTextOptionST("iRelicShowStartup", "Startup Notifications:", self.GetShowStartup(), 0)	
		AddTextOptionST("PrepStationTransfer", "Prep Station Settings:", self.GetPrepStationOptions(), 0)

		AddTextOptionST("RefreshMCM", "Something not working?", "Reload MCM", 0)
		
		SetCursorPosition(1)			
		AddHeaderOption("Mod Info:")
		AddTextOption("Thanks for downloading The Curators Companion, a full", "", 0)
		AddTextOption("featured add-on for Legacy of the Dragonborn.", "", 0)
		AddEmptyOption()
		AddTextOption("", "Developed By (Ic0n)Ic0de", 0)
		AddTextOption("", "Version 5.0.2", 0)		
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
			AddMenuOptionST("moreHUDOptions", "moreHUD Icons Settings:", moreHUDChoiceList[IndexmoreHUD])	
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
		
		AddTextOptionST("RebuildLists", "moreHUD Icons Reset:", "Rebuild", 0)
		
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
		CustomContainer.SetValue(TCC_TokenList_NoShipmentCrates.GetSize() as Int)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("Relic Storage Settings:")
		
		AddTextOptionST("iRelicRestrictionOptions", "Relic Storage Restriction:" , self.GetRestrictionOptions(), 0)
		AddTextOptionST("Token_Visibility", "Storage Token Recipe:", self.GetTokenVisibility(), 0)
		AddHeaderOption("Auto Storage Options:")
		
		if GetTransferOptions() == "Purchase Spell To Use"
			AddTextOptionST("iRelicStorageTransfer", "Automatic Relic Storage:", self.GetTransferOptions(), 1)
		else
			AddTextOptionST("iRelicStorageTransfer", "Automatic Relic Storage:", self.GetTransferOptions(), 0)
		endIf
		
			if GetTransferOptions() == "Enabled" && Game.GetPlayer().HasSpell(RN_Storage_Summon_Spell)
				AddToggleOptionST("Transfer_Armor", "Armor", AllowArmor, 0)
				AddToggleOptionST("Transfer_Book", "Books", AllowBook, 0)
				AddToggleOptionST("Transfer_Gems", "Gems", AllowGems, 0)
				AddToggleOptionST("Transfer_Key", "Keys", AllowKey, 0)
				AddToggleOptionST("Transfer_Misc", "Misc Items", AllowMisc, 0)
				AddToggleOptionST("Transfer_Potion", "Potions", AllowPotion, 0)
				AddToggleOptionST("Transfer_Weapon", "Weapons", AllowWeapon, 0)
			endIF
		
		SetCursorPosition(1)
		AddHeaderOption("Custom Storage Containers: (" + CustomContainer.GetValue() as int + "/6)")
		
		Int _IndexOpt = 0
		ObjectReference _Container
		String _ContainerLocation
		
		Int _Index = TCC_TokenList_NoShipmentCrates.GetSize()
		While _Index
			_Index -= 1
			_Container = TCC_TokenList_NoShipmentCrates.GetAt(_Index) as ObjectReference				
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
;;----------------------------------------------------------------------------- Settings Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
Event AddAchievementsPage()

	if CurrentPage == "Achievements"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)

		if !Achievements_Enabled
			if RN_Setup_Start.GetValue()
				AddTextOptionST("iAchievement_Enabled", "Enable Achievements System", "Wait For Setup...", 1)
			else
				AddToggleOptionST("iAchievement_Enabled", "Enable Achievements System", Achievements_Enabled, 0)	
			endIf
		
		else
			
			AddHeaderOption("Settings:")	
			AddToggleOptionST("AchievementSet01", "Notifications:", Ach_Notify, 0)
			AddToggleOptionST("AchievementSet02", "Visual effect:", Ach_Visual, 0)
			AddMenuOptionST("SoundListOptions", "Sound effect:", AchievementSoundList[IndexSounds])
			AddHeaderOption("Achievements:")	

			SetCursorPosition(1)			
			AddHeaderOption("")	
			
			AddToggleOptionST("Enable_Highlights", "Achievement Descriptions:", Ach_Highlight, 0)
			AddToggleOptionST("Disable_AchievementPerks", "Reward Perk Points:", Ach_Perks, 0)			
			AddMenuOptionST("AttributeListOptions", "Reward Attribute:", AttributeList[IndexAttribute])
			
			AddHeaderOption("Awarded: " + self.GetCurrentAchievementCount(RN_Achievements_Listener_Count, RN_Achievement_Globals) + " Achievements")
			
			Int PageIdx = 9			
			Int _Index = 0
			While _Index < RN_Ach_AchName.length
				SetCursorPosition(PageIdx + 1)
				if RN_Ach_Globals[_Index].GetValue()
					if _Index == 28
						AddTextOptionST(RN_Ach_StateName[_Index], RN_Ach_AchName[_Index] + PlayerRef.GetBaseObject().GetName(), "Awarded", 0)
						PageIdx += 1
					else
						AddTextOptionST(RN_Ach_StateName[_Index], RN_Ach_AchName[_Index], "Awarded", 0)
						PageIdx += 1
					endIf
				else
					if _Index == 28
						AddTextOptionST(RN_Ach_StateName[_Index], RN_Ach_AchName[_Index] + PlayerRef.GetBaseObject().GetName(), "Locked", 1)
						PageIdx += 1
					else
						AddTextOptionST(RN_Ach_StateName[_Index], RN_Ach_AchName[_Index], "Locked", 1)
						PageIdx += 1
					endIf					
				endIf
				_Index +=1		
			endWhile	
		endIf
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Museum Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddMuseumSetsPage()

	if CurrentPage == "Museum Sections"
		RN_Thane_Listener_Total.SetValue(9)
		RN_Skills_Listener_Total.SetValue(6)
		BuildTotalsArray(iMuseumSets, RN_Museum_Global_Complete)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)	
		AddHeaderOption("Museum Sections:")	
				
		Int _Index = 0
		Int _Length = RN_Museum_Global_Complete.length
		While _Index < _Length 			
			
			if RN_Museum_Global_Complete[_Index].GetValue() == 1
				if RN_Museum_Global_Total[_Index].GetValue() > RN_Museum_Global_Count[_Index].GetValue() 
					RN_Museum_Global_Complete[_Index].SetValue(0)
				else
					AddTextOption(_Museum_Section_names[_Index], "Complete", 1)
				endIF
			elseif RN_Scan_Registered.GetValue()
				AddTextOption(_Museum_Section_names[_Index], "Updating...", 1)
			else
				AddTextOption(_Museum_Section_names[_Index], self.GetCurrentCount(RN_Museum_Global_Count[_Index] , RN_Museum_Global_Total[_Index]), 0)
			endIf
			_Index += 1
			
			if _Index == 8 && !RN_CreationClubContent_Installed.GetValue()
				_Index += 1
			endIf
			
			if _Index == 11 && !RN_SafeouseContent_Installed.GetValue()
				_Index += 1
			endIf
			
		endWhile
			
		AddEmptyOption()
		AddHeaderOption("Museum Displays:")

		if (RN_Museum_Dibella_Statues_Complete.GetValue()) == 1
			AddTextOption("Dibella Statues:", "Complete", 1)
		else
			AddTextOption("Dibella Statues:", self.GetCurrentCount(RN_Museum_Dibella_Statues_Count, RN_Museum_Dibella_Statues_Total), 0)
		endIf	

		if (RN_Exploration_Listener_Complete.GetValue()) == 1
			AddTextOption("Exploration Displays:", "Complete", 1)
		else
			AddTextOption("Exploration Displays:", self.GetCurrentCount(RN_Exploration_Listener_Count, RN_Exploration_Listener_Total), 0)
		endIf

		if (RN_Museum_Paintings_Complete.GetValue()) == 1
			AddTextOption("Museum Paintings:", "Complete", 1)
		else
			AddTextOption("Museum Paintings:", self.GetCurrentCount(RN_Museum_Paintings_Count, RN_Museum_Paintings_Total), 0)
		endIf
		
		if (RN_Quest_Listener_Complete.GetValue()) == 1
			AddTextOption("Quest Displays:", "Complete", 1)
		else
			AddTextOption("Quest Displays:", self.GetCurrentCount(RN_Quest_Listener_Count, RN_Quest_Listener_Total), 0)
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
		AddTextOption("This page lists all completable Museum sections.", "", 0)
		AddEmptyOption()
		AddTextOption("As items are collected and displayed, this page will", "", 0)
		AddTextOption("keep track of your progess.", "", 0)
		AddEmptyOption()
		AddTextOption("Running the Museum Scan from the MCM or Prep Station", "", 0)
		AddTextOption("will scan the Museum and Armory for items on display", "", 0)
		AddTextOption("then update the figures in the MCM, it is recommended", "", 0)
		AddTextOption("to use the autoscanner which can be enabled in the MCM", "", 0)
		if RN_CreationClubContent_Installed.GetValue()
			AddEmptyOption()
		endIf
		if RN_SafeouseContent_Installed.GetValue()
			AddEmptyOption()
		endIf
		AddEmptyOption()			
		AddTextOption("Completed:", self.GetCurrentMuseumCount(iMuseumSets), 0)
		AddEmptyOption()
		AddHeaderOption("Display Information:")
		AddTextOption("This section can be used to keep track of displays from", "", 0)
		AddTextOption("completing quests, exploring the world, levelling your", "", 0)
		AddTextOption("skills and finding certain items hidden around the world", "", 0)
		AddTextOption("such as paintings and Dibella statues.", "", 0)
		AddEmptyOption()
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
		BuildTotalsArray(iArmorySets, RN_Armory_Global_Complete)
		BuildTotalsArray(iHeavyArmSets, RN_Section_Complete_Array)
		BuildTotalsArray(iImmWeapSets, RN_Section2_Complete_Array)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("Armory Sets:")
		SetCursorPosition(1)
		AddHeaderOption("Completed: " + self.GetCurrentArmoryCount(iArmorySets) + " Sets")
		Int PageIdx = 1	
		Int _Index = 0
		Int _Length = RN_Armory_Global_Complete.length
		While _Index < _Length 
			SetCursorPosition(PageIdx + 1)
			if RN_Armory_Global_Complete[_Index].GetValue() == 1
				AddTextOption(_Armory_Section_names[_Index], "Complete", 1)
				PageIdx += 1
			elseif RN_Scan_Registered.GetValue()
				AddTextOption(_Armory_Section_names[_Index], "Updating...", 1)
				PageIdx += 1
			else
				AddTextOption(_Armory_Section_names[_Index], self.GetCurrentCount(RN_Armory_Global_Count[_Index], RN_Armory_Global_Total[_Index]), 0)
				PageIdx += 1
			endIf
			_Index +=1
		endWhile
		
		PageIdx += 2
		SetCursorPosition(PageIdx + 1)

		if (Game.GetModByName("LOTD_TCC_ImmWeap.esp") != 255)
			AddHeaderOption("Immersive Weapons Sets:")
			PageIdx += 1
			SetCursorPosition(PageIdx + 1)
			AddHeaderOption("Completed: " + self.GetCurrentIWCount(iImmWeapSets) + " Sets")
			PageIdx	+= 1
			_Index = 0
			_Length = Index_Section2
			While _Index < _Length 
				SetCursorPosition(PageIdx + 1)
				if RN_Section2_Name[_Index] != ""				
					if RN_Section2_Complete_Array[_Index].GetValue() == 1
						AddTextOption(RN_Section2_Name[_Index], "Complete", 1)
						PageIdx += 1
					elseif RN_Scan_Registered.GetValue()
						AddTextOption(RN_Section2_Name[_Index], "Updating...", 1)
						PageIdx += 1
					else
						AddTextOption(RN_Section2_Name[_Index], self.GetCurrentCount(RN_Section2_Count_Array[_Index], RN_Section2_Total_Array[_Index]), 0)
						PageIdx += 1
					endIf
				endIf
				_Index +=1
			endWhile
			PageIdx += 2
			SetCursorPosition(PageIdx + 1)
		endIf
		
		if (Game.GetModByName("LOTD_TCC_HeavyArm.esp") != 255)
			AddHeaderOption("Heavy Armory Sets:")
			PageIdx += 1
			SetCursorPosition(PageIdx + 1)
			AddHeaderOption("Completed: " + self.GetCurrentHACount(iHeavyArmSets) + " Sets")
			PageIdx	+= 1		
			_Index = 0
			_Length = Index_Section
			While _Index < _Length 
				SetCursorPosition(PageIdx + 1)
				if RN_Section_Name[_Index] != ""
					if RN_Section_Complete_Array[_Index].GetValue() == 1
						AddTextOption(RN_Section_Name[_Index], "Complete", 1)
						PageIdx += 1
					elseif RN_Scan_Registered.GetValue()
						AddTextOption(RN_Section_Name[_Index], "Updating...", 1)
						PageIdx += 1
					else
						AddTextOption(RN_Section_Name[_Index], self.GetCurrentCount(RN_Section_Count_Array[_Index], RN_Section_Total_Array[_Index]), 0)
						PageIdx += 1
					endIf
				endIf
				_Index +=1
			endWhile
		endIf
	endIf
endEvent		

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------Mods Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddCompletedModsPage()

	if CurrentPage == "Official Patches"
		BuildTotalsArray(iModComplete, RN_Patches_Complete_Array)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)				
		
		AddHeaderOption("Untracked Patch(es):", 0)
		if (Game.GetModByName("LOTD_TCC_SafehousePlus.esp") != 255)
			AddTextOption("Safehouse Plus", "Installed", 1)
		else
			AddTextOption("Safehouse Plus", "Not Installed", 1)
		endIf
		
		SetCursorPosition(1)
		AddHeaderOption("", 0)
		
		if (Game.GetModByName("LOTD_TCC_CheeseMod.esp") != 255)
			AddTextOption("Cheesemod for Everyone", "Installed", 1)
		else
			AddTextOption("Cheesemod for Everyone", "Not Installed", 1)
		endIf	
		
		SetCursorPosition(4)
		AddHeaderOption(self.GetCurrentCount(iModComplete, RN_SupportedModCount) + " Official Patch(es) Completed", 0)
		
		SetCursorPosition(5)
		AddHeaderOption("", 0)
		
		if RN_SupportedModCount.GetValue() > 0
			Int PageIdx = 5			
			Int _Index = 0
			While _Index < RN_Patches_Name.length	
				SetCursorPosition(PageIdx + 1)
				if RN_Patches_Name[_Index] != ""
					if RN_Patches_Complete_Array[_Index].GetValue()
						AddTextOption(RN_Patches_Name[_Index], "Complete", 1)
						PageIdx += 1
					elseif RN_Scan_Registered.GetValue()
						AddTextOption(RN_Patches_Name[_Index], "Updating...", 1)
						PageIdx += 1
					else
						AddTextOption(RN_Patches_Name[_Index], self.GetCurrentCount(RN_Patches_Count_Array[_Index], RN_Patches_Total_Array[_Index]), 0)
						PageIdx += 1
					endIf
				endIf
				_Index +=1			
			endWhile	
		else
			SetCursorPosition(4)
			AddHeaderOption("Official Patch(es)", 0)
			AddTextOption("No Trackable Patch(es) Installed", "", 1)
		endIf
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------Mods Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddCustomModsPage()

	if CurrentPage == "Custom Patches"
		BuildTotalsArray(iCustomComplete, RN_Custom_Complete_Array)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)									
		AddHeaderOption(self.GetCurrentCount(iCustomComplete, RN_CustomModCount) + " Custom Patch(es) Completed", 0)
		SetCursorPosition(1)
		AddHeaderOption("", 0)
		
		if RN_CustomModCount.GetValue() > 0
			Int PageIdx = 1
			Int _IndexOpt = 0
			Int _Index = 0
			While _Index < RN_Custom_Name.length
				SetCursorPosition(PageIdx + 1)
				if RN_Custom_Name[_Index] != ""
					if RN_Custom_Complete_Array[_Index].GetValue()
						AddTextOption(RN_Custom_Name[_Index], "Complete", 1)
						PageIdx += 1
					elseif RN_Scan_Registered.GetValue()
						AddTextOption(RN_Custom_Name[_Index], "Updating...", 1)
						PageIdx += 1
					else
						AddTextOption(RN_Custom_Name[_Index], self.GetCurrentCount(RN_Custom_Count_Array[_Index], RN_Custom_Total_Array[_Index]), 0)
						PageIdx += 1
					endIf
				endIf
				_Index +=1			
			endWhile	
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
		
		AddTextOptionST("Update_Patches", "Update Installed Patches", "", 0)
		AddTextOptionST("Scan_Debug", "Reset Museum Scanner", "", 0)
		AddtextOptionST("Startup_Debug", "Reset Startup Tasks", "", 0)
		AddEmptyOption()
		AddHeaderOption("moreHUD Debug:")
		AddTextOption("moreHUD new count:", dbmNew.GetSize() As Int, 0)
		AddTextOption("moreHUD found count:", dbmFound.GetSize() As Int, 0)
		AddTextOption("moreHUD Displayed count:", dbmDisp.GetSize() As Int, 0)
		AddTextOption("moreHUD total Count:", dbmMaster.GetSize() As Int, 0)
		AddEmptyOption()
		
		AddHeaderOption("Dev Handlers:")
		AddTextOption("These options can and will break your game.", "", 1)
		AddToggleOptionST("RUI_Handler", "RUI = (" + Utility.RandomInt(0,249) + "/" + Utility.RandomInt(250,500) + ")" , RUI)
		AddToggleOptionST("TOV_Handler", "TOV = (" + Utility.RandomInt(0,249) + "/" + Utility.RandomInt(250,500) + ")" , TOV)
		SetCursorPosition(1)
		
		AddHeaderOption("Mod Requirements:")

		if SKSE.GetPluginVersion("fisses") > 0
			AddTextOption("FISSES:", "<font color='#2b6320'>Installed</font>" + " [" + SKSE.GetPluginVersion("fisses") + "]", 0)
		else
			AddTextOption("FISSES:", "<font color='#750e0e'>Not Found</font>", 0)
		endIf

		if SKSE.GetVersion() > 0			
			AddTextOption("SKSE:", "<font color='#2b6320'>Installed</font>" + " [" + SKSE.GetVersion()+"."+SKSE.GetVersionMinor()+"."+SKSE.GetVersionBeta() + "]", 0)
		else
			AddTextOption("SKSE:", "<font color='#750e0e'>Not Found</font>", 0)	
		endIf

		if (Game.GetModByName("SkyUI_SE.esp") != 255)
			AddTextOption("SkyUI:", "<font color='#2b6320'>Installed</font>" + " [5.2SE]", 0)
		else
			AddTextOption("SkyUI:", "<font color='#750e0e'>Not Found</font>", 0)
		endIf	
		
		AddEmptyOption()
		AddHeaderOption("Icon Support:")
		
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
	
			ShowMessage("Please exit the MCM and re-enter again to see changes", false, "Ok")
			bool bRefresh = True
			SetTitleText("===PLEASE WAIT===")
			While bRefresh
				If !IsInMenuMode()
					Build_Arrays()
					BuildPatchArray(true, true)
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
	
		if (Game.GetModByName("Fiss.esp") != 255)
			Status_Return = "Save Preset"
		else
			Status_Return = "FISS Not Found"
		endIf
	return Status_Return
endFunction	

String function GetConfigLoadString()

		if (Game.GetModByName("Fiss.esp") != 255)
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
	fiss.saveBool("Storage Restriction", Restricted)
	fiss.saveBool("Relic Transfer", AutoTransferRelics)
	fiss.saveBool("TokenCrafting", Token_Vis)
	fiss.saveBool("AllowWeapon", AllowWeapon)
	fiss.saveBool("AllowArmor", AllowArmor)
	fiss.saveBool("AllowBook", AllowBook)
	fiss.saveBool("AllowKey", AllowKey)
	fiss.saveBool("AllowGems", AllowGems)	
	fiss.saveBool("AllowMisc", AllowMisc)	
	fiss.saveBool("AllowPotion", AllowPotion)
	
	;;Achievements Page
	fiss.saveBool("Achievement Notifications", Ach_Notify)
	fiss.saveBool("Achievement Visuals", Ach_Visual)
	fiss.saveInt("Achievement Sounds", IndexSounds)
	fiss.saveBool("Achievement Perks", Ach_Perks)
	fiss.saveInt("Achievement Attribute", IndexAttribute)	
	
	;;Quest Tracker
	fiss.saveBool("Show Spoilers", RN_Tracker._bSpoilers)
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

	Restricted = fiss.loadBool("Storage Restriction")
	
	AutoTransferRelics = fiss.loadBool("Relic Transfer")
	if AutoTransferRelics
		RN_Transfer.GoToState("")
	else
		RN_Transfer.GoToState("Disabled")
	endIf
	
	AllowWeapon = fiss.loadBool("AllowWeapon")
	AllowArmor = fiss.loadBool("AllowArmor")
	AllowBook = fiss.loadBool("AllowBook")
	AllowKey = fiss.loadBool("AllowKey")
	AllowGems = fiss.loadBool("AllowGems")
	AllowMisc = fiss.loadBool("AllowMisc")
	AllowPotion = fiss.loadBool("AllowPotion")	
	
	Token_Vis = fiss.loadBool("TokenCrafting")
	if 	Token_Vis
		RN_Token_Visibility.SetValue(1)
	else
		RN_Token_Visibility.SetValue(0)
	endIf

	;; Achievements Page
	
	Ach_Notify = fiss.loadBool("Achievement Notifications")
	Ach_Visual = fiss.loadBool("Achievement Visuals")
	IndexSounds = fiss.loadInt("Achievement Sounds")
	Ach_Perks = fiss.loadBool("Achievement Perks")
	IndexAttribute = fiss.loadInt("Achievement Attribute")

	;;Quest Tracker
	RN_Tracker._bSpoilers = fiss.loadBool("Show Spoilers")	
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

	ShowMuseumVal = False
	ShowArmoryVal = False
	ShowModsVal = False
	ShowSetCompleteVal = False
	ShowSimpleNotificationVal = True
	ShowListenerVal = True
	ShowStartup = True
	PrepTransfer = 1
	Restricted = True
	
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
	_ScanInterval = 30
	AutoScanVal = True
	RN_AutoScan.UpdateInt(_ScanInterval)
	
	RN_Tracker._bSpoilers = false
	
	RN_Tracker._Helgen_Index = 0
	RN_Tracker._Legacy_Index = 0
	
	Token_Vis = True
	RN_Token_Visibility.SetValue(1)

	Ach_Notify = True
	Ach_Visual = True
	IndexSounds = 0
	Ach_Highlight = False
	Ach_Perks = False
	IndexAttribute = 0

	if IsInMenuMode()
		ForcePageReset()
	endIf
endFunction

;-- Load States / Function --------------------------------

Function Begin_Config_Author()

	ShowMuseumVal = False
	ShowArmoryVal = False
	ShowModsVal = False
	ShowSetCompleteVal = False
	ShowSimpleNotificationVal = True
	ShowListenerVal = True
	ShowStartup = True
	PrepTransfer = 1
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

	AutoTransferRelics = False
	RN_Transfer.GoToState("Disabled")
	AllowWeapon = False
	AllowArmor = False
	AllowBook = False
	AllowKey = False
	AllowGems = False
	AllowMisc = False
	AllowPotion = False
	
	Restricted = False
	ScanNotificationsval = True
	_ScanInterval = 30
	AutoScanVal = True
	RN_AutoScan.UpdateInt(_ScanInterval)
	
	RN_Tracker._bSpoilers = True
	
	Ach_Notify = True
	Ach_Visual = True
	IndexSounds = 1
	Ach_Highlight = True
	Ach_Perks = True
	IndexAttribute = 4
		
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
			ShowMessage("Please exit the MCM and wait for the scan to complete", false, "Ok")
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
		SetSliderDialogRange(0, 120)
		SetSliderDialogInterval(10)
	endEvent

	event OnSliderAcceptST(float a_value)
		_ScanInterval = a_value as int
		SetSliderOptionValueST(_ScanInterval)
		RN_AutoScan.UpdateInt(_ScanInterval)
	endEvent

	event OnDefaultST()
		_ScanInterval = 30
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

state RUI_Handler ;;Debug Options
	Event OnSelectST()
		RUI = !RUI
		SetToggleOptionValueST(RUI)	
	EndEvent
endState

state TOV_Handler ;;Debug Options
	Event OnSelectST()
		TOV = !TOV
		SetToggleOptionValueST(TOV)	
	EndEvent
endState

;;-------------------------------

state Scan_Debug

	Event OnSelectST()
	
		if self.ShowMessage("This will reset the current Museum scan and reset the scanner, do you want to reset now?", true, "Reset", "Cancel")
			RN_Scan_Done.SetValue(RN_Scan_Registered.GetValue())
			
			autoScanVal = True
			_ScanInterval = 30
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

state Startup_Debug

	Event OnSelectST()
	
		if self.ShowMessage("This will reset the startup tasks, do you want to reset now?", true, "Reset", "Cancel")
			ShowMessage("Please wait a few minutes then save / load the game", false, "Ok")
			RN_Setup_Done.SetValue(RN_Setup_Registered.GetValue())
			ShowMessage("Please exit the MCM", false, "Ok")
			ForcePageReset()
		endIf
		
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Resets the TCC Startup tasks")
	EndEvent
endState

;;-------------------------------

State Update_Patches

	function OnSelectST()
	
		if self.ShowMessage("This will send an update event to all installed patches, do you want to update now?", true, "Update", "Cancel")
			self.ShowMessage("Please exit the MCM and follow the on-screen instructions", false, "Ok")
			RN_Utility.UpdatePatches()
		endIF			
	EndFunction

	Event OnHighlightST()

		self.SetInfoText("Use this to add support for new items / displays from installed patches that have been updated mid-game")
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

		SetInfoText("This option will rebuild the moreHUD lists -- Only to be used if prompted or advised by Developer.")
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

		self.SetInfoText("This option will display notifications when the player collects all displayable items from a given Set, collection or Museum Section.\n Default: On")
	EndEvent
endState

;;-------------------------------

String function SetCompleteNotificationsString()

		if !ShowSetCompleteVal		
			Status_Return = "Off"
		elseif ShowSetCompleteVal	
			Status_Return = "On"
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetCompleteNotificationsString()

	if !ShowSetCompleteVal
		Status_Return = "Off"
	elseif ShowSetCompleteVal	
		Status_Return = "On"
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

;;-------------------------------

state iRelicRestrictionOptions

	Event OnSelectST()
		Restricted = !Restricted 
			
		self.SetTextOptionValueST(Self.SetRestrictionOptions(), false, "")
		ForcePagereset()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Toggles storage restriction on/off.\n Off - The storage container will have no restrictions and will allow any items to be stored.\n On - The storage container will only allow items that are displayable and not already on display.")
	EndEvent
endState

;;-------------------------------
	
String function SetRestrictionOptions()
	
	if !Restricted
		Status_Return = "Off"	
		
	elseif Restricted
		Status_Return = "On"
	endIf
	return Status_Return
endFunction	

;;-------------------------------
	
String function GetRestrictionOptions()
	
	if !Restricted
		Status_Return = "Off"
		
	elseif Restricted
		Status_Return = "On"
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

		self.SetInfoText("Choose which container(s) to check for displayable items when using the 'Transfer Relics' option at the Prep station.\n All Storage: Player Inventory, Relic Storage Container, All custom storage containers added via token.\n Relic Storage: Relic Storage Container Only.\n Custom Storage: Only containers added via token.")
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

	if !Game.GetPlayer().HasSpell(RN_Storage_Summon_Spell)
		Status_Return = "Purchase Spell To Use"
	elseif !AutoTransferRelics
		Status_Return = "Disabled"			
	elseif AutoTransferRelics
		Status_Return = "Enabled"				
	endIf	
	
	return Status_Return 
endFunction
	
;;-------------------------------
	
String function GetTransferOptions()
	
	if !Game.GetPlayer().HasSpell(RN_Storage_Summon_Spell)
		Status_Return = "Purchase Spell To Use"
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
		SetTextOptionValueST(Self.SetTokenVisibility(), false, "")
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
		Status_Return = "Off"
		
	elseif Token_Vis
		RN_Token_Visibility.SetValue(1)
		Status_Return = "On"
	endIf
	
	return Status_Return 
endFunction
	
;;-------------------------------
	
String function GetTokenVisibility()
	
	if !Token_Vis
		Status_Return = "Off"
		
	elseif Token_Vis
		Status_Return = "On"
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

		self.SetInfoText("Show Notifications when picking up a displayable item for the Museum.\n Default: On")
	EndEvent
endState

;;-------------------------------

String function SetMuseumNotificationsString()

	if !ShowMuseumVal		
		Status_Return = "Off"
	elseif ShowMuseumVal	
		Status_Return = "On"
	endIf
	return Status_Return
endfunction

;;-------------------------------
			
String function GetMuseumNotificationsString()

	if !ShowMuseumVal
		Status_Return = "Off"
	elseif ShowMuseumVal	
		Status_Return = "On"
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

		self.SetInfoText("Show Notifications when picking up a displayable item for the Armory.\n Default: On")
	EndEvent
endState

;;-------------------------------

String function SetArmoryNotificationsString()

	if !ShowArmoryVal		
		Status_Return = "Off"
	elseif ShowArmoryVal	
		Status_Return = "On"
	endIf
		return Status_Return
endfunction

;;-------------------------------
		
String function GetArmoryNotificationsString()

	if !ShowArmoryVal		
		Status_Return = "Off"
	elseif ShowArmoryVal	
		Status_Return = "On"
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

		self.SetInfoText("Show Notifications when picking up a displayable item from any installed patch(es).\n Default: On")
	EndEvent
endState

;;-------------------------------

String function SetModsNotificationsString()

	if !ShowModsVal		
		Status_Return = "Off"
	elseif ShowModsVal	
		Status_Return = "On"
	endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetModsNotificationsString()

	if !ShowModsVal
		Status_Return = "Off"
	elseif ShowModsVal	
		Status_Return = "On"
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

		self.SetInfoText("Enable to show notifications for quest displays, skills displays, exploration displays and unlocked achievements in the Museum.\n Default: On")
	EndEvent
endState

;;-------------------------------

String function SetListenerString()

	if !ShowListenerVal		
		Status_Return = "Off"
	elseif ShowListenerVal	
		Status_Return = "On"
	endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetListenerString()

	if !ShowListenerVal
		Status_Return = "Off"
	elseif ShowListenerVal	
		Status_Return = "On"
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
				ShowMessage("Please exit the MCM and wait for the setup complete notification", false, "Ok")
				While IsInMenuMode()
					Wait(0.5)
				endWhile
				RN_Utility.SetUpSafehouse()
				RN_SafeouseContent_Installed.SetValue(1)
			endIf
		endIF			
	EndFunction

	Event OnHighlightST()

		self.SetInfoText("Enable this to show moreHUD icons and add functionality to general Safehouse items including Safehouse Plus & CheeseMod for Everyone\n Default: Disabled \n (THIS FEATURE CAN NOT BE DISABLED ONCE TURNED ON)")
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

;;-------------------------------

state iAchievement_Enabled
	
	function OnSelectST()
	
		Achievements_Enabled = !Achievements_Enabled 
		
		if Achievements_Enabled
			if self.ShowMessage("This will enable the TCC Achievements system which can grant perks, gold, increases to attributes and Unique items for reaching certain milestones within Legacy of the Dragonborn, do you want to enable now?", true, "Enable", "Cancel")
				SetToggleOptionValueST(Achievements_Enabled)
				ShowMessage("Please exit the MCM and wait for the setup complete notification", false, "Ok")
				While IsInMenuMode()
					Wait(0.5)
				endWhile
				RN_Utility.SetUpAchievements()
			endIf
		endIF			
	EndFunction

	Event OnHighlightST()

		self.SetInfoText("Enable this to turn on the achievements system.\n Default: Disabled \n (THIS FEATURE CAN NOT BE DISABLED ONCE TURNED ON)")
	EndEvent
endState

;;-------------------------------

State Disable_AchievementPerks

	function OnSelectST()
	
		Ach_Perks = !Ach_Perks 
		SetToggleOptionValueST(Ach_Perks)
	EndFunction

	Event OnHighlightST()

		self.SetInfoText("Some achievements will grant perk points as part of the reward, use this option to enable/disable perk point rewards.\n Default: Disabled")
	EndEvent
endState

State Enable_Highlights

	function OnSelectST()
	
		Ach_Highlight = !Ach_Highlight 
		SetToggleOptionValueST(Ach_Highlight)
	EndFunction

	Event OnHighlightST()

		self.SetInfoText("Use to show/hide the specific requirements for obtaining an achievement when hovering over them in the MCM.\n Default: Disabled")
	EndEvent
endState	
;;-------------------------------
		
state SoundListOptions

	event OnMenuOpenST()
		SetMenuDialogStartIndex(IndexSounds)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(AchievementSoundList)
	endEvent

	event OnMenuAcceptST(int index)
		IndexSounds = Index
		SetMenuOptionValueST(SoundListOptions, AchievementSoundList[IndexSounds])
		ForcePageReset()
	endEvent

	event OnDefaultST()
		IndexSounds = 0
		SetMenuOptionValueST(AchievementSoundList[IndexSounds])
		ForcePageReset()
	endEvent

	event OnHighlightST()
		SetInfoText("Use this menu to customize which sound plays when an achievement is awarded.")
	endEvent
endState

;;-------------------------------
		
state AttributeListOptions

	event OnMenuOpenST()
		SetMenuDialogStartIndex(IndexAttribute)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(AttributeList)
	endEvent

	event OnMenuAcceptST(int index)
		IndexAttribute = Index
		SetMenuOptionValueST(AttributeListOptions, AttributeList[IndexAttribute])
		ForcePageReset()
	endEvent

	event OnDefaultST()
		IndexAttribute = 0
		SetMenuOptionValueST(AttributeList[IndexAttribute])
		ForcePageReset()
	endEvent

	event OnHighlightST()
		SetInfoText("Use this menu to customize which attribute is increased when an achievement is awarded.")
	endEvent
endState

;;-------------------------------

state AchievementSet01

	function OnSelectST()
		Ach_Notify = !Ach_Notify
		SetToggleOptionValueST(Ach_Notify)
	EndFunction

	Event OnHighlightST()

		self.SetInfoText("Enable this to turn on the achievements notification system.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

state AchievementSet02

	function OnSelectST()
		Ach_Visual = !Ach_Visual 
		SetToggleOptionValueST(Ach_Visual)		
	EndFunction

	Event OnHighlightST()

		self.SetInfoText("Enable this to turn on the visual effect when an achievement is awarded.\n Default: Enabled")
	EndEvent
endState

state iAchievement01
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Reach a total of 750 displays in the Museum")
		endif
	EndEvent
endState

state iAchievement02
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Reach a total of 1000 displays in the Museum")
		endif
	EndEvent
endState

state iAchievement03
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Reach a total of 100 book displays in the Museum")
		endif
	EndEvent
endState

state iAchievement04
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Reach a total of 250 book displays in the Museum")
		endif
	EndEvent
endState

state iAchievement05
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Find and display all the Explorer Relics in the Guildhouse")
		endif
	EndEvent
endState

state iAchievement06
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Find and display all the Gems in the Gallery of Natural Science")
		endif
	EndEvent
endState

state iAchievement07
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Find and display all the Shells for the Tide Pool in the Gallery of Natural Science")
		endif
	EndEvent
endState

state iAchievement08
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Find and display all 10 Decks of Cards in the Hall of Oddities")
		endif
	EndEvent
endState

state iAchievement09
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Find and display the complete Coin Collection in the Hall of Oddities")
		endif
	EndEvent
endState

state iAchievement10
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Complete all side quests from Auryen's Notes")
		endif
	EndEvent
endState

state iAchievement11
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Locate and interact with all Standing Stones around Skyrim")
		endif
	EndEvent
endState

state iAchievement12
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Locate and interact with all Word Walls around Skyrim")
		endif
	EndEvent
endState

state iAchievement13
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Find and display all Dragon Priest Masks and Dragon Claws in the Hall of Heroes")
		endif
	EndEvent
endState

state iAchievement14
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Help the people of Skyrim and become the Thane of every Hold")
		endif
	EndEvent
endState

state iAchievement15
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Find and display all the pieces from the Arms of the Crusader set in the Hall of Heroes")
		endif
	EndEvent
endState

state iAchievement16
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Visit Solitude and complete the Legacy starting quest to open the Museum")
		endif
	EndEvent
endState

state iAchievement17
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Find and display all the Black Books in the Daedric Gallery")
		endif
	EndEvent
endState

state iAchievement18
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Fill the Armory and reach a Smithing level of 100, this achievement does not count items from supported mods")
		endif
	EndEvent
endState

state iAchievement19
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Build all creature displays in the Gallery of Natural Science")
		endif
	EndEvent
endState

state iAchievement20
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Locate and interact with the 9 Shrines of the Divines around Skyrim")
		endif
	EndEvent
endState

state iAchievement21
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Locate or craft all Dwemer artifacts in the Reception Hall")
		endif
	EndEvent
endState

state iAchievement22
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Locate or craft all Falmer artifacts in the Reception Hall")
		endif
	EndEvent
endState

state iAchievement23
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Locate or craft all Nordic artifacts in the Reception Hall")
		endif
	EndEvent
endState

state iAchievement24
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Agree to help Brother Ikard and don't skip the Haunted Museum quest")
		endif
	EndEvent
endState

state iAchievement25
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Display all Museum Paintings")
		endif
	EndEvent
endState

state iAchievement26
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Complete all Excavations and roll the credits")
		endif
	EndEvent
endState

state iAchievement27
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Build all the Explorer Outposts")
		endif
	EndEvent
endState

state iAchievement28
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Forgive Avram after Shadows of One's Past")
		endif
	EndEvent
endState

state iAchievement29
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Become a Master of each spell school")
		endif
	EndEvent
endState

state iAchievement30
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Find and display Ice's Stalhrim Spoon of Assassination")
		endif
	EndEvent
endState

state iAchievement31
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Renovate Deepholme")
		endif
	EndEvent
endState

state iAchievement32
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Display all Guild Displays in the Dragonborn Hall")
		endif
	EndEvent
endState

state iAchievement33
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Complete all Daedric Quests")
		endif
	EndEvent
endState

state iAchievement34
	Event OnHighlightST()
		if Ach_Highlight
			self.SetInfoText("Take all that gold and fill the Treasury!")
		endif
	EndEvent
endState

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

Event BuildTotalsArray(globalvariable akvariable, Globalvariable[] _array)

	akvariable.setvalue(0)
	Int _Index = _array.length
	while _Index
		_Index -= 1
		if _array[_Index] != None
			if _array[_Index].GetValue()
				akvariable.Mod(1)
			endIF
		endIF
	endWhile
endEvent

;;-------------------------------

string function GetCurrentMuseumCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	Int Total_Room = 11
		
		if RN_CreationClubContent_Installed.GetValue()
			Total_Room += 1
		endIf

		if RN_SafeouseContent_Installed.GetValue()
			Total_Room += 1
		endIf
		
		Status_Return = (Current_Count + "/" + Total_Room + " Sections")
	return Status_Return
endFunction

;;-------------------------------

string function GetCurrentAchievementCount(GlobalVariable akVariable, Formlist akTotal)

		Status_Return = (akVariable.GetValue() as Int + "/" + akTotal.GetSize() as Int)
	return Status_Return
endFunction

;;-------------------------------

string function GetDisplaySectionCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/6 Sections")
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

	RN_Armory_Global_Count = new globalvariable[20]
	_Index = 0
	While _Index < _Armory_Global_Count.GetSize()
		globalvariable akvariable = _Armory_Global_Count.GetAt(_Index) as globalvariable
		RN_Armory_Global_Count[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Armory_Global_Complete = new globalvariable[20]
	_Index = 0
	While _Index < _Armory_Global_Complete.GetSize()
		globalvariable akvariable = _Armory_Global_Complete.GetAt(_Index) as globalvariable
		RN_Armory_Global_Complete[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Armory_Global_Total = new globalvariable[20]
	_Index = 0
	While _Index < _Armory_Global_Total.GetSize()
		globalvariable akvariable = _Armory_Global_Total.GetAt(_Index) as globalvariable
		RN_Armory_Global_Total[_Index] = akvariable
		_Index += 1
	endWhile

;;-------------------------------

	RN_Museum_Global_Complete = new globalvariable[13]
	_Index = 0
	While _Index < _Museum_Global_Complete.GetSize()
		globalvariable akvariable = _Museum_Global_Complete.GetAt(_Index) as globalvariable
		RN_Museum_Global_Complete[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Museum_Global_Count = new globalvariable[13]
	_Index = 0
	While _Index < _Museum_Global_Count.GetSize()
		globalvariable akvariable = _Museum_Global_Count.GetAt(_Index) as globalvariable
		RN_Museum_Global_Count[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Museum_Global_Total = new globalvariable[13]
	_Index = 0
	While _Index < _Museum_Global_Total.GetSize()
		globalvariable akvariable = _Museum_Global_Total.GetAt(_Index) as globalvariable
		RN_Museum_Global_Total[_Index] = akvariable
		_Index += 1
	endWhile

	RN_Ach_Globals = new globalvariable[34]
	_Index = 0
	While _Index < RN_Achievement_Globals.GetSize()
		globalvariable akvariable = RN_Achievement_Globals.GetAt(_Index) as globalvariable
		RN_Ach_Globals[_Index] = akvariable
		_Index += 1
	endWhile
	
;;-------------------------------

	_Armory_Section_names = new string[20]
	_Armory_Section_names[0] = "Ancient Nord Set:"
	_Armory_Section_names[1] = "Blades Set:"
	_Armory_Section_names[2] = "Daedric Set:"
	_Armory_Section_names[3] = "Dawnguard Set:"
	_Armory_Section_names[4] = "Dragon Set:"
	_Armory_Section_names[5] = "Dwarven Set:"
	_Armory_Section_names[6] = "Ebony Set:"
	_Armory_Section_names[7] = "Elven Set:"
	_Armory_Section_names[8] = "Falmer Set:"
	_Armory_Section_names[9] = "Forsworn Set:"
	_Armory_Section_names[10] = "Glass Set:"
	_Armory_Section_names[11] = "Guard Armor Set:"
	_Armory_Section_names[12] = "Iron Set:"
	_Armory_Section_names[13] = "Misc Set:"
	_Armory_Section_names[14] = "Nordic Set:"
	_Armory_Section_names[15] = "Orcish Set:"
	_Armory_Section_names[16] = "Snow Elf Set:"
	_Armory_Section_names[17] = "Stalhrim Set:"
	_Armory_Section_names[18] = "Steel Set:"
	_Armory_Section_names[19] = "Thane Weapons Set:"

	_Museum_Section_names = new string[13]
	_Museum_Section_names[0] = "Armory:"
	_Museum_Section_names[1] = "Daedric Gallery:"
	_Museum_Section_names[2] = "Dragonborn Hall:"
	_Museum_Section_names[3] = "Guildhouse:"
	_Museum_Section_names[4] = "Hall of Heroes:"
	_Museum_Section_names[5] = "Hall of Lost Empires:"
	_Museum_Section_names[6] = "Hall of Oddities:"
	_Museum_Section_names[7] = "Hall of Secrets:"
	_Museum_Section_names[8] = "Hall of Wonders:"
	_Museum_Section_names[9] = "Library:"
	_Museum_Section_names[10] = "Natural Science:"
	_Museum_Section_names[11] = "Safehouse:"
	_Museum_Section_names[12] = "Storeroom:"
	
	RN_Ach_StateName = new string[34]
	RN_Ach_StateName[0] = "iAchievement01"
	RN_Ach_StateName[1] = "iAchievement02"
	RN_Ach_StateName[2] = "iAchievement03"
	RN_Ach_StateName[3] = "iAchievement04"
	RN_Ach_StateName[4] = "iAchievement05"
	RN_Ach_StateName[5] = "iAchievement06"
	RN_Ach_StateName[6] = "iAchievement07"
	RN_Ach_StateName[7] = "iAchievement08"
	RN_Ach_StateName[8] = "iAchievement09"
	RN_Ach_StateName[9] = "iAchievement10"
	RN_Ach_StateName[10] = "iAchievement11"
	RN_Ach_StateName[11] = "iAchievement12"
	RN_Ach_StateName[12] = "iAchievement13"	
	RN_Ach_StateName[13] = "iAchievement14"
	RN_Ach_StateName[14] = "iAchievement15"
	RN_Ach_StateName[15] = "iAchievement16"
	RN_Ach_StateName[16] = "iAchievement17"
	RN_Ach_StateName[17] = "iAchievement18"
	RN_Ach_StateName[18] = "iAchievement19"
	RN_Ach_StateName[19] = "iAchievement20"
	RN_Ach_StateName[20] = "iAchievement21"
	RN_Ach_StateName[21] = "iAchievement22"
	RN_Ach_StateName[22] = "iAchievement23"
	RN_Ach_StateName[23] = "iAchievement24"
	RN_Ach_StateName[24] = "iAchievement25"
	RN_Ach_StateName[25] = "iAchievement26"
	RN_Ach_StateName[26] = "iAchievement27"
	RN_Ach_StateName[27] = "iAchievement28"
	RN_Ach_StateName[28] = "iAchievement29"
	RN_Ach_StateName[29] = "iAchievement30"
	RN_Ach_StateName[30] = "iAchievement31"
	RN_Ach_StateName[31] = "iAchievement32"
	RN_Ach_StateName[32] = "iAchievement33"
	RN_Ach_StateName[33] = "iAchievement34"

	RN_Ach_AchName = new string[34]
	RN_Ach_AchName[0] = "Collector"
	RN_Ach_AchName[1] = "Hoarder"
	RN_Ach_AchName[2] = "Junior Librarian"
	RN_Ach_AchName[3] = "Bibliophile"
	RN_Ach_AchName[4] = "Spelunker"
	RN_Ach_AchName[5] = "Lapidarist"
	RN_Ach_AchName[6] = "Conchologist"
	RN_Ach_AchName[7] = "Fusilatelist"
	RN_Ach_AchName[8] = "Fusilatelist"
	RN_Ach_AchName[9] = "Expert Sleuth"
	RN_Ach_AchName[10] = "Pillar of Nirn"
	RN_Ach_AchName[11] = "Noise Complaint"
	RN_Ach_AchName[12] = "Masquerader"	
	RN_Ach_AchName[13] = "That's Sir Thane to You"
	RN_Ach_AchName[14] = "Guardian of the Divine"
	RN_Ach_AchName[15] = "Cut the Ribbon"
	RN_Ach_AchName[16] = "Tentacle Afficianado"
	RN_Ach_AchName[17] = "Temper Tantrum"
	RN_Ach_AchName[18] = "Taxidermist"
	RN_Ach_AchName[19] = "By All of the Gods!"
	RN_Ach_AchName[20] = "Gearhead"
	RN_Ach_AchName[21] = "Blind Construction"
	RN_Ach_AchName[22] = "Children of the Sky"
	RN_Ach_AchName[23] = "Ghostbuster"
	RN_Ach_AchName[24] = "Canvas Collector"
	RN_Ach_AchName[25] = "That's all Folks"
	RN_Ach_AchName[26] = "Expansionist"
	RN_Ach_AchName[27] = "Forgive and Forget"
	RN_Ach_AchName[28] = "Yer a Wizard "
	RN_Ach_AchName[29] = "Master of Secrets"
	RN_Ach_AchName[30] = "Deep Pockets"
	RN_Ach_AchName[31] = "Guild Master Master"
	RN_Ach_AchName[32] = "Champion of All"
	RN_Ach_AchName[33] = "Midas Touch"	
endEvent
				
;;-------------------------------
	
Function AddModSupport(Int _WaitTime, GlobalVariable _GVComplete, GlobalVariable _GVCount, GlobalVariable _GVTotal, String _ModName)
	
	;Utility.Wait(_WaitTime)
	
	Int Index = GetArrayPos(_ModName)
	
	if Index == 999
		Index = RN_Patches_Complete_Array.Find(none)
		RN_Patches_Name[Index] = _ModName
		RN_Patches_Complete_Array[Index] = _GVComplete
		RN_Patches_Count_Array[Index] = _GVCount
		RN_Patches_Total_Array[Index] = _GVTotal
	else
		RN_Patches_Name[Index] = _ModName
		RN_Patches_Complete_Array[Index] = _GVComplete
		RN_Patches_Count_Array[Index] = _GVCount
		RN_Patches_Total_Array[Index] = _GVTotal		
	endif
	TCCDebug.Log("MCM Registered Official Patch [" + _ModName + "] at position " + Index, 0)
endFunction

;;-------------------------------
	
Function AddCustomModSupport(Int _WaitTime, GlobalVariable _GVComplete, GlobalVariable _GVCount, GlobalVariable _GVTotal, String _ModName)
	
	;Utility.Wait(_WaitTime)
	
	Int Index = RN_Custom_Name.Find(_ModName)
	if Index == -1
		Index = RN_Custom_Name.Find("")
		RN_Custom_Name[Index] = _ModName
		RN_Custom_Complete_Array[Index] = _GVComplete
		RN_Custom_Count_Array[Index] = _GVCount
		RN_Custom_Total_Array[Index] = _GVTotal
	else
		RN_Custom_Name[Index] = _ModName
		RN_Custom_Complete_Array[Index] = _GVComplete
		RN_Custom_Count_Array[Index] = _GVCount
		RN_Custom_Total_Array[Index] = _GVTotal		
	endif

	TCCDebug.Log("MCM Registered Custom Patch [" + _ModName + "] at position " + Index, 0)
endFunction

;;-------------------------------
	
Function AddSectionSupport(Formlist Count, Formlist Total, Formlist Complete, String _ModName, String[] _SectionName)
	
	Int Index
	
	if _ModName == "Heavy Armory:"
		
		Index = _SectionName.length
		Index_Section = Index
		While  Index
			Index -= 1
			RN_Section_Name[Index] = _SectionName[Index]
			RN_Section_Complete_Array[Index] = Complete.GetAt(Index) as GlobalVariable
			RN_Section_Count_Array[Index] = Count.GetAt(Index) as GlobalVariable
			RN_Section_Total_Array[Index] = Total.GetAt(Index) as GlobalVariable
			TCCDebug.Log("MCM Registered Heavy Armory Section [" + _SectionName[Index] + "] at position " + Index, 0)
		endWhile
	
	elseif _ModName == "Immersive Weapons:"

		Index = Complete.GetSize()
		Index_Section2 = Index
		While  Index
			Index -= 1
			RN_Section2_Name[Index] = _SectionName[Index]
			RN_Section2_Complete_Array[Index] = Complete.GetAt(Index) as GlobalVariable
			RN_Section2_Count_Array[Index] = Count.GetAt(Index) as GlobalVariable
			RN_Section2_Total_Array[Index] = Total.GetAt(Index) as GlobalVariable
			TCCDebug.Log("MCM Registered Immersive Weapons Section [" + _SectionName[Index] + "] at position " + Index, 0)
		endWhile	
	endIf
endFunction

;;-------------------------------

Function BuildPatchArray(bool _create, bool _Rebuild)
	
	if _create
	
		TCCDebug.Log("MCM - Building Patch Array", 0)	
		
		RN_Patches_Complete_Array = new globalvariable[128]
		RN_Patches_Count_Array = new globalvariable[128]
		RN_Patches_Total_Array = new globalvariable[128]
		RN_Patches_Name = new string[128]
		
		RN_Custom_Complete_Array = new globalvariable[128]
		RN_Custom_Count_Array = new globalvariable[128]
		RN_Custom_Total_Array = new globalvariable[128]
		RN_Custom_Name = new string[128]

		RN_Section_Complete_Array = new globalvariable[128]
		RN_Section_Count_Array = new globalvariable[128]
		RN_Section_Total_Array = new globalvariable[128]
		RN_Section_Name = new string[128]
		
		RN_Section2_Complete_Array = new globalvariable[128]
		RN_Section2_Count_Array = new globalvariable[128]
		RN_Section2_Total_Array = new globalvariable[128]
		RN_Section2_Name = new string[128]	
	endIf
	
	if _Rebuild
		
		TCCDebug.Log("MCM - Sending Patch Array Event", 0)
		SendModEvent("TCCUpdate_Arrays")
	endIf
endFunction
			
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script End ------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
