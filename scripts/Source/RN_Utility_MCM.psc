scriptname RN_Utility_MCM extends SKI_ConfigBase Conditional

import FISSFactory

import AhzmoreHUD
import AhzmoreHUDIE

import utility
import RN_Utility_Global

RN_Utility_Script property RN_Utility auto
RN_Main_Armory property _AddItemArmory auto
RN_Main_Safehouse property _AddItemSafehoue auto
RN_Main_Museum_HOHLIB property _AddItemMain_1 auto
RN_Main_Museum_EEHMISC property _AddItemMain_2 auto
RN_Main_SupportedMods property _AddItemPatches auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; String Returns
string[] PagesList
string Status_Return

bool property advdebug auto hidden
bool Token_Vis conditional

bool property Safehouse_Enabled auto hidden
bool Ach_Highlight
bool Property Achievements_Enabled auto hidden
bool Property Ach_Perks auto hidden

Bool Page1
Bool Page2

;; General Globals
globalvariable property DBM_SortWait auto
globalvariable property RN_Setup_Done auto
globalvariable property RN_Setup_Start auto
globalvariable property RN_Setup_Finish auto
globalvariable property RN_Setup_Registered auto

globalvariable property RN_Safehouse_Done auto
globalvariable property RN_Safehouse_Registered auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

;; Player Ref for Game.GetPlayer()
objectreference property PlayerRef auto

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

string[] TransferList
int property IndexTransfer auto hidden
int TransferListOptions

;; bool Properties
bool property ShowMuseumVal = true auto hidden ;;Museum Notifications
bool property ShowArmoryVal = true auto hidden ;;Armory Notifications
bool property ShowModsVal = true auto hidden ;;Supported Mod Notifications
bool property ShowSetCompleteVal = true auto hidden ;;Section / Set Completion Notifications
bool property ShowSimpleNotificationVal = true auto hidden ;;Simple Notification (No MessageBox)
bool property ShowListenerVal = true auto hidden ;;Notifications for Display Listeners
bool property Restricted auto hidden ;;Storage Restriction Value
bool property ShowStartup = true auto hidden ;; Shows Startup Messages

bool property ScanNotificationsval auto hidden ;; Museum Scan Notifications
bool property Ach_Notify = true auto hidden
bool property Ach_Visual = true auto hidden

globalvariable property AchHealth auto
globalvariable property AchStamina auto
globalvariable property AchMagicka auto
globalvariable property AchSpeech auto

;; Globals for Complete Set Listings.

globalvariable property iDisplaySectionComplete auto
globalvariable property RN_SupportedModCount auto
globalvariable property RN_CustomModCount auto
globalvariable property RN_CreationClubContent_Installed auto
globalvariable property RN_SafeouseContent_Installed auto

;; Treasury Globals
globalvariable property RN_MuseumValue auto
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

ObjectReference Property TCC_Achievements_Xmarker Auto

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
Formlist property _Armory_Formlist_Items_Tracking auto
Formlist property _Armory_Formlist_Displays_Tracking auto
GlobalVariable[] RN_Armory_Global_Complete
GlobalVariable[] RN_Armory_Global_Count
GlobalVariable[] RN_Armory_Global_Total
Int[] _Armory_Section_Position
String[] _Armory_Section_names

;Achievements
globalvariable property RN_Achievements_Listener_Count auto
formlist property RN_Achievement_Globals auto
globalvariable[] RN_Ach_Globals
string[] RN_Ach_Highlight
string[] RN_Ach_AchName
int[] RN_Ach_Position

globalvariable property RN_ComAchievements_Listener_Count auto
formlist property RN_ComAchievement_Globals auto
globalvariable[] RN_ComAch_Globals
string[] RN_ComAch_Highlight
string[] RN_ComAch_AchName
int[] RN_ComAch_Position

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Patches -----------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

GlobalVariable[] RN_Patches_Complete_Array
GlobalVariable[] RN_Patches_Count_Array
GlobalVariable[] RN_Patches_Total_Array
Quest[] RN_Patches_Quests_Array
Int[] RN_Patches_Position_Array
String[] RN_Patches_Name

GlobalVariable[] RN_Custom_Complete_Array
GlobalVariable[] RN_Custom_Count_Array
GlobalVariable[] RN_Custom_Total_Array
Quest[] RN_Custom_Quests_Array
Int[] RN_Custom_Position_Array
String[] RN_Custom_Name

GlobalVariable[] RN_Section_Complete_Array
GlobalVariable[] RN_Section_Count_Array
GlobalVariable[] RN_Section_Total_Array
Formlist RN_Section_DisplaysList
Formlist RN_Section_ItemsList
String[] RN_Section_Name
Int[] RN_Section_Position_Array
Int Index_Section

GlobalVariable[] RN_Section2_Complete_Array
GlobalVariable[] RN_Section2_Count_Array
GlobalVariable[] RN_Section2_Total_Array
Formlist RN_Section2_DisplaysList
Formlist RN_Section2_ItemsList
String[] RN_Section2_Name
Int[] RN_Section2_Position_Array
Int Index_Section2

Quest TrackedQuest
String TrackedPatch
GlobalVariable TrackedCount
GlobalVariable TrackedTotal

ObjectReference[] TrackedDisplays
ObjectReference[] TrackedDisplays2
String[] TrackedNames
String[] TrackedNames2

Int SetVal
Int SetVal2
Int SetVal3

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnConfigInit()

	Build_Arrays()
	AddDynamicPagesList()
EndEvent

;-- Events --------------------------------

Event AddDynamicPagesList()

	ModName = "LOTD: The Curators Companion"
	PagesList = new String[128]
	PagesList[0] = "General Settings"
	PagesList[1] = "Advanced Settings"
	PagesList[2] = "Achievements"
	PagesList[3] = " "
	PagesList[4] = "~~ Completion ~~"
	PagesList[5] = "Museum Sections"
	PagesList[6] = "Armory Sections"
	PagesList[7] = "Official Patches"		

	Int Q = 0
	Int x = 8

	if RN_CustomModCount.GetValue()
		Q = PagesList.Find("")	
			PagesList[Q] = "Custom Patches"
		x += 1
	endif

	Q = PagesList.Find("")	
		PagesList[Q] = " "
	x += 1	
	
	Q = PagesList.Find("")	
		PagesList[Q] = "Display Tracker (1/2)"
	x += 1

	Q = PagesList.Find("")	
		PagesList[Q] = "Display Tracker (2/2)"
	x += 1
	
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
	endif
	
	AddDynamicPagesList()
	AddSettingsPage()
	AddAdvancedPage()
	AddAchievementsPage()
	AddMuseumSetsPage()
	AddArmorySetsPage()
	AddCompletedModsPage()
	AddCustomModsPage()
	AddDebugPage()
	AddTrackingPage()
	AddTrackingPage2()
	InitmoreHUDChoiceList()
	InitAchievementSoundList()
	InitAttributeList()
	InitTransferList()
EndEvent

;-- Events --------------------------------

Function InitmoreHUDChoiceList()

	moreHUDChoiceList = new string[5]
	moreHUDChoiceList[0] = "Show All Icons"
	moreHUDChoiceList[1] = "Show New Icons"
	moreHUDChoiceList[2] = "Show Found Icons"
	moreHUDChoiceList[3] = "Show Displayed Icons"
	moreHUDChoiceList[4] = "Hide All Icons"
EndFunction

;-- Events --------------------------------

Function InitAchievementSoundList()

	AchievementSoundList = new string[3]
	AchievementSoundList[0] = "Default Sound FX"
	AchievementSoundList[1] = "Crowd Cheer FX"
	AchievementSoundList[2] = "No Sound FX"
EndFunction

;-- Events --------------------------------

Function InitAttributeList()

	AttributeList = new string[5]
	AttributeList[0] = "No Attribute Reward"
	AttributeList[1] = "Increase Magicka"
	AttributeList[2] = "Increase Health"
	AttributeList[3] = "Increase Stamina"
	AttributeList[4] = "Random Attribute"
EndFunction

;-- Events --------------------------------

Function InitTransferList()

	TransferList = new string[3]
	TransferList[0] = "All Storage"
	TransferList[1] = "Relic Storage Container"
	TransferList[2] = "Custom Storage Only"
EndFunction
		
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Settings Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
Function AddSettingsPage()

	if CurrentPage == "General Settings"
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		SetCursorPosition(0)
		AddHeaderOption("Notification Settings:")
		
		AddTextOptionST("iRelicMuseumNotifications", "Museum Items:", GetDefaultOnOff(ShowMuseumVal), 0)
		AddTextOptionST("iRelicArmoryNotifications", "Armory Items:", GetDefaultOnOff(ShowArmoryVal), 0)	
		AddTextOptionST("iRelicModsNotifications", "Patch(es) Items:", GetDefaultOnOff(ShowModsVal), 0)
		AddTextOptionST("iRelicListenerNotifications", "Listeners:", GetDefaultOnOff(ShowListenerVal), 0)
		AddTextOptionST("iRelicSetCompleteNotifications", "Collection / Set Completion:", GetDefaultOnOff(ShowSetCompleteVal), 0)
		AddTextOptionST("iRelicSimpleNotifications", "Notification Style:", GetDefaultType(ShowSimpleNotificationVal), 0)
		
		AddEmptyOption()		
		AddHeaderOption("General Settings:")
		AddTextOptionST("iRelicShowStartup", "Startup Notifications:", GetDefaultStartup(ShowStartup), 0)	
		AddTextOptionST("RefreshMCM", "Something not working?", "Reload MCM", 0)
		AddTextOptionST("Config_Default", "Restore Defaults", "Restore", 0)	
		
		SetCursorPosition(1)			
		AddHeaderOption("Mod Info:")
		
		AddTextOption("Thanks for downloading The Curators Companion, please", "", 0)
		AddTextOption("read the mod description on Nexus to learn about all", "", 0)
		AddTextOption("the different features this mod provides.", "", 0)
		AddEmptyOption()
		AddTextOption("", "Developed By [Ic0n]Ic0de", 0)
		AddTextOption("", "Version 5.1.0", 0)	
		
		AddEmptyOption()
		AddHeaderOption("Profile Settings:")
		AddTextOptionST("Config_Save", "FISS - User Profile", GetConfigSaveString(), 0)
		AddTextOptionST("Config_Load", "FISS - User Profile", GetConfigLoadString(), 0)
		AddTextOptionST("Config_Author", "Developers Preset", "Load Preset", 0)
	endif
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Settings Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
Function AddAdvancedPage()

	if CurrentPage == "Advanced Settings"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("moreHUD Settings:")
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017 || SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
			AddMenuOptionST("moreHUDOptions", "moreHUD Icons Settings:", moreHUDChoiceList[IndexmoreHUD])	
		else
			AddtextOption("moreHUD Icon Settings:", "<font color='#750e0e'>moreHUD Not Found</font>")
		endif
		
		if Safehouse_Enabled
			AddTextOptionST("Safehouse_Disp", "moreHUD Safehouse Integration:", GetDefaultEnabled(Safehouse_Enabled), 1)		
		elseif RN_Setup_Start.GetValue()
			AddTextOptionST("Safehouse_Disp", "moreHUD Safehouse Integration:", "Wait For Setup...", 1)
		else
			AddTextOptionST("Safehouse_Disp", "moreHUD Safehouse Integration:", GetDefaultEnabled(Safehouse_Enabled), 0)
		endif		
		AddEmptyOption()
		
		AddHeaderOption("Museum Scan:")
		AddTextOptionST("ScanNotifications", "Museum Scan Notifications", GetDefaultEnabled(ScanNotificationsval), 0)
		AddTextOptionST("ScanMuseum", "Museum Scan (Manual)", "Scan Now", 0)			
		
		AddEmptyOption()

		AddHeaderOption("Relic Storage Settings:")
		
		AddTextOptionST("iRelicRestrictionOptions", "Relic Storage Restriction:" , GetDefaultOnOff(Restricted), 0)
		AddTextOptionST("Token_Visibility", "Storage Token Recipe:", GetDefaultOnOff(Token_Vis), 0)
		AddMenuOptionST("TransferListOptions", "Transfer Station:", TransferList[IndexTransfer])
		SetCursorPosition(1)
		AddHeaderOption("Custom Storage Containers: (" + TCC_TokenList_NoShipmentCrates.GetSize() as Int + "/6)")
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
				endif
			endif

			AddTextOption(_Container.GetDisplayName(), _ContainerLocation, 0)
		endWhile
		
		SetCursorPosition(17)
		AddHeaderOption("Custom Storage Containers Information:")
		AddTextOptionST("ShowCustomContainerInfo", "Click to Show Information", "", 0)		
	endif
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Settings Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
Function AddAchievementsPage()

	if CurrentPage == "Achievements"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)

		if TCC_Achievements_Xmarker.IsDisabled()
			if RN_Setup_Start.GetValue()
				AddTextOptionST("iAchievement_Enabled", "Enable Achievements System", "Wait For Setup...", 1)
			else
				AddToggleOptionST("iAchievement_Enabled", "Enable Achievements System", Achievements_Enabled, 0)	
			endif
		
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
			
			AddHeaderOption("Awarded: " + GetCurrentAchievementCount(RN_Achievements_Listener_Count, RN_Achievement_Globals) + " Achievements")
			
			Int PageIdx = 9			
			Int _Index = 0
			While _Index < RN_Ach_Globals.length
				SetCursorPosition(PageIdx + 1)
				if RN_Ach_Globals[_Index] != none
					if RN_Ach_Globals[_Index].GetValue()
						if _Index == 28
							RN_Ach_Position[_Index] = AddTextOption(RN_Ach_AchName[_Index] + PlayerRef.GetBaseObject().GetName(), "Awarded", 0)
							PageIdx += 1
						else
							RN_Ach_Position[_Index] = AddTextOption(RN_Ach_AchName[_Index], "Awarded", 0)
							PageIdx += 1
						endif
					else
						if _Index == 28
							RN_Ach_Position[_Index] = AddTextOption(RN_Ach_AchName[_Index] + PlayerRef.GetBaseObject().GetName(), "Locked", 1)
							PageIdx += 1
						else
							RN_Ach_Position[_Index] = AddTextOption(RN_Ach_AchName[_Index], "Locked", 1)
							PageIdx += 1
						endif					
					endif
				endif
				_Index +=1		
			endWhile
			
			SetCursorPosition(PageIdx + 2)
			AddHeaderOption("Community Achievements:")
			PageIdx += 2
			SetCursorPosition(PageIdx + 1) 
			AddHeaderOption("Awarded: " + GetCurrentAchievementCount(RN_ComAchievements_Listener_Count, RN_ComAchievement_Globals) + " Community Achievements")
			PageIdx += 1
			_Index = 0
			While _Index < RN_ComAch_Globals.length
				SetCursorPosition(PageIdx + 1)
				if RN_ComAch_Globals[_Index] != none
					if RN_ComAch_Globals[_Index].GetValue()
						RN_ComAch_Position[_Index] = AddTextOption(RN_ComAch_AchName[_Index], "Awarded", 0)
						PageIdx += 1
					else
						RN_ComAch_Position[_Index] = AddTextOption(RN_ComAch_AchName[_Index], "Locked", 1)
						PageIdx += 1				
					endif
				endif
				_Index +=1		
			endWhile
		endif
	endif
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Museum Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function AddMuseumSetsPage()

	if CurrentPage == "Museum Sections"
		RN_Thane_Listener_Total.SetValue(9)
		RN_Skills_Listener_Total.SetValue(6)
		SetVal = BuildTotalsArray(SetVal, RN_Museum_Global_Complete)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)	
		AddHeaderOption("Museum Sections:")	
				
		Int _Index = 0
		Int _Length = RN_Museum_Global_Complete.length
		While _Index < _Length 			
			
			if RN_Museum_Global_Complete[_Index].GetValue()
				AddTextOption(_Museum_Section_names[_Index], "Complete", 1)
			elseif RN_Scan_Registered.GetValue()
				AddTextOption(_Museum_Section_names[_Index], "Updating...", 1)
			else
				AddTextOption(_Museum_Section_names[_Index], self.GetCurrentCount(RN_Museum_Global_Count[_Index] , RN_Museum_Global_Total[_Index]), 0)
			endif
			_Index += 1
			
			if _Index == 8 && !RN_CreationClubContent_Installed.GetValue()
				_Index += 1
			endif
			
			if _Index == 11 && !RN_SafeouseContent_Installed.GetValue()
				_Index += 1
			endif
			
		endWhile
			
		AddEmptyOption()
		AddHeaderOption("Museum Displays:")

		if (RN_Museum_Dibella_Statues_Complete.GetValue()) == 1
			AddTextOption("Dibella Statues:", "Complete", 1)
		else
			AddTextOption("Dibella Statues:", self.GetCurrentCount(RN_Museum_Dibella_Statues_Count, RN_Museum_Dibella_Statues_Total), 0)
		endif	

		if (RN_Exploration_Listener_Complete.GetValue()) == 1
			AddTextOption("Exploration Displays:", "Complete", 1)
		else
			AddTextOption("Exploration Displays:", self.GetCurrentCount(RN_Exploration_Listener_Count, RN_Exploration_Listener_Total), 0)
		endif

		if (RN_Museum_Paintings_Complete.GetValue()) == 1
			AddTextOption("Museum Paintings:", "Complete", 1)
		else
			AddTextOption("Museum Paintings:", self.GetCurrentCount(RN_Museum_Paintings_Count, RN_Museum_Paintings_Total), 0)
		endif
		
		if (RN_Quest_Listener_Complete.GetValue()) == 1
			AddTextOption("Quest Displays:", "Complete", 1)
		else
			AddTextOption("Quest Displays:", self.GetCurrentCount(RN_Quest_Listener_Count, RN_Quest_Listener_Total), 0)
		endif			

		if (RN_Skills_Listener_Complete.GetValue()) == 1
			AddTextOption("Skills Displays:", "Complete", 1)
		else
			AddTextOption("Skills Displays:", self.GetCurrentCount(RN_Skills_Listener_Count, RN_Skills_Listener_Total), 0)
		endif

		if (RN_Thane_Listener_Complete.GetValue()) == 1
			AddTextOption("Thane of the Holds:", "Complete", 1)
		else
			AddTextOption("Thane of the Holds:", self.GetCurrentCount(RN_Thane_Listener_Count, RN_Thane_Listener_Total), 0)
		endif

		AddEmptyOption()

		AddHeaderOption("Player Wealth:")
		AddTextOption("Museum Displays Value:", RN_MuseumValue.GetValue() as Int, 0)
		AddTextOption("Safehouse Treasury Value:", RN_Treasury_Count.GetValue() as Int, 0)
		AddTextOption("Deepholme Treasury Value:", RN_Treasury_Count2.GetValue() as Int, 0)
		AddTextOption("Karagas' Tower Treasury Value:", RN_Treasury_Count3.GetValue() as Int, 0)
	
		SetCursorPosition(1)
		AddHeaderOption("Page Information:")
		AddTextOption("This page lists all completable Museum sections.", "", 0)
		AddEmptyOption()
		AddTextOption("As items are collected and displayed, this page will", "", 0)
		AddTextOption("keep track of your progess and display counts.", "", 0)
		AddEmptyOption()
		AddTextOption("The figures on this page will update automatically", "", 0)
		AddTextOption("when displaying items in the Museum, of course it", "", 0)
		AddTextOption("may take a moment to update those numbers so run", "", 0)
		AddTextOption("the Museum scan if you feel the numbers seem off ;)", "", 0)
		if RN_CreationClubContent_Installed.GetValue()
			AddEmptyOption()
		endif
		if RN_SafeouseContent_Installed.GetValue()
			AddEmptyOption()
		endif
		AddEmptyOption()			
		AddTextOption("Completed:", GetCurrentMuseumCount(SetVal), 0)
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
		AddTextOption("This section tracks the Museum value as well as the Gold", "", 0)
		AddTextOption("value of the Treasury rooms, the figures update after", "", 0)
		AddTextOption("displaying items or adding / removing Gold.", "", 0)
		AddTextOptionST("GetMuseumValue", "Total Museum value:", self.GetTotalTreasuryValue(RN_MuseumValue, RN_Treasury_Count, RN_Treasury_Count2, RN_Treasury_Count3), 0)
	endif
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Armory Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function AddArmorySetsPage()

	if CurrentPage == "Armory Sections"
		SetVal = BuildTotalsArray(SetVal, RN_Armory_Global_Complete)
		SetVal2 = BuildTotalsArray(SetVal2, RN_Section_Complete_Array)
		SetVal3 = BuildTotalsArray(SetVal3, RN_Section2_Complete_Array)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("Armory Sets:")
		SetCursorPosition(1)
		AddHeaderOption("Completed: " + self.GetCurrentArmoryCount(SetVal) + " Sets")
		Int PageIdx = 1	
		Int _Index = 0
		Int _Length = RN_Armory_Global_Complete.length
		While _Index < _Length 
			SetCursorPosition(PageIdx + 1)
			if RN_Armory_Global_Complete[_Index].GetValue()
				AddTextOption(_Armory_Section_names[_Index], "Complete", 1)
				PageIdx += 1
			elseif RN_Scan_Registered.GetValue()
				AddTextOption(_Armory_Section_names[_Index], "Updating...", 1)
				PageIdx += 1
			else
				_Armory_Section_Position[_Index] = AddTextOption(_Armory_Section_names[_Index], self.GetCurrentCount(RN_Armory_Global_Count[_Index], RN_Armory_Global_Total[_Index]), 0)
				PageIdx += 1
			endif
			_Index +=1
		endWhile
		
		PageIdx += 2
		SetCursorPosition(PageIdx + 1)

		if (Game.GetModByName("LOTD_TCC_ImmWeap.esp") != 255)
			AddHeaderOption("Immersive Weapons Sets:")
			PageIdx += 1
			SetCursorPosition(PageIdx + 1)
			AddHeaderOption("Completed: " + self.GetCurrentIWCount(SetVal3) + " Sets")
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
						RN_Section2_Position_Array[_Index] = AddTextOption(RN_Section2_Name[_Index], self.GetCurrentCount(RN_Section2_Count_Array[_Index], RN_Section2_Total_Array[_Index]), 0)
						PageIdx += 1
					endif
				endif
				_Index +=1
			endWhile
			PageIdx += 2
			SetCursorPosition(PageIdx + 1)
		endif
		
		if (Game.GetModByName("LOTD_TCC_HeavyArm.esp") != 255)
			AddHeaderOption("Heavy Armory Sets:")
			PageIdx += 1
			SetCursorPosition(PageIdx + 1)
			AddHeaderOption("Completed: " + self.GetCurrentHACount(SetVal2) + " Sets")
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
						RN_Section_Position_Array[_Index] = AddTextOption(RN_Section_Name[_Index], self.GetCurrentCount(RN_Section_Count_Array[_Index], RN_Section_Total_Array[_Index]), 0)
						PageIdx += 1
					endif
				endif
				_Index +=1
			endWhile
		endif
	endif
endFunction	

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------Mods Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function AddCompletedModsPage()

	if CurrentPage == "Official Patches"
		SetVal = BuildTotalsArray(SetVal, RN_Patches_Complete_Array)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)				
		
		AddHeaderOption("Untracked Patch(es):", 0)
		if (Game.GetModByName("LOTD_TCC_SafehousePlus.esp") != 255)
			AddTextOption("Safehouse Plus", "Installed", 1)
		else
			AddTextOption("Safehouse Plus", "Not Installed", 1)
		endif
		
		SetCursorPosition(1)
		AddHeaderOption("", 0)
		
		if (Game.GetModByName("LOTD_TCC_CheeseMod.esp") != 255)
			AddTextOption("Cheesemod for Everyone", "Installed", 1)
		else
			AddTextOption("Cheesemod for Everyone", "Not Installed", 1)
		endif	
		
		SetCursorPosition(4)
		AddHeaderOption(GetCurrentCountInt(SetVal, RN_SupportedModCount) + " Official Patch(es) Completed", 0)
		
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
						RN_Patches_Position_Array[_Index] = AddTextOption(RN_Patches_Name[_Index], self.GetCurrentCount(RN_Patches_Count_Array[_Index], RN_Patches_Total_Array[_Index]), 0)
						PageIdx += 1
					endif
				endif
				_Index +=1
			endWhile
		else
			SetCursorPosition(4)
			AddHeaderOption("Official Patch(es)", 0)
			AddTextOption("No Trackable Patch(es) Installed", "", 1)
		endif
	endif
endFunction
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Patch Tracking Page 1 --------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function AddTrackingPage()

	if CurrentPage == "Display Tracker (1/2)"

		if !Page1
			AddTextOption("No Tracking Data To Display...", "", 1)
			return
		endif
		
		SetTitleText(TrackedPatch)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)									
		AddHeaderOption(TrackedCount.GetValue() as Int + " / " + TrackedTotal.GetValue() as Int + " Displays Enabled", 0)
		SetCursorPosition(1)
		AddHeaderOption("", 0)
		
		Int PageIdx = 1
		Int _Index = 0
		While _Index < TrackedDisplays.length
			SetCursorPosition(PageIdx + 1)
			
			if (TrackedNames[_Index] != "")
				if (TrackedDisplays[_Index].IsEnabled())
					AddTextOption(TrackedNames[_Index], "Displayed", 1)
					PageIdx += 1
				else
					AddTextOption(TrackedNames[_Index], "", 0)
					PageIdx += 1
				endif
			endif
			_Index +=1			
		endWhile
		
		if Page2
			AddTextOption("Continue on Page 2...", "", 1)
		endif
	endif
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Patch Tracking Page 2 --------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function AddTrackingPage2()
	if CurrentPage == "Display Tracker (2/2)"
	
		if !Page2
			AddTextOption("No Tracking Data To Display...", "", 1)
			return
		endif
		
		SetTitleText(TrackedPatch)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)									
		AddHeaderOption(TrackedCount.GetValue() as Int + " / " + TrackedTotal.GetValue() as Int + " Displays Enabled", 0)
		SetCursorPosition(1)
		AddHeaderOption("", 0)
		
		Int PageIdx = 1
		Int _Index = 0
		While _Index < TrackedDisplays2.length
			SetCursorPosition(PageIdx + 1)
			
			if (TrackedNames2[_Index] != "")
				if (TrackedDisplays2[_Index].IsEnabled())
					AddToggleOption(TrackedNames2[_Index], "Displayed", 1)
					PageIdx += 1
				else
					AddToggleOption(TrackedNames2[_Index], "", 0)
					PageIdx += 1
				endif
			endif
			_Index +=1			
		endWhile
	endif
endFunction	
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------Mods Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function AddCustomModsPage()

	if CurrentPage == "Custom Patches"
		SetVal = BuildTotalsArray(SetVal, RN_Custom_Complete_Array)
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)									
		AddHeaderOption(GetCurrentCountInt(SetVal, RN_CustomModCount) + " Custom Patch(es) Completed", 0)
		SetCursorPosition(1)
		AddHeaderOption("", 0)
		
		if RN_CustomModCount.GetValue() > 0
			Int PageIdx = 1
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
						RN_Custom_Position_Array[_Index] = AddTextOption(RN_Custom_Name[_Index], self.GetCurrentCount(RN_Custom_Count_Array[_Index], RN_Custom_Total_Array[_Index]), 0)
						PageIdx += 1
					endif
				endif
				_Index +=1			
			endWhile	
		endif
	endif
endFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------- Debug Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
string function GetStatusString()

	if RN_Setup_Done.GetValue() > RN_Setup_Registered.GetValue() || RN_Safehouse_Done.GetValue() > RN_Safehouse_Registered.GetValue()
		return "Setup Error"
	endIf

	if RN_Scan_Done.GetValue() > RN_Scan_Registered.GetValue()
		return "Scan Error"
	endIf
	
	if RN_Setup_Start.GetValue()
		return "Setting Up"
		
	elseif RN_Scan_Registered.GetValue()
		return "Scanning"
	
	elseif DBM_SortWait.getValue()
		return "Busy"
	endIf
	
	return "No Errors Detected"
endfunction

Function AddDebugPage()

	if CurrentPage == "Debug Options"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("Debug Options:")
		
		AddTextOptionST("Update_Patches", "Update Installed Patches", "", 0)
		AddTextOptionST("Scan_Debug", "Reset Museum Scanner", "", 0)
		AddtextOptionST("Startup_Debug", "Reset Startup Tasks", "", 0)
		AddtoggleOptionST("AdvancedDebugging", "Enable Debugging", advdebug)
		AddEmptyOption()
		AddHeaderOption("moreHUD Debug:")
		AddTextOptionST("RebuildLists", "moreHUD Icons Reset:", "Rebuild", 0)
		AddTextOption("moreHUD new count:", dbmNew.GetSize() As Int, 1)
		AddTextOption("moreHUD found count:", dbmFound.GetSize() As Int, 1)
		AddTextOption("moreHUD Displayed count:", dbmDisp.GetSize() As Int, 1)
		AddTextOption("moreHUD total Count:", dbmMaster.GetSize() As Int, 1)
		AddEmptyOption()
		AddHeaderOption("Mod Status:")
		AddTextOptionST("StatusCheck", "Status:", GetStatusString(), 0)
		AddTextOption("Setup Start:", RN_Setup_Start.GetValue() As Int, 1)
		AddTextOption("Setup Finish:", RN_Setup_Finish.GetValue() As Int, 1)
		AddTextOption("Setup Registered:", RN_Setup_Registered.GetValue() As Int, 1)
		AddTextOption("Setup Done:", RN_Setup_Done.GetValue() As Int, 1)

		SetCursorPosition(1)
		
		AddHeaderOption("Mod Requirements:")

		if SKSE.GetPluginVersion("fisses") > 0
			AddTextOption("FISSES:", "<font color='#2b6320'>Installed</font>" + " [" + SKSE.GetPluginVersion("fisses") + "]", 0)
		else
			AddTextOption("FISSES:", "<font color='#750e0e'>Not Found</font>", 0)
		endif

		if SKSE.GetVersion() > 0			
			AddTextOption("SKSE:", "<font color='#2b6320'>Installed</font>" + " [" + SKSE.GetVersion()+"."+SKSE.GetVersionMinor()+"."+SKSE.GetVersionBeta() + "]", 0)
		else
			AddTextOption("SKSE:", "<font color='#750e0e'>Not Found</font>", 0)	
		endif

		if (Game.GetModByName("SkyUI_SE.esp") != 255)
			AddTextOption("SkyUI:", "<font color='#2b6320'>Installed</font>" + " [5.2SE]", 0)
		else
			AddTextOption("SkyUI:", "<font color='#750e0e'>Not Found</font>", 0)
		endif	
		
		AddEmptyOption()
		AddEmptyOption()
		AddHeaderOption("moreHUD Icon Support:")
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") < 30800
			AddTextOption("moreHUD:", "<font color='#750e0e'>Invalid / Missing</font>", 0)
		else
			AddTextOption("moreHUD:", "<font color='#2b6320'>Installed</font>" + " [" + GetVersionString() + "]", 0)
		endif

		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") < 10017
			AddTextOption("moreHUD Inventory Edition:", "<font color='#750e0e'>Invalid / Missing</font>", 0)
		else
			AddTextOption("moreHUD Inventory Edition:", "<font color='#2b6320'>Installed</font>" + " [" + SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") + "]", 0)
		endif
		
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddHeaderOption("")
		AddTextOption("SortWait:", DBM_SortWait.GetValue() As Int, 1)
		AddTextOption("Safehouse Registered:", RN_Safehouse_Registered.GetValue() As Int, 1)
		AddTextOption("Safehouse Done:", RN_Safehouse_Done.GetValue() As Int, 1)
		AddTextOption("Scan Registered:", RN_Scan_Registered.GetValue() As Int, 1)
		AddTextOption("Scan Done:", RN_Scan_Done.GetValue() As Int, 1)		
	endif
endFunction

String Function GetVersionString()
    int iVersion = AhzMoreHud.GetVersion()
    int iMajor = iVersion / 1000000
    int iMinor = (iVersion / 10000) % 100
    int iBug = (iVersion / 100) % 100
    int iBeta = iVersion % 100
    string aVersion = iMajor + "." + iMinor + "." + iBug

    if (iBeta > 0)
        aVersion += " Beta " + iBeta
    endif
    return aVersion
EndFunction

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General States------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
state RefreshMCM

	Event OnSelectST()
	
			ShowMessage("Please exit the MCM and re-enter again to see changes", false, "Ok")
			bool bRefresh = True
			SetTitleText("=== PLEASE EXIT THE MCM ===")
			While bRefresh
				if !IsInMenuMode()
					Build_Arrays()
					BuildPatchArray(true, true)
					AddDynamicPagesList()		
					bRefresh = false
					Debug.Notification("The Curators Companion: MCM Rebuilt")
				endif
			endWhile
	endEvent

	function OnHighlightST()

		SetInfoText("Force refresh Mod list and reload the MCM - use if installed mods don't automatically show up.")
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

		SetInfoText("Save current settings to Config File (Requires FISS)")
	EndEvent
endState

state Config_Load

	Event OnSelectST()
		
		Begin_Config_Load()
	EndEvent

	Event OnHighlightST()

		SetInfoText("Load user settings from Config File (Requires FISS)")
	EndEvent
endState

String function GetConfigSaveString()
	
	if (Game.GetModByName("Fiss.esp") != 255)
		return "Save Preset"
	endif
	
	return "FISS Not Found"
endFunction	

String function GetConfigLoadString()

	if (Game.GetModByName("Fiss.esp") != 255)
		return "Load Preset"
	endif
	
	return "FISS Not Found"
endFunction	

;-- Save States / Function --------------------------------

Function Begin_Config_Save()
	FISSInterface fiss = FISSFactory.getFISS()

	if !fiss
		ShowMessage("FISS not installed, unable to save user settings to config file", false, "Ok")
			return
	endif
	
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
	endif
	fiss.saveBool("Show startup notifications", ShowStartup)
	fiss.saveBool("ScanNotificationsval", ScanNotificationsval)
	
	;;Relic Storage Page
	fiss.saveInt ("StorageTransfer", IndexTransfer)
	fiss.saveBool("Storage Restriction", Restricted)
	fiss.saveBool("TokenCrafting", Token_Vis)
	
	;;Achievements Page
	fiss.saveBool("Achievement Notifications", Ach_Notify)
	fiss.saveBool("Achievement Visuals", Ach_Visual)
	fiss.saveInt("Achievement Sounds", IndexSounds)
	fiss.saveBool("Achievement Perks", Ach_Perks)
	fiss.saveInt("Achievement Attribute", IndexAttribute)	
	
	string saveResult = fiss.endSave()
		if (saveResult != "")
			ShowMessage("Fiss Save Error - Please check the log", false, "Ok")
		else
			ShowMessage("User settings saved successfully to Config file", false, "Ok")
		endif
EndFunction

;-- Load States / Function --------------------------------

Function Begin_Config_Load()
FISSInterface fiss = FISSFactory.getFISS()
	
	if !fiss && IsInMenuMode()
		ShowMessage("FISS not installed, unable to load user settings from config file", false, "Ok")
		return
	endif
	
	fiss.beginLoad("TheCuratorsCompanion_Config.xml")	
	
	;;General Settings
	ShowMuseumVal = fiss.loadBool("Museum Notifications")
	if ShowMuseumVal
		_AddItemMain_1.GoToState("Notify")
		_AddItemMain_2.GoToState("Notify")
		_AddItemSafehoue.GoToState("Notify")
	else
		_AddItemMain_1.GoToState("Silent")
		_AddItemMain_2.GoToState("Silent")
		_AddItemSafehoue.GoToState("Silent")
	endif
		
	ShowArmoryVal = fiss.loadBool("Armory Notifications")
	if ShowArmoryVal
		_AddItemArmory.GoToState("Notify")
	else
		_AddItemArmory.GoToState("Silent")
	endif
		
	ShowModsVal = fiss.loadBool("Supported Mods Notifications")
	if ShowModsVal
		_AddItemPatches.GoToState("Notify")
	else
		_AddItemPatches.GoToState("Silent")
	endif	
	
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
			
		endif	
			
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
			
		endif	
			
	endif	
	
	ShowStartup = fiss.loadBool("Show startup notifications")	

	ScanNotificationsval = fiss.loadBool("ScanNotificationsval")
	
	;;Relic Storage Page
	IndexTransfer = fiss.loadInt("StorageTransfer")
	Restricted = fiss.loadBool("Storage Restriction")
	Token_Vis = fiss.loadBool("TokenCrafting")

	;; Achievements Page
	
	Ach_Notify = fiss.loadBool("Achievement Notifications")
	Ach_Visual = fiss.loadBool("Achievement Visuals")
	IndexSounds = fiss.loadInt("Achievement Sounds")
	Ach_Perks = fiss.loadBool("Achievement Perks")
	IndexAttribute = fiss.loadInt("Achievement Attribute")
	
	string loadResult = fiss.endLoad()
		if (loadResult != "")
			if IsInMenuMode()
				ShowMessage("Fiss Load Error - No config file found", false, "Ok")
			endif
			Begin_Config_Default()
		else
			if IsInMenuMode()
				ShowMessage("User settings loaded successfully from Config file", false, "Ok")
				ForcePageReset()
			endif
		endif
EndFunction	


;-- Load States / Function --------------------------------

state Config_Default

	Event OnSelectST()
	
		 if ShowMessage("This will Restore all MCM options back to default including moreHUD icons... do you want to Restore now?", true, "Restore", "Cancel")
			Begin_Config_Default()
		endif
	EndEvent

	Event OnHighlightST()

		SetInfoText("Restore MCM Options To Default")
	EndEvent
endState

;-- Load States / Function --------------------------------

state Config_Author

	Event OnSelectST()
	
		 if ShowMessage("This will set all MCM options to the Developers preferred setup, limited notifications, full moreHUD support and a less invasive but still full featured preset... do you want to configure now?", true, "Configure", "Cancel")
			Begin_Config_Author()
		endif
	EndEvent

	Event OnHighlightST()

		SetInfoText("Configuration profile for the Developers personal and preferred setup")
	EndEvent
endState

;-- Load States / Function --------------------------------

Function Begin_Config_Default()

	ShowMuseumVal = False
	_AddItemMain_1.GoToState("Silent")
	_AddItemMain_2.GoToState("Silent")
	_AddItemSafehoue.GoToState("Silent")
	
	ShowArmoryVal = False
	_AddItemArmory.GoToState("Silent")
		
	ShowModsVal = False
	_AddItemPatches.GoToState("Silent")
	
	ShowSetCompleteVal = True
	ShowSimpleNotificationVal = True
	ShowListenerVal = True
	ShowStartup = True
	Restricted = True
	
	IndexmoreHUD = 0
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
		AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
		AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
		AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
	endif
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017	
		AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
		AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
		AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
	endif
	
	ScanNotificationsval = True
	
	Token_Vis = True
	IndexTransfer = 0
	
	Ach_Notify = True
	Ach_Visual = True
	IndexSounds = 0
	Ach_Highlight = False
	Ach_Perks = False
	IndexAttribute = 0
	
	if IsInMenuMode()
		ForcePageReset()
	endif
endFunction

;-- Load States / Function --------------------------------

Function Begin_Config_Author()

	ShowMuseumVal = False
	_AddItemMain_1.GoToState("Silent")
	_AddItemMain_2.GoToState("Silent")
	_AddItemSafehoue.GoToState("Silent")
	
	ShowArmoryVal = False
	_AddItemArmory.GoToState("Silent")
		
	ShowModsVal = False
	_AddItemPatches.GoToState("Silent")
	
	ShowSetCompleteVal = True
	ShowSimpleNotificationVal = True
	ShowListenerVal = True
	ShowStartup = True
	Token_Vis = True
	IndexTransfer = 0
	IndexmoreHUD = 0
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
		AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
		AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
		AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
	endif
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017	
		AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
		AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
		AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
	endif
	
	Restricted = False
	ScanNotificationsval = True
	
	Ach_Notify = True
	Ach_Visual = True
	IndexSounds = 1
	Ach_Highlight = True
	Ach_Perks = True
	IndexAttribute = 4
	
	if IsInMenuMode()
		ForcePageReset()
	endif
endFunction

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Museum Scan Options--------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state ScanMuseum

	Event OnSelectST()
		
		if ShowMessage("This will start the process of Scanning the Museum for completed sets... do you want to scan now?", true, "Scan", "Cancel")
			ShowMessage("Please exit the MCM and wait for the scan to complete", false, "Ok")
			SetTitleText("=== PLEASE EXIT THE MCM ===")
			RN_Utility.ScanMuseum()
		endif
	endEvent

	Event OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum & Armory for all displayed items and update the listings within this mod.")
	endEvent
endState

;;------------------------------

state ScanNotifications

	Event OnSelectST()
	
		ScanNotificationsval = !ScanNotificationsval
		SetTextOptionValueST(GetDefaultEnabled(ScanNotificationsval), false, "")
	EndEvent

	Event OnHighlightST()

		SetInfoText("Enables / Disables Museum Scanner Notifications\n Default: Enabled")
	EndEvent
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Debug Options -------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-------------------------------

state Scan_Debug

	Event OnSelectST()
	
		if ShowMessage("This will reset the current Museum scan and reset the scanner, do you want to reset now?", true, "Reset", "Cancel")
			RN_Scan_Done.SetValue(RN_Scan_Registered.GetValue())
			DBM_SortWait.setvalue(0)
		endif
		
	EndEvent

	Event OnHighlightST()

		SetInfoText("Resets the Museum Scanner")
	EndEvent
endState

;;-------------------------------

state Startup_Debug

	Event OnSelectST()
	
		if ShowMessage("This will reset the startup tasks, do you want to reset now?", true, "Reset", "Cancel")
			ShowMessage("Please wait a few minutes then save / load the game", false, "Ok")
			RN_Setup_Done.SetValue(RN_Setup_Registered.GetValue())
			ShowMessage("Please exit the MCM", false, "Ok")
		endif
		
	EndEvent

	Event OnHighlightST()

		SetInfoText("Resets the TCC Startup tasks")
	EndEvent
endState

;;-------------------------------

state AdvancedDebugging

	Event OnSelectST()		
		advdebug = !advdebug
		
		if advdebug
			if ShowMessage("This will enable debugging which can be used to diagnose issues with the Mod, would you like to enable debugging now?", true, "Enable", "Cancel")
				TCCDebug.EnableLogging()
			else
				advdebug = false
			endif
		else
			TCCDebug.DisableLogging()
		endIf
		
		
		SetToggleOptionValueST(advdebug)
	EndEvent

	Event OnHighlightST()

		SetInfoText("Enables TCC debug logging to Documents > My Games > Skyrim Special Edition > Logs > Script > User > TheCuratorsCompanion.log")
	EndEvent
endState

;;-------------------------------

State Update_Patches

	Event OnSelectST()
	
		if ShowMessage("This will send an update event to all installed patches, do you want to update now?", true, "Update", "Cancel")
			ShowMessage("Please exit the MCM and follow the on-screen instructions", false, "Ok")
			RN_Utility.UpdatePatches()
		endif			
	EndEvent

	Event OnHighlightST()

		SetInfoText("Use this to add support for new items / displays from installed patches that have been updated mid-game")
	EndEvent
endState

;;-------------------------------

state RebuildLists

	Event OnSelectST()
	
		if IsInMenuMode()
			if ShowMessage("This will rebuild and update the moreHUD lists for all new / found / displayed items, do you want to rebuild now?", true, "Rebuild", "Cancel")
				
				ShowMessage("Please exit the MCM and wait for a completion message", false, "Ok")
				RN_Utility.RebuildLists()
			endif
		endif
	EndEvent

	Event OnHighlightST()

		SetInfoText("This option will rebuild the moreHUD lists -- Only to be used if prompted or advised by Developer.")
	EndEvent
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Notifications Options -----------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state iRelicSimpleNotifications ;;Simple Notifications


	Event OnSelectST()
		ShowSimpleNotificationVal = !ShowSimpleNotificationVal 
		
		SetTextOptionValueST(GetDefaultType(ShowSimpleNotificationVal), false, "")
	EndEvent

	Event OnHighlightST()

		SetInfoText("Display a basic notification in the corner of the screen instead of the default pop-up message box.\n Default: Simple")
	EndEvent
endState

;;-------------------------------

state iRelicMuseumNotifications

	Event OnSelectST()
		ShowMuseumVal = !ShowMuseumVal 
		
		if ShowMuseumVal
			_AddItemMain_1.GoToState("Notify")
			_AddItemMain_2.GoToState("Notify")
			_AddItemSafehoue.GoToState("Notify")
		else
			_AddItemMain_1.GoToState("Silent")
			_AddItemMain_2.GoToState("Silent")
			_AddItemSafehoue.GoToState("Silent")
		endif
		
		SetTextOptionValueST(GetDefaultOnOff(ShowMuseumVal), false, "")
	EndEvent

	Event OnHighlightST()

		SetInfoText("Show Notifications when picking up a displayable item for the Museum.\n Default: Off")
	EndEvent
endState

;;-------------------------------

state iRelicArmoryNotifications

	Event OnSelectST()
		ShowArmoryVal = !ShowArmoryVal 

		if ShowArmoryVal
			_AddItemArmory.GoToState("Notify")
		else
			_AddItemArmory.GoToState("Silent")
		endif
		
		SetTextOptionValueST(GetDefaultOnOff(ShowArmoryVal), false, "")
	EndEvent

	Event OnHighlightST()

		SetInfoText("Show Notifications when picking up a displayable item for the Armory.\n Default: Off")
	EndEvent
endState

;;-------------------------------

state iRelicModsNotifications

	Event OnSelectST()
		ShowModsVal = !ShowModsVal 

		if ShowModsVal
			_AddItemPatches.GoToState("Notify")
		else
			_AddItemPatches.GoToState("Silent")
		endif
	
		SetTextOptionValueST(GetDefaultOnOff(ShowModsVal), false, "")
	EndEvent

	Event OnHighlightST()

		SetInfoText("Show Notifications when picking up a displayable item from any installed patch(es).\n Default: Off")
	EndEvent
endState

;;-------------------------------

state iRelicListenerNotifications
	
	function OnSelectST()
	
		ShowListenerVal = !ShowListenerVal 
		SetTextOptionValueST(GetDefaultOnOff(ShowListenerVal), false, "")
	EndFunction

	Event OnHighlightST()

		SetInfoText("Enable to show notifications for quest displays, skills displays, exploration displays and unlocked achievements in the Museum.\n Default: On")
	EndEvent
endState

;;-------------------------------

state iRelicSetCompleteNotifications

	Event OnSelectST()
		ShowSetCompleteVal = !ShowSetCompleteVal 
		
		SetTextOptionValueST(GetDefaultOnOff(ShowSetCompleteVal), false, "")
	EndEvent

	Event OnHighlightST()

		SetInfoText("This option will display notifications when the player collects all displayable items from a given Set, collection or Museum Section.\n Default: On")
	EndEvent
endState

;;-------------------------------

state iRelicShowStartup ;;Show Startup Notifications


	Event OnSelectST()
		ShowStartup = !ShowStartup 
		
		SetTextOptionValueST(GetDefaultStartup(ShowStartup), false, "")
	EndEvent

	Event OnHighlightST()

		SetInfoText("Hides the startup notifications when loading in.\n Default: Messages Shown")
	EndEvent
endState

;;-------------------------------

String function GetDefaultOnOff(bool val)

	if !val		
		return "Off"
	endif
	
	return "On"
endfunction

;;-------------------------------

String function GetDefaultType(bool val)

	if !val		
		return "Default"
	endif
	
	return "Simple"
endfunction

;;-------------------------------

String function GetDefaultStartup(bool val)

	if !val		
		return "Messages Hidden"
	endif
	
	return "Messages Shown"
endfunction

;;-------------------------------
			
String function GetDefaultEnabled(bool val)

	if !val		
		return "Disabled"
	endif
	
	return "Enabled"
endfunction

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------------- Storage Options -----------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

state iRelicRestrictionOptions

	Event OnSelectST()
		Restricted = !Restricted 
			
		SetTextOptionValueST(GetDefaultOnOff(Restricted), false, "")
	EndEvent

	Event OnHighlightST()

		SetInfoText("Toggles storage restriction on/off.\n Off - The storage container will have no restrictions and will allow any items to be stored.\n On - The storage container will only allow items that are displayable and not already on display.")
	EndEvent
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------------- Storage Transfer Options ---------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

;;-------------------------------
		
state TransferListOptions

	event OnMenuOpenST()
		SetMenuDialogStartIndex(IndexTransfer)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(TransferList)
	endEvent

	event OnMenuAcceptST(int index)
		IndexTransfer = Index
		SetMenuOptionValueST(TransferListOptions, TransferList[IndexTransfer])
		ForcePageReset()
	endEvent

	event OnDefaultST()
		IndexTransfer = 0
		SetMenuOptionValueST(TransferList[IndexTransfer])
		ForcePageReset()
	endEvent

	event OnHighlightST()
		SetInfoText("Choose which container(s) to check for displayable items when using the 'Transfer Relics' option at the Prep station.\n All Storage: Player Inventory, Relic Storage Container, All custom storage containers added via token.\n Relic Storage Container: Relic Storage Container Only.\n Custom Storage Only: Only containers added via token.")
	endEvent
endState

;;-------------------------------

state ShowCustomContainerInfo ;;Storage Transfer
	
	Event OnSelectST()
		
		ShowMessage("Custom Storage Info" + "\n" + "\n The 'Curators Storage Token' can be crafted from any of the forges located around Skyrim, drop the token into any container or follower(non merchant) to add them to the custom storage list, any displayable items will automatically have their icons updated to the correct display status." + "\n" + "\nDrop another token into the container or follower to remove them from the list, doing this will automatically transfer all displayable items to the player.", false, "Ok")
	EndEvent
endState

;;-------------------------------

state Token_Visibility ;;Token Visibility

	Event OnSelectST()
		Token_Vis = !Token_Vis
		SetTextOptionValueST(GetDefaultOnOff(Token_Vis), false, "")
	EndEvent

	Event OnHighlightST()

		SetInfoText("Toggle to show / hide the Curators Storage Token crafting recipe at the Forge / Smelter.")
	EndEvent
	
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Section Toggles------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
				
			endif
		endif
			
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
				
			endif
		endif
			
		ForcePageReset()
	endEvent

	event OnDefaultST()
		IndexmoreHUD = 0
		SetMenuOptionValueST(moreHUDChoiceList[IndexmoreHUD])
	endEvent

	event OnHighlightST()
		SetInfoText("Use this menu to customize which icons are displayed in the UI.\n Default: Show All Icons")
	endEvent
endState

;;-------------------------------

state Safehouse_Disp
	
	function OnSelectST()
	
		Safehouse_Enabled = !Safehouse_Enabled 
		
		if Safehouse_Enabled
			if ShowMessage("This will Enable moreHUD icons and functionality for all standard Safehouse displays, do you want to enable now?", true, "Enable", "Cancel")
				SetTextOptionValueST(GetDefaultEnabled(Safehouse_Enabled), false, "")
				ShowMessage("Please exit the MCM and wait for the setup complete notification", false, "Ok")
				SetTitleText("=== PLEASE EXIT THE MCM ===")
				While IsInMenuMode()
					Wait(0.5)
				endWhile
				RN_Utility.SetUpSafehouse()
				RN_SafeouseContent_Installed.SetValue(1)
			endif
		endif			
	EndFunction

	Event OnHighlightST()

		SetInfoText("Enable this to show moreHUD icons and add functionality to general Safehouse items including Safehouse Plus & CheeseMod for Everyone\n Default: Disabled \n (THIS FEATURE CAN NOT BE DISABLED ONCE TURNED ON)")
	EndEvent
endState

;;-------------------------------

state iAchievement_Enabled
	
	function OnSelectST()
	
		Achievements_Enabled = !Achievements_Enabled 
		
		if Achievements_Enabled
			if ShowMessage("This will enable the TCC Achievements system which can grant perks, gold, increases to attributes and Unique items for reaching certain milestones within Legacy of the Dragonborn, do you want to enable now?", true, "Enable", "Cancel")
				SetToggleOptionValueST(Achievements_Enabled)
				ShowMessage("Please exit the MCM and wait for the setup complete notification", false, "Ok")
				SetTitleText("=== PLEASE EXIT THE MCM ===")
				While IsInMenuMode()
					Wait(0.5)
				endWhile
				RN_Utility.SetUpAchievements()
			else
				Achievements_Enabled = False
			endif
		endif			
	EndFunction

	Event OnHighlightST()

		SetInfoText("Enable this to turn on the achievements system.\n Default: Disabled \n (THIS FEATURE CAN NOT BE DISABLED ONCE TURNED ON)")
	EndEvent
endState

;;-------------------------------

State Disable_AchievementPerks

	function OnSelectST()
	
		Ach_Perks = !Ach_Perks 
		SetToggleOptionValueST(Ach_Perks)
	EndFunction

	Event OnHighlightST()

		SetInfoText("Some achievements will grant perk points as part of the reward, use this option to enable/disable perk point rewards.\n Default: Disabled")
	EndEvent
endState

State Enable_Highlights

	function OnSelectST()
	
		Ach_Highlight = !Ach_Highlight 
		SetToggleOptionValueST(Ach_Highlight)
	EndFunction

	Event OnHighlightST()

		SetInfoText("Use to show/hide the specific requirements for obtaining an achievement when hovering over them in the MCM.\n Default: Disabled")
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
		SetInfoText("Use this menu to customize which attribute is increased when an achievement is awarded.\n" + "\n" + "Total Increases from achievement rewards - Health: (" + AchHealth.GetValue() as Int + ")   Stamina: (" + AchStamina.GetValue() as Int + ")   Magicka: (" + AchMagicka.GetValue() as Int + ")   Speechcraft: (" + AchSpeech.GetValue() as Int +")")  
	endEvent
endState

;;-------------------------------

state AchievementSet01

	function OnSelectST()
		Ach_Notify = !Ach_Notify
		SetToggleOptionValueST(Ach_Notify)
	EndFunction

	Event OnHighlightST()

		SetInfoText("Enable this to turn on the achievements notification system.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

state AchievementSet02

	function OnSelectST()
		Ach_Visual = !Ach_Visual 
		SetToggleOptionValueST(Ach_Visual)		
	EndFunction

	Event OnHighlightST()

		SetInfoText("Enable this to turn on the visual effect when an achievement is awarded.\n Default: Enabled")
	EndEvent
endState

;;--------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Return Strings -------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------

string function GetCurrentCountInt(Int akVariable, GlobalVariable akVariableB)
	
	return (akVariable + "/" + (akVariableB.GetValue()) as Int)
endFunction

;;-------------------------------

string function GetCurrentCount(GlobalVariable akVariable, GlobalVariable akVariableB)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	Int Total_Count = (akVariableB.GetValue()) as Int
	
		Status_Return = (Current_Count + "/" + Total_Count)
	return Status_Return
endFunction

;;-------------------------------

Int Function BuildTotalsArray(Int val, Globalvariable[] _array)
	
	val = 0
	Int _Index = _array.length
	while _Index
		_Index -= 1
		if _array[_Index] != None
			if _array[_Index].GetValue()
				val += 1
			endif
		endif
	endWhile
	
	Return val
endFunction

;;-------------------------------

string function GetCurrentMuseumCount(Int val)

	Int Total_Room = 11	
	if RN_CreationClubContent_Installed.GetValue()
		Total_Room += 1
	endif

	if RN_SafeouseContent_Installed.GetValue()
		Total_Room += 1
	endif

	return (val + "/" + Total_Room + " Sections")
endFunction

;;-------------------------------

string function GetCurrentAchievementCount(GlobalVariable akVariable, formlist akTotal)

		Status_Return = (akVariable.GetValue() as Int + "/" + akTotal.GetSIze() as Int)
	return Status_Return
endFunction

;;-------------------------------

string function GetDisplaySectionCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/6 Sections")
	return Status_Return
endFunction

;;-------------------------------

string function GetCurrentArmoryCount(Int akVariable)

	return (akVariable + "/20")
endFunction

;;-------------------------------

string function GetCurrentIWCount(Int akVariable)

	return (akVariable + "/16")
endFunction	

;;-------------------------------

string function GetCurrentHACount(Int akVariable)
	
	return (akVariable + "/19")
endFunction	

;;-------------------------------

State GetMuseumValue

	Event OnHighlightST()
		SetInfoText("This is an approximate total value for the Museum including Safehouse Displays and all 3 Treasury Rooms.\n The value will update after using the Prep Station, Display Drop off chest or manually displaying an item.")
	EndEvent
endState
		
;;-------------------------------

Int function GetTotalTreasuryValue(GlobalVariable akMuseumVal, GlobalVariable akvariable1, GlobalVariable akvariable2, GlobalVariable akvariable3)

	return ((akMuseumVal.GetValue() as Int) + (akvariable1.GetValue() as Int) + (akvariable2.GetValue() as Int) + (akvariable3.GetValue() as Int))
endFunction
	
;;-------------------------------

Function SetupPage(Quest _Quest, GlobalVariable _Count, GlobalVariable _Total, String _Name, Formlist _Items = none, Formlist _Displays = none)

	SetTitleText("=== Please Wait ===")
	TrackedNames = new string[128]
	TrackedNames2 = new string[128]
	TrackedDisplays = new objectreference[128]
	TrackedDisplays2 = new objectreference[128]
	TrackedQuest = _Quest
	TrackedCount = _Count
	TrackedTotal = _Total
	TrackedPatch = 	_Name
	Page1 = True
	Page2 = False
	
	if _Quest
		SetTrackerArray()
	else
		SetTrackerSection(_Items, _Displays)
	endif
	
	AddDynamicPagesList()
	ForcePageReset()	
endFunction

Event OnOptionSelect(Int _Val)
	
	Int Index
	if CurrentPage == "Official Patches"
		Index = RN_Patches_Position_Array.find(_Val)
		if Index != -1 
			if ShowMessage("Would you like to start tracking " + RN_Patches_Name[Index] + "?", true, "Track", "Cancel")
				SetupPage(RN_Patches_Quests_Array[Index], RN_Patches_Count_Array[Index], RN_Patches_Total_Array[Index], RN_Patches_Name[Index])
			endif
		endif
		
	elseif CurrentPage == "Custom Patches"
		Index = RN_Custom_Position_Array.find(_Val)
		if Index != -1 
			if ShowMessage("Would you like to start tracking " + RN_Custom_Name[Index] + "?", true, "Track", "Cancel")
				SetupPage(RN_Custom_Quests_Array[Index], RN_Custom_Count_Array[Index], RN_Custom_Total_Array[Index], RN_Custom_Name[Index])		
			endif
		endif
		
	elseif CurrentPage == "Armory Sections"
		Index = _Armory_Section_Position.find(_Val)
		if Index != -1 
			if ShowMessage("Would you like to start tracking the " + _Armory_Section_names[Index] + "?", true, "Track", "Cancel")
				SetupPage(None, RN_Armory_Global_Count[Index], RN_Armory_Global_Total[Index], _Armory_Section_names[Index], _Armory_Formlist_Items_Tracking.GetAt(Index) as formlist, _Armory_Formlist_Displays_Tracking.GetAt(Index) as formlist)
			endif
		else
			Index = RN_Section_Position_Array.find(_Val)
			if Index != -1 
				if ShowMessage("Would you like to start tracking the Heavy Armory " + RN_Section_Name[Index] + "?", true, "Track", "Cancel")
					SetupPage(None, RN_Section_Count_Array[Index], RN_Section_Total_Array[Index], "Heavy Armory -" + RN_Section_Name[Index], RN_Section_ItemsList.GetAt(Index) as formlist, RN_Section_DisplaysList.GetAt(Index) as formlist)
				endif
			else
				Index = RN_Section2_Position_Array.find(_Val)
				if Index != -1 
					if ShowMessage("Would you like to start tracking the Immersive Weapons " + RN_Section2_Name[Index] + "?", true, "Track", "Cancel")
						SetupPage(None, RN_Section2_Count_Array[Index], RN_Section2_Total_Array[Index], "Immersive Weapons - " + RN_Section2_Name[Index], RN_Section2_ItemsList.GetAt(Index) as formlist, RN_Section2_DisplaysList.GetAt(Index) as formlist)
					endif
				endif
			endif
		endif
	endif
EndEvent

;;-------------------------------

Event OnOptionHighlight(Int _Val)

	Int Index
	if CurrentPage == "Official Patches"
		Index = RN_Patches_Position_Array.find(_Val)
		if Index != -1 
			SetInfoText("Click to track " + RN_Patches_Name[Index] + " in the Display Tracker.")
		endif
	elseif CurrentPage == "Custom Patches"
		Index = RN_Custom_Position_Array.find(_Val)
		if Index != -1 
			SetInfoText("Click to track " + RN_Custom_Name[Index] + " in the Display Tracker.")
		endif
		
	elseif CurrentPage == "Armory Sections"
		Index = _Armory_Section_Position.find(_Val)
		if Index != -1 
			SetInfoText("Click to track the " + _Armory_Section_names[Index] + " in the Display Tracker.")
		else
			Index = RN_Section_Position_Array.find(_Val)
			if Index != -1 
				SetInfoText("Click to track the Heavy Armory - " + RN_Section_Name[Index] + " in the Display Tracker.")
			else
				Index = RN_Section2_Position_Array.find(_Val)
				if Index != -1 
					SetInfoText("Click to track the Immersive Weapons - " + RN_Section2_Name[Index] + " in the Display Tracker.")	
				endif
			endif	
		endif
	elseif CurrentPage == "Achievements"
		Index = RN_Ach_Position.find(_Val)
		if Index != -1 && Ach_Highlight
			SetInfoText(RN_Ach_Highlight[Index])
		else		
			Index = RN_ComAch_Position.find(_Val)
			if Index != -1 && Ach_Highlight
				SetInfoText(RN_ComAch_Highlight[Index])	
			endif
		endif
	endif
EndEvent
		
;;-------------------------------

Function SetTrackerSection(Formlist AfListA = None, Formlist afListB = None)

	Int ArrayPos = 0
	Int Index = 0
		
	Formlist flist = AfListA as Formlist
	Formlist Dlist = afListB as Formlist					
		
	Int Index2 = 0
	While Index2 < Dlist.GetSize()		

		if ArrayPos >= 125 && !Page2
			Page2 = True
			ArrayPos = 0
		endif
		
		Form fDisp = Dlist.GetAt(Index2)
		Form fItem = flist.GetAt(Index2)
		ObjectReference DispRef = None	
	
		if fDisp as FormList
			FormList NestedList = fDisp as FormList
			int Index3 = NestedList.GetSize()
			while Index3 && !DispRef
				Index3 -= 1
				ObjectReference TDisp = NestedList.GetAt(Index3) as ObjectReference
				if TDisp && TDisp.IsEnabled()
					DispRef = TDisp
					if fItem as FormList
						fItem = (fItem as Formlist).GetAt(Index3)
					endif
				endif
			endwhile
			if !DispRef
				DispRef = (NestedList.GetAt(0) as ObjectReference)
			endif
		elseif fDisp 
			DispRef = fDisp as ObjectReference
		endif

		String DispName
		if fItem
			if fItem as FormList
				DispName = (fItem as FormList).GetAt(0).GetName()
			else
				DispName = fItem.GetName()
			endif
		else
			DispName = "!Error"
		endif
			
		if Page2
			TrackedNames2[ArrayPos] = DispName
			TrackedDisplays2[ArrayPos] = DispRef
			ArrayPos += 1				
		else
			TrackedNames[ArrayPos] = DispName
			TrackedDisplays[ArrayPos] = DispRef
			ArrayPos += 1				
		endif
			
		Index2 += 1
	endwhile
endFunction

;;-------------------------------

Function SetTrackerArray()
	DBMSupportedModScript SupportPatch = (TrackedQuest as DBMSupportedModScript)

	Int ArrayPos = 0
	Int Index = 0
	While Index < SupportPatch.NewSectionDisplayRefLists.length
			
		Formlist flist = SupportPatch.NewSectionItemLists[Index] as Formlist
		Formlist Dlist = SupportPatch.NewSectionDisplayRefLists[Index] as Formlist					
			
		Int Index2 = 0
		While Index2 < Dlist.GetSize()		

			if ArrayPos >= 125 && !Page2
				Page2 = True
				ArrayPos = 0
			endif
				
			Form fDisp = Dlist.GetAt(Index2)
			Form fItem = flist.GetAt(Index2)
			ObjectReference DispRef = None	
		
			if fDisp as FormList
				FormList NestedList = fDisp as FormList
				int Index3 = NestedList.GetSize()
				while Index3 && !DispRef
					Index3 -= 1
					ObjectReference TDisp = NestedList.GetAt(Index3) as ObjectReference
					if TDisp && TDisp.IsEnabled()
						DispRef = TDisp
						if fItem as FormList
							fItem = (fItem as Formlist).GetAt(Index3)
						endif
					endif
				endwhile
				if !DispRef
					DispRef = (NestedList.GetAt(0) as ObjectReference)
				endif
			elseif fDisp 
				DispRef = fDisp as ObjectReference
			endif

			String DispName
			if fItem
				if fItem as FormList
					DispName = (fItem as FormList).GetAt(0).GetName()
				else
					DispName = fItem.GetName()
				endif
			else
				DispName = "!Error"
			endif
				
				if !Page2
					TrackedNames[ArrayPos] = DispName
					TrackedDisplays[ArrayPos] = DispRef
					ArrayPos += 1
				else
					TrackedNames2[ArrayPos] = DispName
					TrackedDisplays2[ArrayPos] = DispRef
					ArrayPos += 1					
				endif
				
				Index2 += 1
			endwhile
		Index += 1
	endWhile
endFunction

;;-------------------------------

Function Build_Arrays()	
	
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
	
	RN_Ach_Globals = new globalvariable[128]
	_Index = 0
	While _Index < RN_Achievement_Globals.GetSize()
		globalvariable akvariable = RN_Achievement_Globals.GetAt(_Index) as globalvariable
		RN_Ach_Globals[_Index] = akvariable
		_Index += 1
	endWhile	

	RN_ComAch_Globals = new globalvariable[128]
	_Index = 0
	While _Index < RN_ComAchievement_Globals.GetSize()
		globalvariable akvariable = RN_ComAchievement_Globals.GetAt(_Index) as globalvariable
		RN_ComAch_Globals[_Index] = akvariable
		_Index += 1
	endWhile
	
	TrackedDisplays = new objectreference[128]
	TrackedDisplays2 = new objectreference[128]

	TrackedNames = new string[128]
	TrackedNames2 = new string[128]
	
;;-------------------------------
	_Armory_Section_Position = new Int[128]
	_Armory_Section_names = new string[20]
	_Armory_Section_names[0] = "Ancient Nord Set"
	_Armory_Section_names[1] = "Blades Set"
	_Armory_Section_names[2] = "Daedric Set"
	_Armory_Section_names[3] = "Dawnguard Set"
	_Armory_Section_names[4] = "Dragon Set"
	_Armory_Section_names[5] = "Dwarven Set"
	_Armory_Section_names[6] = "Ebony Set"
	_Armory_Section_names[7] = "Elven Set"
	_Armory_Section_names[8] = "Falmer Set"
	_Armory_Section_names[9] = "Forsworn Set"
	_Armory_Section_names[10] = "Glass Set"
	_Armory_Section_names[11] = "Guard Armor Set"
	_Armory_Section_names[12] = "Iron Set"
	_Armory_Section_names[13] = "Misc Set"
	_Armory_Section_names[14] = "Nordic Set"
	_Armory_Section_names[15] = "Orcish Set"
	_Armory_Section_names[16] = "Snow Elf Set"
	_Armory_Section_names[17] = "Stalhrim Set"
	_Armory_Section_names[18] = "Steel Set"
	_Armory_Section_names[19] = "Thane Weapons Set"
	
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
	
	RN_Ach_Highlight = new string[128]
	RN_Ach_Highlight[0] = "Reach a total of 750 displays in the Museum"
	RN_Ach_Highlight[1] = "Reach a total of 1000 displays in the Museum"
	RN_Ach_Highlight[2] = "Reach a total of 100 book displays in the Museum"
	RN_Ach_Highlight[3] = "Reach a total of 250 book displays in the Museum"
	RN_Ach_Highlight[4] = "Find and display all the Explorer Relics in the Guildhouse"
	RN_Ach_Highlight[5] = "Find and display all the Gems in the Gallery of Natural Science"
	RN_Ach_Highlight[6] = "Find and display all the Shells for the Tide Pool in the Gallery of Natural Science"
	RN_Ach_Highlight[7] = "Find and display all 10 Decks of Cards in the Hall of Oddities"
	RN_Ach_Highlight[8] = "Find and display the complete Coin Collection in the Hall of Oddities"
	RN_Ach_Highlight[9] = "Complete all side quests from Auryen's Notes"
	RN_Ach_Highlight[10] = "Locate and interact with all Standing Stones around Skyrim"
	RN_Ach_Highlight[11] = "Locate and interact with all Word Walls around Skyrim"
	RN_Ach_Highlight[12] = "Find and display all Dragon Priest Masks and Dragon Claws in the Hall of Heroes"	
	RN_Ach_Highlight[13] = "Help the people of Skyrim and become the Thane of every Hold"
	RN_Ach_Highlight[14] = "Find and display all the pieces from the Arms of the Crusader set in the Hall of Heroes"
	RN_Ach_Highlight[15] = "Visit Solitude and complete the Legacy starting quest to open the Museum"
	RN_Ach_Highlight[16] = "Find and display all the Black Books in the Daedric Gallery"
	RN_Ach_Highlight[17] = "Fill the Armory and reach a Smithing level of 100, this achievement does not count items from supported mods"
	RN_Ach_Highlight[18] = "Build all creature displays in the Gallery of Natural Science"
	RN_Ach_Highlight[19] = "Locate and interact with the 9 Shrines of the Divines around Skyrim"
	RN_Ach_Highlight[20] = "Locate or craft all Dwemer artifacts in the Reception Hall"
	RN_Ach_Highlight[21] = "Locate or craft all Falmer artifacts in the Reception Hall"
	RN_Ach_Highlight[22] = "Locate or craft all Nordic artifacts in the Reception Hall"
	RN_Ach_Highlight[23] = "Agree to help Brother Ikard and don't skip the Haunted Museum quest"
	RN_Ach_Highlight[24] = "Display all Museum Paintings"
	RN_Ach_Highlight[25] = "Complete all Excavations and roll the credits"
	RN_Ach_Highlight[26] = "Build all the Explorer Outposts"
	RN_Ach_Highlight[27] = "Forgive Avram after Shadows of One's Past"
	RN_Ach_Highlight[28] = "Become a Master of each spell school"
	RN_Ach_Highlight[29] = "Find and display Ice's Stalhrim Spoon of Assassination"
	RN_Ach_Highlight[30] = "Renovate Deepholme"
	RN_Ach_Highlight[31] = "Display all Guild Displays in the Dragonborn Hall"
	RN_Ach_Highlight[32] = "Complete all Daedric Quests"
	RN_Ach_Highlight[33] = "Take all that gold and fill the Treasury!"
	RN_Ach_Highlight[34] = "Take all perks from the Excavation skill tree" 
	RN_Ach_Highlight[35] = "Take all perks from the Expedition skill tree"
	RN_Ach_Highlight[36] = "Take all perks from the Academia skill tree"
	
	RN_Ach_Position = new int[128]
	RN_Ach_AchName = new string[128]
	RN_Ach_AchName[0] = "Collector"
	RN_Ach_AchName[1] = "Hoarder"
	RN_Ach_AchName[2] = "Junior Librarian"
	RN_Ach_AchName[3] = "Bibliophile"
	RN_Ach_AchName[4] = "Spelunker"
	RN_Ach_AchName[5] = "Lapidarist"
	RN_Ach_AchName[6] = "Conchologist"
	RN_Ach_AchName[7] = "Fusilatelist"
	RN_Ach_AchName[8] = "Numismatist"
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
	RN_Ach_AchName[34] = "Deft Digger"
	RN_Ach_AchName[35] = "Expedient"
	RN_Ach_AchName[36] = "Professor"
	
	RN_ComAch_Position = new int[128]
	RN_ComAch_AchName = new string[128]
	RN_ComAch_AchName[0] = "Edward Daggerhands"
	RN_ComAch_AchName[1] = "Head Honcho"
	RN_ComAch_AchName[2] = "Don't ask where I got them"
	RN_ComAch_AchName[3] = "Food of the Gods"
	RN_ComAch_AchName[4] = "One Small Step"
	RN_ComAch_AchName[5] = "Jade Emperor"
	RN_ComAch_AchName[6] = "Bibbidi-Bobbidi-Boo"
	RN_ComAch_AchName[7] = "Sommelier"
	RN_ComAch_AchName[8] = "Ic0nic Collector"
	RN_ComAch_AchName[9] = "Franchise"
	RN_ComAch_AchName[10] = "X Marker"
	RN_ComAch_AchName[11] = "Culture Cultivator"

	RN_ComAch_Highlight = new string[128]
	RN_ComAch_Highlight[0] = "Fill up the dagger display in the Hall of Heroes\n Achievement idea by: NGIS"
	RN_ComAch_Highlight[1] = "Fill up the helmet display in the Hall of Heroes\n Achievement idea by: NGIS"
	RN_ComAch_Highlight[2] = "Find and display all skulls in the Hall of Secrets\n Achievement idea by: WillowWisp"
	RN_ComAch_Highlight[3] = "Take home a snack from Sovngarde\n Achievement idea by: WillowWisp"
	RN_ComAch_Highlight[4] = "Locate and display all the planetarium cubes\n Achievement idea by: WillowWisp"
	RN_ComAch_Highlight[5] = "Collect and display all the Jade statues\n Achievement idea by: Megalorex"
	RN_ComAch_Highlight[6] = "Fill the magic staff display in the Hall of Heroes\n Achievement idea by: Captain Blob-eye"
	RN_ComAch_Highlight[7] = "Display all beverages in the Museum Storeroom\n Achievement idea by: NGIS"
	RN_ComAch_Highlight[8] = "Collect and display all the unique items from The Curators Companion\n Achievement idea by: Captain Blob-eye"
	RN_ComAch_Highlight[9] = "Display the Elder Scrolls\n Achievement idea by: NGIS"
	RN_ComAch_Highlight[10] = "Find and display all treasure maps in the library\n Achievement idea by: WillowWisp"
	RN_ComAch_Highlight[11] = "Discover all the culture displays for the Hall of Heroes\n Achievement idea by: Kriana"
endFunction
		
;;-------------------------------
	
Function AddModSupport(GlobalVariable _GVComplete, GlobalVariable _GVCount, GlobalVariable _GVTotal, String _ModName, GlobalVariable akTotal, Quest _Quest)
	
	Int Index = GetArrayPos(_ModName)
	if Index == 999
		Index = RN_Patches_Complete_Array.Find(none)
		RN_Patches_Name[Index] = _ModName
		RN_Patches_Complete_Array[Index] = _GVComplete
		RN_Patches_Count_Array[Index] = _GVCount
		RN_Patches_Total_Array[Index] = _GVTotal
		RN_Patches_Quests_Array[Index] = _Quest
		akTotal.Mod(1)
	else
		RN_Patches_Name[Index] = _ModName
		RN_Patches_Complete_Array[Index] = _GVComplete
		RN_Patches_Count_Array[Index] = _GVCount
		RN_Patches_Total_Array[Index] = _GVTotal
		RN_Patches_Quests_Array[Index] = _Quest
		akTotal.Mod(1)
	endif
	
	if advdebug
		TCCDebug.Log("MCM Registered Official Patch [" + _ModName + "] at position " + Index, 0)
	endif
endFunction

;;-------------------------------
	
Function AddCustomModSupport(GlobalVariable _GVComplete, GlobalVariable _GVCount, GlobalVariable _GVTotal, String _ModName, GlobalVariable akTotal, Quest _Quest)
	
	Int Index = RN_Custom_Name.Find(_ModName)
	if Index == -1
		Index = RN_Custom_Name.Find("")
		RN_Custom_Name[Index] = _ModName
		RN_Custom_Complete_Array[Index] = _GVComplete
		RN_Custom_Count_Array[Index] = _GVCount
		RN_Custom_Total_Array[Index] = _GVTotal
		RN_Custom_Quests_Array[Index] = _Quest
		akTotal.Mod(1)
	else
		RN_Custom_Name[Index] = _ModName
		RN_Custom_Complete_Array[Index] = _GVComplete
		RN_Custom_Count_Array[Index] = _GVCount
		RN_Custom_Total_Array[Index] = _GVTotal	
		RN_Custom_Quests_Array[Index] = _Quest
		akTotal.Mod(1)
	endif
	
	if advdebug
		TCCDebug.Log("MCM Registered Custom Patch [" + _ModName + "] at position " + Index, 0)
	endif
endFunction

;;-------------------------------
	
Function AddSectionSupport(Formlist Count, Formlist Total, Formlist Complete, String _ModName, String[] _SectionName, Formlist ItemsList, Formlist DisplayList)
	
	Int Index
	
	if _ModName == "Heavy Armory"
		
		Index = _SectionName.length
		Index_Section = Index
		While  Index
			Index -= 1
			RN_Section_Name[Index] = _SectionName[Index]
			RN_Section_Complete_Array[Index] = Complete.GetAt(Index) as GlobalVariable
			RN_Section_Count_Array[Index] = Count.GetAt(Index) as GlobalVariable
			RN_Section_Total_Array[Index] = Total.GetAt(Index) as GlobalVariable
			if advdebug
				TCCDebug.Log("MCM Registered Heavy Armory Section [" + _SectionName[Index] + "] at position " + Index, 0)
			endif
		endWhile

		RN_Section_ItemsList = ItemsList
		RN_Section_DisplaysList = DisplayList
			
	elseif _ModName == "Immersive Weapons"

		Index = _SectionName.length
		Index_Section2 = Index
		While  Index
			Index -= 1
			RN_Section2_Name[Index] = _SectionName[Index]
			RN_Section2_Complete_Array[Index] = Complete.GetAt(Index) as GlobalVariable
			RN_Section2_Count_Array[Index] = Count.GetAt(Index) as GlobalVariable
			RN_Section2_Total_Array[Index] = Total.GetAt(Index) as GlobalVariable
			if advdebug
				TCCDebug.Log("MCM Registered Immersive Weapons Section [" + _SectionName[Index] + "] at position " + Index, 0)
			endif
		endWhile

		RN_Section2_ItemsList = ItemsList as Formlist
		RN_Section2_DisplaysList = DisplayList as FOrmlist
	endif
endFunction

;;-------------------------------

Function BuildPatchArray(bool _create, bool _Rebuild)
	
	if _create
		if advdebug
			TCCDebug.Log("MCM - Building Patch Array", 0)
		endif
		
		RN_Patches_Complete_Array = new globalvariable[128]
		RN_Patches_Count_Array = new globalvariable[128]
		RN_Patches_Total_Array = new globalvariable[128]
		RN_Patches_Quests_Array = new quest[128]
		RN_Patches_Position_Array = new int[128]
		RN_Patches_Name = new string[128]
		
		RN_Custom_Complete_Array = new globalvariable[128]
		RN_Custom_Count_Array = new globalvariable[128]
		RN_Custom_Total_Array = new globalvariable[128]
		RN_Custom_Quests_Array = new quest[128]
		RN_Custom_Position_Array = new int[128]
		RN_Custom_Name = new string[128]

		RN_Section_Complete_Array = new globalvariable[128]
		RN_Section_Count_Array = new globalvariable[128]
		RN_Section_Total_Array = new globalvariable[128]
		RN_Section_Position_Array = new int[128]
		RN_Section_Name = new string[128]
		
		RN_Section2_Complete_Array = new globalvariable[128]
		RN_Section2_Count_Array = new globalvariable[128]
		RN_Section2_Total_Array = new globalvariable[128]
		RN_Section2_Position_Array = new int[128]
		RN_Section2_Name = new string[128]	
	endif
	
	if _Rebuild
		
		if advdebug
			TCCDebug.Log("MCM - Sending Patch Array Event", 0)
		endif
		
		RN_SupportedModCount.SetValue(0)
		RN_CustomModCount.SetValue(0)
		SendModEvent("TCCUpdate_Arrays")
	endif
endFunction
			
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script End ------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

