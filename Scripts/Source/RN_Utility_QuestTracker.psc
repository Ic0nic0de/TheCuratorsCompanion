scriptName RN_Utility_QuestTracker extends SKI_ConfigBase

;-- Variables ---------------------------------------

String[] _M_Quest_ID_Ongoing
String[] _M_Quest_ID_Completed
String[] _M_Quest_ID_Incomplete

Int _M_Quest_ID_Index_Ongoing
Int _M_Quest_ID_Index_Completed
Int _M_Quest_ID_Index_Incomplete

String[] _M_Quest_Title_Ongoing
String[] _M_Quest_Title_Completed
String[] _M_Quest_Title_Incomplete

Int _M_Quest_Title_Index_Ongoing
Int _M_Quest_Title_Index_Completed
Int _M_Quest_Title_Index_Incomplete

String[] _R_Quest_ID_Incomplete
String[] _R_Quest_Title_Incomplete

Int _R_Quest_ID_Index_Incomplete

String[] _Array_Name_Museum
String[] _Array_Name_Notes
String[] _Array_Name_Guild
String[] _Array_Name_Misc
String[] _Array_Name_Sanamia
String[] _Array_Name_Falskaar
String[] _Array_Name_Helgen
String[] _Array_Name_Moonpath
String[] _Array_Name_Clockwork
String[] _Array_Name_MoonStar
String[] _Array_Name_ProjectAHO
String[] _Array_Name_Wyrmstooth
String[] _Array_Name_Undeath
String[] _Array_Name_Wheels
String[] _Array_Name_Nocturnal
String[] _Array_Name_Underground
String[] _Array_Name_VigilantActs
String[] _Array_Name_VigilantSide
String[] _Array_Name_VigilantMem

String[] _Array_Page_Static	
String[] _Array_Page_Dynamic

String[] _Array_Quest_ID
String[] _Array_Quest_Name
String[] _Array_Quest_Require
String[] _Array_Quest_Overview
String[] _Array_Quest_Giver
String[] _Array_Quest_Option_Name

Bool[] _Array_Toggle_Museum
Bool[] _Array_Toggle_Notes
Bool[] _Array_Toggle_Guild
Bool[] _Array_Toggle_Misc
Bool[] _Array_Toggle_Sanamia
Bool[] _Array_Toggle_Falskaar
Bool[] _Array_Toggle_Helgen
Bool[] _Array_Toggle_Moonpath
Bool[] _Array_Toggle_Clockwork
Bool[] _Array_Toggle_MoonStar
Bool[] _Array_Toggle_ProjectAHO
Bool[] _Array_Toggle_Undeath
Bool[] _Array_Toggle_Wyrmstooth
Bool[] _Array_Toggle_Wheels
Bool[] _Array_Toggle_Nocturnal
Bool[] _Array_Toggle_Underground
Bool[] _Array_Toggle_VigilantActs
Bool[] _Array_Toggle_VigilantSide
Bool[] _Array_Toggle_VigilantMem

Bool[] _Array_Quest_Radiant
Bool[] _Array_Quest_ToggleState

Bool _Built_Array_Museum
Bool _Built_Array_Notes
Bool _Built_Array_Guild
Bool _Built_Array_Misc
Bool _Built_Array_Sanamia
Bool _Built_Array_Falskaar
Bool _Built_Array_Helgen
Bool _Built_Array_Moonpath
Bool _Built_Array_ProjectAHO
Bool _Built_Array_Clockwork
Bool _Built_Array_MoonStar
Bool _Built_Array_Undeath
Bool _Built_Array_Wyrmstooth
Bool _Built_Array_Wheels
Bool _Built_Array_Nocturnal
Bool _Built_Array_Underground
Bool _Built_Array_VigilantActs
Bool _Built_Array_VigilantSide
Bool _Built_Array_VigilantMem

Int _Array_Int
Int _Array_Quest_Index
Int _Position_Right
Int _Position_Left

Int[] _Array_Stage_First             
Int[] _Array_Stage_Final
Int[] _Array_Quest_Option_ID 

;;-------------------------

RN_Utility_Mods Property RN_Mod Auto

String[] _MCM_Strings
String[] _Helgen_Menu_Option
String[] _Legacy_Menu_Option

String _Status_Return

Int _State_Menu_Helgen
Int _State_Menu_Legacy

Int Property _Helgen_Index = 0 Auto Hidden
Int Property _Legacy_Index = 0 Auto Hidden

Bool Property _bSpoilers Auto Hidden
Bool Property _HideIncomplete Auto Hidden

;-- Events --------------------------------------

Event OnConfigInit()
   
	RN_Mod.CheckSupportedMods()
	_Build_Pages()
	_Build_Pages_Dynamic()
endEvent

;-- Events --------------------------------------

Event _Build_Pages()
	
	_Array_Page_Dynamic = new String[19]
	_Array_Page_Dynamic[0] = "Museum Quests"
	_Array_Page_Dynamic[1] = "Explorers Guild"
	_Array_Page_Dynamic[2] = "Misc Quests"
	_Array_Page_Dynamic[3] = "Auryen's Notes"
	_Array_Page_Dynamic[4] = "Sanamia's Journals"
	_Array_Page_Dynamic[5] = "Falskaar"
	_Array_Page_Dynamic[6] = "Helgen Reborn"
	_Array_Page_Dynamic[7] = "Moonpath To Elsweyr"
	_Array_Page_Dynamic[8] = "Clockwork"
	_Array_Page_Dynamic[9] = "Moon And Star"
	_Array_Page_Dynamic[10] = "Project AHO"
	_Array_Page_Dynamic[11] = "Undeath"
	_Array_Page_Dynamic[12] = "Wyrmstooth"
	_Array_Page_Dynamic[13] = "The Wheels Of Lull"
	_Array_Page_Dynamic[14] = "The Gray Cowl Of Nocturnal"
	_Array_Page_Dynamic[15] = "Skyrim Underground"
	_Array_Page_Dynamic[16] = "Vigilant Main Quests"
	_Array_Page_Dynamic[17] = "Vigilant Side Quests"	
	_Array_Page_Dynamic[18] = "Vigilant Memory Quests"	
endEvent

;-- Events --------------------------------------

Event _Build_Pages_Dynamic()

	ModName = "LOTD: The Curators Tracker"
	_Array_Page_Static = new String[26]
	_Array_Page_Static[0] = "Settings"
	_Array_Page_Static[1] = " "  
	_Array_Page_Static[2] = "~~Legacy Quests~~ "
	_Array_Page_Static[3] = "Museum Quests"
	_Array_Page_Static[4] = "Explorers Guild"
	_Array_Page_Static[5] = "Auryen's Notes"
	_Array_Page_Static[6] = "Sanamia's Journals"
	_Array_Page_Static[7] = "Misc Quests"
	_Array_Page_Static[8] = " "
	_Array_Page_Static[9] = "~~Supported Mods~~"
	
	Int _Index = 0
	Int _Page = 10

	if RN_Mod.XX_MoonpathL
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Moonpath To Elsweyr"
		_Page += 1
	endIf
 
	if RN_Mod.XX_WyrmstoothL
		_Index = _Array_Page_Static.Find("")	
			_Array_Page_Static[_Index] = "Wyrmstooth"
		_Page += 1
	endif
   
	if RN_Mod.XX_FalskaarL
		_Index = _Array_Page_Static.Find("") 	
			_Array_Page_Static[_Index] = "Falskaar"
		_Page += 1
	endif
		
	if RN_Mod.XX_HelgenL
		_Index = _Array_Page_Static.Find("")  
			_Array_Page_Static[_Index] = "Helgen Reborn"
		_Page += 1
	endif

	if RN_Mod.XX_MoonStarL  
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Moon And Star"
		_Page += 1
	endif

	if RN_Mod.XX_ProjectAHOL  
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Project AHO"
		_Page += 1
	endif
	
	if RN_Mod.XX_GrayCowlL
		_Index = _Array_Page_Static.Find("")	
			_Array_Page_Static[_Index] = "The Gray Cowl Of Nocturnal"
		_Page += 1
	endif 

	if RN_Mod.XX_ClockworkL
		_Index = _Array_Page_Static.Find("")	
			_Array_Page_Static[_Index] = "Clockwork"
		_Page += 1
	endif
				
	if RN_Mod.XX_WheelsOfLullL
		_Index = _Array_Page_Static.Find("")  
			_Array_Page_Static[_Index] = "The Wheels Of Lull"
		_Page += 1
	endif

	if RN_Mod.XX_UndeathL
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Undeath"
		_Page += 1
	endif

	if RN_Mod.XX_UndergroundL || RN_Mod.XX_UndergroundESPL
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Skyrim Underground"
		_Page += 1
	endif
  
	if RN_Mod.XX_VigilantL
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = " "
		_Page += 1

		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "~~Vigilant Quests~~"
		_Page += 1
				
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Vigilant Main Quests"
		_Page += 1

		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Vigilant Side Quests"
		_Page += 1	

		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Vigilant Memory Quests"
		_Page += 1	
	endIf

	Pages = Utility.CreateStringArray(_Page)
	
	Int x = _Page
	
	While x >= 1
		x -= 1 
		Pages[x] = _Array_Page_Static[x]  
	EndWhile
	
endEvent

;-- Events --------------------------------------

Event OnPageReset(String page)
	
	if page == " " || page == ""
		LoadCustomContent("TCC/CuratorSplash.swf", 50, -32)
	else
		UnloadCustomContent()
	endIf
	
	_Build_Pages()
	_Build_Pages_Dynamic()
	_Build_Page_Settings()
	
	_Build_Menu_Helgen()
	_Build_Menu_Legacy()
	_Build_MCM_Strings()
	
	_Build_Arrays()
	_Build_Quests()
	_Build_Quests_Pages()
endEvent

;-- Menu Events ---------------------------------

Event _Build_Menu_Helgen()

	_Helgen_Menu_Option = new string[4]
	_Helgen_Menu_Option[0] = "Make Selection"
	_Helgen_Menu_Option[1] = "Helgen Faction"
	_Helgen_Menu_Option[2] = "Stormclock Faction"
	_Helgen_Menu_Option[3] = "Imperial Faction"
	
endEvent

;-- Menu Events ---------------------------------

Event _Build_Menu_Legacy()

	_Legacy_Menu_Option = new string[4]
	_Legacy_Menu_Option[0] = "Make Selection"
	_Legacy_Menu_Option[1] = "Any Other Start"
	_Legacy_Menu_Option[2] = "Solitude Docks Start"
	_Legacy_Menu_Option[3] = "GuildMaster Start"

endEvent

;-- Events --------------------------------------

Event _Build_MCM_Strings()

	_MCM_Strings = new string[3]
	_MCM_Strings[0] = "Not Found"
	_MCM_Strings[1] = "Disabled"
	_MCM_Strings[2] = "Enabled"
endEvent

;-- Events --------------------------------------

Event _Build_Page_Settings()

	if CurrentPage == "Settings"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("Mod Settings:")
		
		if RN_Mod.XX_LAL
			AddMenuOptionST("_State_Menu_Legacy", "Live Another Life Config:", _Legacy_Menu_Option[_Legacy_Index])
			
		else
		
			AddTextOption("Live Another Life Config:", _MCM_Strings[0], 1)			

		endIf
		
		AddEmptyOption()
		AddTextOption("Users with the 'Alternate Start: Live Another Life'", "", 0)
		AddTextOption("mod should use the menu above to display the mods", "", 0)
		AddTextOption("correct quests depending on the start they chose", "", 0)
		AddTextOption("during character creation.", "", 0)
		AddEmptyOption()
		AddHeaderOption("General Settings:")
		AddTextOptionST("_State_Spoilers", "Show Hidden Quests (Spoilers)", self.GetSpoilersString())
		AddTextOptionST("_State_HideIncomplete", "Hide Available Quests", self.GetHideIncompleteString())
		SetCursorPosition(1)
		AddHeaderOption("")	
	
		if RN_Mod.XX_HelgenL
			AddMenuOptionST("_State_Menu_Helgen", "Helgen Reborn Config:", _Helgen_Menu_Option[_Helgen_Index])			
			
		else
		
			AddTextOption("Helgen Reborn Config:", _MCM_Strings[0], 1)
		endIf	

		AddEmptyOption()
		AddTextOption("Helgen Reborn has 18 Trainee Evaluation quests in", "", 0)
		AddTextOption("the main quest line, you can use the menu above", "", 0)
		AddTextOption("to display the quests from the faction you picked", "", 0)
		AddTextOption("during the main quest line.", "", 0)	
			
	endIf
endEvent

;-- Show Spoilers Toggle State -----------------------------------------

State _State_Spoilers

	Event OnSelectST()
		_bSpoilers = !_bSpoilers
		SetToggleOptionValueST(Self.SetSpoilersString(), false, "")
		ForcePageReset()
	endEvent

	Event OnHighlightST()

		SetInfoText("Enable this to display quests that are designed to be found while exploring or considered to be Secrets.\n Default: OFF")
	endEvent
	
endState

String Function SetSpoilersString()

	if _bSpoilers
		_Status_Return = _MCM_Strings[2]
	
	else
		_Status_Return = _MCM_Strings[1]
		
	endif
	
	return _Status_Return
endFunction

String Function GetSpoilersString()

	if _bSpoilers
		_Status_Return = _MCM_Strings[2]
	
	else
		_Status_Return = _MCM_Strings[1]
		
	endif
	
	return _Status_Return
endFunction

;-- Hide Incomplete Toggle State -----------------------------------------

State _State_HideIncomplete

	Event OnSelectST()
		_HideIncomplete = !_HideIncomplete
		SetToggleOptionValueST(Self.SetHideIncompleteString(), false, "")
		ForcePageReset()
	endEvent

	Event OnHighlightST()

		SetInfoText("Enable this to hide the available quests and only show completed & in progress quests.\n Default: OFF")
	endEvent
	
endState

String Function SetHideIncompleteString()

	if _HideIncomplete
		_Status_Return = _MCM_Strings[2]
	
	else
		_Status_Return = _MCM_Strings[1]
		
	endif
	
	return _Status_Return
endFunction

String Function GetHideIncompleteString()

	if _HideIncomplete
		_Status_Return = _MCM_Strings[2]
	
	else
		_Status_Return = _MCM_Strings[1]
		
	endif
	
	return _Status_Return
endFunction

;-- Legacy Menu State -----------------------------------------

State _State_Menu_Legacy ; MENU

	Event OnMenuOpenST()
		SetMenuDialogStartIndex(_Legacy_Index)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(_Legacy_Menu_Option)
	endEvent
					
	Event OnMenuAcceptST(int index)
		_Legacy_Index = Index
		SetMenuOptionValueST(_State_Menu_Legacy, _Legacy_Menu_Option[_Legacy_Index])
		ForcePageReset()
	endEvent

	Event OnDefaultST()
		_Legacy_Index = 0
		SetMenuOptionValueST(_Legacy_Menu_Option[_Legacy_Index])
	endEvent

	Event OnHighlightST()
		SetInfoText("Use this menu to add the start quests from the new life you chose:\n Vanilla Start - Default\n Live Another Life Start - Solitude Docks\n GuildMaster Start - Relic Hunter")
	endEvent
	
endState

;-- Helgen Menu State -----------------------------------------

State _State_Menu_Helgen ; MENU

	Event OnMenuOpenST()
		SetMenuDialogStartIndex(_Helgen_Index)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(_Helgen_Menu_Option)
	endEvent

	Event OnMenuAcceptST(int index)
		_Helgen_Index = Index
		SetMenuOptionValueST(_State_Menu_Helgen, _Helgen_Menu_Option[_Helgen_Index])
		ForcePageReset()
	endEvent

	Event OnDefaultST()
		_Helgen_Index = 0
		SetMenuOptionValueST(_Helgen_Menu_Option[_Helgen_Index])
	endEvent

	Event OnHighlightST()
		SetInfoText("Use this menu to add the quests from the faction you chose during the Helgen Reborn main quest:\n Helgen Faction\n Stormclock Faction\n Imperial Faction")
	endEvent
	
endState

;-- Events --------------------------------------

Event _Build_Arrays()

	_Array_Quest_Option_ID = new Int[128]
	_Array_Quest_Option_Name = new String[128]
	_Array_Quest_ToggleState = new Bool[128]
	_Array_Quest_Index = 0
		
	if !_Built_Array_Museum
		_Array_Name_Museum = new String[128]
		_Array_Toggle_Museum = new Bool[128]
		_Built_Array_Museum = true
	endIf
	
	if !_Built_Array_Guild
		_Array_Name_Guild = new String[128]
		_Array_Toggle_Guild = new Bool[128]
		_Built_Array_Guild = true
	endIf
	
	if !_Built_Array_Misc
		_Array_Name_Misc = new String[128]
		_Array_Toggle_Misc = new Bool[128]
		_Built_Array_Misc = true
	endIf
	
	if !_Built_Array_Notes
		_Array_Name_Notes = new String[128]
		_Array_Toggle_Notes = new Bool[128]
		_Built_Array_Notes = true
	endIf
    
	if !_Built_Array_Sanamia
		_Array_Name_Sanamia = new String[128]
		_Array_Toggle_Sanamia = new Bool[128]
		_Built_Array_Sanamia = true
	endIf
	
	if !_Built_Array_Falskaar
		_Array_Name_Falskaar = new String[128]
		_Array_Toggle_Falskaar = new Bool[128]
		_Built_Array_Falskaar = true
	endIf
	
	if !_Built_Array_Helgen
		_Array_Name_Helgen = new String[128]
		_Array_Toggle_Helgen = new Bool[128]
		_Built_Array_Helgen = true
	endIf
	
	if !_Built_Array_Moonpath
		_Array_Name_Moonpath = new String[128]
		_Array_Toggle_Moonpath = new Bool[128]
		_Built_Array_Moonpath = true
	endIf
	
	if !_Built_Array_Clockwork
		_Array_Name_Clockwork = new String[128]
		_Array_Toggle_Clockwork = new Bool[128]
		_Built_Array_Clockwork = true
	endIf
	
	if !_Built_Array_MoonStar
		_Array_Name_MoonStar = new String[128]
		_Array_Toggle_MoonStar = new Bool[128]
		_Built_Array_MoonStar = true
	endIf

	if !_Built_Array_ProjectAHO
		_Array_Name_ProjectAHO = new String[128]
		_Array_Toggle_ProjectAHO = new Bool[128]
		_Built_Array_ProjectAHO = true
	endIf
	
	if !_Built_Array_Undeath
		_Array_Name_Undeath = new String[128]
		_Array_Toggle_Undeath = new Bool[128]
		_Built_Array_Undeath = true
	endIf
	
	if !_Built_Array_Wyrmstooth
		_Array_Name_Wyrmstooth = new String[128]
		_Array_Toggle_Wyrmstooth = new Bool[128]
		_Built_Array_Wyrmstooth = true
	endIf
	
	if !_Built_Array_Wheels
		_Array_Name_Wheels = new String[128]
		_Array_Toggle_Wheels = new Bool[128]
		_Built_Array_Wheels = true
	endIf
	
	if !_Built_Array_Nocturnal
		_Array_Name_Nocturnal = new String[128]
		_Array_Toggle_Nocturnal = new Bool[128]
		_Built_Array_Nocturnal = true
	endIf
	
	if !_Built_Array_Underground
		_Array_Name_Underground = new String[128]
		_Array_Toggle_Underground = new Bool[128]
		_Built_Array_Underground = true
	endIf
	
	if !_Built_Array_VigilantActs
		_Array_Name_VigilantActs = new String[128]
		_Array_Toggle_VigilantActs = new Bool[128]
		_Built_Array_VigilantActs = true
	endIf
	
	if !_Built_Array_VigilantSide
		_Array_Name_VigilantSide = new String[128]
		_Array_Toggle_VigilantSide = new Bool[128]
		_Built_Array_VigilantSide = true
	endIf
	
	if !_Built_Array_VigilantMem
		_Array_Name_VigilantMem = new String[128]
		_Array_Toggle_VigilantMem = new Bool[128]
		_Built_Array_VigilantMem = true
	endIf
	
	_Array_Quest_ID = new String[128]
	_Array_Quest_Name = new String[128]
	_Array_Quest_Radiant = new Bool[128]
	_Array_Quest_Overview = new String[128]
	_Array_Quest_Giver = new String[128]
	_Array_Quest_Require = new String[128]
	_Array_Stage_First = new Int[128]
	_Array_Stage_Final = new Int[128]
	_Array_Int = 0
	
	_M_Quest_ID_Incomplete = new String[128]
	_M_Quest_ID_Index_Incomplete = 0
	
	_M_Quest_Title_Incomplete = new String[128]	
	_M_Quest_Title_Index_Incomplete = 0
	
	_M_Quest_ID_Ongoing = new String[128]
	_M_Quest_ID_Index_Ongoing = 0
	
	_M_Quest_Title_Ongoing = new String[128]
	_M_Quest_Title_Index_Ongoing = 0
		
	_M_Quest_ID_Completed = new String[128]
	_M_Quest_ID_Index_Completed = 0
	
	_M_Quest_Title_Completed = new String[128]	
	_M_Quest_Title_Index_Completed = 0
	
	_R_Quest_ID_Incomplete = new String[128]
	_R_Quest_Title_Incomplete = new String[128]
	_R_Quest_ID_Index_Incomplete = 0
			
endEvent

;-- Events --------------------------------------

Event _Build_Quests_Pages()

	_Add_Quest_Status("Museum Quests", _Array_Name_Museum, _Array_Toggle_Museum)
	_Add_Page_Header("Museum Quests")
	
	_Add_Quest_Status("Explorers Guild", _Array_Name_Guild, _Array_Toggle_Guild)
	_Add_Page_Header("Explorers Guild")
	
	_Add_Quest_Status("Misc Quests", _Array_Name_Misc, _Array_Toggle_Misc)
	_Add_Page_Header("Misc Quests")
	
	_Add_Quest_Status("Auryen's Notes", _Array_Name_Notes, _Array_Toggle_Notes)
	_Add_Page_Header("Auryen's Notes")
	
	_Add_Quest_Status("Sanamia's Journals", _Array_Name_Sanamia, _Array_Toggle_Sanamia)
	_Add_Page_Header("Sanamia's Journals")
	
	_Add_Quest_Status("Falskaar", _Array_Name_Falskaar, _Array_Toggle_Falskaar)
	_Add_Page_Header("Falskaar")
	
	_Add_Quest_Status("Helgen Reborn", _Array_Name_Helgen, _Array_Toggle_Helgen)
	_Add_Page_Header("Helgen Reborn")
	
	_Add_Quest_Status("Moonpath To Elsweyr", _Array_Name_Moonpath, _Array_Toggle_Moonpath)
	_Add_Page_Header("Moonpath To Elsweyr")
	
	_Add_Quest_Status("Clockwork", _Array_Name_Clockwork, _Array_Toggle_Clockwork)
	_Add_Page_Header("Clockwork")
	
	_Add_Quest_Status("Moon And Star", _Array_Name_MoonStar, _Array_Toggle_MoonStar)
	_Add_Page_Header("Moon And Star")

	_Add_Quest_Status("Project AHO", _Array_Name_ProjectAHO, _Array_Toggle_ProjectAHO)
	_Add_Page_Header("Project AHO")
	
	_Add_Quest_Status("Undeath", _Array_Name_Undeath, _Array_Toggle_Undeath)
	_Add_Page_Header("Undeath")
	
	_Add_Quest_Status("Wyrmstooth", _Array_Name_Wyrmstooth, _Array_Toggle_Wyrmstooth)
	_Add_Page_Header("Wyrmstooth")
	
	_Add_Quest_Status("The Wheels Of Lull", _Array_Name_Wheels, _Array_Toggle_Wheels)
	_Add_Page_Header("The Wheels Of Lull")
	
	_Add_Quest_Status("The Gray Cowl Of Nocturnal", _Array_Name_Nocturnal, _Array_Toggle_Nocturnal)
	_Add_Page_Header("The Gray Cowl Of Nocturnal")
	
	_Add_Quest_Status("Skyrim Underground", _Array_Name_Underground, _Array_Toggle_Underground)
	_Add_Page_Header("Skyrim Underground")
	
	_Add_Quest_Status("Vigilant Main Quests", _Array_Name_VigilantActs, _Array_Toggle_VigilantActs)
	_Add_Page_Header("Vigilant Main Quests")
	
	_Add_Quest_Status("Vigilant Side Quests", _Array_Name_VigilantSide, _Array_Toggle_VigilantSide)
	_Add_Page_Header("Vigilant Side Quests")
	
	_Add_Quest_Status("Vigilant Memory Quests", _Array_Name_VigilantMem, _Array_Toggle_VigilantMem)
	_Add_Page_Header("Vigilant Memory Quests")	   

endEvent

;-- Events --------------------------------------

Event _Add_Page_Header(String _Dynamic_Page)

	if CurrentPage == _Dynamic_Page
	
		SetCursorFillMode(LEFT_TO_RIGHT)
		
		_Position_Left = 0
		_Position_Right = 1
		_Build_Section_Left("Available Quests (Main & Side)", 0, _M_Quest_Title_Incomplete, false)
		_Build_Section_Left("Available Quests (Radiant)", 1, _R_Quest_Title_Incomplete, false)	
		
		_Build_Section_Right("Quests (In Progress)", 0, _M_Quest_Title_Ongoing, false)			
		_Build_Section_Right("Quests (Completed)", 1, _M_Quest_Title_Completed, true)		
		
	endIf
endEvent

;-- Events --------------------------------------

Event _Build_Section_Left(String TitleOfSectionHeader, Int HeaderSectionLayoutOnPage, String[] CurrentQuestNames, Bool CurrentQuestState)

	Int _Index = 0
	Int _Array_Length = CurrentQuestNames.length
	_Position_Left += HeaderSectionLayoutOnPage * 2
	SetCursorPosition(_Position_Left)
	AddHeaderOption(TitleOfSectionHeader, 0)
	_Position_Left += 2
		if !_HideIncomplete
			while _Index < _Array_Length && CurrentQuestNames[_Index] != ""
				SetCursorPosition(_Position_Left)
				_Array_Quest_Option_ID[_Array_Quest_Index] = self.AddToggleOption(CurrentQuestNames[_Index], CurrentQuestState, 0)
				_Array_Quest_Option_Name[_Array_Quest_Index] = CurrentQuestNames[_Index]
				_Array_Quest_ToggleState[_Array_Quest_Index] = CurrentQuestState
				_Array_Quest_Index += 1
				_Position_Left += 2
				_Index += 1
			endWhile
		endIf
endEvent

;-- Events --------------------------------------

Event _Build_Section_Right(String TitleOfSectionHeader, Int HeaderSectionLayoutOnPage, String[] CurrentQuestNames, Bool CurrentQuestState)

	Int _Index = 0
	Int _Array_Length = CurrentQuestNames.length
	_Position_Right += HeaderSectionLayoutOnPage * 2
	SetCursorPosition(_Position_Right)
	AddHeaderOption(TitleOfSectionHeader, 0)
	_Position_Right += 2
	
		while _Index < _Array_Length && CurrentQuestNames[_Index] != ""
			SetCursorPosition(_Position_Right)
			_Array_Quest_Option_ID[_Array_Quest_Index] = self.AddToggleOption(CurrentQuestNames[_Index], CurrentQuestState, 0)
			_Array_Quest_Option_Name[_Array_Quest_Index] = CurrentQuestNames[_Index]
			_Array_Quest_ToggleState[_Array_Quest_Index] = CurrentQuestState
			_Array_Quest_Index += 1
			_Position_Right += 2
		_Index += 1
		endWhile	
endEvent

;-- Events --------------------------------------

Event MaintainCurrentToggleStateValue(String _QuestName, Bool _Quest_Toggle_State)

	if CurrentPage == "Museum Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Museum, _Array_Toggle_Museum)
		
	elseIf CurrentPage == "Explorers Guild"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Guild, _Array_Toggle_Guild)
		
	elseIf CurrentPage == "Misc Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Misc, _Array_Toggle_Misc)	
		
	elseIf CurrentPage == "Auryen's Notes"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Notes, _Array_Toggle_Notes)
		
	elseIf CurrentPage == "Sanamia's Journals"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Sanamia, _Array_Toggle_Sanamia)
		
	elseIf CurrentPage == "Falskaar"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Falskaar, _Array_Toggle_Falskaar)
		
	elseIf CurrentPage == "Helgen Reborn"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Helgen, _Array_Toggle_Helgen)
		
	elseIf CurrentPage == "Moonpath To Elsweyr"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Moonpath, _Array_Toggle_Moonpath)
		
	elseIf CurrentPage == "Clockwork"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Clockwork, _Array_Toggle_Clockwork)
		
	elseIf CurrentPage == "Moon And Star"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_MoonStar, _Array_Toggle_MoonStar)

	elseIf CurrentPage == "Project AHO"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_ProjectAHO, _Array_Toggle_ProjectAHO)
	
	elseIf CurrentPage == "Undeath"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Undeath, _Array_Toggle_Undeath)
		
	elseIf CurrentPage == "Wyrmstooth"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Wyrmstooth, _Array_Toggle_Wyrmstooth)
		
	elseIf CurrentPage == "The Wheels Of Lull"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Wheels, _Array_Toggle_Wheels)
		
	elseIf CurrentPage == "The Gray Cowl Of Nocturnal"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Nocturnal, _Array_Toggle_Nocturnal)
		
	elseIf CurrentPage == "Skyrim Underground"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_Underground, _Array_Toggle_Underground)
		
	elseIf CurrentPage == "Vigilant Main Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_VigilantActs, _Array_Toggle_VigilantActs)
		
	elseIf CurrentPage == "Vigilant Side Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_VigilantSide, _Array_Toggle_VigilantSide)
		
	elseIf CurrentPage == "Vigilant Memory Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _Array_Name_VigilantMem, _Array_Toggle_VigilantMem)	
		
	endIf
endEvent

;-- Events --------------------------------------

Bool Function PageIsDynamicQuestPage()

	Int _Index = _Array_Page_Dynamic.find(CurrentPage, 0)
	   return _Index >= 0
EndFunction

;-- Events --------------------------------------

Event _Add_Quest_Status(String _Dynamic_Page, String[] _New_QuestName, Bool[] _New_Toggle_State)

	if CurrentPage == _Dynamic_Page
		Int _Index = 0
		Int _Array_Length = _Array_Quest_ID.length	
		while _Index < _Array_Length && _Array_Quest_Name[_Index] != ""
			Bool userManuallyCompleted = PlayerMarkedQuestManuallyCompleted(_Array_Quest_Name[_Index], _New_QuestName, _New_Toggle_State)	
				if !_Array_Quest_Radiant[_Index]
					if !userManuallyCompleted
					quest curQuest = quest.getquest(_Array_Quest_ID[_Index])
					Int curQuestStage = curQuest.GetStage()
					Bool isCompleteBasedOnStage = curQuestStage > _Array_Stage_Final[_Index]						
						if !curQuest.IsCompleted() && !isCompleteBasedOnStage
							if curQuestStage == 0 || curQuestStage < _Array_Stage_First[_Index]
								_M_Quest_ID_Incomplete[_M_Quest_ID_Index_Incomplete] = _Array_Quest_ID[_Index] as String
								_M_Quest_Title_Incomplete[_M_Quest_Title_Index_Incomplete] = _Array_Quest_Name[_Index]
								_M_Quest_ID_Index_Incomplete += 1
								_M_Quest_Title_Index_Incomplete += 1
							else
								_M_Quest_ID_Ongoing[_M_Quest_ID_Index_Ongoing] = _Array_Quest_ID[_Index] as String
								_M_Quest_Title_Ongoing[_M_Quest_Title_Index_Ongoing] = _Array_Quest_Name[_Index]
								_M_Quest_ID_Index_Ongoing += 1
								_M_Quest_Title_Index_Ongoing += 1
							endIf
						else
								_M_Quest_ID_Completed[_M_Quest_ID_Index_Completed] = _Array_Quest_ID[_Index] as String
								_M_Quest_Title_Completed[_M_Quest_Title_Index_Completed] = _Array_Quest_Name[_Index]
								_M_Quest_ID_Index_Completed += 1
								_M_Quest_Title_Index_Completed += 1
						endIf
					else
								_M_Quest_ID_Completed[_M_Quest_ID_Index_Completed] = _Array_Quest_ID[_Index] as String
								_M_Quest_Title_Completed[_M_Quest_Title_Index_Completed] = _Array_Quest_Name[_Index]
								_M_Quest_ID_Index_Completed += 1
								_M_Quest_Title_Index_Completed += 1
					endIf
					
				elseIf !userManuallyCompleted
					_R_Quest_ID_Incomplete[_R_Quest_ID_Index_Incomplete] = _Array_Quest_ID[_Index] as String
					_R_Quest_Title_Incomplete[_R_Quest_ID_Index_Incomplete] = _Array_Quest_Name[_Index]
					_R_Quest_ID_Index_Incomplete += 1
				else
					_M_Quest_ID_Completed[_M_Quest_ID_Index_Completed] = _Array_Quest_ID[_Index] as String
					_M_Quest_Title_Completed[_M_Quest_Title_Index_Completed] = _Array_Quest_Name[_Index]
					_M_Quest_Title_Index_Completed += 1
				endIf
			_Index += 1
		endWhile	
	endIf
endEvent

;-- Events --------------------------------------

Bool Function PlayerMarkedQuestManuallyCompleted(String _QuestName, String[] _New_QuestName, Bool[] _New_Toggle_State)

	Bool _Manual_Toggle
	Int _Quest_Form = _New_QuestName.find(_QuestName, 0)
		if _Quest_Form >= 0
			_Manual_Toggle = _New_Toggle_State[_Quest_Form]
		else
			_Manual_Toggle = false
		endIf
			return _Manual_Toggle
EndFunction

;-- Events --------------------------------------

Event OnOptionHighlight(Int _Value)
		   
    if PageIsDynamicQuestPage()
		String _QuestName = _Get_Quest_Name(_Value)
		String _QuestOverview = _Get_Quest_Overview(_Value, _QuestName)
		String _QuestGiver = _Get_Quest_Giver(_Value, _QuestName)
		String _QuestRequirements = _Get_Quest_Requirements(_Value, _QuestName)
		SetInfoText("Quest Giver: " + _QuestGiver + "\nRequires: " + _QuestOverview + "\n" + _QuestRequirements)
	endIf
endEvent

;-- Events --------------------------------------

Event OnOptionSelect(Int _Value)

    String _QuestName = _Get_Quest_Name(_Value)
	Bool _Quest_State = _Get_Quest_State(_Value)
	SetToggleOptionValue(_Value, !_Quest_State, false)
	TogglefromID(_Value, !_Quest_State)
	MaintainCurrentToggleStateValue(_QuestName, !_Quest_State)
	ForcePageReset()	
endEvent

;-- Events --------------------------------------

Event TogglefromID(Int _Value, Bool _Quest_State)

	Int _Index = 0
	Int _Array_Length = _Array_Quest_Option_ID.length
		while _Index < _Array_Length
			if _Array_Quest_Option_ID[_Index] == _Value
				_Array_Quest_ToggleState[_Index] = _Quest_State
			endIf
		_Index += 1
		endWhile
endEvent

;-- Events --------------------------------------

String Function _Get_Quest_Giver(Int _Value, String _QuestName)

	String _QuestGiver = ""
	Int _Index = 0
	Int _Array_Length = _Array_Quest_Name.length
		while _Index < _Array_Length
			if _Array_Quest_Name[_Index] == _QuestName
				_QuestGiver = _Array_Quest_Giver[_Index]
			endif
			_Index += 1
		endWhile
			return _QuestGiver
EndFunction

;-- Events --------------------------------------

String Function _Get_Quest_Overview(Int _Value, String _QuestName)

	String _QuestOverview = ""
	Int _Index = 0
	Int _Array_Length = _Array_Quest_Name.length
		while _Index < _Array_Length
			if _Array_Quest_Name[_Index] == _QuestName
				_QuestOverview = _Array_Quest_Overview[_Index]
			endIf
			_Index += 1
		endWhile
			return _QuestOverview
EndFunction

;-- Events --------------------------------------

String Function _Get_Quest_Requirements(Int _Value, String _QuestName)

	String _QuestRequirements = ""
	Int _Index = 0
	Int _Array_Length = _Array_Quest_Name.length
		while _Index < _Array_Length
			if _Array_Quest_Name[_Index] == _QuestName
				_QuestRequirements = _Array_Quest_Require[_Index]
			endIf
			_Index += 1
		endWhile
			return _QuestRequirements
EndFunction

;-- Events --------------------------------------

String Function _Get_Quest_Name(Int _Value)

	Int _Index = 0
	Int _Array_Length = _Array_Quest_Option_ID.length
	String _QuestName = ""
		while _Index < _Array_Length
			if _Array_Quest_Option_ID[_Index] == _Value
				_QuestName = _Array_Quest_Option_Name[_Index]
			endIf
			_Index += 1
		endWhile
			return _QuestName
EndFunction

;-- Events --------------------------------------

Bool Function _Get_Quest_State(Int _Value)

	Int _Index = 0
	Int _Array_Length = _Array_Quest_Option_ID.length
	Bool _Quest_State = false
		while _Index < _Array_Length
			if _Array_Quest_Option_ID[_Index] == _Value
				_Quest_State = _Array_Quest_ToggleState[_Index]
			endIf
			_Index += 1
		endWhile
			return _Quest_State
EndFunction

;-- Events --------------------------------------

Event _Update_Quest_State(String _QuestName, Bool _Quest_Toggle_State, String[] _New_QuestName, Bool[] _New_Toggle_State)

	Int _Index_Quest = _New_QuestName.find(_QuestName, 0)
	
	if _Index_Quest >= 0
	
		_New_Toggle_State[_Index_Quest] = _Quest_Toggle_State
	  
	else
	
		Int _Index_Empty = _New_QuestName.find("", 0)
		_New_QuestName[_Index_Empty] = _QuestName
		_New_Toggle_State[_Index_Empty] = _Quest_Toggle_State
		
	endIf 
endEvent

;-- Events --------------------------------------

Event _Add_Quest_Data(String _EditorID, String _QuestName, Bool _RadiantQuests, String _Dynamic_Page, String _QuestGiver, String _QuestOverview, String _QuestRequirements, Int _StageFirst, Int _StageFinal)

	if CurrentPage == _Dynamic_Page
	
		_Array_Quest_ID[_Array_Int] = _EditorID
		_Array_Quest_Name[_Array_Int] = _QuestName
		_Array_Quest_Radiant[_Array_Int] = _RadiantQuests
		_Array_Quest_Giver[_Array_Int] = _QuestGiver
		_Array_Quest_Overview[_Array_Int] = _QuestOverview
		_Array_Quest_Require[_Array_Int] = _QuestRequirements
		_Array_Stage_First[_Array_Int] = _StageFirst
		_Array_Stage_Final[_Array_Int] = _StageFinal		
		_Array_Int += 1
		
	endIf
endEvent

;-- Events --------------------------------------

Event _Build_Quests()

	if CurrentPage == "Museum Quests" ;---------------COMPLETE (10)			
						
		If _Legacy_Index == 1
			_Add_Quest_Data("DBM_MuseumIntro", "I. An Interesting Prospect", false, "Museum Quests", "Start this quest by Reading a note in a tavern, visiting the museum or selling an artifact.", "No Requirements.", "NOTE: This is the 'Vanilla' starting quest.", 5, 110)
		
		ElseIf _Legacy_Index == 2
			_Add_Quest_Data("DBM_LALStart", "I. Dragonborn Gallery", false, "Museum Quests", "Automatic Start", "No Requirements, this quest starts on game load.", "NOTE: This is the 'Live Another Life' starting quest.",  5, 35)
		
		ElseIf _Legacy_Index == 3	
			_Add_Quest_Data("DBM_RHStartQST", "Ia. Akaviri Rising", false, "Museum Quests", "Automatic Start.", "No Requirements, this quest starts on game load.", "NOTE: This is the 'GuildMaster' starting quest.",  10, 40)
			_Add_Quest_Data("DBM_GuildMasterStart", "Ib. An Interesting Prospect", false, "Museum Quests", "Automatic Start", "Completion of 'Akaviri Rising'.", "NOTE: This quest will update in the MCM after speaking with Auryen.",  0, 40)
			_Add_Quest_Data("DBM_LALStart", "Ic. Dragonborn Gallery", false, "Museum Quests", "Automatic Start", "No Requirements, this quest starts after visiting the Museum.", "",  5, 35)
		endIf
		
		_Add_Quest_Data("DBM_HauntedMuseumQuest", "II. Night At The Museum", false, "Museum Quests", "Visit the museum and speak to 'Brother Ikard'.", "Completion of 'An Interesting Prospect' and have reached a display count of 300.",  "", 6, 111)
		_Add_Quest_Data("DBM_MuseumHeist", "III. Shadows Of One's Past", false, "Museum Quests", "Visit the museum and speak to Avram Shazir.", "Completion of 'An Interesting Prospect' and have reached a display count of 400.", "NOTE: If 'Night At The Museum' is currently ongoing it will need to be completed first before this quest can start.", 10, 60)
		_Add_Quest_Data("DBM_ShatteredLegacy", "IV. Shattered Legacy", false, "Museum Quests", "Byron", "Completion of 'Shadows of One's Past' and have reached a display count of 550.", "NOTE: The main quest 'The Way of the Voice' has to be completed.", 10, 300)
		_Add_Quest_Data("DBM_WaystoneQuest", "V. The Ayleid Crossroads", false, "Museum Quests", "Auryen", "Completion of 'Shattered Legacy'.", "NOTE: Auryen will speak to you when returning to the museum after completing 'Shattered Legacy'.", 5, 20)
		
		if RN_Mod.XX_MoonpathL	
			_Add_Quest_Data("DBM_MoonpathIndarys", "VI. It Belongs In A Museum", false, "Museum Quests", "Auryen", "Completion of 'An Interesting Prospect' and have reached a display count of 70.", "NOTE: Minimum level of 18 required.", 0, 10)		
		else
			_Add_Quest_Data("DBM_MuseumIndarysQuest", "VI. It Belongs In A Museum", false, "Museum Quests", "Auryen", "Completion of 'An Interesting Prospect' and reached a display count of 70.", "NOTE: Minimum level of 18 required.", 0, 100)		
		EndIf
		
		if _bSpoilers == 1
			_Add_Quest_Data("DBM_DHQuest", "The Vaults Of Deepholme (Side)", false, "Museum Quests", "Automatic Start - Travel to Deepholme.", "Completion of 'Shadows of One's Past' and 'Digging Up Explorers'.", "", 5, 50)
		endIf
					
		_Add_Quest_Data("", "Finders Keepers (Radiant)", true, "Museum Quests", "Auryen", "No Requirements", "NOTE: it takes 5 days for this quest to be available again.", -99999, 99999)
		_Add_Quest_Data("", "Research Project (Radiant)", true, "Museum Quests", "Automatic Start - Use the 'Research Station' in the library.", "Research Points currency.", "NOTE: Researching for a new item before completing the previous one will forfeit the Points spent to research it.", -99999, 99999)
		
		
	elseIf CurrentPage == "Explorers Guild" ;---------------COMPLETE (17)
	
		_Add_Quest_Data("DBM_ExplorerGuildHouse", "I. A Room With A View", false, "Explorers Guild", "Auryen", "Must have a display count of at least 150.", "", 5, 100)
		_Add_Quest_Data("DBM_ExplorerGuildmembers", "II. Digging Up Explorers", false, "Explorers Guild", "Read the note on the desk inside the Guild House.", "Completion of 'A Room with a View'.", "NOTE: Sometimes the explorers after being spoken to, will not be recruited and must be spoken to again.", 5, 100)
		_Add_Quest_Data("DBM_Excavation01", "III. The Excavation of Windcaller Pass", false, "Explorers Guild", "Marassi", "Completion of 'Shadows of One's Past' and have reached a display count of 400.", "NOTE: The dragon fight at the Tower west of Whiterun has to be completed for this quest to start.", 5, 150)
		_Add_Quest_Data("DBM_Excavation02", "IV. The Excavation of the Ruins of Rkund", false, "Explorers Guild", "Marassi", "Quest available 10 days after 'The Excavation of Windcaller Pass'.", "", 5, 140)
		_Add_Quest_Data("DBM_Excavation03Prelude", "V. The Visage", false, "Explorers Guild", "Ghost outside Greenwall Cave.", "Completion of 'Much Ado About Snow Elves' and 'The Excavation of the Ruins of Rkund'.", "NOTE: It is recommended to first complete all three of the Field stations as they become unavailable later on, the ghost can be found outside Greenwall Cave, near Fort Greenwall (north of Riften).", 1, 15)
		_Add_Quest_Data("DBM_Excavation03A", "VI. Trial Of Trinimac", false, "Explorers Guild", "Automatic Start", "Quest available three days after the end of The Visage.", "NOTE: In order to complete this quest, you will need access to the Glacial Crevice in the Forgotten Vale.", 5, 350)
			
		if _bSpoilers == 1
			_Add_Quest_Data("DBM_HrormirStaffQuest", "Eternal Ice (Side)", false, "Explorers Guild", "Automatic Start", "Must have started the 'Excavation of Windcaller Pass'.", "NOTE: During the excavation of Windcaller Pass, six shards can be found, this quest will start after picking up the first one.", 5, 40)
		endIf
				
		if _bSpoilers == 1		
			_Add_Quest_Data("DBM_PlanetariumQuest", "A Path To The Heavens (Side)", false, "Explorers Guild", "Automatic Start", "Find the Dwemer Schematics in Karagas' Tower.", "", 0, 50)
		endIf
		
		if _bSpoilers == 1
			_Add_Quest_Data("DBM_MalrusCodexQST", "The Book Of Wonders (Side)", false, "Explorers Guild", "Automatic Start - Read Malrus's Journal.", "No Requirements.", "", 5, 100)
		endIf
		
		_Add_Quest_Data("DBM_ExplorerRelicFindQST", "Tools Of The Trade (Side)", false, "Explorers Guild", "Automatic Start - Read Kamahl's Map.", "Completion of 'A Room with a View' and 'Digging Up Explorers'.", "Fun Fact: The relics and names of the explorers actually relate to members of the development team or key contributors to Legacy of the Dragonborn's development.", 5, 10)
		_Add_Quest_Data("DBM_ExplorerFieldStation01", "Branching Out (Side)", false, "Explorers Guild", "Marassi", "Completion of 'Under Saarthal' and 'Digging Up Explorers'.", "", 5, 16)
		_Add_Quest_Data("DBM_ExplorerFieldStation02", "Branching Out... Again (Side)", false, "Explorers Guild", "Marassi", "Completion of 'Escape from Cidhna Mine'.", "", 5, 17)
		_Add_Quest_Data("DBM_ExplorerFieldStation03", "Branching Out... Ever More (Side)", false, "Explorers Guild", "Marassi", "Completion of 'Forbidden Legend'.", "", 5, 16)
		_Add_Quest_Data("", "One Man's Junk (Radiant)", true, "Explorers Guild", "Latoria", "Completion of 'Digging Up Explorers'.", "NOTE: This quest will reward you with a random treasure map, book or spell scrolls.", -99999, 99999)
		_Add_Quest_Data("", "Kyre's Ore Prospect (Radiant)", true, "Explorers Guild", "Kyre", "Completion of 'Digging Up Explorers'.", "", -99999, 99999)
		_Add_Quest_Data("", "Relic Hunt (Radiant)", true, "Explorers Guild", "Automatic Start", "No Requirements", "NOTE: Either use 'Schneider's Sextant' or the 'Locate Relic' power.", -99999, 99999)
		
		
	elseIf CurrentPage == "Misc Quests" ;---------------COMPLETE (7)
	
		if _bSpoilers == 1	
			_Add_Quest_Data("DBM_HOSDiscoveryQST", "Auryen Morellus And The Chamber Of Secrets", false, "Misc Quests", "Automatic Start - Find the hidden chamber.", "No Requirements.", "NOTE: Take a stroll in 'Dragonborn Hall'.", 5, 15)
		endIf
			
		_Add_Quest_Data("DBM_MuchAdoAboutSnowElves", "Much Ado About Snow Elves", false, "Misc Quests", "Courier - Read the note from Calcelmo.", "Completion of 'The Lost Expedition'.", "NOTE: This quest has 3 paths to take, it is recommended to do them in order to avoid backtracking.", 5, 500)
		_Add_Quest_Data("DBM_HandofGloryQuest", "The Hand Of Glory", false, "Misc Quests", "Greigor of the Dark Brotherhood", "Access to the Dark Brotherhood Sanctuary.", "NOTE: If you decide to destroy the Dark Brotherhood, you must be careful to not kill everyone inside before finishing the quest.", 5, 30)
		_Add_Quest_Data("DBM_HOGCleanseQuest", "Breaking The Curse", false, "Misc Quests", "Automatic Start - Read Greigor's Journal.", "Completion of 'The Hand Of Glory'.", "", 5, 15)
		_Add_Quest_Data("DBM_OngarKegbreaker", "Ongar's Kegbreaker", false, "Misc Quests", "Ongar Brewer (Nightgate Inn)", "No Requirements.", "Note: This quest comes in two variations:\n One if you have less then 60 skill points in smithing, the other if you have more than 60 skill points in smithing.", 20, 35)
		
		if _bSpoilers == 1
			_Add_Quest_Data("DBM_ImbuningMachine", "Back To The Drawing Board", false, "Misc Quests", "Automatic Start - Travel to 'White Ridge Barrow'.", "Access to the Safehouse.", "NOTE: This quest will add the 'Imbuing Machine' to the Safehouse.", 10, 20)
		endIf
		
		_Add_Quest_Data("DBM_LordsMailQuest", "Lord's Mail", false, "Misc Quests", "Read the writ of execution in 'Penitus Oculatus Outpost'.", "No Requirements.", "NOTE: Lord's Mail is needed for another quest.", 10, 100)
			
		if _bSpoilers == 1
			_Add_Quest_Data("DBM_KOTNQuest", "Guardians Of The Divine", false, "Misc Quests", "Read the book 'Lost Wonders of the Ages Vol. 3'.", "No Requirements.", "NOTE: This quest can also be started by finding any of the artifacts although\n it is recommended to start this quest by reading the book.", 5, 50)		
		endIf
	
	elseIf CurrentPage == "Auryen's Notes" ;---------------COMPLETE (10)
	
		_Add_Quest_Data("DBM_AMJournalQST01", "Auryen's Notes: Dagger Of Symmachus", false, "Auryen's Notes", "Read Auryen's Note", "Access to Solstheim.", "NOTE: 10 days must have passed since you visited the Museum and\n talked to Auryen Morellus for the first time.", 10, 50)
		_Add_Quest_Data("DBM_AMJournalQST02", "Auryen's Notes: Cyrus' Saber", false, "Auryen's Notes", "Read Auryen's Note", "No Requirements.", "NOTE: If you already picked up Cyrus' Saber before reading the note, the quest finishes instantly with a different journal entry.", 10, 50)
		_Add_Quest_Data("DBM_AMJournalQST03", "Auryen's Notes: Orgnum's Coffer", false, "Auryen's Notes", "Read Auryen's Note", "No Requirements.", "NOTE: If you already picked up the King Orgnum's Coffer before reading the note, the quest finishes instantly with a different journal entry.", 10, 50)
		_Add_Quest_Data("DBM_AMJournalQST04", "Auryen's Notes: Ice Blade Of The Monarch", false, "Auryen's Notes", "Read Auryen's Note", "No Requirements.", "NOTE: If you already picked up the Ice Blade of the Monarch before reading the note, the quest finishes instantly with a different journal entry.", 10, 50)
		_Add_Quest_Data("DBM_AMJournalQST05", "Auryen's Notes: Shalidor's Stone", false, "Auryen's Notes", "Read Auryen's Note", "No Requirements.", "NOTE: If you already picked up Shalidor's Stone before reading the note, the quest finishes instantly with a different journal entry.", 10, 50)
		_Add_Quest_Data("DBM_AMJournalQST06", "Auryen's Notes: The Bloodworm Helm", false, "Auryen's Notes", "Read Auryen's Note", "No Requirements.", "NOTE: If you already picked up the Bloodworm Helm before reading the note, the quest finishes instantly with a different journal entry.", 10, 50)
		_Add_Quest_Data("DBM_AMJournalQST07", "Auryen's Notes: The Warlock's Ring", false, "Auryen's Notes", "Read Auryen's Note", "No Requirements.", "Note: If you already picked up the Warlock's Ring before reading the note, the quest finishes instantly with a different journal entry.", 10, 50)
		_Add_Quest_Data("DBM_AMJournalQST08", "Auryen's Notes: The Dragonmail Cuirass", false, "Auryen's Notes", "Read Auryen's Note", "Access to Solstheim.", "Note: If you already picked up the Dragonmail Cuirass before reading the note, the quest finishes instantly with a different journal entry.", 10, 50)
		_Add_Quest_Data("DBM_AMJournalQST09", "Auryen's Notes: The Fists Of Randagulf", false, "Auryen's Notes", "Read Auryen's Note", "No Requirements.", "Note: Either steal the gloves from the master locked display in the corridor to the left of the throne room\n or either bribe or persuade Falk Firebeard to let you have the gloves.", 10, 30)
		_Add_Quest_Data("DBM_AMJournalQST10", "Auryen's Notes: The Tools Of Kagrenac", false, "Auryen's Notes", "Read Auryen's Note", "Access to Solstheim.", "Note: If you already picked up Sunder, Wraithguard and Keening before reading the note, the quest finishes instantly with a different journal entry.", 10, 50)		
	
	
	elseIf CurrentPage == "Sanamia's Journals" ;---------------COMPLETE (6)
	
	    _Add_Quest_Data("DBM_JournalDungeon01QST", "Sanamia's Journals: Mzulft", false, "Sanamia's Journals", "Read the journal found in the Smugglers hold of the Dev Aveza.", "Access to the Dev Aveza", "", 5, 10)
		_Add_Quest_Data("DBM_JournalDungeon02QST", "Sanamia's Journals: Valthume", false, "Sanamia's Journals", "Read the journal found in Broken Tusk Mine.", "Access to Solstheim.", "", 5, 10)
		_Add_Quest_Data("DBM_JournalDungeon03QST", "Sanamia's Journals: Fort Frostmoth", false, "Sanamia's Journals", "Read the journal found in Dead Drop Falls.", "No Requirements.", "", 5, 10)
		_Add_Quest_Data("DBM_JournalDungeon04QST", "Sanamia's Journals: Lake Ilinalta", false, "Sanamia's Journals", "Read the journal found in Arcwind Point.", "No Requirements.", "", -5, 10)
		_Add_Quest_Data("DBM_JournalDungeon05QST", "Sanamia's Journals: Burial Ruin", false, "Sanamia's Journals", "Read the journal found in Thirsk Mead Hall.", "Access to Solstheim.", "", 5, 10)
	
		if _bSpoilers == 1
			_Add_Quest_Data("DBM_GhostChestQST", "Sanamia's Journals: The Phantom Cache", false, "Sanamia's Journals", "Read the journal found in a Riekling camp north of Solstheim.", "Access to Solstheim.", "", 10, 20)		
		endIf
	
	elseIf CurrentPage == "Falskaar" ;---------------COMPLETE (26)
	
		_Add_Quest_Data("FSMQ01", "I. An Ancient Gate", false, "Falskaar", "Jalamar (Riften)", "No Requirements", "NOTE: Very rarely, it is possible for Jalamar to be found dead or missing from Riften, this does not break the quest however, just head to 'Echo Deep Mine' and continue through there, as picking up the lexicon will start the quest.", 5, 15)
		_Add_Quest_Data("FSMQ02", "II. Welcome To Falskaar", false, "Falskaar", "Automatic Start during 'An Ancient Gate'", "No Requirements", "", 5, 15)
		_Add_Quest_Data("FSMQ03", "III. An Army Of Greed", false, "Falskaar", "Jarl Agnar (Amber Creek)", "No Requirements", "", 5, 45)
		_Add_Quest_Data("FSMQ04", "IV. Warning Valfred", false, "Falskaar", "Jarl Agnar (Amber Creek)", "No Requirements", "NOTE: Sometimes the game will crash after jumping into the pond, Reloading the game fixes this.", 5, 40)
		_Add_Quest_Data("FSMQ05", "V. Strength And Wisdom", false, "Falskaar", "Jarl Agnar (Amber Creek)", "No Requirements", "", 5, 25)
		_Add_Quest_Data("FSMQ06", "VI. Lost Knowledge", false, "Falskaar", "Brother Thorlogh", "No Requirements", "NOTE: If the dialogue at the end of the quest is skipped, the next quest will not start.", 5, 20)
		_Add_Quest_Data("FSMQ07", "VII. Fort Urokk", false, "Falskaar", "Jarl Agnar (Amber Creek)", "No Requirements", "", 5, 55)
		_Add_Quest_Data("FSMQ08", "VIII. Returning The Favor", false, "Falskaar", "Jarl Agnar (Amber Creek)", "No Requirements", "NOTE: Sometimes, after taking down the Emerald Soldier's and speaking to Ulgar to attack Staalgarde, the screen will fade to black and the game will crash.", 5, 35)
		_Add_Quest_Data("FSMQ09", "IX. The Heart Of The Gods", false, "Falskaar", "Automatic Start", "No Requirements", "NOTE: It is possible that, after waiting a few hours and then entering the temple, the required NPCs will still not enter the temple.", 5, 45)
		_Add_Quest_Data("FSSQ11", "A Craftsman's Finest (Side)", false, "Falskaar", "Rangarr (Amber Creek)", "No Requirements", "", 1, 21)
		_Add_Quest_Data("FSSQ08", "A Fortunate Find (Side)", false, "Falskaar", "Automatic Start", "No Requirements", "NOTE: There is more than one way to trigger this quest, talk to everyone you can.", 1, 40)
		_Add_Quest_Data("FSSQ06", "A Present From The Past (Side)", false, "Falskaar", "Henrik (Falskaar Docks)", "No Requirements", "", 5, 15)
		_Add_Quest_Data("FSSQ05", "A Special Kind Of Berry (Side)", false, "Falskaar", "Freya (Falskaar Docks)", "No Requirements", "", 5, 10)
		_Add_Quest_Data("FSSQ09", "Kind Blood (Side)", false, "Falskaar", "Kalevi (Amber Creek)", "No Requirements", "", 2, 5)
		_Add_Quest_Data("FSSQ10", "Old Friends (Side)", false, "Falskaar", "Oudin (Amber Creek)", "No Requirements", "", 2, 10)
		_Add_Quest_Data("FSSQ02", "Passage Home (Side)", false, "Falskaar", "Wulf (Falskaar Docks)", "No Requirements", "NOTE: For those players with little cash, completing the quest 'The Lady in the Lighthouse' will decrease the cost of the journey from 500 gold to 100 gold.", -999999, 10)
		_Add_Quest_Data("FSSQ01", "Rough Waters (Side)", false, "Falskaar", "Automatic Start - (Falskaar Docks)", "No Requirements", "", 5, 15)
		_Add_Quest_Data("FSSQ07", "Songs Of The Dead (Side)", false, "Falskaar", "Automatic Start", "No Requirements", "", 1, 11)
		_Add_Quest_Data("FSSQ13", "The Crusher's End (Side)", false, "Falskaar", "Helena (Audmund's Farm)", "No Requirements", "NOTE: Following the quest markers into 'Mammoth Keep' is ill-advised as any followers or summoned atronachs will cause immediate detection for every enemy within the fort. Either use the hidden entrance in one of the keep's towers or find the mine entrance near the dock platform to ensure a stealthier entrance.", 1, 25)
		_Add_Quest_Data("FSSQ12", "The Forgotten Depths (Side)", false, "Falskaar", "Jalma (Amber Creek)", "No Requirements", "NOTE: After the end of the passages, there's a door that leads to a small drop. Due to navmeshing issues, followers will not be able to drop down from this and will walk back through the tunnel to exit.", 2, 15)
		_Add_Quest_Data("FSSQ04", "The Lady In The Lighthouse (Side)", false, "Falskaar", "Wulf (Falskaar Docks)", "No Requirements", "", 5, 15)
		_Add_Quest_Data("FSSQ16", "(Daedric) Dread Aura", false, "Falskaar", "Klara (Amber Creek)", "No Requirements", "NOTE: Depending on character level, this quest may be very hard due to the amount of high level necromancers within the hot springs.", 5, 15)
		_Add_Quest_Data("FSSQ17", "(Daedric) Dreams In Oblivion", false, "Falskaar", "Brother Arnand (Bailun Priory)", "No Requirements", "NOTE: Arnand's Journal may be impossible to interact with upon entering the lair, Saving and loading this save resolves this.", 1, 40)
		_Add_Quest_Data("FSSQ15", "(Daedric) No Harm, No Fowl", false, "Falskaar", "Kunnari (Amber Creek)", "No Requirements", "", 5, 30)
		_Add_Quest_Data("FSSQ14", "(Daedric) Runaway Cattle", false, "Falskaar", "Audmund (Audmund's Farm)", "No Requirements", "", 5, 16)
		_Add_Quest_Data("FSSQ03", "(Daedric) The Deadliest Catch", false, "Falskaar", "Galen (Falskaar Docks)", "No Requirements", "Fun Fact: Dialogue options with Galen at the end of this quest can result in a bigger reward than 25 gold.", 5, 15)
	
	
	elseIf CurrentPage == "Helgen Reborn" ;---------------COMPLETE	(25)  
	
	    _Add_Quest_Data("BalokCourierTimer", "I. Helgen Reborn Start Up", false, "Helgen Reborn", "Automatic Start - This quest starts on game load.", "No Requirements.", "", 1, 10)
		_Add_Quest_Data("BalokHelgen01", "II. Desperate Times", false, "Helgen Reborn", "Automatic Start", "Completion of 'Helgen Reborn Start Up'.", "", 5, 100)
		_Add_Quest_Data("BalokThalmorPrison", "III. Molon Labe", false, "Helgen Reborn", "Marcus Jannus during 'Desperate Times'.", "'Desperate Times' to have been started.", "", 1, 130)
		_Add_Quest_Data("BalokConstructionQuest", "IV. A City on a Hill", false, "Helgen Reborn", "Marcus Jannus", "Completion of 'Desperate Times'.", "", 20, 500)
		_Add_Quest_Data("BalokBitterWounds", "V. Bitter Wounds", false, "Helgen Reborn", "Valerius during 'A City On A Hill'.", "'A City on a Hill' to have been started.", "", 10, 270)
		_Add_Quest_Data("BalokCiennaQuest", "Color me Cienna (Side)", false, "Helgen Reborn", "Cienna", "Helgen to be rebuilt.", "", 1, 210)
		
		if _bSpoilers == 1
		
			_Add_Quest_Data("BalokHamingQuest", "Going Home (Side)", false, "Helgen Reborn", "Froki", "Helgen to be rebuilt.", "", 1, 40)
		
		endIf
			
		If _Helgen_Index == 1		
			_Add_Quest_Data("BalokRadiant01", "The Changing of the Guard - Wanan-Dun", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 1, 60)
			_Add_Quest_Data("BalokRadiant02", "The Changing of the Guard - Joto", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 60)
			_Add_Quest_Data("BalokRadiant03", "The Changing of the Guard - Herd", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 60)
			_Add_Quest_Data("BalokRadiant04", "The Changing of the Guard - Orianthi", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 60)
			_Add_Quest_Data("BalokRadiant05", "The Changing of the Guard - Sorian", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 60)
			_Add_Quest_Data("BalokRadiant06", "The Changing of the Guard - Kindrick", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 50)
			
		elseIf _Helgen_Index == 2		
			_Add_Quest_Data("BalokRadiant01Stormcloak", "The Changing of the Guard - Toralf", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 1, 40)
			_Add_Quest_Data("BalokRadiant02Stormcloak", "The Changing of the Guard - Savard", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 40)
			_Add_Quest_Data("BalokRadiant03Stormcloak", "The Changing of the Guard - Herd", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 40)
			_Add_Quest_Data("BalokRadiant04Stormcloak", "The Changing of the Guard - Kar", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 40)
			_Add_Quest_Data("BalokRadiant05Stormcloak", "The Changing of the Guard - Viggun", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 40)
			_Add_Quest_Data("BalokRadiant06Stormcloak", "The Changing of the Guard - Alof", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 40)
			
		elseIf _Helgen_Index == 3		
			_Add_Quest_Data("BalokRadiant01Empire", "The Changing of the Guard - Surus", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 1, 40)
			_Add_Quest_Data("BalokRadiant02Empire", "The Changing of the Guard - Cidius", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 40)
			_Add_Quest_Data("BalokRadiant03Empire", "The Changing of the Guard - Herd", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 40)
			_Add_Quest_Data("BalokRadiant04Empire", "The Changing of the Guard - Josslin", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 40)
			_Add_Quest_Data("BalokRadiant05Empire", "The Changing of the Guard - Ciel", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 40)
			_Add_Quest_Data("BalokRadiant06Empire", "The Changing of the Guard - Miles", false, "Helgen Reborn", "Korst", "'Desperate Times' to have been started.", "", 10, 40)
			
		EndIf	
		
	elseIf CurrentPage == "Moonpath To Elsweyr" ;---------------COMPLETE (6)
	
		_Add_Quest_Data("AnvilMoonpathQuest", "I. By the Light Of the Moon", false, "Moonpath To Elsweyr", "Automatic Start", "Level 18+ and reached a display count of 70.", "NOTE: If using the Moonpath To Elsweyr Unofficial Patch, 'The Way of the Voice' must also be completed for this quest to trigger.", 0, 60)
		_Add_Quest_Data("AnvilQuestameir", "II. The Sweet Taste Of Elsweyr", false, "Moonpath To Elsweyr", "Yura", "completion of 'By the Light of the Moon'.", "", 0, 20)
		_Add_Quest_Data("AnvilDenQuest", "III. Incursion", false, "Moonpath To Elsweyr", "Mervar Denfriend", "'The Sweet Taste Of Elsweyr' to have been started.", "", 0, 150)
		_Add_Quest_Data("Anvil_buildquest", "IV. Rebuilding The Past", false, "Moonpath To Elsweyr", "Khulan", "Completion of 'Incursion'.", "", 0, 60)	
		_Add_Quest_Data("DBM_AirshipQuest", "V. A Gift from a Friend", false, "Moonpath To Elsweyr", "Automatic Start", "Completion of 'Rebuilding the Past' and have the Explorer's Society set up.", "NOTE: This quest starts automatically 5 days after the completion of 'Rebuilding The Past'.", 1, 100)
		_Add_Quest_Data("AnvilSloadquest", "The Dinner Guest (Side)", false, "Moonpath To Elsweyr", "Erid'or", "'The Sweet Taste Of Elsweyr' to have been started.", "", 5, 100)
		_Add_Quest_Data("Anvil_armorquest", "Desert Style (Side)", false, "Moonpath To Elsweyr", "Automatic Start - Reach the Supply Post.", "'Incursion' to have been started.", "", 0, 30)
		
	elseIf CurrentPage == "Clockwork" ;---------------COMPLETE (6)
	
		_Add_Quest_Data("CLWKicker01Quest", "I. Foot Of The Mountain",      false, "Clockwork", "Automatic Start", "Level 5+",  "NOTE: this quest will trigger when travelling in Skyrim's wilderness, it is not advised to bring followers, this is meant to be a lone journey, there is no way back to Skyrim until completing the Clockwork quest line.", 5, 40)
		_Add_Quest_Data("CLWStory01Quest", "II. Shadow Under The Mountain", false, "Clockwork", "Automatic Start", "Completion of 'Foot Of The Mountain'.",  "", 10, 200)
		_Add_Quest_Data("CLWStory02Quest", "III. Steam-Powered",            false, "Clockwork", "Automatic Start", "Completion of 'Shadow Under The Mountain'.", "", 10, 140)
		_Add_Quest_Data("CLWStory03Quest", "IV. Crystalline Heart",         false, "Clockwork", "Lamashtu", "'Steam-Powered' to have been started.", "", 10, 160)
		_Add_Quest_Data("CLWStory04Quest", "V. I Against I",                false, "Clockwork", "Automatic Start", "Completion of 'Crystalline Heart'.", "", 10, 200)
		_Add_Quest_Data("CLWSide01Quest", "A Bed of Dust (Side)",           false, "Clockwork", "Lahar", "No Requirements.", "", 10, 40)
		_Add_Quest_Data("CLWSide02Quest", "Staff Enchanting (Side)",        false, "Clockwork", "Lahar", "No Requirements.", "", 10, 100)
		
		
	elseIf CurrentPage == "Moon And Star" ;---------------COMPLETE (6)	
		
		_Add_Quest_Data("MASMainQuest", "Moon And Star",                false, "Moon And Star", "Courier or Mandyn Hlaalu", "No Requirements", "", 10, 92)
		_Add_Quest_Data("MASAlbertDialog", "One Dog Ain't Enough",      false, "Moon And Star", "Albert", "No Requirements", "", 10, 30)
		_Add_Quest_Data("MASBalRanDialog", "A Favor for Bal-Ran",       false, "Moon And Star", "Bal-Ran", "No Requirements", "", 10, 30)
		_Add_Quest_Data("MASBelvadyrFavor", "A Favor for Belvadyr",     false, "Moon And Star", "Belvadyr Rathvasi", "No Requirements", "", 10, 40)
		_Add_Quest_Data("MASSelyseDialog", "A Favor for Selyse",        false, "Moon And Star", "Selyse Andrathil", "No Requirements", "", 10, 30)
		_Add_Quest_Data("MASTorenDialog", "A Favor for Toren",          false, "Moon And Star", "Toren Darrosa", "No Requirements", "", 10, 36)

	elseIf CurrentPage == "Project AHO" ;---------------COMPLETE (16)	
		
		_Add_Quest_Data("DwarfSphereQ01", "Wrong Place, Wrong Time",    false, "Project AHO", "Automatic Start", "Level 15 required.", "", -9999, 25)
		_Add_Quest_Data("DwarfSphereQ03", "A Problematic Neighbour",    false, "Project AHO", "Shanath Selthri", "Completion of 'Wrong Place, Wrong Time'", "", -9999, 15)
		_Add_Quest_Data("DwarfSphereQ04", "No Corpse, No Case",         false, "Project AHO", "Shanath Selthri", "Completion of 'A Problematic Neighbour'", "", -9999, 30)
		_Add_Quest_Data("DwarfSphereQ05", "An Erudite Beverage",        false, "Project AHO", "Shanath Selthri", "Completion of 'No Corpse, No Case'", "", -9999, 20)
		_Add_Quest_Data("DwarfSphereQ06", "Legacy of the Extinct Race", false, "Project AHO", "Automatic Start", "Completion of 'An Erudite Beverage'", "", -9999, 330)
		_Add_Quest_Data("DwarfSphereQ07", "Freedom of Choice",          false, "Project AHO", "Marisa Verendas", "Completion of 'Legacy of the Extinct Race'", "", -9999, 1000)
			
		_Add_Quest_Data("DwarfSphereSQ01", "Crack'n'Chirp (Side)",              false, "Project AHO", "Started by picking up the lever part, located in Bkhalzarf.", "Requires 'Freedom of Choice' to have been started.", "", 10, 30)
		_Add_Quest_Data("DwarfSphereSQ02", "A Nostalgic Aroma (Side)",          false, "Project AHO", "Tamina Elenil", "No Requirements", "", 10, 100)
		_Add_Quest_Data("DwarfSphereSQ03", "The Lady's Ring (Side)",            false, "Project AHO", "Tadys Andavel", "No Requirements", "", 10, 200)
		_Add_Quest_Data("DwarfSphereSQ04", "A Burden of the Past (Side)",       false, "Project AHO", "Zarona Orys", "No Requirements", "", 10, 500)
		_Add_Quest_Data("DwarfSphereSQ05", "Orsimer of House Telvanni (Side)",  false, "Project AHO", "Shaglak", "No Requirements", "", 10, 50)
		_Add_Quest_Data("DwarfSphereSQ06", "A Legacy of Ancestors (Side)",      false, "Project AHO", "Erver Milo", "No Requirements", "", 10, 40)
		_Add_Quest_Data("DwarfSphereSQ07", "Signs of Attention (Side)",         false, "Project AHO", "Aryni Sendu", "No Requirements", "", 5, 50)
		_Add_Quest_Data("DwarfSphereSQ08", "Forgotten Art (Side)",              false, "Project AHO", "Merano Rendo", "No Requirements", "", 5, 30)
		_Add_Quest_Data("DwarfSphereSQ09", "Be Aware of Darkness (Side)",       false, "Project AHO", "Selveni Andavel", "No Requirements", "", 5, 25)
		_Add_Quest_Data("DwarfSphereSQ11", "Shadow of the Past (Side)",         false, "Project AHO", "Kuovin Nrezalf", "No Requirements", "", 5, 50)	
		
	elseIf CurrentPage == "Undeath" ;---------------COMPLETE (7)	
	
	    _Add_Quest_Data("NecroQuest01", "I. In Their Footsteps", false, "Undeath", "Automatic Start", "Level 30+", "", 10, 70)
		_Add_Quest_Data("NecroQuest02", "II. Exhuming Power", false, "Undeath", "Automatic Start during 'In Their Footsteps'.", "'In Their Footsteps' to have been started.", "", 0, 33)
		_Add_Quest_Data("NecroQuest03", "III. Arkay The Enemy", false, "Undeath", "Automatic Start during 'In Their Footsteps'.", "'In Their Footsteps' to have been started.", "", 0, 35)
		_Add_Quest_Data("NecroQuest04", "IV. Infernal Alchemy", false, "Undeath", "Automatic Start during 'In Their Footsteps'.", "'In Their Footsteps' to have been started.", "", 0, 61)
		_Add_Quest_Data("NecroQuest05", "V. Scourg Barrow", false, "Undeath", "Automatic Start", "Completion of 'Exhuming Power'., 'Arkay The Enemy' and 'Infernal Alchemy'.", "", 10, 50)
		_Add_Quest_Data("NecroBlackBookQuest01", "VI. Black Book: Whispers of the Veil", false, "Undeath", "Automatic Start", "Completion of 'Arkay The Enemy'.", "NOTE: This quest can only be obtained by killing the captive priest during the quest 'Arkay The Enemy'.", 10, 20)
		_Add_Quest_Data("NecroLichRitualQuest", "VII. The Path of Transcendance", false, "Undeath", "Automatic Start", "Completion of 'Black Book: Whispers of the Veil'.", "", 10, 100)
	
	
	elseIf CurrentPage == "Wyrmstooth" ;---------------COMPLETE (17)
	
	    _Add_Quest_Data("WTDragonHunt", "I. Dragon Hunt", false, "Wyrmstooth", "Theodyn Bienne", "Level 10+ and completion of 'The Way of the Voice'.", "", 10, 130)
		_Add_Quest_Data("WTBarrowOfTheWyrm", "II. Barrow Of The Wyrm", false, "Wyrmstooth", "Automatic Start", "Completion of 'Dragon Hunt'.", "", 10, 270)
		_Add_Quest_Data("WTBountyAnimal", "Bounty: Animal", false, "Wyrmstooth", "Read the note (Imperial Mining Settlement)", "No Requirements.", "", 10, 20)
		_Add_Quest_Data("WTBountyBandit", "Bounty: Bandit", false, "Wyrmstooth", "Read the note from Dunyick (Imperial Mining Settlement)", "No Requirements.", "", 10, 20)
		_Add_Quest_Data("WTBountyVampire", "Bounty: Vampire", false, "Wyrmstooth", "Read 'Amon's Note' (Stendarr's Outpost)", "No Requirements.", "", 10, 20)
		_Add_Quest_Data("WTBountyWarlock", "Bounty: Warlock", false, "Wyrmstooth", "Read the note (Stormcloak Camp)", "No Requirements.", "", 10, 20)
		_Add_Quest_Data("WTWolfFollower", "Howl Load Of Trouble (Side)", false, "Wyrmstooth", "Dunyick (Dunyick's Camp)", "No Requirements.", "", 10, 40)
		_Add_Quest_Data("WTPricelessCommodity", "A Priceless Commodity (Side)", false, "Wyrmstooth", "Bolmar (Gronndal Grove)", "No Requirements.", "", 10, 60)
		_Add_Quest_Data("WTPlayerHome", "Reclaiming The Past (Side)", false, "Wyrmstooth", "Enter any building in Fort Valus.", "No Requirements.", "", 10, 40)
		_Add_Quest_Data("WTShargamFavor", "Repaying A Debt (Side)", false, "Wyrmstooth", "Shargam (Imperial Mining Settlement)", "Completion of Wyrmstooth main quest line.", "", 10, 30)
		_Add_Quest_Data("WTAthirFavor", "Retrieving Embersunder (Side)", false, "Wyrmstooth", "Athir (Imperial Mining Settlement)", "Completion of Wyrmstooth main quest line.", "", 10, 30)
		_Add_Quest_Data("WTDaenlitFavor", "Robbed Blind (Side)", false, "Wyrmstooth", "Daenlit (Imperial Mining Settlement)", "Completion of Wyrmstooth main quest line.", "", 10, 30)
		_Add_Quest_Data("WTUberEncounter", "Someone With Backbone (Side)", false, "Wyrmstooth", "Read the book 'History of Wyrmstooth' or enter the Tomb of Vulom", "No Requirements.", "", 5, 50)
		_Add_Quest_Data("WTKillThalmor", "Unwanted Guests (Side)", false, "Wyrmstooth", "Alberthor", "Completion of 'Barrow Of The Wyrm'.", "", 10, 30)
		_Add_Quest_Data("WTWrapMeUp", "Wrap Me Up (Side)", false, "Wyrmstooth", "Alberthor", "Completion of 'Barrow Of The Wyrm'.", "", 10, 30)
		_Add_Quest_Data("WTBlindRobbersCache", "Blind Robber's Cache (Side)", false, "Wyrmstooth", "Read Fjeimir's Note next to his body at Chillbone Camp.", "No Requirements.", "", 10, 30)
		_Add_Quest_Data("WTElmeraFavor", "Stickler In The Mud (Side)", false, "Wyrmstooth", "Elmera", "No Requirements.", "", 10, 30)
		
		
	elseIf CurrentPage == "The Wheels Of Lull" ;---------------Requires Playthrough for 3 Side Quests.

        _Add_Quest_Data("_Lull_MQ01", "I. Deep Down", false, "The Wheels Of Lull", "Fast travel to any settlement", "Level 15+", "NOTE: Easiest way to trigger this quest is to fast travel to Riverwood.", 10, 999999)
        _Add_Quest_Data("_Lull_MQ02", "II. Sky Spy", false, "The Wheels Of Lull", "Numinar", "Level 15+ and completion of 'Deep Down'.", "NOTE: Required Items for quest - Diamond or 55 Speach Skill.", 5, 999999)
        _Add_Quest_Data("_Lull_MQ03", "III. The Mer In The High Castle", false, "The Wheels Of Lull", "Numinar", "Level 20+ and completion of 'Sky Spy'.", "NOTE: Required Items for quest - Shovel.", 5, 999999)
        _Add_Quest_Data("_Lull_MQ04", "IV. The Boiling Foundry", false, "The Wheels Of Lull", "Numinar", "Level 20+ and completion of 'The Mer In The High Castle'.", "NOTE: Required Items for quest - Visor.", 10, 999999)
        _Add_Quest_Data("_Lull_MQ05", "V. The Brass Forest", false, "The Wheels Of Lull", "Numinar", "Level 25+ and completion of 'The Boiling Foundry'.", "NOTE: Fast travel to trigger, required items for quest - Visor, Rod of OHM.", 10, 999999)
        _Add_Quest_Data("_Lull_MQ06", "VI. At The Bottom Of The World", false, "The Wheels Of Lull", "Numinar", "Level 30+ and completion of 'The Brass Forest'.", "NOTE: Fast travel to trigger, required items for quest - Visor, Rod of OHM, Goveri's Unwinder.", 10, 999999)
        _Add_Quest_Data("_Lull_MQ07", "VII. The Wheels Of Lull", false, "The Wheels Of Lull", "Numinar", "Level 30+ and completion of 'The Wheels Of Lull'.", "NOTE: Required Items - Protective Pack, made by Avarri.", 2, 999999)       
		_Add_Quest_Data("_Lull_SQ_Watchman_Restore", "Up And Atom (Side)", false, "The Wheels Of Lull", "Automatic Start", "Completion of 'Deep Down'.", "", 1, 999999)
		_Add_Quest_Data("_Lull_SQ_Water", "Water Under The Bridge (Side)", false, "The Wheels Of Lull", "Subori's Husband", "No Requirements.", "", 1, 999999)
		_Add_Quest_Data("_Lull_SQ_HammarUpdate", "Upkeep (Side)", false, "The Wheels Of Lull", "Medeliu Hammar", "No Requirements.", "", 10, 999999)
		_Add_Quest_Data("_Lull_SQ_CartRide", "Riddling Rails (Side)", false, "The Wheels Of Lull", "Board the tram at Lull-Mor", "Completion of 'The Brass Forest'.", "", 1, 999999)
		_Add_Quest_Data("_Lull_SQ_ArcheronMines", "Closing Ports (Side)", false, "The Wheels Of Lull", "The Eternity", "UNKNOWN", "NOTE: Requires Playthrough.", 2, 999999)
		_Add_Quest_Data("_Lull_SQ_Seamonster", "Under Pressure (Side)", false, "The Wheels Of Lull", "UNKNOWN", "UNKNOWN", "NOTE: Requires Playthrough.", 5, 999999)
		_Add_Quest_Data("_Lull_SQ_DyeTrader", "Dye Trader (Side)", false, "The Wheels Of Lull", "UNKNOWN", "UNKNOWN", "NOTE: Requires Playthrough.", 1, 999999)
        _Add_Quest_Data("_Lull_SQ_ArmsMerchant", "Black Arms Market (Side)", false, "The Wheels Of Lull", "UNKNOWN", "UNKNOWN", "NOTE: Requires Playthrough.", 0, 999999)
		_Add_Quest_Data("", "Crafting Quests (Radiant)", true, "The Wheels Of Lull", "Avarri", "No Requirements.", "", -999999, 999999)
       
	   
    elseIf CurrentPage == "The Gray Cowl Of Nocturnal" ;---------------Complete (10)
	
	    _Add_Quest_Data("manny_GF_MQ", "I. The Call Of Gray Cowl Of Nocturnal", false, "The Gray Cowl Of Nocturnal", "Automatic Start", "Start this quest by stealing or pickpocketing something.", "NOTE: This quest is heavily focused upon stealth, it will be a lot easier if you have high skill points in Sneak, Lockpicking, Pickpocket and Illusion. It is advised not to bring followers on the mod.", 10, 999)
		_Add_Quest_Data("manny_GF_ColdharbourQuest", "II. Reward Of Coldharbour", false, "The Gray Cowl Of Nocturnal", "Automatic Start", "'The Call Of Gray Cowl Of Nocturnal' to have been started.", "", 10, 255)
		_Add_Quest_Data("manny_GF_Farewell", "III. Time For The Farewells", false, "The Gray Cowl Of Nocturnal", "Seviana Umbranox.", "", "NOTE: It is advised to complete 'Memories of the Umbranox' first.", 10, 30)
		_Add_Quest_Data("manny_GF_Books", "Memories of the Umbranox (Side)", false, "The Gray Cowl Of Nocturnal", "Automatic Start - Read any of Caio's Journals.", "'The Call Of Gray Cowl Of Nocturnal' to have been started.", "", 10, 200)
		_Add_Quest_Data("manny_GF_Sadraaka", "The Curse of Sadraaka (Side)", false, "The Gray Cowl Of Nocturnal", "Automatic Start (Forgotten City)", "'The Call Of Gray Cowl Of Nocturnal' to have been started.", "", 5, 30)
		_Add_Quest_Data("manny_GF_BuryValenDreth", "(Misc) Remains of Valen Dreth", false, "The Gray Cowl Of Nocturnal", "Automatic Start", "'The Call Of Gray Cowl Of Nocturnal' to have been started.", "NOTE: you can find Valen Dreth's remains in the 'Imperial City Prison'.", 10, 30)
		_Add_Quest_Data("manny_GF_MiscQuestDesertWolfPelts", "(Misc) Desert Wolf Pelts", false, "The Gray Cowl Of Nocturnal", "Notice Board: Ben Erai", "No Requirements.", "", 10, 999999)
		_Add_Quest_Data("manny_GF_MiscQuestDuneripperBlood", "(Misc) Duneripper Blood Phials", false, "The Gray Cowl Of Nocturnal", "Notice Board: Ben Erai", "No Requirements.", "", 10, 20)
		_Add_Quest_Data("manny_GF_MiscQuestMetiliusAmulet", "(Misc) I Want My Amulet Back!", false, "The Gray Cowl Of Nocturnal", "Notice Board: Ben Erai", "No Requirements.", "", 10, 30)
		_Add_Quest_Data("manny_GF_MiscQuestPraetorianCores", "(Misc) Praetorian Dynamo Cores", false, "The Gray Cowl Of Nocturnal", "Notice Board: Ben Erai", "No Requirements.", "", 5, 20)
        
		
    elseIf CurrentPage == "Skyrim Underground" ;---------------Complete (8)

		_Add_Quest_Data("AKMotierre01", "A Mother's Love", false, "Skyrim Underground", "Automatic Start (Read 'Treasure Hunter's Note')", "No Requirements.",  "", 10, 50)
        _Add_Quest_Data("AKJRQ01", "The Lusty Argonian Maid v3", false, "Skyrim Underground", "Jarl Rangulf of Skeevertown", "No Requirements.", "", 10, 50)
        _Add_Quest_Data("AKJRQ02", "Head-Hunter", false, "Skyrim Underground", "Jarl Rangulf of Skeevertown", "Completion of 'The Lusty Argonian Maid v3'.", "", 20, 50)
        _Add_Quest_Data("AKPQ01", "Dark(Elf) Secrets", false, "Skyrim Underground", "Automatic Start - (Read 'Lowlife's Journal')", "No Requirements.", "", 10, 100)
        _Add_Quest_Data("AKZombieGirlQuest01", "The Lost Zombie Girl", false, "Skyrim Underground", "Grinn (Zombie Girl)", "No Requirements.", "", 10, 200)
        _Add_Quest_Data("AKMotierre02", "A Mother's Hate", false, "Skyrim Underground", "Automatic Start - Random Event", "Completion of 'A Mother's Love'. ", "", 10, 70)
        _Add_Quest_Data("AKDVQ01", "Secret of Dwarven Valley", false, "Skyrim Underground", "Wayn the Upright (Jerall Mountain Valley)", "No Requirements.", "", 10, 110)
        _Add_Quest_Data("AKSub01", "Ancient Dwemer Submarine", false, "Skyrim Underground", "Automatic Start (Northern Glacial Lake)", "No Requirements.", "", 10, 60)

	elseIf CurrentPage == "Vigilant Main Quests" ;---------------Complete (21)
	
		_Add_Quest_Data("zzzAoMMq00", "(Act I) Vigilant of Stendarr", false, "Vigilant Main Quests", "Altano (Windpeak Inn)", "No Requirements.",  "", 0, 9999)
		_Add_Quest_Data("zzzAoMMq01", "(Act I) Bloodsucker", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Vigilant of Stendarr'.",  "", 0, 9999)
		_Add_Quest_Data("zzzAoMMq02", "(Act I) He Who Cannot Be Touched", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Bloodsucker'.",  "", 0, 9999)
		_Add_Quest_Data("zzzAoMMq03", "(Act I) Lazy Afternoon", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'He Who Cannot Be Touched'.",  "", 0, 9999)
		_Add_Quest_Data("zzzAoMMq04", "(Act I) The Eye of Madness", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Lazy Afternoon'.",  "", 0, 9999)
		_Add_Quest_Data("zzzAoMMq05", "(Act I) Dine and Dash", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'The Eye of Madness'.",  "", 0, 9999)
		_Add_Quest_Data("zzzAoMMq06", "(Act I) Thus Spoke Khajiit", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Dine and Dash'.",  "", 0, 9999)
		_Add_Quest_Data("zzzAoMMq07", "(Act I) Old Guilts", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Thus Spoke Khajiit'.",  "", 0, 9999)
		_Add_Quest_Data("zzzAoMMq08", "(Act I) No Mercy", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Old Guilts'.",  "NOTE: Karma Neutral path - Start conversation with 'What are you doing here?'.", 0, 9999)
		_Add_Quest_Data("zzzAoMMq09", "(Act I) The Endless Fall", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'No Mercy'.",  "NOTE: Karma Gain path - Defy Molag Bal with 'Begone...' and 'I said, begone...' dialogue options.", 0, 9999)
		_Add_Quest_Data("zzzAoMMq10", "(Act I) The Landing", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'The Endless Fall'.",  "", 0, 9999)
		
		if _bSpoilers == 1
		
			_Add_Quest_Data("zzzAoMSubQ01", "(Act I) The witch of Ivarstead", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'The Landing'.",  "NOTE: This quest will register as 'Ongoing' when the quest 'The Landing' is started, once 'The Landing' has been completed, travel back to the Witch's Pond and speak with Reyda.\n Karma Gain path - Ignore her lies and tell her that her fate is sealed.", 10, 300)
		
		endIf
					
		_Add_Quest_Data("zzzBMMq01", "(Act II) Empty Cells", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'The Landing'.",  "NOTE: Start this quest by speaking to the Windhelm guard outside the Temple of Stendarr, this quest will complete after speaking to Jorleif, 'Loose Ends' and 'The Blood Matron'.", 0, 9999)
		_Add_Quest_Data("zzzBMMq02", "(Act II) Loose Ends", false, "Vigilant Main Quests", "Automatic Start", "Must have started 'Empty Cells'.",  "Note: This quest is contained within 'Empty Cells',\n Karma Gain path - Kill the giant Vampire Brute.\n Karma Neutral Path - Answer Lamae with 'Begone, monster', or attack her if you already agreed to her offer.", 0, 9999)
		_Add_Quest_Data("zzzBMMq03", "(Act II) The Blood Matron", false, "Vigilant Main Quests", "Automatic Start", "Must have started 'Empty Cells'.",  "Note: This quest is contained within 'Empty Cells'.\n Karma Gain path - automatic on completion.", 0, 9999)
		
		_Add_Quest_Data("zzzCOMq01", "(Act III) Child of Oblivion", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Empty Cells'.",  "NOTE: Start this quest by returning to the Temple of Stendarr after leaving Windhelm, Choosing the death option will result in missing the Museum quest display for act III, it is highly recommended to complete this quest accepting the help of Molag Bal.", 0, 9999)
		
		_Add_Quest_Data("zzzCHMQ00", "(Act IV) Coldharbour", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Child Of Oblivion'.",  "NOTE: This quest does not appear in your journal.", 0, 999)
		_Add_Quest_Data("zzzCHMQ01", "(Act IV) Aetherius", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Coldharbour'.",  "NOTE: This quest does not appear in your journal, Must have a Karma Level of 50+ for a chance to trigger the good ending.", 0, 255)
		_Add_Quest_Data("zzzCHMQ02", "(Act IV) Exsultate Jubilate", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Exsultate Jubilate'.",  "NOTE: This quest does not appear in your journal.", 0, 50)
		_Add_Quest_Data("zzzCHEpilogueQuest01", "(Act IV) A Million Cats", false, "Vigilant Main Quests", "Automatic Start", "Completion of 'Exsultate Jubilate'.",  "NOTE: This quest does not appear in your journal.", 0, 20)
		
	elseIf CurrentPage == "Vigilant Side Quests" ;---------------Complete (18)
	
		_Add_Quest_Data("", "Knight of Akatosh", true, "Vigilant Side Quests", "Sir Amiel (Barrier Tower of Anyammis)", "No Requirements.",  "NOTE: Speak to sir Amiel, Becomes a follower if you have more than 0 karma.", -99999, 0)
		_Add_Quest_Data("", "Knight of Talos", true, "Vigilant Side Quests", "Sir Berich (Old Temple of the Eight Divines)", "No Requirements.",  "NOTE: Speak to Sir Berich, Becomes a follower if you have more than 20 karma.", -99999, 0)
		_Add_Quest_Data("", "Knight of Mara", true, "Vigilant Side Quests", "Sir Casimir (Old Temple of the Eight Divines)", "No Requirements.",  "NOTE: Find and battle Sir Casimir in the 'Old Temple of the Eight Divines'.", -99999, 0)
		_Add_Quest_Data("", "Knight of Stendarr", true, "Vigilant Side Quests", "Sir Caius (Prison Sewer)", "No Requirements.",  "NOTE: If you kill Atima and appeal to Caius' sense of duty, he can become a follower.\n WARNING: Killing Atima results in missing a relic from the Museum.", -99999, 0)	
		_Add_Quest_Data("", "Knight of Dibella", true, "Vigilant Side Quests", "Sir Gregory", "No Requirements.",  "NOTE: Collect all 7 of Sir Gregory's notes found inside little Dibella statues around ColdHarbour.", -99999, 0)
				
		_Add_Quest_Data("zzzCHSubQuest02", "Archer of Kyne", false, "Vigilant Side Quests", "Bourlor", "No Requirements.",  "NOTE: Becomes a follower if you defeat Vernaccus in Fort Verin, loot Bourlor's Bow from Vernaccus and bring it back to Bourlor.", 10, 255)
		_Add_Quest_Data("zzzCHSubQuest03", "The Black Worm", false, "Vigilant Side Quests", "Black Worm (Silorn's Priory)", "No Requirements.",  "NOTE: If you let him out (karma loss), he'll move to Mathmalatu Priory and become a merchant.\n Karma Gain path - Kill him in the prison.", 10, 255)		
		_Add_Quest_Data("zzzCHSubQuest04", "Funeral", false, "Vigilant Side Quests", "Martha (Watchtowers)", "No Requirements.",  "Note: Return to the graveyard and speak to Martha to complete this quest.", 10, 255)
		_Add_Quest_Data("zzzCHSubQuest01", "More Skooma", false, "Vigilant Side Quests", "Ja'zhan Sr (Prison Tower)", "No Requirements.",  "Complete this quest by speaking to 'Ja'zhan Sr' after clearing the Prison Tower.", 10, 255)
		_Add_Quest_Data("zzzCHSubQuest09", "Paladin Melus", false, "Vigilant Side Quests", "Melus Petilius", "No Requirements.",  "NOTE: Can be met a total of 3 times, the final being a Boss Battle.", 5, 20)
		_Add_Quest_Data("zzzCHSubQuest10", "Knight of Arkay", false, "Vigilant Side Quests", "Sir Torolf (Church of Arkay)", "Sithis' Eye Ring",  "NOTE: Boss Battle, striking the wall with Arkay's skeleton using the 'Greatsword of Anui-El' will reveal the door to the Hall of Bones.", 0, 20)
		_Add_Quest_Data("zzzCHSubQuest08", "Knight of Zenithar", false, "Vigilant Side Quests", "Sir Ralvas (Prison Tower)", "No Requirements.",  "NOTE: Return Ralvas his head and he can become a follower.", 0, 999)
		_Add_Quest_Data("zzzCHSubQuest07", "Knight of Julianos", false, "Vigilant Side Quests", "Sir Henrik", "No Requirements.",  "NOTE: Can be met a total of 4 times, the final time with a decision to be made.", 0, 999)
		_Add_Quest_Data("zzzCHSubQuest12", "Knight of Kynareth", false, "Vigilant Side Quests", "Sir Juncan", "No Requirements.",  "NOTE: Can be met a total of 5 times, the final being a Boss Battle.", 0, 50)
		_Add_Quest_Data("zzzCHSubQuest05", "The Madness", false, "Vigilant Side Quests", "Mad King Dro'Zel (Malatar Mansion)", "No Requirements.",  "NOTE: Find and defeat 'Mad King Dro'Zel'.", 10, 60)
		_Add_Quest_Data("zzzCHSubQuest06", "The Avenger", false, "Vigilant Side Quests", "Aredhel (St. Dulsa's Charnel)", "No Requirements.",  "NOTE: Defeat Aredhel in St. Dulsa's Charnel.", 5, 30)		
		_Add_Quest_Data("zzzCHSubQuest11", "Kyne's Dragon", false, "Vigilant Side Quests", "Kahkaankrein (Second Inquisition Court)", "Kyne's Feather & White Flowers(Funeral Quest)",  "NOTE: If you have Kyne's Feather in your inventory, he'll ask you for it and giving it to him will set him free.", 10, 999)
		_Add_Quest_Data("zzzCHGreymarchQuest", "Greymarch", false, "Vigilant Side Quests", "Automatic Start", "No Requirements.",  "NOTE: This quest starts when you kill Marukh in Malada.", 10, 20)

	elseIf CurrentPage == "Vigilant Memory Quests" ;---------------Complete (12)
	
		_Add_Quest_Data("zzzCHMemoryQuest03", "The Knight of Hounds", false, "Vigilant Memory Quests", "Automatic Start", "Win the Boss Battle against Varla in 'Fort Welkynd'.",  "NOTE: Loot Enola's Skull to start the Memory Quest.\n Karma Gain path - keep refusing to kill Enola until Belharza relents.", 0, 999)
		_Add_Quest_Data("zzzCHMemoryQuest04", "Johan the Fool", false, "Vigilant Memory Quests", "Automatic Start", "No Requirements.",  "NOTE: Activate Johan's Grave to start this memory quest.\n Karma Gain path - Refuse the mace and drive the bard away.", 0, 999)
		_Add_Quest_Data("zzzCHMemoryQuest10", "Pelinal the Bloody", false, "Vigilant Memory Quests", "Automatic Start", "Win the battle against Pelinal The Bloody at the Barrier Tower of Agea.",  "NOTE: Walk into the red stream of light and confirm you want to synchronize your soul.\n Karma Gain path - Activate the shackles on Mary's hands, lead her back to the main hall, listen to Pelinal.", 0, 999)
		_Add_Quest_Data("zzzCHMemoryQuest01", "The Grand Inquisitor", false, "Vigilant Memory Quests", "Automatic Start", "No Requirements.",  "NOTE: Kill Mary in the 'Cradle of Filth' to start this quest.\n Karma Gain path - Remain quiet through the entirety of Pepe's rant.", 0, 999)
		_Add_Quest_Data("zzzCHMemoryQuest02", "The Mad King", false, "Vigilant Memory Quests", "Automatic Start", "Defeating 'Mad King Dro'Zel' in Malatar Mansion.",  "NOTE: Fight Dro'Zel in Malatar Mansion to the last room where he cowers next to Hasaama's corpse.\n Karma Gain path - don't tell Dro'Zel about Gilverdale.", 0, 999)	
		_Add_Quest_Data("zzzCHMemoryQuest05", "Ada Bal", false, "Vigilant Memory Quests", "Automatic Start", "No Requirements.",  "NOTE: Note: Activate Dulsa's bones in St. Dulsa's Charnel to start this quest.\n Karma Gain path - Kill Marukh without being hit by him more than once.", 0, 999)
		_Add_Quest_Data("zzzCHMemoryQuest11", "After the Storm", false, "Vigilant Memory Quests", "Automatic Start", "Comnpletion of the quest 'Pelinal the Bloody'.",  "NOTE: This memory is different depending on the path you took in Pelinal's quest.", 0, 999)	
		_Add_Quest_Data("zzzCHMemoryQuest12", "The Last Night", false, "Vigilant Memory Quests", "Automatic Start", "Completion of the quest 'After the Storm'.",  "NOTE: This memory is different depending on the path you took in Pelinal's quest.", 0, 999)			
		_Add_Quest_Data("zzzCHMemoryQuest06", "Remains of the Miracle", false, "Vigilant Memory Quests", "Automatic Start", "Completion of 'Coldharbour'.",  "NOTE: Activate the first Strange Sand Pile to start this quest, only available if you had 50 or more karma when you reached the top of the tower and placed Ada Bal in the set on the floor.", 0, 999)
		_Add_Quest_Data("zzzCHMemoryQuest07", "Temptation of Marukh", false, "Vigilant Memory Quests", "Automatic Start", "Completion of 'Coldharbour'.",  "NOTE: Activate the Second Strange Sand Pile to start this quest,Only available if you had 50 or more karma when you reached the top of the tower and placed Ada Bal in the set on the floor.\nKarma Gain path -  Answer Alessia with '...' dialogue option and kill her.", 0, 999)
		_Add_Quest_Data("zzzCHMemoryQuest08", "The Nameless Bard", false, "Vigilant Memory Quests", "Automatic Start", "Completion of 'Coldharbour'.",  "NOTE: Activate the Third Strange Sand Pile to start this quest after defeating Molag Bal, Only available if you had 50 or more karma when you reached the top of the tower and placed Ada Bal in the set on the floor.", 0, 999)
		_Add_Quest_Data("zzzCHMemoryQuest09", "Beyond the Madness", false, "Vigilant Memory Quests", "Automatic Start", "Completion of 'Coldharbour'.",  "NOTE: This Quest is only available if you select 'Ada Bal' during the quest 'The Nameless Bard'.\nManually toggle this quest complete if it doesn't auto update.", -99999, 99999)
			
	endIf
endEvent

;-- EVENTS END ------------------------------------------------------------------------------------------------------------------------------------------------------------