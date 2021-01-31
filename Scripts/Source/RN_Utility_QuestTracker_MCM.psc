scriptName RN_Utility_QuestTracker_MCM extends SKI_ConfigBase

;-- Variables ---------------------------------------

RN_Utility_QuestTracker_Quests property _QuestHolder auto
RN_Utility_QuestTracker_Arrays property _ArrayHolder auto

RN_Utility_MCM Property RN_MCM auto

String property _MCM_Page auto hidden

String[] _Array_Page_Static	
String[] _Array_Page_Dynamic

Int _Position_Right
Int _Position_Left

String[] _MCM_Strings
String[] _Helgen_Menu_Option
String[] _Legacy_Menu_Option

String _Status_Return

Int _State_Menu_Helgen
Int _State_Menu_Legacy

Int Property _Helgen_Index = 0 Auto Hidden
Int Property _Legacy_Index = 0 Auto Hidden

Bool Property _bSpoilers Auto Hidden

Bool DevDebugVal
;-- Events --------------------------------------

Event OnConfigInit()
 
	_Build_Pages()
	_Build_Pages_Dynamic()
endEvent

;-- Events --------------------------------------

Event _Build_Pages()
	
	_Array_Page_Dynamic = new String[23]
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
	_Array_Page_Dynamic[19] = "3DNPC Main Quests"
	_Array_Page_Dynamic[20] = "3DNPC Blood of Kings"
	_Array_Page_Dynamic[21] = "3DNPC Darkened Steel"
	_Array_Page_Dynamic[22] = "3DNPC Misc Quests"
endEvent

;-- Events --------------------------------------

Event _Build_Pages_Dynamic()

	ModName = "LOTD: The Curators Tracker"
	_Array_Page_Static = new String[32]
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

	if Game.GetModByName("LOTD_TCC_Clockwork.esp") != 255
		_Index = _Array_Page_Static.Find("")	
			_Array_Page_Static[_Index] = "Clockwork"
		_Page += 1
	endif

	if Game.GetModByName("LOTD_TCC_Falskaar.esp") != 255
		_Index = _Array_Page_Static.Find("") 	
			_Array_Page_Static[_Index] = "Falskaar"
		_Page += 1
	endif

	if Game.GetModByName("LOTD_TCC_Helgen.esp") != 255
		_Index = _Array_Page_Static.Find("")  
			_Array_Page_Static[_Index] = "Helgen Reborn"
		_Page += 1
	endif

	if Game.GetModByName("LOTD_TCC_MAS.esp") != 255
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Moon And Star"
		_Page += 1
	endif
	
	if Game.GetModByName("LOTD_TCC_Moonpath.esp") != 255
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Moonpath To Elsweyr"
		_Page += 1
	endIf
 
 	if Game.GetModByName("LOTD_TCC_ProjectAHO.esp") != 255
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Project AHO"
		_Page += 1
	endif

	if Game.GetModByName("LOTD_TCC_Underground.esp") != 255
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Skyrim Underground"
		_Page += 1
	endif

	if Game.GetModByName("LOTD_TCC_GrayCowl.esp") != 255
		_Index = _Array_Page_Static.Find("")	
			_Array_Page_Static[_Index] = "The Gray Cowl Of Nocturnal"
		_Page += 1
	endif 

	if Game.GetModByName("LOTD_TCC_WheelsOfLull.esp") != 255
		_Index = _Array_Page_Static.Find("")  
			_Array_Page_Static[_Index] = "The Wheels Of Lull"
		_Page += 1
	endif

	if Game.GetModByName("LOTD_TCC_Undeath.esp") != 255
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "Undeath"
		_Page += 1
	endif
	
	if Game.GetModByName("LOTD_TCC_Wyrmstooth.esp") != 255
		_Index = _Array_Page_Static.Find("")	
			_Array_Page_Static[_Index] = "Wyrmstooth"
		_Page += 1
	endif
	
	if Game.GetModByName("LOTD_TCC_3DNPC.esp") != 255
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = " "
		_Page += 1

		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "~~3DNPC Quests~~"
		_Page += 1
				
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "3DNPC Main Quests"
		_Page += 1

		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "3DNPC Blood of Kings"
		_Page += 1	

		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "3DNPC Darkened Steel"
		_Page += 1	
		
		_Index = _Array_Page_Static.Find("")
			_Array_Page_Static[_Index] = "3DNPC Misc Quests"
		_Page += 1	
	endIf
	
	if Game.GetModByName("LOTD_TCC_Vigilant.esp") != 255
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
	
	_MCM_Page = CurrentPage
	
	_Build_Pages()
	_Build_Pages_Dynamic()
	_Build_Page_Settings()
	
	_Build_Menu_Helgen()
	_Build_Menu_Legacy()
	_Build_MCM_Strings()
	
	_ArrayHolder._Reset_Arrays()
	_QuestHolder._Build_Quests()
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
	
	if Game.GetModByName("DBM_RelicHunter.esp") != 255
		_Legacy_Menu_Option = new string[4]
		_Legacy_Menu_Option[0] = "Make Selection"
		_Legacy_Menu_Option[1] = "Any Other Start"
		_Legacy_Menu_Option[2] = "Solitude Docks Start"
		_Legacy_Menu_Option[3] = "GuildMaster Start"
	else
		_Legacy_Menu_Option = new string[3]
		_Legacy_Menu_Option[0] = "Make Selection"
		_Legacy_Menu_Option[1] = "Any Other Start"
		_Legacy_Menu_Option[2] = "Solitude Docks Start"
	endif
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
		
		if Game.GetModByName("Alternate Start - Live Another Life.esp") != 255
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
		AddToggleOptionST("Dev_Alerts", "Developer Debugging", DevDebugVal)
		SetCursorPosition(1)
		AddHeaderOption("")	
	
		if Game.GetModByName("LOTD_TCC_Helgen.esp") != 255
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
		SetTextOptionValueST(Self.SetSpoilersString(), false, "")
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

		self.SetInfoText("Enables Developer Debugging\n Default: OFF")
	EndEvent
endState

;-- Events --------------------------------------

Event _Build_Quests_Pages()

	_Allocate_Quests("Museum Quests", _ArrayHolder._Array_Name_Museum, _ArrayHolder._Array_Toggle_Museum)
	_Build_Page_Layout("Museum Quests")
	
	_Allocate_Quests("Explorers Guild", _ArrayHolder._Array_Name_Guild, _ArrayHolder._Array_Toggle_Guild)
	_Build_Page_Layout("Explorers Guild")
	
	_Allocate_Quests("Misc Quests", _ArrayHolder._Array_Name_Misc, _ArrayHolder._Array_Toggle_Misc)
	_Build_Page_Layout("Misc Quests")
	
	_Allocate_Quests("Auryen's Notes", _ArrayHolder._Array_Name_Notes, _ArrayHolder._Array_Toggle_Notes)
	_Build_Page_Layout("Auryen's Notes")
	
	_Allocate_Quests("Sanamia's Journals", _ArrayHolder._Array_Name_Sanamia, _ArrayHolder._Array_Toggle_Sanamia)
	_Build_Page_Layout("Sanamia's Journals")
	
	_Allocate_Quests("Falskaar", _ArrayHolder._Array_Name_Falskaar, _ArrayHolder._Array_Toggle_Falskaar)
	_Build_Page_Layout("Falskaar")
	
	_Allocate_Quests("Helgen Reborn", _ArrayHolder._Array_Name_Helgen, _ArrayHolder._Array_Toggle_Helgen)
	_Build_Page_Layout("Helgen Reborn")
	
	_Allocate_Quests("Moonpath To Elsweyr", _ArrayHolder._Array_Name_Moonpath, _ArrayHolder._Array_Toggle_Moonpath)
	_Build_Page_Layout("Moonpath To Elsweyr")
	
	_Allocate_Quests("Clockwork", _ArrayHolder._Array_Name_Clockwork, _ArrayHolder._Array_Toggle_Clockwork)
	_Build_Page_Layout("Clockwork")
	
	_Allocate_Quests("Moon And Star", _ArrayHolder._Array_Name_MoonStar, _ArrayHolder._Array_Toggle_MoonStar)
	_Build_Page_Layout("Moon And Star")

	_Allocate_Quests("Project AHO", _ArrayHolder._Array_Name_ProjectAHO, _ArrayHolder._Array_Toggle_ProjectAHO)
	_Build_Page_Layout("Project AHO")
	
	_Allocate_Quests("Undeath", _ArrayHolder._Array_Name_Undeath, _ArrayHolder._Array_Toggle_Undeath)
	_Build_Page_Layout("Undeath")
	
	_Allocate_Quests("Wyrmstooth", _ArrayHolder._Array_Name_Wyrmstooth, _ArrayHolder._Array_Toggle_Wyrmstooth)
	_Build_Page_Layout("Wyrmstooth")
	
	_Allocate_Quests("The Wheels Of Lull", _ArrayHolder._Array_Name_Wheels, _ArrayHolder._Array_Toggle_Wheels)
	_Build_Page_Layout("The Wheels Of Lull")
	
	_Allocate_Quests("The Gray Cowl Of Nocturnal", _ArrayHolder._Array_Name_Nocturnal, _ArrayHolder._Array_Toggle_Nocturnal)
	_Build_Page_Layout("The Gray Cowl Of Nocturnal")
	
	_Allocate_Quests("Skyrim Underground", _ArrayHolder._Array_Name_Underground, _ArrayHolder._Array_Toggle_Underground)
	_Build_Page_Layout("Skyrim Underground")
	
	_Allocate_Quests("Vigilant Main Quests", _ArrayHolder._Array_Name_VigilantActs, _ArrayHolder._Array_Toggle_VigilantActs)
	_Build_Page_Layout("Vigilant Main Quests")
	
	_Allocate_Quests("Vigilant Side Quests", _ArrayHolder._Array_Name_VigilantSide, _ArrayHolder._Array_Toggle_VigilantSide)
	_Build_Page_Layout("Vigilant Side Quests")
	
	_Allocate_Quests("Vigilant Memory Quests", _ArrayHolder._Array_Name_VigilantMem, _ArrayHolder._Array_Toggle_VigilantMem)
	_Build_Page_Layout("Vigilant Memory Quests")	   

	_Allocate_Quests("3DNPC Main Quests", _ArrayHolder._Array_Name_3DNPC_Main, _ArrayHolder._Array_Toggle_3DNPC_Main)
	_Build_Page_Layout("3DNPC Main Quests")	

	_Allocate_Quests("3DNPC Blood of Kings", _ArrayHolder._Array_Name_3DNPC_BOK, _ArrayHolder._Array_Toggle_3DNPC_BOK)
	_Build_Page_Layout("3DNPC Blood of Kings")
	
	_Allocate_Quests("3DNPC Darkened Steel", _ArrayHolder._Array_Name_3DNPC_DS, _ArrayHolder._Array_Toggle_3DNPC_DS)
	_Build_Page_Layout("3DNPC Darkened Steel")	
	
	_Allocate_Quests("3DNPC Misc Quests", _ArrayHolder._Array_Name_3DNPC_Misc, _ArrayHolder._Array_Toggle_3DNPC_Misc)
	_Build_Page_Layout("3DNPC Misc Quests")	
	
endEvent

;-- Events --------------------------------------

Event _Build_Page_Layout(String _Cur_Quest_Page)

	if CurrentPage == _Cur_Quest_Page
	
		SetCursorFillMode(LEFT_TO_RIGHT)
		
		_Position_Left = 0
		_Position_Right = 1	
		_Build_Section(true, "Available Quests (Main & Side)", 0, _ArrayHolder._M_Quest_Title_Incomplete, false)
		_Build_Section(true, "Available Quests (Radiant)", 1, _ArrayHolder._R_Quest_Title_Incomplete, false)	
		
		_Build_Section(false, "Quests (In Progress)", 0, _ArrayHolder._M_Quest_Title_Ongoing, false)			
		_Build_Section(false, "Quests (Completed)", 1, _ArrayHolder._M_Quest_Title_Completed, true)
		
	endIf
endEvent

;-- Events --------------------------------------

Event _Build_Section(bool Page_Side, String TitleOfSectionHeader, Int HeaderSectionLayoutOnPage, String[] CurrentQuestNames, Bool CurrentQuestState)

	Int _Index = 0
	Int _Array_Length = CurrentQuestNames.length
	
	if Page_Side
	
		_Position_Left += HeaderSectionLayoutOnPage * 2
		SetCursorPosition(_Position_Left)
		AddHeaderOption(TitleOfSectionHeader, 0)
		_Position_Left += 2
		while _Index < _Array_Length && CurrentQuestNames[_Index] != ""
			SetCursorPosition(_Position_Left)
			_ArrayHolder._Array_Quest_Option_ID[_ArrayHolder._Array_Quest_Index] = self.AddToggleOption(CurrentQuestNames[_Index], CurrentQuestState, 0)
			_ArrayHolder._Array_Quest_Option_Name[_ArrayHolder._Array_Quest_Index] = CurrentQuestNames[_Index]
			_ArrayHolder._Array_Quest_ToggleState[_ArrayHolder._Array_Quest_Index] = CurrentQuestState
			_ArrayHolder._Array_Quest_Index += 1
			_Position_Left += 2
			_Index += 1
		endWhile
		
	else

		_Position_Right += HeaderSectionLayoutOnPage * 2
		SetCursorPosition(_Position_Right)
		AddHeaderOption(TitleOfSectionHeader, 0)
		_Position_Right += 2
		while _Index < _Array_Length && CurrentQuestNames[_Index] != ""
			SetCursorPosition(_Position_Right)
			_ArrayHolder._Array_Quest_Option_ID[_ArrayHolder._Array_Quest_Index] = self.AddToggleOption(CurrentQuestNames[_Index], CurrentQuestState, 0)
			_ArrayHolder._Array_Quest_Option_Name[_ArrayHolder._Array_Quest_Index] = CurrentQuestNames[_Index]
			_ArrayHolder._Array_Quest_ToggleState[_ArrayHolder._Array_Quest_Index] = CurrentQuestState
			_ArrayHolder._Array_Quest_Index += 1
			_Position_Right += 2
		_Index += 1
		endWhile	
	endIf	
endEvent

;-- Events --------------------------------------

Event _SwitchToggleState(String _QuestName, Bool _Quest_Toggle_State)

	if CurrentPage == "Museum Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Museum, _ArrayHolder._Array_Toggle_Museum)
		
	elseIf CurrentPage == "Explorers Guild"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Guild, _ArrayHolder._Array_Toggle_Guild)
		
	elseIf CurrentPage == "Misc Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Misc, _ArrayHolder._Array_Toggle_Misc)	
		
	elseIf CurrentPage == "Auryen's Notes"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Notes, _ArrayHolder._Array_Toggle_Notes)
		
	elseIf CurrentPage == "Sanamia's Journals"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Sanamia, _ArrayHolder._Array_Toggle_Sanamia)
		
	elseIf CurrentPage == "Falskaar"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Falskaar, _ArrayHolder._Array_Toggle_Falskaar)
		
	elseIf CurrentPage == "Helgen Reborn"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Helgen, _ArrayHolder._Array_Toggle_Helgen)
		
	elseIf CurrentPage == "Moonpath To Elsweyr"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Moonpath, _ArrayHolder._Array_Toggle_Moonpath)
		
	elseIf CurrentPage == "Clockwork"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Clockwork, _ArrayHolder._Array_Toggle_Clockwork)
		
	elseIf CurrentPage == "Moon And Star"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_MoonStar, _ArrayHolder._Array_Toggle_MoonStar)

	elseIf CurrentPage == "Project AHO"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_ProjectAHO, _ArrayHolder._Array_Toggle_ProjectAHO)
	
	elseIf CurrentPage == "Undeath"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Undeath, _ArrayHolder._Array_Toggle_Undeath)
		
	elseIf CurrentPage == "Wyrmstooth"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Wyrmstooth, _ArrayHolder._Array_Toggle_Wyrmstooth)
		
	elseIf CurrentPage == "The Wheels Of Lull"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Wheels, _ArrayHolder._Array_Toggle_Wheels)
		
	elseIf CurrentPage == "The Gray Cowl Of Nocturnal"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Nocturnal, _ArrayHolder._Array_Toggle_Nocturnal)
		
	elseIf CurrentPage == "Skyrim Underground"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Underground, _ArrayHolder._Array_Toggle_Underground)
		
	elseIf CurrentPage == "Vigilant Main Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_VigilantActs, _ArrayHolder._Array_Toggle_VigilantActs)
		
	elseIf CurrentPage == "Vigilant Side Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_VigilantSide, _ArrayHolder._Array_Toggle_VigilantSide)
		
	elseIf CurrentPage == "Vigilant Memory Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_VigilantMem, _ArrayHolder._Array_Toggle_VigilantMem)	

	elseIf CurrentPage == "3DNPC Main Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_3DNPC_Main, _ArrayHolder._Array_Toggle_3DNPC_Main)

	elseIf CurrentPage == "3DNPC Blood of Kings"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_3DNPC_BOK, _ArrayHolder._Array_Toggle_3DNPC_BOK)
		
	elseIf CurrentPage == "3DNPC Darkened Steel"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_3DNPC_DS, _ArrayHolder._Array_Toggle_3DNPC_DS)
		
	elseIf CurrentPage == "3DNPC Misc Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_3DNPC_Misc, _ArrayHolder._Array_Toggle_3DNPC_Misc)
				
	endIf
endEvent

;-- Events --------------------------------------

Bool Function _DynamicPageAlloc()

	Int _Index = _Array_Page_Dynamic.find(CurrentPage, 0)
	   return _Index >= 0
EndFunction

;-- Events --------------------------------------

Event _Allocate_Quests(String _Cur_Quest_Page, String[] _New_QuestName, Bool[] _New_Toggle_State)

	if CurrentPage == _Cur_Quest_Page
	
		Int _Index = 0
		while _Index < _ArrayHolder._Array_Quest_ID.length && _ArrayHolder._Array_Quest_Name[_Index] != ""
			Bool userManuallyCompleted = _Player_Toggled(_ArrayHolder._Array_Quest_Name[_Index], _New_QuestName, _New_Toggle_State)	
				if !_ArrayHolder._Array_Quest_Radiant[_Index]
					if !userManuallyCompleted
						Quest _Checked_Quest = Quest.GetQuest(_ArrayHolder._Array_Quest_ID[_Index])
						Int _Checked_Quest_Stage = _Checked_Quest.GetStage()
						Bool isCompleteBasedOnStage = _Checked_Quest_Stage > _ArrayHolder._Array_Stage_Final[_Index]
						if !_Checked_Quest.IsCompleted() && !isCompleteBasedOnStage
							if _Checked_Quest_Stage == 0 || _Checked_Quest_Stage < _ArrayHolder._Array_Stage_First[_Index]
								_ArrayHolder._M_Quest_ID_Incomplete[_ArrayHolder._M_Quest_ID_Index_Incomplete] = _ArrayHolder._Array_Quest_ID[_Index] as String
								_ArrayHolder._M_Quest_Title_Incomplete[_ArrayHolder._M_Quest_Title_Index_Incomplete] = _ArrayHolder._Array_Quest_Name[_Index]
								_ArrayHolder._M_Quest_ID_Index_Incomplete += 1
								_ArrayHolder._M_Quest_Title_Index_Incomplete += 1
							else
								_ArrayHolder._M_Quest_ID_Ongoing[_ArrayHolder._M_Quest_ID_Index_Ongoing] = _ArrayHolder._Array_Quest_ID[_Index] as String
								_ArrayHolder._M_Quest_Title_Ongoing[_ArrayHolder._M_Quest_Title_Index_Ongoing] = _ArrayHolder._Array_Quest_Name[_Index]
								_ArrayHolder._M_Quest_ID_Index_Ongoing += 1
								_ArrayHolder._M_Quest_Title_Index_Ongoing += 1
							endIf
						else
							_ArrayHolder._M_Quest_ID_Completed[_ArrayHolder._M_Quest_ID_Index_Completed] = _ArrayHolder._Array_Quest_ID[_Index] as String
							_ArrayHolder._M_Quest_Title_Completed[_ArrayHolder._M_Quest_Title_Index_Completed] = _ArrayHolder._Array_Quest_Name[_Index]
							_ArrayHolder._M_Quest_ID_Index_Completed += 1
							_ArrayHolder._M_Quest_Title_Index_Completed += 1
						endIf
					else
						_ArrayHolder._M_Quest_ID_Completed[_ArrayHolder._M_Quest_ID_Index_Completed] = _ArrayHolder._Array_Quest_ID[_Index] as String
						_ArrayHolder._M_Quest_Title_Completed[_ArrayHolder._M_Quest_Title_Index_Completed] = _ArrayHolder._Array_Quest_Name[_Index]
						_ArrayHolder._M_Quest_ID_Index_Completed += 1
						_ArrayHolder._M_Quest_Title_Index_Completed += 1
					endIf
					
				elseIf !userManuallyCompleted
					_ArrayHolder._R_Quest_ID_Incomplete[_ArrayHolder._R_Quest_ID_Index_Incomplete] = _ArrayHolder._Array_Quest_ID[_Index] as String
					_ArrayHolder._R_Quest_Title_Incomplete[_ArrayHolder._R_Quest_ID_Index_Incomplete] = _ArrayHolder._Array_Quest_Name[_Index]
					_ArrayHolder._R_Quest_ID_Index_Incomplete += 1
				else
					_ArrayHolder._M_Quest_ID_Completed[_ArrayHolder._M_Quest_ID_Index_Completed] = _ArrayHolder._Array_Quest_ID[_Index] as String
					_ArrayHolder._M_Quest_Title_Completed[_ArrayHolder._M_Quest_Title_Index_Completed] = _ArrayHolder._Array_Quest_Name[_Index]
					_ArrayHolder._M_Quest_Title_Index_Completed += 1
				endIf
			_Index += 1
		endWhile	
	endIf
endEvent

;-- Events --------------------------------------

Bool Function _Player_Toggled(String _QuestName, String[] _New_QuestName, Bool[] _New_Toggle_State)

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

Event _IDToggleState(Int _Value, Bool _Quest_State)

	Int _Index = 0
	Int _Array_Length = _ArrayHolder._Array_Quest_Option_ID.length
		while _Index < _Array_Length
			if _ArrayHolder._Array_Quest_Option_ID[_Index] == _Value
				_ArrayHolder._Array_Quest_ToggleState[_Index] = _Quest_State
			endIf
		_Index += 1
		endWhile
endEvent

;-- Events --------------------------------------

String Function _Get_Quest_Giver(Int _Value, String _QuestName)

	String _QuestGiver = ""
	Int _Index = 0
	Int _Array_Length = _ArrayHolder._Array_Quest_Name.length
		while _Index < _Array_Length
			if _ArrayHolder._Array_Quest_Name[_Index] == _QuestName
				_QuestGiver = _ArrayHolder._Array_Quest_Giver[_Index]
			endif
			_Index += 1
		endWhile
			return _QuestGiver
EndFunction

;-- Events --------------------------------------

String Function _Get_Quest_Overview(Int _Value, String _QuestName)

	String _QuestOverview = ""
	Int _Index = 0
	Int _Array_Length = _ArrayHolder._Array_Quest_Name.length
		while _Index < _Array_Length
			if _ArrayHolder._Array_Quest_Name[_Index] == _QuestName
				_QuestOverview = _ArrayHolder._Array_Quest_Overview[_Index]
			endIf
			_Index += 1
		endWhile
			return _QuestOverview
EndFunction

;-- Events --------------------------------------

String Function _Get_Quest_Requirements(Int _Value, String _QuestName)

	String _QuestRequirements = ""
	Int _Index = 0
	Int _Array_Length = _ArrayHolder._Array_Quest_Name.length
		while _Index < _Array_Length
			if _ArrayHolder._Array_Quest_Name[_Index] == _QuestName
				_QuestRequirements = _ArrayHolder._Array_Quest_Require[_Index]
			endIf
			_Index += 1
		endWhile
			return _QuestRequirements
EndFunction

;-- Events --------------------------------------

String Function _Get_Quest_Name(Int _Value)

	Int _Index = 0
	Int _Array_Length = _ArrayHolder._Array_Quest_Option_ID.length
	String _QuestName = ""
		while _Index < _Array_Length
			if _ArrayHolder._Array_Quest_Option_ID[_Index] == _Value
				_QuestName = _ArrayHolder._Array_Quest_Option_Name[_Index]
			endIf
			_Index += 1
		endWhile
			return _QuestName
EndFunction

;-- Events --------------------------------------

Bool Function _Get_Quest_State(Int _Value)

	Int _Index = 0
	Int _Array_Length = _ArrayHolder._Array_Quest_Option_ID.length
	Bool _Quest_State = false
		while _Index < _Array_Length
			if _ArrayHolder._Array_Quest_Option_ID[_Index] == _Value
				_Quest_State = _ArrayHolder._Array_Quest_ToggleState[_Index]
			endIf
			_Index += 1
		endWhile
			return _Quest_State
EndFunction

;-- Events --------------------------------------

String Function _Get_Quest_ID(Int _Value, String _QuestName)

	String _EditorID = ""
	Int _Index = 0
	Int _Array_Length = _ArrayHolder._Array_Quest_Name.length
	while _Index < _Array_Length
		if _ArrayHolder._Array_Quest_Name[_Index] == _QuestName
			_EditorID = _ArrayHolder._Array_Quest_ID[_Index]
		endif
		_Index += 1
	endWhile
		return _EditorID
EndFunction

;-- Events --------------------------------------

Int Function _Get_Quest_Stage_First(Int _Value, String _QuestName)

	Int _StageFirst = 0
	Int _Index = 0
	Int _Array_Length = _ArrayHolder._Array_Quest_Name.length
	while _Index < _Array_Length
		if _ArrayHolder._Array_Quest_Name[_Index] == _QuestName
			_StageFirst = _ArrayHolder._Array_Stage_First[_Index]
		endif
		_Index += 1
	endWhile
		return _StageFirst
EndFunction

;-- Events --------------------------------------

Int Function _Get_Quest_Stage_Final(Int _Value, String _QuestName)

	Int _StageFinal = 0
	Int _Index = 0
	Int _Array_Length = _ArrayHolder._Array_Quest_Name.length
	while _Index < _Array_Length
		if _ArrayHolder._Array_Quest_Name[_Index] == _QuestName
			_StageFinal = _ArrayHolder._Array_Stage_Final[_Index]
		endif
		_Index += 1
	endWhile
		return _StageFinal
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

Event OnOptionHighlight(Int _Value)
		   
    if _DynamicPageAlloc()
		String _QuestName = _Get_Quest_Name(_Value)
		String _QuestOverview = _Get_Quest_Overview(_Value, _QuestName)
		String _QuestGiver = _Get_Quest_Giver(_Value, _QuestName)
		String _QuestRequirements = _Get_Quest_Requirements(_Value, _QuestName)
		SetInfoText("Quest Giver: " + _QuestGiver + "\nRequires: " + _QuestRequirements + "\n" + _QuestOverview)
	endIf
endEvent

;-- Events --------------------------------------

Event OnOptionSelect(Int _Value)

	if DevDebugVal
		String _QuestName = _Get_Quest_Name(_Value)
		String _EditorID = _Get_Quest_ID(_Value, _QuestName)
		Int _StageFirst = _Get_Quest_Stage_First(_Value, _QuestName)
		Int _StageFinal = _Get_Quest_Stage_Final(_Value, _QuestName)
		Bool _Quest_State = _Get_Quest_State(_Value)	
		Self.ShowMessage("Quest Name: " + _QuestName + "\nQuest ID: " + _EditorID + "\nFirst Stage: " + _StageFirst + "\nFinal Stage: " + _StageFinal)
		
	else
	
		String _QuestName = _Get_Quest_Name(_Value)
		Bool _Quest_State = _Get_Quest_State(_Value)
		SetToggleOptionValue(_Value, !_Quest_State, false)
		_IDToggleState(_Value, !_Quest_State)
		_SwitchToggleState(_QuestName, !_Quest_State)
		ForcePageReset()
	endIf
endEvent

;-- Events --------------------------------------

Event _Add_Quest_Data(Bool _RadiantQuests, Int _StageFirst, Int _StageFinal, String _EditorID, String _QuestName, String _Cur_Quest_Page, String _QuestGiver, String _QuestRequirements, String _QuestOverview)

	if CurrentPage == _Cur_Quest_Page
		
		_ArrayHolder._Array_Quest_Radiant[_ArrayHolder._Array_Int] = _RadiantQuests
		_ArrayHolder._Array_Stage_First[_ArrayHolder._Array_Int] = _StageFirst
		_ArrayHolder._Array_Stage_Final[_ArrayHolder._Array_Int] = _StageFinal			
		_ArrayHolder._Array_Quest_ID[_ArrayHolder._Array_Int] = _EditorID
		_ArrayHolder._Array_Quest_Name[_ArrayHolder._Array_Int] = _QuestName
		_ArrayHolder._Array_Quest_Giver[_ArrayHolder._Array_Int] = _QuestGiver
		_ArrayHolder._Array_Quest_Overview[_ArrayHolder._Array_Int] = _QuestOverview
		_ArrayHolder._Array_Quest_Require[_ArrayHolder._Array_Int] = _QuestRequirements
	
		_ArrayHolder._Array_Int += 1
	endIf
endEvent

;-- EVENTS END ------------------------------------------------------------------------------------------------------------------------------------------------------------