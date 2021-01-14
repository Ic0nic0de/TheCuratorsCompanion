scriptName Ic0n_Completionist_MCM extends SKI_ConfigBase

;-- Variables ---------------------------------------

Ic0n_Completionist_Quests property _QuestHolder auto
Ic0n_Completionist_Arrays property _ArrayHolder auto

String property _MCM_Page auto hidden

String[] _Array_Page_Static
String[] _Array_Page_Dynamic

Int _Position_Right
Int _Position_Left

String[] _Dawnguard_Faction
Int _State_Menu_Faction
Int property DG_Faction_Choice = 0 auto hidden

String[] _CivilWar_Faction
Int _State_Menu_Faction2
Int property CW_Faction_Choice = 0 auto hidden

string _Status_Return
bool _Debugging

;-- Events --------------------------------------

Event OnConfigInit()
	
	_Build_Pages()
	_Build_Pages_Dynamic()
endEvent

;-- Events --------------------------------------

Event _Build_Pages()

	_Array_Page_Dynamic = new String[28]	
	_Array_Page_Dynamic[0] = "Main Quests"
	_Array_Page_Dynamic[1] = "Main Quests (CW)"
	_Array_Page_Dynamic[2] = "Main Quests (DG)"
	_Array_Page_Dynamic[3] = "Main Quests (DB)"		
	_Array_Page_Dynamic[4] = "Whiterun Quests"
	_Array_Page_Dynamic[5] = "Falkreath Quests"
	_Array_Page_Dynamic[6] = "Riften Quests"
	_Array_Page_Dynamic[7] = "Windhelm Quests"	
	_Array_Page_Dynamic[8] = "Dawnstar Quests"
	_Array_Page_Dynamic[9] = "Markarth Quests"
	_Array_Page_Dynamic[10] = "Morthal Quests"
	_Array_Page_Dynamic[11] = "Solitude Quests"
	_Array_Page_Dynamic[12] = "Winterhold Quests"
	_Array_Page_Dynamic[13] = "Raven Rock Quests"
	_Array_Page_Dynamic[14] = "Skaal Village Quests"
	_Array_Page_Dynamic[15] = "Tel Mithryn Quests"
	_Array_Page_Dynamic[16] = "Thirsk Quests"
	_Array_Page_Dynamic[17] = "Misc Town Quests"
	_Array_Page_Dynamic[18] = "Companions" 
	_Array_Page_Dynamic[19] = "College of Winterhold"
	_Array_Page_Dynamic[20] = "Thieves Guild" 	
	_Array_Page_Dynamic[21] = "Dark Brotherhood" 
	_Array_Page_Dynamic[22] = "Dawnguard" 
	_Array_Page_Dynamic[23] = "Vampires" 	
	_Array_Page_Dynamic[24] = "Dungeon Quests"
	_Array_Page_Dynamic[25] = "Misc Quests" 
	_Array_Page_Dynamic[26] = "Misc Quests (DG)" 
	_Array_Page_Dynamic[27] = "Misc Quests (DB)" 
 	
endEvent

;-- Events --------------------------------------

Event _Build_Pages_Dynamic()

	ModName = "Completionist"
	_Array_Page_Static = new String[36]	
	
	_Array_Page_Static[0] = "Settings" 
	_Array_Page_Static[1] = " "
	
	_Array_Page_Static[2] = "Main Quests"
	_Array_Page_Static[3] = "Main Quests (CW)"
	_Array_Page_Static[4] = "Main Quests (DG)"
	_Array_Page_Static[5] = "Main Quests (DB)"	
	_Array_Page_Static[6] = " "
	
	_Array_Page_Static[7] = "~~ Towns & Cities ~~"	
	_Array_Page_Static[8] = "Whiterun Quests"
	_Array_Page_Static[9] = "Falkreath Quests"
	_Array_Page_Static[10] = "Riften Quests"
	_Array_Page_Static[11] = "Windhelm Quests"	
	_Array_Page_Static[12] = "Dawnstar Quests"
	_Array_Page_Static[13] = "Markarth Quests"
	_Array_Page_Static[14] = "Morthal Quests"
	_Array_Page_Static[15] = "Solitude Quests"
	_Array_Page_Static[16] = "Winterhold Quests"
	_Array_Page_Static[17] = "Raven Rock Quests"
	_Array_Page_Static[18] = "Skaal Village Quests"
	_Array_Page_Static[19] = "Tel Mithryn Quests"
	_Array_Page_Static[20] = "Thirsk Quests"
	_Array_Page_Static[21] = "Misc Town Quests"
	_Array_Page_Static[22] = " "
	
	_Array_Page_Static[23] = "~~ Guilds & Factions ~~"
	_Array_Page_Static[24] = "Companions" 
	_Array_Page_Static[25] = "College of Winterhold" 	
	_Array_Page_Static[26] = "Thieves Guild" 	
	_Array_Page_Static[27] = "Dark Brotherhood" 
	_Array_Page_Static[28] = "Dawnguard" 
	_Array_Page_Static[29] = "Vampires" 
	_Array_Page_Static[30] = " "
	
	_Array_Page_Static[31] = "~~ Dungeons & Misc ~~"	
	_Array_Page_Static[32] = "Dungeon Quests"
	_Array_Page_Static[33] = "Misc Quests" 
	_Array_Page_Static[34] = "Misc Quests (DG)" 
	_Array_Page_Static[35] = "Misc Quests (DB)" 	

	Int _Index = 0
	Int _Page = 36

	Pages = Utility.CreateStringArray(_Page)
	
	Int x = _Page
	
	While x >= 1
		x -= 1 
		Pages[x] = _Array_Page_Static[x]  
	EndWhile
	
endEvent

;-- Events --------------------------------------

Event OnPageReset(String page)
	
	_MCM_Page = CurrentPage
	
	_Build_Pages()
	_Build_Pages_Dynamic()
	_Build_Menu_Faction()
	_Build_Page_Settings()
	_ArrayHolder._Build_Arrays()
	_QuestHolder._Build_Quests()
	_Build_Quests_Pages()
endEvent

;-- Menu Events ---------------------------------

Event _Build_Menu_Faction()

	_Dawnguard_Faction = new string[4]
	_Dawnguard_Faction[0] = "Make Your Choice!"
	_Dawnguard_Faction[1] = "Dawnguard."
	_Dawnguard_Faction[2] = "Vampires."
	
	_CivilWar_Faction = new string[4]
	_CivilWar_Faction[0] = "Make Your Choice!"
	_CivilWar_Faction[1] = "Imperial."
	_CivilWar_Faction[2] = "Stormcloaks."
endEvent

;-- Events --------------------------------------

Event _Build_Page_Settings()

	if CurrentPage == "Settings"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("Mod Settings:")
		
		AddMenuOptionST("_State_Menu_Faction", "Dawnguard Faction:", _Dawnguard_Faction[DG_Faction_Choice])
		AddMenuOptionST("_State_Menu_Faction2", "Civil War Faction:", _CivilWar_Faction[CW_Faction_Choice])
		AddEmptyOption()
		AddTextOptionST("_State_Debugging", "Debugging (Show Editor ID)", self.GetDebuggingString())
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddHeaderOption("Section Information:")
		AddTextOption("Quests in the 'Available Quests (Main)' section", "", 0)
		AddTextOption("will update automatically when a quest is either", "", 0)
		AddTextOption("started or completed.", "", 0)		
		SetCursorPosition(1)	
		AddHeaderOption("")
		AddTextOption("Thanks for downloading Completionist: Quest Tracker", "", 0)
		AddTextOption("an automatic MCM quest tracker for Skyrim & its DLC.", "", 0)
		AddEmptyOption()
		AddTextOption("", "Completionist Version: 1.0.0", 0)
		AddTextOption("", "Developed by Ic0nic0de", 0)
		AddEmptyOption()		
		AddHeaderOption("")
		AddTextOption("Quests in 'Available Quests (Radiant)' section", "", 0)
		AddTextOption("will not update automatically and will need to", "", 0)
		AddTextOption("toggled manually when completed.", "", 0)
		
	endIf
endEvent

;-- Faction Menu State -----------------------------------------

State _State_Menu_Faction ; MENU

	Event OnMenuOpenST()
		SetMenuDialogStartIndex(DG_Faction_Choice)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(_Dawnguard_Faction)
	endEvent
					
	Event OnMenuAcceptST(int index)
		DG_Faction_Choice = Index
		SetMenuOptionValueST(_State_Menu_Faction, _Dawnguard_Faction[DG_Faction_Choice])
		ForcePageReset()
	endEvent

	Event OnDefaultST()
		DG_Faction_Choice = 0
		SetMenuOptionValueST(_Dawnguard_Faction[DG_Faction_Choice])
	endEvent

	Event OnHighlightST()
		SetInfoText("Use this menu to show the correct quests from the faction you joined during the Dawnguard quest 'Bloodline'")
	endEvent
	
endState

;-- Faction Menu State -----------------------------------------

State _State_Menu_Faction2 ; MENU

	Event OnMenuOpenST()
		SetMenuDialogStartIndex(CW_Faction_Choice)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(_CivilWar_Faction)
	endEvent
					
	Event OnMenuAcceptST(int index)
		CW_Faction_Choice = Index
		SetMenuOptionValueST(_State_Menu_Faction2, _CivilWar_Faction[CW_Faction_Choice])
		ForcePageReset()
	endEvent

	Event OnDefaultST()
		CW_Faction_Choice = 0
		SetMenuOptionValueST(_CivilWar_Faction[CW_Faction_Choice])
	endEvent

	Event OnHighlightST()
		SetInfoText("Use this menu to show the correct quests from the faction you joined during the Civil War quest line")
	endEvent
	
endState

;-- Hide Incomplete Toggle State -----------------------------------------

State _State_Debugging

	Event OnSelectST()
		_Debugging = !_Debugging
		SetToggleOptionValueST(Self.SetDebuggingString(), false, "")
		ForcePageReset()
	endEvent

	Event OnHighlightST()

		SetInfoText("Enable this to show EditorID in Highlight box.\n Default: Disabled")
	endEvent
	
endState

String Function SetDebuggingString()

	if _Debugging
		_Status_Return = "Enabled"
	
	else
		_Status_Return = "Disabled"
		
	endif
	
	return _Status_Return
endFunction

String Function GetDebuggingString()

	if _Debugging
		_Status_Return = "Enabled"
	
	else
		_Status_Return = "Disabled"
		
	endif
	
	return _Status_Return
endFunction

;-- Events --------------------------------------

Event _Build_Quests_Pages()
	
	_Allocate_Quests("Main Quests", _ArrayHolder._Array_Name_Main, _ArrayHolder._Array_Toggle_Main)
	_Build_Page_Layout("Main Quests")
	
	_Allocate_Quests("Dawnstar Quests", _ArrayHolder._Array_Name_Dawnstar, _ArrayHolder._Array_Toggle_Dawnstar)
	_Build_Page_Layout("Dawnstar Quests")
	
	_Allocate_Quests("Falkreath Quests", _ArrayHolder._Array_Name_Falkreath, _ArrayHolder._Array_Toggle_Falkreath)
	_Build_Page_Layout("Falkreath Quests")
	
	_Allocate_Quests("Markarth Quests", _ArrayHolder._Array_Name_Markarth, _ArrayHolder._Array_Toggle_Markarth)
	_Build_Page_Layout("Markarth Quests")
	
	_Allocate_Quests("Morthal Quests", _ArrayHolder._Array_Name_Morthal, _ArrayHolder._Array_Toggle_Morthal)
	_Build_Page_Layout("Morthal Quests")
	
	_Allocate_Quests("Riften Quests", _ArrayHolder._Array_Name_Riften, _ArrayHolder._Array_Toggle_Riften)
	_Build_Page_Layout("Riften Quests")
	
	_Allocate_Quests("Solitude Quests", _ArrayHolder._Array_Name_Solitude, _ArrayHolder._Array_Toggle_Solitude)
	_Build_Page_Layout("Solitude Quests")
	
	_Allocate_Quests("Whiterun Quests", _ArrayHolder._Array_Name_Whiterun, _ArrayHolder._Array_Toggle_Whiterun)
	_Build_Page_Layout("Whiterun Quests")
	
	_Allocate_Quests("Windhelm Quests", _ArrayHolder._Array_Name_Windhelm, _ArrayHolder._Array_Toggle_Windhelm)
	_Build_Page_Layout("Windhelm Quests")
	
	_Allocate_Quests("Winterhold Quests", _ArrayHolder._Array_Name_Winterhold, _ArrayHolder._Array_Toggle_Winterhold)
	_Build_Page_Layout("Winterhold Quests")

	_Allocate_Quests("Misc Town Quests", _ArrayHolder._Array_Name_Towns, _ArrayHolder._Array_Toggle_Towns)
	_Build_Page_Layout("Misc Town Quests")
	
	_Allocate_Quests("Dungeon Quests", _ArrayHolder._Array_Name_Dungeons, _ArrayHolder._Array_Toggle_Dungeons)
	_Build_Page_Layout("Dungeon Quests")
	
	_Allocate_Quests("Misc Quests", _ArrayHolder._Array_Name_Misc, _ArrayHolder._Array_Toggle_Misc)
	_Build_Page_Layout("Misc Quests")
	
	_Allocate_Quests("Companions", _ArrayHolder._Array_Name_Companions, _ArrayHolder._Array_Toggle_Companions)
	_Build_Page_Layout("Companions")

	_Allocate_Quests("College of Winterhold", _ArrayHolder._Array_Name_College, _ArrayHolder._Array_Toggle_College)
	_Build_Page_Layout("College of Winterhold")
	
	_Allocate_Quests("Thieves Guild", _ArrayHolder._Array_Name_Thieves, _ArrayHolder._Array_Toggle_Thieves)
	_Build_Page_Layout("Thieves Guild")
	
	_Allocate_Quests("Dark Brotherhood", _ArrayHolder._Array_Name_Brotherhood, _ArrayHolder._Array_Toggle_Brotherhood)
	_Build_Page_Layout("Dark Brotherhood")
	
	_Allocate_Quests("Main Quests (DG)", _ArrayHolder._Array_Name_DGMain, _ArrayHolder._Array_Toggle_DGMain)
	_Build_Page_Layout("Main Quests (DG)")	   

	_Allocate_Quests("Dawnguard", _ArrayHolder._Array_Name_Dawnguard, _ArrayHolder._Array_Toggle_Dawnguard)
	_Build_Page_Layout("Dawnguard")
	
	_Allocate_Quests("Vampires", _ArrayHolder._Array_Name_Vampires, _ArrayHolder._Array_Toggle_Vampires)
	_Build_Page_Layout("Vampires")
	
	_Allocate_Quests("Misc Quests (DG)", _ArrayHolder._Array_Name_DGMisc, _ArrayHolder._Array_Toggle_DGMisc)
	_Build_Page_Layout("Misc Quests (DG)")
	
	_Allocate_Quests("Main Quests (DB)", _ArrayHolder._Array_Name_DBMain, _ArrayHolder._Array_Toggle_DBMain)
	_Build_Page_Layout("Main Quests (DB)")
	
	_Allocate_Quests("Raven Rock Quests", _ArrayHolder._Array_Name_RavenRock, _ArrayHolder._Array_Toggle_RavenRock)
	_Build_Page_Layout("Raven Rock Quests")
	
	_Allocate_Quests("Skaal Village Quests", _ArrayHolder._Array_Name_SkaalVillage, _ArrayHolder._Array_Toggle_SkaalVillage)
	_Build_Page_Layout("Skaal Village Quests")
	
	_Allocate_Quests("Tel Mithryn Quests", _ArrayHolder._Array_Name_TelMithryn, _ArrayHolder._Array_Toggle_TelMithryn)
	_Build_Page_Layout("Tel Mithryn Quests")
	
	_Allocate_Quests("Thirsk Quests", _ArrayHolder._Array_Name_Thirsk, _ArrayHolder._Array_Toggle_Thirsk)
	_Build_Page_Layout("Thirsk Quests")
	
	_Allocate_Quests("Misc Quests (DB)", _ArrayHolder._Array_Name_DBMisc, _ArrayHolder._Array_Toggle_DBMisc)
	_Build_Page_Layout("Misc Quests (DB)")

	_Allocate_Quests("Main Quests (CW)", _ArrayHolder._Array_Name_CWMain, _ArrayHolder._Array_Toggle_CWMain)
	_Build_Page_Layout("Main Quests (CW)")	
endEvent

;-- Events --------------------------------------

Event _Build_Page_Layout(String _Cur_Quest_Page)

	if CurrentPage == _Cur_Quest_Page
	
		SetCursorFillMode(LEFT_TO_RIGHT)
		
		_Position_Left = 0
		_Position_Right = 1
		_Build_Section_Left("Available Quests (Main & Side)", 0, _ArrayHolder._M_Quest_Title_Incomplete, false)
		_Build_Section_Left("Available Quests (Radiant & Favour)", 1, _ArrayHolder._R_Quest_Title_Incomplete, false)	
		
		_Build_Section_Right("Quests (In Progress)", 0, _ArrayHolder._M_Quest_Title_Ongoing, false)			
		_Build_Section_Right("Quests (Completed)", 1, _ArrayHolder._M_Quest_Title_Completed, true)		
		
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
	
	while _Index < _Array_Length && CurrentQuestNames[_Index] != ""
		SetCursorPosition(_Position_Left)
		_ArrayHolder._Array_Quest_Option_ID[_ArrayHolder._Array_Quest_Index] = self.AddToggleOption(CurrentQuestNames[_Index], CurrentQuestState, 0)
		_ArrayHolder._Array_Quest_Option_Name[_ArrayHolder._Array_Quest_Index] = CurrentQuestNames[_Index]
		_ArrayHolder._Array_Quest_ToggleState[_ArrayHolder._Array_Quest_Index] = CurrentQuestState
		_ArrayHolder._Array_Quest_Index += 1
		_Position_Left += 2
		_Index += 1
	endWhile
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
		_ArrayHolder._Array_Quest_Option_ID[_ArrayHolder._Array_Quest_Index] = self.AddToggleOption(CurrentQuestNames[_Index], CurrentQuestState, 0)
		_ArrayHolder._Array_Quest_Option_Name[_ArrayHolder._Array_Quest_Index] = CurrentQuestNames[_Index]
		_ArrayHolder._Array_Quest_ToggleState[_ArrayHolder._Array_Quest_Index] = CurrentQuestState
		_ArrayHolder._Array_Quest_Index += 1
		_Position_Right += 2
	_Index += 1
	endWhile	
endEvent

;-- Events --------------------------------------

Event _SwitchToggleState(String _QuestName, Bool _Quest_Toggle_State)

	if CurrentPage == "Main Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Main, _ArrayHolder._Array_Toggle_Main)
		
	elseIf CurrentPage == "Dawnstar Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Dawnstar, _ArrayHolder._Array_Toggle_Dawnstar)
		
	elseIf CurrentPage == "Falkreath Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Falkreath, _ArrayHolder._Array_Toggle_Falkreath)	
	
	elseIf CurrentPage == "Markarth Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Markarth, _ArrayHolder._Array_Toggle_Markarth)
		
	elseIf CurrentPage == "Morthal Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Morthal, _ArrayHolder._Array_Toggle_Morthal)
		
	elseIf CurrentPage == "Riften Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Riften, _ArrayHolder._Array_Toggle_Riften)
		
	elseIf CurrentPage == "Solitude Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Solitude, _ArrayHolder._Array_Toggle_Solitude)
		
	elseIf CurrentPage == "Whiterun Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Whiterun, _ArrayHolder._Array_Toggle_Whiterun)
		
	elseIf CurrentPage == "Windhelm Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Windhelm, _ArrayHolder._Array_Toggle_Windhelm)
		
	elseIf CurrentPage == "Winterhold Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Winterhold, _ArrayHolder._Array_Toggle_Winterhold)

	elseIf CurrentPage == "Misc Town Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Towns, _ArrayHolder._Array_Toggle_Towns)
	
	elseIf CurrentPage == "Dungeon Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Dungeons, _ArrayHolder._Array_Toggle_Dungeons)
		
	elseIf CurrentPage == "Misc Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Misc, _ArrayHolder._Array_Toggle_Misc)
		
	elseIf CurrentPage == "Companions" 
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Companions, _ArrayHolder._Array_Toggle_Companions)

	elseIf CurrentPage == "College of Winterhold" 
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_College, _ArrayHolder._Array_Toggle_College)
		
	elseIf CurrentPage == "Thieves Guild"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Thieves, _ArrayHolder._Array_Toggle_Thieves)
		
	elseIf CurrentPage == "Dark Brotherhood"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Brotherhood, _ArrayHolder._Array_Toggle_Brotherhood)
		
	elseIf CurrentPage == "Main Quests (DG)"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_DGMain, _ArrayHolder._Array_Toggle_DGMain)	

	elseIf CurrentPage == "Dawnguard" 
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Dawnguard, _ArrayHolder._Array_Toggle_Dawnguard)
		
	elseIf CurrentPage == "Vampires" 
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Vampires, _ArrayHolder._Array_Toggle_Vampires)
		
	elseIf CurrentPage == "Misc Quests (DG)"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_DGMisc, _ArrayHolder._Array_Toggle_DGMisc)
		
	elseIf CurrentPage == "Main Quests (DB)"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_DBMain, _ArrayHolder._Array_Toggle_DBMain)
		
	elseIf CurrentPage == "Raven Rock Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_RavenRock, _ArrayHolder._Array_Toggle_RavenRock)

	elseIf CurrentPage == "Skaal Village Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_SkaalVillage, _ArrayHolder._Array_Toggle_SkaalVillage)
		
	elseIf CurrentPage == "Tel Mithryn Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_TelMithryn, _ArrayHolder._Array_Toggle_TelMithryn)
		
	elseIf CurrentPage == "Thirsk Quests"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_Thirsk, _ArrayHolder._Array_Toggle_Thirsk)
		
	elseIf CurrentPage == "Misc Quests (DB)"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_DBMisc, _ArrayHolder._Array_Toggle_DBMisc)

	elseIf CurrentPage == "Main Quests (CW)"
		_Update_Quest_State(_QuestName, _Quest_Toggle_State, _ArrayHolder._Array_Name_CWMain, _ArrayHolder._Array_Toggle_CWMain)					
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
		Int _Array_Length = _ArrayHolder._Array_Quest_ID.length	
		while _Index < _Array_Length && _ArrayHolder._Array_Quest_Name[_Index] != ""
			Bool userManuallyCompleted = _Player_Toggled(_ArrayHolder._Array_Quest_Name[_Index], _New_QuestName, _New_Toggle_State)	
				if !_ArrayHolder._Array_Quest_Radiant[_Index]
					if !userManuallyCompleted
					quest curQuest = quest.getquest(_ArrayHolder._Array_Quest_ID[_Index])
					Int curQuestStage = curQuest.GetStage()
					Bool isCompleteBasedOnStage = curQuestStage > _ArrayHolder._Array_Stage_Final[_Index]						
						if !curQuest.IsCompleted() && !isCompleteBasedOnStage
							if curQuestStage == 0 || curQuestStage < _ArrayHolder._Array_Stage_First[_Index]
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

Event OnOptionHighlight(Int _Value)
		   
    if _DynamicPageAlloc()
		String _QuestName = _Get_Quest_Name(_Value)
		String _QuestOverview = _Get_Quest_Overview(_Value, _QuestName)
		String _QuestGiver = _Get_Quest_Giver(_Value, _QuestName)
		String _EditorID = _Get_Quest_ID(_Value, _QuestName)
		
		if !_Debugging
			SetInfoText("Quest Giver: " + _QuestGiver + "\nDetails: " + _QuestOverview)
		else
			SetInfoText("Quest Giver: " + _QuestGiver + "\nDetails: " + _QuestOverview + "\nEditorID: " + _EditorID)
		endIf
	endIf
endEvent

;-- Events --------------------------------------

Event OnOptionSelect(Int _Value)

    String _QuestName = _Get_Quest_Name(_Value)
	Bool _Quest_State = _Get_Quest_State(_Value)
	SetToggleOptionValue(_Value, !_Quest_State, false)
	_IDToggleState(_Value, !_Quest_State)
	_SwitchToggleState(_QuestName, !_Quest_State)
	ForcePageReset()	
endEvent

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

Event _Add_Quest_Data(Bool _RadiantQuests, Int _StageFirst, Int _StageFinal, String _EditorID, String _QuestName, String _Cur_Quest_Page, String _QuestGiver, String _QuestOverview)

	if CurrentPage == _Cur_Quest_Page 
		
		_ArrayHolder._Array_Quest_Radiant[_ArrayHolder._Array_Int] = _RadiantQuests
		_ArrayHolder._Array_Stage_First[_ArrayHolder._Array_Int] = _StageFirst
		_ArrayHolder._Array_Stage_Final[_ArrayHolder._Array_Int] = _StageFinal
		_ArrayHolder._Array_Quest_ID[_ArrayHolder._Array_Int] = _EditorID
		_ArrayHolder._Array_Quest_Name[_ArrayHolder._Array_Int] = _QuestName
		_ArrayHolder._Array_Quest_Giver[_ArrayHolder._Array_Int] = _QuestGiver
		_ArrayHolder._Array_Quest_Overview[_ArrayHolder._Array_Int] = _QuestOverview
		_ArrayHolder._Array_Int += 1
		
	endIf
endEvent

;-- EVENTS END ------------------------------------------------------------------------------------------------------------------------------------------------------------