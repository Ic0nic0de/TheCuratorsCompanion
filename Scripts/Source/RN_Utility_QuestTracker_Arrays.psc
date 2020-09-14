scriptname RN_Utility_QuestTracker_Arrays extends quest

RN_Utility_QuestTracker_MCM property MCM auto

String[] property _M_Quest_ID_Ongoing auto hidden
String[] property _M_Quest_ID_Completed auto hidden
String[] property _M_Quest_ID_Incomplete auto hidden

Int property _M_Quest_ID_Index_Ongoing auto hidden
Int property _M_Quest_ID_Index_Completed auto hidden
Int property _M_Quest_ID_Index_Incomplete auto hidden

String[] property _M_Quest_Title_Ongoing auto hidden
String[] property _M_Quest_Title_Completed auto hidden
String[] property _M_Quest_Title_Incomplete auto hidden

Int property _M_Quest_Title_Index_Ongoing auto hidden
Int property _M_Quest_Title_Index_Completed auto hidden
Int property _M_Quest_Title_Index_Incomplete auto hidden

String[] property _R_Quest_ID_Incomplete auto hidden
String[] property _R_Quest_Title_Incomplete auto hidden

Int property _R_Quest_ID_Index_Incomplete auto hidden

String[] property _Array_Name_Museum auto hidden
String[] property _Array_Name_Notes auto hidden
String[] property _Array_Name_Guild auto hidden
String[] property _Array_Name_Misc auto hidden
String[] property _Array_Name_Sanamia auto hidden
String[] property _Array_Name_Falskaar auto hidden
String[] property _Array_Name_Helgen auto hidden
String[] property _Array_Name_Moonpath auto hidden
String[] property _Array_Name_Clockwork auto hidden
String[] property _Array_Name_MoonStar auto hidden
String[] property _Array_Name_ProjectAHO auto hidden
String[] property _Array_Name_Wyrmstooth auto hidden
String[] property _Array_Name_Undeath auto hidden
String[] property _Array_Name_Wheels auto hidden
String[] property _Array_Name_Nocturnal auto hidden
String[] property _Array_Name_Underground auto hidden
String[] property _Array_Name_VigilantActs auto hidden
String[] property _Array_Name_VigilantSide auto hidden
String[] property _Array_Name_VigilantMem auto hidden
String[] property _Array_Name_3DNPC_Main auto hidden
String[] property _Array_Name_3DNPC_BOK auto hidden
String[] property _Array_Name_3DNPC_DS auto hidden
String[] property _Array_Name_3DNPC_Misc auto hidden	
	
String[] property _Array_Quest_ID auto hidden
String[] property _Array_Quest_Name auto hidden
String[] property _Array_Quest_Require auto hidden
String[] property _Array_Quest_Overview auto hidden
String[] property _Array_Quest_Giver auto hidden
String[] property _Array_Quest_Option_Name auto hidden

Bool[] property _Array_Toggle_Museum auto hidden
Bool[] property _Array_Toggle_Notes auto hidden
Bool[] property _Array_Toggle_Guild auto hidden
Bool[] property _Array_Toggle_Misc auto hidden
Bool[] property _Array_Toggle_Sanamia auto hidden
Bool[] property _Array_Toggle_Falskaar auto hidden
Bool[] property _Array_Toggle_Helgen auto hidden
Bool[] property _Array_Toggle_Moonpath auto hidden
Bool[] property _Array_Toggle_Clockwork auto hidden
Bool[] property _Array_Toggle_MoonStar auto hidden
Bool[] property _Array_Toggle_ProjectAHO auto hidden
Bool[] property _Array_Toggle_Undeath auto hidden
Bool[] property _Array_Toggle_Wyrmstooth auto hidden
Bool[] property _Array_Toggle_Wheels auto hidden
Bool[] property _Array_Toggle_Nocturnal auto hidden
Bool[] property _Array_Toggle_Underground auto hidden
Bool[] property _Array_Toggle_VigilantActs auto hidden
Bool[] property _Array_Toggle_VigilantSide auto hidden
Bool[] property _Array_Toggle_VigilantMem auto hidden
Bool[] property _Array_Toggle_3DNPC_Main auto hidden
Bool[] property _Array_Toggle_3DNPC_BOK auto hidden
Bool[] property _Array_Toggle_3DNPC_DS auto hidden
Bool[] property _Array_Toggle_3DNPC_Misc auto hidden

Bool[] property _Array_Quest_Radiant auto hidden
Bool[] property _Array_Quest_ToggleState auto hidden

Int[] property _Array_Stage_First auto hidden           
Int[] property _Array_Stage_Final auto hidden
Int[] property _Array_Quest_Option_ID auto hidden

Int property _Array_Int auto hidden
Int property _Array_Quest_Index auto hidden

;-- Arrays for Quests ---------------------------

String[] property page auto

String[] property Museum_ID auto hidden
String[] property Museum_Name auto hidden
String[] property Museum_Giver auto hidden
String[] property Museum_Reqs auto hidden
String[] property Museum_Notes auto hidden

Bool[] property Museum_Radiant auto hidden
Bool[] property Museum_Spoiler auto hidden

Int[] property Museum_First auto hidden
Int[] property Museum_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Explorer_ID auto hidden
String[] property Explorer_Name auto hidden
String[] property Explorer_Giver auto hidden
String[] property Explorer_Reqs auto hidden
String[] property Explorer_Notes auto hidden

Bool[] property Explorer_Radiant auto hidden
Bool[] property Explorer_Spoiler auto hidden

Int[] property Explorer_First auto hidden
Int[] property Explorer_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Misc_ID auto hidden
String[] property Misc_Name auto hidden
String[] property Misc_Giver auto hidden
String[] property Misc_Reqs auto hidden
String[] property Misc_Notes auto hidden

Bool[] property Misc_Radiant auto hidden
Bool[] property Misc_Spoiler auto hidden

Int[] property Misc_First auto hidden
Int[] property Misc_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Notes_ID auto hidden
String[] property Notes_Name auto hidden
String[] property Notes_Giver auto hidden
String[] property Notes_Reqs auto hidden
String[] property Notes_Notes auto hidden

Bool[] property Notes_Radiant auto hidden
Bool[] property Notes_Spoiler auto hidden

Int[] property Notes_First auto hidden
Int[] property Notes_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Journals_ID auto hidden
String[] property Journals_Name auto hidden
String[] property Journals_Giver auto hidden
String[] property Journals_Reqs auto hidden
String[] property Journals_Notes auto hidden

Bool[] property Journals_Radiant auto hidden
Bool[] property Journals_Spoiler auto hidden

Int[] property Journals_First auto hidden
Int[] property Journals_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Falskaar_ID auto hidden
String[] property Falskaar_Name auto hidden
String[] property Falskaar_Giver auto hidden
String[] property Falskaar_Reqs auto hidden
String[] property Falskaar_Notes auto hidden

Bool[] property Falskaar_Radiant auto hidden
Bool[] property Falskaar_Spoiler auto hidden

Int[] property Falskaar_First auto hidden
Int[] property Falskaar_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Moonpath_ID auto hidden
String[] property Moonpath_Name auto hidden
String[] property Moonpath_Giver auto hidden
String[] property Moonpath_Reqs auto hidden
String[] property Moonpath_Notes auto hidden

Bool[] property Moonpath_Radiant auto hidden
Bool[] property Moonpath_Spoiler auto hidden

Int[] property Moonpath_First auto hidden
Int[] property Moonpath_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Helgen_ID auto hidden
String[] property Helgen_Name auto hidden
String[] property Helgen_Giver auto hidden
String[] property Helgen_Reqs auto hidden
String[] property Helgen_Notes auto hidden

Bool[] property Helgen_Radiant auto hidden
Bool[] property Helgen_Spoiler auto hidden

Int[] property Helgen_First auto hidden
Int[] property Helgen_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Clockwork_ID auto hidden
String[] property Clockwork_Name auto hidden
String[] property Clockwork_Giver auto hidden
String[] property Clockwork_Reqs auto hidden
String[] property Clockwork_Notes auto hidden

Bool[] property Clockwork_Radiant auto hidden
Bool[] property Clockwork_Spoiler auto hidden

Int[] property Clockwork_First auto hidden
Int[] property Clockwork_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property MoonStar_ID auto hidden
String[] property MoonStar_Name auto hidden
String[] property MoonStar_Giver auto hidden
String[] property MoonStar_Reqs auto hidden
String[] property MoonStar_Notes auto hidden

Bool[] property MoonStar_Radiant auto hidden
Bool[] property MoonStar_Spoiler auto hidden

Int[] property MoonStar_First auto hidden
Int[] property MoonStar_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property ProjectAHO_ID auto hidden
String[] property ProjectAHO_Name auto hidden
String[] property ProjectAHO_Giver auto hidden
String[] property ProjectAHO_Reqs auto hidden
String[] property ProjectAHO_Notes auto hidden

Bool[] property ProjectAHO_Radiant auto hidden
Bool[] property ProjectAHO_Spoiler auto hidden

Int[] property ProjectAHO_First auto hidden
Int[] property ProjectAHO_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Underground_ID auto hidden
String[] property Underground_Name auto hidden
String[] property Underground_Giver auto hidden
String[] property Underground_Reqs auto hidden
String[] property Underground_Notes auto hidden

Bool[] property Underground_Radiant auto hidden
Bool[] property Underground_Spoiler auto hidden

Int[] property Underground_First auto hidden
Int[] property Underground_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Nocturnal_ID auto hidden
String[] property Nocturnal_Name auto hidden
String[] property Nocturnal_Giver auto hidden
String[] property Nocturnal_Reqs auto hidden
String[] property Nocturnal_Notes auto hidden

Bool[] property Nocturnal_Radiant auto hidden
Bool[] property Nocturnal_Spoiler auto hidden

Int[] property Nocturnal_First auto hidden
Int[] property Nocturnal_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Wheels_ID auto hidden
String[] property Wheels_Name auto hidden
String[] property Wheels_Giver auto hidden
String[] property Wheels_Reqs auto hidden
String[] property Wheels_Notes auto hidden

Bool[] property Wheels_Radiant auto hidden
Bool[] property Wheels_Spoiler auto hidden

Int[] property Wheels_First auto hidden
Int[] property Wheels_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Undeath_ID auto hidden
String[] property Undeath_Name auto hidden
String[] property Undeath_Giver auto hidden
String[] property Undeath_Reqs auto hidden
String[] property Undeath_Notes auto hidden

Bool[] property Undeath_Radiant auto hidden
Bool[] property Undeath_Spoiler auto hidden

Int[] property Undeath_First auto hidden
Int[] property Undeath_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property Wyrmstooth_ID auto hidden
String[] property Wyrmstooth_Name auto hidden
String[] property Wyrmstooth_Giver auto hidden
String[] property Wyrmstooth_Reqs auto hidden
String[] property Wyrmstooth_Notes auto hidden

Bool[] property Wyrmstooth_Radiant auto hidden
Bool[] property Wyrmstooth_Spoiler auto hidden

Int[] property Wyrmstooth_First auto hidden
Int[] property Wyrmstooth_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property VigilantMain_ID auto hidden
String[] property VigilantMain_Name auto hidden
String[] property VigilantMain_Giver auto hidden
String[] property VigilantMain_Reqs auto hidden
String[] property VigilantMain_Notes auto hidden

Bool[] property VigilantMain_Radiant auto hidden
Bool[] property VigilantMain_Spoiler auto hidden

Int[] property VigilantMain_First auto hidden
Int[] property VigilantMain_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property VigilantSide_ID auto hidden
String[] property VigilantSide_Name auto hidden
String[] property VigilantSide_Giver auto hidden
String[] property VigilantSide_Reqs auto hidden
String[] property VigilantSide_Notes auto hidden

Bool[] property VigilantSide_Radiant auto hidden
Bool[] property VigilantSide_Spoiler auto hidden

Int[] property VigilantSide_First auto hidden
Int[] property VigilantSide_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property VigilantMem_ID auto hidden
String[] property VigilantMem_Name auto hidden
String[] property VigilantMem_Giver auto hidden
String[] property VigilantMem_Reqs auto hidden
String[] property VigilantMem_Notes auto hidden

Bool[] property VigilantMem_Radiant auto hidden
Bool[] property VigilantMem_Spoiler auto hidden

Int[] property VigilantMem_First auto hidden
Int[] property VigilantMem_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property InterestingNPCMain_ID auto hidden
String[] property InterestingNPCMain_Name auto hidden
String[] property InterestingNPCMain_Giver auto hidden
String[] property InterestingNPCMain_Reqs auto hidden
String[] property InterestingNPCMain_Notes auto hidden

Bool[] property InterestingNPCMain_Radiant auto hidden
Bool[] property InterestingNPCMain_Spoiler auto hidden

Int[] property InterestingNPCMain_First auto hidden
Int[] property InterestingNPCMain_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property InterestingNPCBOK_ID auto hidden
String[] property InterestingNPCBOK_Name auto hidden
String[] property InterestingNPCBOK_Giver auto hidden
String[] property InterestingNPCBOK_Reqs auto hidden
String[] property InterestingNPCBOK_Notes auto hidden

Bool[] property InterestingNPCBOK_Radiant auto hidden
Bool[] property InterestingNPCBOK_Spoiler auto hidden

Int[] property InterestingNPCBOK_First auto hidden
Int[] property InterestingNPCBOK_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property InterestingNPCDS_ID auto hidden
String[] property InterestingNPCDS_Name auto hidden
String[] property InterestingNPCDS_Giver auto hidden
String[] property InterestingNPCDS_Reqs auto hidden
String[] property InterestingNPCDS_Notes auto hidden

Bool[] property InterestingNPCDS_Radiant auto hidden
Bool[] property InterestingNPCDS_Spoiler auto hidden

Int[] property InterestingNPCDS_First auto hidden
Int[] property InterestingNPCDS_Final auto hidden

;-- Arrays for Quests ---------------------------

String[] property InterestingNPCMisc_ID auto hidden
String[] property InterestingNPCMisc_Name auto hidden
String[] property InterestingNPCMisc_Giver auto hidden
String[] property InterestingNPCMisc_Reqs auto hidden
String[] property InterestingNPCMisc_Notes auto hidden

Bool[] property InterestingNPCMisc_Radiant auto hidden
Bool[] property InterestingNPCMisc_Spoiler auto hidden

Int[] property InterestingNPCMisc_First auto hidden
Int[] property InterestingNPCMisc_Final auto hidden

;-- Events --------------------------------------

Event OnInit()
	
	_Reset_Arrays()
	_Build_Quest_Toggles()
	_Build_Quest_Arrays()
endEvent
	
;-- Events --------------------------------------

Event _Reset_Arrays()
	
	_Array_Quest_Option_ID = new Int[128]
	_Array_Quest_Option_Name = new String[128]
	_Array_Quest_ToggleState = new Bool[128]
	_Array_Quest_Index = 0
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

Event _Build_Quest_Toggles()
	
	_Array_Name_Museum = new String[128]
	_Array_Toggle_Museum = new Bool[128]

	_Array_Name_Guild = new String[128]
	_Array_Toggle_Guild = new Bool[128]

	_Array_Name_Misc = new String[128]
	_Array_Toggle_Misc = new Bool[128]

	_Array_Name_Notes = new String[128]
	_Array_Toggle_Notes = new Bool[128]

	_Array_Name_Sanamia = new String[128]
	_Array_Toggle_Sanamia = new Bool[128]
	
	_Array_Name_Falskaar = new String[128]
	_Array_Toggle_Falskaar = new Bool[128]

	_Array_Name_Helgen = new String[128]
	_Array_Toggle_Helgen = new Bool[128]

	_Array_Name_Moonpath = new String[128]
	_Array_Toggle_Moonpath = new Bool[128]

	_Array_Name_Clockwork = new String[128]
	_Array_Toggle_Clockwork = new Bool[128]

	_Array_Name_MoonStar = new String[128]
	_Array_Toggle_MoonStar = new Bool[128]

	_Array_Name_ProjectAHO = new String[128]
	_Array_Toggle_ProjectAHO = new Bool[128]

	_Array_Name_Undeath = new String[128]
	_Array_Toggle_Undeath = new Bool[128]

	_Array_Name_Wyrmstooth = new String[128]
	_Array_Toggle_Wyrmstooth = new Bool[128]

	_Array_Name_Wheels = new String[128]
	_Array_Toggle_Wheels = new Bool[128]

	_Array_Name_Nocturnal = new String[128]
	_Array_Toggle_Nocturnal = new Bool[128]

	_Array_Name_Underground = new String[128]
	_Array_Toggle_Underground = new Bool[128]

	_Array_Name_VigilantActs = new String[128]
	_Array_Toggle_VigilantActs = new Bool[128]

	_Array_Name_VigilantSide = new String[128]
	_Array_Toggle_VigilantSide = new Bool[128]

	_Array_Name_VigilantMem = new String[128]
	_Array_Toggle_VigilantMem = new Bool[128]

	_Array_Name_3DNPC_Main = new String[128]
	_Array_Toggle_3DNPC_Main = new Bool[128]

	_Array_Name_3DNPC_BOK = new String[128]
	_Array_Toggle_3DNPC_BOK = new Bool[128]

	_Array_Name_3DNPC_DS = new String[128]
	_Array_Toggle_3DNPC_DS = new Bool[128]

	_Array_Name_3DNPC_Misc = new String[128]
	_Array_Toggle_3DNPC_Misc = new Bool[128]	
endEvent

;-- Events --------------------------------------

Event _Build_Quest_Arrays()		
	
	Museum_ID = new string[14]
	Museum_ID[0] = "DBM_MuseumIntro"
	Museum_ID[1] = "DBM_LALStart"
	Museum_ID[2] = "DBM_RHStartQST"
	Museum_ID[3] = "DBM_GuildMasterStart"
	Museum_ID[4] = "DBM_LALStart"
	Museum_ID[5] = "DBM_HauntedMuseumQuest"
	Museum_ID[6] = "DBM_MuseumHeist"
	Museum_ID[7] = "DBM_ShatteredLegacy"
	Museum_ID[8] = "DBM_WaystoneQuest"
	Museum_ID[9] = "DBM_MoonpathIndarys"
	Museum_ID[10] = "DBM_MuseumIndarysQuest"
	Museum_ID[11] = "DBM_DHQuest"
	Museum_ID[12] = ""
	Museum_ID[13] = ""
	
	Museum_Name = new string[14]
	Museum_Name[0] = "I. An Interesting Prospect"
	Museum_Name[1] = "I. Dragonborn Gallery"
	Museum_Name[2] = "Ia. Akaviri Rising"
	Museum_Name[3] = "Ib. An Interesting Prospect"
	Museum_Name[4] = "Ic. Dragonborn Gallery"
	Museum_Name[5] = "II. Night At The Museum"
	Museum_Name[6] = "III. Shadows Of One's Past"
	Museum_Name[7] = "IV. Shattered Legacy"
	Museum_Name[8] = "V. The Ayleid Crossroads"
	Museum_Name[9] = "VI. It Belongs In A Museum"
	Museum_Name[10] = "VI. It Belongs In A Museum"
	Museum_Name[11] = "The Vaults Of Deepholme (Side)"
	Museum_Name[12] = "Finders Keepers (Radiant)"
	Museum_Name[13] = "Research Project (Radiant)"

	Museum_Giver = new string[14]
	Museum_Giver[0] = "Start this quest by Reading a note in a tavern"
	Museum_Giver[1] = "Automatic Start"
	Museum_Giver[2] = "Automatic Start"
	Museum_Giver[3] = "Automatic Start"
	Museum_Giver[4] = "Automatic Start"
	Museum_Giver[5] = "Visit the museum and speak to 'Brother Ikard'."
	Museum_Giver[6] = "Visit the museum and speak to Avram Shazir."
	Museum_Giver[7] = "Byron"
	Museum_Giver[8] = "Auryen"
	Museum_Giver[9] = "Auryen"
	Museum_Giver[10] = "Auryen"
	Museum_Giver[11] = "Automatic Start - Travel to Deepholme."
	Museum_Giver[12] = "Auryen"
	Museum_Giver[13] = "Use the 'Research Station' in the library."	

	Museum_Reqs = new string[14]
	Museum_Reqs[0] = "No Requirements."
	Museum_Reqs[1] = "No Requirements."
	Museum_Reqs[2] = "No Requirements."
	Museum_Reqs[3] = "Completion of 'Akaviri Rising'."
	Museum_Reqs[4] = "No Requirements, this quest starts after visiting the Museum."
	Museum_Reqs[5] = "Completion of 'An Interesting Prospect' and have reached a display count of 300."
	Museum_Reqs[6] = "Completion of 'An Interesting Prospect' and have reached a display count of 400."
	Museum_Reqs[7] = "Completion of 'Shadows of One's Past' and have reached a display count of 550."
	Museum_Reqs[8] = "Completion of 'Shattered Legacy'."
	Museum_Reqs[9] = "Completion of 'An Interesting Prospect' and have reached a display count of 70."
	Museum_Reqs[10] = "Completion of 'An Interesting Prospect' and have reached a display count of 70."
	Museum_Reqs[11] = "Completion of 'Shadows of One's Past' and 'Digging Up Explorers'."
	Museum_Reqs[12] = "No Requirements."
	Museum_Reqs[13] = "Research Points currency."	

	Museum_Notes = new string[14]
	Museum_Notes[0] = "NOTE: This is the 'Vanilla' starting quest."
	Museum_Notes[1] = "NOTE: This is the 'Live Another Life' starting quest."
	Museum_Notes[2] = "NOTE: This is the 'GuildMaster' starting quest."
	Museum_Notes[3] = "NOTE: This quest will update in the MCM after speaking with Auryen."
	Museum_Notes[4] = ""
	Museum_Notes[5] = ""
	Museum_Notes[6] = "NOTE: If 'Night At The Museum' is currently ongoing it will need to be completed first before this quest can start."
	Museum_Notes[7] = "NOTE: The main quest 'The Way of the Voice' has to be completed."
	Museum_Notes[8] = "NOTE: Auryen will speak to you when returning to the museum after completing 'Shattered Legacy'."
	Museum_Notes[9] = "NOTE: Minimum level of 18 required."
	Museum_Notes[10] = "NOTE: Minimum level of 18 required."
	Museum_Notes[11] = ""
	Museum_Notes[12] = "NOTE: it takes 5 days for this quest to be available again."
	Museum_Notes[13] = "NOTE: Researching for a new item before completing the previous one will forfeit the Points spent to research it."	

	Museum_First = new int[14]	
	Museum_First[0] = 5	
	Museum_First[1] = 5
	Museum_First[2] = 10
	Museum_First[3] = 0
	Museum_First[4] = 5
	Museum_First[5] = 6
	Museum_First[6] = 10
	Museum_First[7] = 10
	Museum_First[8] = 5
	Museum_First[9] = 0
	Museum_First[10] = 0
	Museum_First[11] = 5
	Museum_First[12] = -999
	Museum_First[13] = -999
	
	Museum_Final = new int[14]	
	Museum_Final[0] = 110	
	Museum_Final[1] = 35
	Museum_Final[2] = 40
	Museum_Final[3] = 40
	Museum_Final[4] = 35
	Museum_Final[5] = 110
	Museum_Final[6] = 60
	Museum_Final[7] = 300
	Museum_Final[8] = 20
	Museum_Final[9] = 10
	Museum_Final[10] = 100
	Museum_Final[11] = 50
	Museum_Final[12] = 999
	Museum_Final[13] = 999	

	Museum_Radiant = new bool[14]
	Museum_Radiant[0] = false
	Museum_Radiant[1] = false
	Museum_Radiant[2] = false
	Museum_Radiant[3] = false
	Museum_Radiant[4] = false
	Museum_Radiant[5] = false
	Museum_Radiant[6] = false
	Museum_Radiant[7] = false
	Museum_Radiant[8] = false
	Museum_Radiant[9] = false
	Museum_Radiant[10] = false
	Museum_Radiant[11] = false
	Museum_Radiant[12] = true
	Museum_Radiant[13] = true

	Museum_Spoiler = new bool[14]
	Museum_Spoiler[0] = false
	Museum_Spoiler[1] = false
	Museum_Spoiler[2] = false
	Museum_Spoiler[3] = false
	Museum_Spoiler[4] = false
	Museum_Spoiler[5] = false
	Museum_Spoiler[6] = false
	Museum_Spoiler[7] = false
	Museum_Spoiler[8] = false
	Museum_Spoiler[9] = false
	Museum_Spoiler[10] = false
	Museum_Spoiler[11] = true
	Museum_Spoiler[12] = false
	Museum_Spoiler[13] = false
	
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------

	Explorer_ID = new string[16]
	Explorer_ID[0] = "DBM_ExplorerGuildHouse"
	Explorer_ID[1] = "DBM_ExplorerGuildmembers"
	Explorer_ID[2] = "DBM_Excavation01"
	Explorer_ID[3] = "DBM_Excavation02"
	Explorer_ID[4] = "DBM_Excavation03Prelude"
	Explorer_ID[5] = "DBM_Excavation03A"
	Explorer_ID[6] = "DBM_HrormirStaffQuest"
	Explorer_ID[7] = "DBM_PlanetariumQuest"
	Explorer_ID[8] = "DBM_MalrusCodexQST"
	Explorer_ID[9] = "DBM_ExplorerRelicFindQST"
	Explorer_ID[10] = "DBM_ExplorerFieldStation01"
	Explorer_ID[11] = "DBM_ExplorerFieldStation02"
	Explorer_ID[12] = "DBM_ExplorerFieldStation03"
	Explorer_ID[13] = ""
	Explorer_ID[14] = ""
	Explorer_ID[15] = ""

	Explorer_Name = new string[16]
	Explorer_Name[0] = "I. A Room With A View"
	Explorer_Name[1] = "II. Digging Up Explorers"
	Explorer_Name[2] = "III. The Excavation of Windcaller Pass"
	Explorer_Name[3] = "IV. The Excavation of the Ruins of Rkund"
	Explorer_Name[4] = "V. The Visage"
	Explorer_Name[5] = "VI. Trial Of Trinimac"
	Explorer_Name[6] = "Eternal Ice (Side)"
	Explorer_Name[7] = "A Path To The Heavens (Side)"
	Explorer_Name[8] = "The Book Of Wonders (Side)"
	Explorer_Name[9] = "Tools Of The Trade (Side)"
	Explorer_Name[10] = "Branching Out (Side)"
	Explorer_Name[11] = "Branching Out... Again (Side)"
	Explorer_Name[12] = "Branching Out... Ever More (Side)"
	Explorer_Name[13] = "One Man's Junk (Radiant)"
	Explorer_Name[14] = "Kyre's Ore Prospect (Radiant)"
	Explorer_Name[15] = "Relic Hunt (Radiant)"

	Explorer_Giver = new string[16]
	Explorer_Giver[0] = "Auryen"
	Explorer_Giver[1] = "Read the note on the desk inside the Guild House."
	Explorer_Giver[2] = "Marassi"
	Explorer_Giver[3] = "Marassi"
	Explorer_Giver[4] = "Ghost outside Greenwall Cave."
	Explorer_Giver[5] = "Automatic Start"
	Explorer_Giver[6] = "Automatic Start"
	Explorer_Giver[7] = "Automatic Start"
	Explorer_Giver[8] = "Automatic Start"
	Explorer_Giver[9] = "Automatic Start - Read Kamahl's Map."
	Explorer_Giver[10] = "Marassi"
	Explorer_Giver[11] = "Marassi"
	Explorer_Giver[12] = "Marassi"
	Explorer_Giver[13] = "Latoria"
	Explorer_Giver[14] = "Kyre"
	Explorer_Giver[15] = "Automatic Start"

	Explorer_Reqs = new string[16]
	Explorer_Reqs[0] = "Must have a display count of at least 150."
	Explorer_Reqs[1] = "Completion of 'A Room with a View'."
	Explorer_Reqs[2] = "Completion of 'Shadows of One's Past' and have reached a display count of 400."
	Explorer_Reqs[3] = "Quest available 10 days after 'The Excavation of Windcaller Pass'."
	Explorer_Reqs[4] = "Completion of 'Much Ado About Snow Elves' and 'The Excavation of the Ruins of Rkund'."
	Explorer_Reqs[5] = "Quest available three days after the end of The Visage."
	Explorer_Reqs[6] = "Must have started the 'Excavation of Windcaller Pass'."
	Explorer_Reqs[7] = "Find the Dwemer Schematics in Karagas' Tower."
	Explorer_Reqs[8] = "Automatic Start - Read Malrus's Journal."
	Explorer_Reqs[9] = "Completion of 'A Room with a View' and 'Digging Up Explorers'."
	Explorer_Reqs[10] = "Completion of 'Under Saarthal' and 'Digging Up Explorers'."
	Explorer_Reqs[11] = "Completion of 'Escape from Cidhna Mine'."
	Explorer_Reqs[12] = "Completion of 'Forbidden Legend'."
	Explorer_Reqs[13] = "Completion of 'Digging Up Explorers'."
	Explorer_Reqs[14] = "Completion of 'Digging Up Explorers'."
	Explorer_Reqs[15] = "No Requirements"	

	Explorer_Notes = new string[16]
	Explorer_Notes[0] = ""
	Explorer_Notes[1] = "NOTE: Sometimes the explorers after being spoken to, will not be recruited and must be spoken to again."
	Explorer_Notes[2] = "NOTE: The dragon fight at the Tower west of Whiterun has to be completed for this quest to start."
	Explorer_Notes[3] = ""
	Explorer_Notes[4] = "NOTE: It is recommended to first complete all three of the Field stations as they become unavailable later on, the ghost can be found outside Greenwall Cave, near Fort Greenwall (north of Riften)."
	Explorer_Notes[5] = "NOTE: In order to complete this quest, you will need access to the Glacial Crevice in the Forgotten Vale."
	Explorer_Notes[6] = "NOTE: During the excavation of Windcaller Pass, six shards can be found, this quest will start after picking up the first one."
	Explorer_Notes[7] = ""
	Explorer_Notes[8] = ""
	Explorer_Notes[9] = "Fun Fact: The relics and names of the explorers actually relate to members of the development team or key contributors to Legacy of the Dragonborn's development."
	Explorer_Notes[10] = ""
	Explorer_Notes[11] = ""
	Explorer_Notes[12] = ""
	Explorer_Notes[13] = "NOTE: This quest will reward you with a random treasure map, book or spell scrolls."
	Explorer_Notes[14] = ""
	Explorer_Notes[15] = "NOTE: Either use 'Schneider's Sextant' or the 'Locate Relic' power."

	Explorer_First = new int[16]	
	Explorer_First[0] = 5	
	Explorer_First[1] = 5
	Explorer_First[2] = 5
	Explorer_First[3] = 5
	Explorer_First[4] = 1
	Explorer_First[5] = 5
	Explorer_First[6] = 5
	Explorer_First[7] = 0
	Explorer_First[8] = 5
	Explorer_First[9] = 5
	Explorer_First[10] = 5
	Explorer_First[11] = 5
	Explorer_First[12] = 5
	Explorer_First[13] = -999
	Explorer_First[14] = -999
	Explorer_First[15] = -999
	
	Explorer_Final = new int[16]	
	Explorer_Final[0] = 100
	Explorer_Final[1] = 100
	Explorer_Final[2] = 150
	Explorer_Final[3] = 140
	Explorer_Final[4] = 15
	Explorer_Final[5] = 350
	Explorer_Final[6] = 40
	Explorer_Final[7] = 50
	Explorer_Final[8] = 100
	Explorer_Final[9] = 10
	Explorer_Final[10] = 16
	Explorer_Final[11] = 17
	Explorer_Final[12] = 16
	Explorer_Final[13] = 999	
	Explorer_First[14] = 999
	Explorer_First[15] = 999

	Explorer_Radiant = new bool[16]
	Explorer_Radiant[0] = false
	Explorer_Radiant[1] = false
	Explorer_Radiant[2] = false
	Explorer_Radiant[3] = false
	Explorer_Radiant[4] = false
	Explorer_Radiant[5] = false
	Explorer_Radiant[6] = false
	Explorer_Radiant[7] = false
	Explorer_Radiant[8] = false
	Explorer_Radiant[9] = false
	Explorer_Radiant[10] = false
	Explorer_Radiant[11] = false
	Explorer_Radiant[12] = false
	Explorer_Radiant[13] = true
	Explorer_Radiant[14] = true
	Explorer_Radiant[15] = true

	Explorer_Spoiler = new bool[16]
	Explorer_Spoiler[0] = false
	Explorer_Spoiler[1] = false
	Explorer_Spoiler[2] = false
	Explorer_Spoiler[3] = false
	Explorer_Spoiler[4] = false
	Explorer_Spoiler[5] = false
	Explorer_Spoiler[6] = true
	Explorer_Spoiler[7] = true
	Explorer_Spoiler[8] = true
	Explorer_Spoiler[9] = false
	Explorer_Spoiler[10] = false
	Explorer_Spoiler[11] = false
	Explorer_Spoiler[12] = false
	Explorer_Spoiler[13] = false
	Explorer_Spoiler[14] = false
	Explorer_Spoiler[15] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
	
	Misc_ID = new string[8]
	Misc_ID[0] = "DBM_HOSDiscoveryQST"
	Misc_ID[1] = "DBM_MuchAdoAboutSnowElves"
	Misc_ID[2] = "DBM_HandofGloryQuest"
	Misc_ID[3] = "DBM_HOGCleanseQuest"
	Misc_ID[4] = "DBM_OngarKegbreaker"
	Misc_ID[5] = "DBM_ImbuningMachine"
	Misc_ID[6] = "DBM_LordsMailQuest"
	Misc_ID[7] = "DBM_KOTNQuest"

	Misc_Name = new string[8]
	Misc_Name[0] = "Auryen Morellus And The Chamber Of Secrets"
	Misc_Name[1] = "Much Ado About Snow Elves"
	Misc_Name[2] = "The Hand Of Glory"
	Misc_Name[3] = "Breaking The Curse"
	Misc_Name[4] = "Ongar's Kegbreaker"
	Misc_Name[5] = "Back To The Drawing Board"
	Misc_Name[6] = "Lord's Mail"
	Misc_Name[7] = "Guardians Of The Divine"

	Misc_Giver = new string[8]
	Misc_Giver[0] = "Automatic Start - Find the hidden chamber."
	Misc_Giver[1] = "Courier - Read the note from Calcelmo."
	Misc_Giver[2] = "Greigor of the Dark Brotherhood"
	Misc_Giver[3] = "Automatic Start - Read Greigor's Journal."
	Misc_Giver[4] = "Ongar Brewer (Nightgate Inn)"
	Misc_Giver[5] = "Automatic Start - Travel to 'White Ridge Barrow'."
	Misc_Giver[6] = "Read the writ of execution in 'Penitus Oculatus Outpost'."
	Misc_Giver[7] = "Read the book 'Lost Wonders of the Ages Vol. 3'."

	Misc_Reqs = new string[8]
	Misc_Reqs[0] = "No Requirements."
	Misc_Reqs[1] = "Completion of 'The Lost Expedition'."
	Misc_Reqs[2] = "Access to the Dark Brotherhood Sanctuary."
	Misc_Reqs[3] = "Completion of 'The Hand Of Glory'."
	Misc_Reqs[4] = "No Requirements."
	Misc_Reqs[5] = "Access to the Safehouse."
	Misc_Reqs[6] = "No Requirements."
	Misc_Reqs[7] = "No Requirements."
	
	Misc_Notes = new string[8]
	Misc_Notes[0] = "NOTE: Take a stroll in 'Dragonborn Hall'."
	Misc_Notes[1] = "NOTE: This quest has 3 paths to take, it is recommended to do them in order to avoid backtracking."
	Misc_Notes[2] = "NOTE: If you decide to destroy the Dark Brotherhood, you must be careful to not kill everyone inside before finishing the quest."
	Misc_Notes[3] = ""
	Misc_Notes[4] = "Note: This quest comes in two variations:\n One if you have less then 60 skill points in smithing, the other if you have more than 60 skill points in smithing."
	Misc_Notes[5] = "NOTE: This quest will add the 'Imbuing Machine' to the Safehouse."
	Misc_Notes[6] = "NOTE: Lord's Mail is needed for another quest."
	Misc_Notes[7] = "NOTE: This quest can also be started by finding any of the artifacts although\n it is recommended to start this quest by reading the book."

	Misc_First = new int[8]	
	Misc_First[0] = 5
	Misc_First[1] = 5
	Misc_First[2] = 5
	Misc_First[3] = 5
	Misc_First[4] = 20
	Misc_First[5] = 10
	Misc_First[6] = 10
	Misc_First[7] = 5
	
	Misc_Final = new int[8]	
	Misc_Final[0] = 15
	Misc_Final[1] = 500
	Misc_Final[2] = 30
	Misc_Final[3] = 15
	Misc_Final[4] = 35
	Misc_Final[5] = 20
	Misc_Final[6] = 100
	Misc_Final[7] = 50

	Misc_Radiant = new bool[8]
	Misc_Radiant[0] = false
	Misc_Radiant[1] = false
	Misc_Radiant[2] = false
	Misc_Radiant[3] = false
	Misc_Radiant[4] = false
	Misc_Radiant[5] = false
	Misc_Radiant[6] = false
	Misc_Radiant[7] = false
	
	Misc_Spoiler = new bool[8]
	Misc_Spoiler[0] = true
	Misc_Spoiler[1] = false
	Misc_Spoiler[2] = false
	Misc_Spoiler[3] = false
	Misc_Spoiler[4] = false
	Misc_Spoiler[5] = true
	Misc_Spoiler[6] = false
	Misc_Spoiler[7] = true
	
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Notes_ID = new string[10]
	Notes_ID[0] = "DBM_AMJournalQST01"
	Notes_ID[1] = "DBM_AMJournalQST02"
	Notes_ID[2] = "DBM_AMJournalQST03"
	Notes_ID[3] = "DBM_AMJournalQST04"
	Notes_ID[4] = "DBM_AMJournalQST05"
	Notes_ID[5] = "DBM_AMJournalQST06"
	Notes_ID[6] = "DBM_AMJournalQST07"
	Notes_ID[7] = "DBM_AMJournalQST08"
	Notes_ID[8] = "DBM_AMJournalQST09"
	Notes_ID[9] = "DBM_AMJournalQST10"

	Notes_Name = new string[10]
	Notes_Name[0] = "Auryen's Notes: Dagger Of Symmachus"
	Notes_Name[1] = "Auryen's Notes: Cyrus' Saber"
	Notes_Name[2] = "Auryen's Notes: Orgnum's Coffer"
	Notes_Name[3] = "Auryen's Notes: Ice Blade Of The Monarch"
	Notes_Name[4] = "Auryen's Notes: Shalidor's Stone"
	Notes_Name[5] = "Auryen's Notes: The Bloodworm Helm"
	Notes_Name[6] = "Auryen's Notes: The Warlock's Ring"
	Notes_Name[7] = "Auryen's Notes: The Dragonmail Cuirass"
	Notes_Name[8] = "Auryen's Notes: The Fists Of Randagulf"
	Notes_Name[9] = "Auryen's Notes: The Tools Of Kagrenac"

	Notes_Giver = new string[10]
	Notes_Giver[0] = "Read Auryen's Note"
	Notes_Giver[1] = "Read Auryen's Note"
	Notes_Giver[2] = "Read Auryen's Note"
	Notes_Giver[3] = "Read Auryen's Note"
	Notes_Giver[4] = "Read Auryen's Note"
	Notes_Giver[5] = "Read Auryen's Note"
	Notes_Giver[6] = "Read Auryen's Note"
	Notes_Giver[7] = "Read Auryen's Note"
	Notes_Giver[8] = "Read Auryen's Note"
	Notes_Giver[9] = "Read Auryen's Note"

	Notes_Reqs = new string[10]
	Notes_Reqs[0] = "Access to Solstheim."
	Notes_Reqs[1] = "No Requirements."
	Notes_Reqs[2] = "No Requirements."
	Notes_Reqs[3] = "No Requirements."
	Notes_Reqs[4] = "No Requirements."
	Notes_Reqs[5] = "No Requirements."
	Notes_Reqs[6] = "No Requirements."
	Notes_Reqs[7] = "Access to Solstheim."
	Notes_Reqs[8] = "No Requirements."
	Notes_Reqs[9] = "Access to Solstheim."
	
	Notes_Notes = new string[10]
	Notes_Notes[0] = "NOTE: 10 days must have passed since you visited the Museum and\n talked to Auryen Morellus for the first time."
	Notes_Notes[1] = "NOTE: If you already picked up Cyrus' Saber before reading the note, the quest finishes instantly with a different journal entry."
	Notes_Notes[2] = "NOTE: If you already picked up the King Orgnum's Coffer before reading the note, the quest finishes instantly with a different journal entry."
	Notes_Notes[3] = "NOTE: If you already picked up the Ice Blade of the Monarch before reading the note, the quest finishes instantly with a different journal entry."
	Notes_Notes[4] = "NOTE: If you already picked up Shalidor's Stone before reading the note, the quest finishes instantly with a different journal entry."
	Notes_Notes[5] = "NOTE: If you already picked up the Bloodworm Helm before reading the note, the quest finishes instantly with a different journal entry."
	Notes_Notes[6] = "Note: If you already picked up the Warlock's Ring before reading the note, the quest finishes instantly with a different journal entry."
	Notes_Notes[7] = "Note: If you already picked up the Dragonmail Cuirass before reading the note, the quest finishes instantly with a different journal entry."
	Notes_Notes[8] = "Note: Either steal the gloves from the master locked display in the corridor to the left of the throne room\n or either bribe or persuade Falk Firebeard to let you have the gloves."
	Notes_Notes[9] = "Note: If you already picked up Sunder, Wraithguard and Keening before reading the note, the quest finishes instantly with a different journal entry."

	Notes_First = new int[10]	
	Notes_First[0] = 10
	Notes_First[1] = 10
	Notes_First[2] = 10
	Notes_First[3] = 10
	Notes_First[4] = 10
	Notes_First[5] = 10
	Notes_First[6] = 10
	Notes_First[7] = 10
	Notes_First[8] = 10
	Notes_First[9] = 10

	Notes_Final = new int[10]	
	Notes_Final[0] = 50
	Notes_Final[1] = 50
	Notes_Final[2] = 50
	Notes_Final[3] = 50
	Notes_Final[4] = 50
	Notes_Final[5] = 50
	Notes_Final[6] = 50
	Notes_Final[7] = 50
	Notes_Final[8] = 30
	Notes_Final[9] = 50
	
	Notes_Radiant = new bool[10]
	Notes_Radiant[0] = false
	Notes_Radiant[1] = false
	Notes_Radiant[2] = false
	Notes_Radiant[3] = false
	Notes_Radiant[4] = false
	Notes_Radiant[5] = false
	Notes_Radiant[6] = false
	Notes_Radiant[7] = false
	Notes_Radiant[8] = false
	Notes_Radiant[9] = false
	
	Notes_Spoiler = new bool[10]
	Notes_Spoiler[0] = false
	Notes_Spoiler[1] = false
	Notes_Spoiler[2] = false
	Notes_Spoiler[3] = false
	Notes_Spoiler[4] = false
	Notes_Spoiler[5] = false
	Notes_Spoiler[6] = false
	Notes_Spoiler[7] = false
	Notes_Spoiler[8] = false
	Notes_Spoiler[9] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Journals_ID = new string[6]
	Journals_ID[0] = "DBM_JournalDungeon01QST"
	Journals_ID[1] = "DBM_JournalDungeon02QST"
	Journals_ID[2] = "DBM_JournalDungeon03QST"
	Journals_ID[3] = "DBM_JournalDungeon04QST"
	Journals_ID[4] = "DBM_JournalDungeon05QST"
	Journals_ID[5] = "DBM_GhostChestQST"

	Journals_Name = new string[6]
	Journals_Name[0] = "Sanamia's Journals: Mzulft"
	Journals_Name[1] = "Sanamia's Journals: Valthume"
	Journals_Name[2] = "Sanamia's Journals: Fort Frostmoth"
	Journals_Name[3] = "Sanamia's Journals: Lake Ilinalta"
	Journals_Name[4] = "Sanamia's Journals: Burial Ruin"
	Journals_Name[5] = "Sanamia's Journals: The Phantom Cache"

	Journals_Giver = new string[6]
	Journals_Giver[0] = "Read the journal found in the Smugglers hold of the Dev Aveza."
	Journals_Giver[1] = "Read the journal found in Broken Tusk Mine."
	Journals_Giver[2] = "Read the journal found in Dead Drop Falls."
	Journals_Giver[3] = "Read the journal found in Arcwind Point."
	Journals_Giver[4] = "Read the journal found in Thirsk Mead Hall."
	Journals_Giver[5] = "Read the journal found in a Riekling camp north of Solstheim."

	Journals_Reqs = new string[6]
	Journals_Reqs[0] = "Access to the Dev Aveza."
	Journals_Reqs[1] = "Access to Solstheim."
	Journals_Reqs[2] = "No Requirements."
	Journals_Reqs[3] = "No Requirements."
	Journals_Reqs[4] = "Access to Solstheim."
	Journals_Reqs[5] = "Access to Solstheim."

	Journals_Notes = new string[6]
	Journals_Notes[0] = ""
	Journals_Notes[1] = ""
	Journals_Notes[2] = ""
	Journals_Notes[3] = ""
	Journals_Notes[4] = ""
	Journals_Notes[5] = ""

	Journals_First = new int[6]	
	Journals_First[0] = 5
	Journals_First[1] = 5
	Journals_First[2] = 5
	Journals_First[3] = -5
	Journals_First[4] = 5
	Journals_First[5] = 10

	Journals_Final = new int[6]	
	Journals_Final[0] = 10
	Journals_Final[1] = 10
	Journals_Final[2] = 10
	Journals_Final[3] = 10
	Journals_Final[4] = 10
	Journals_Final[5] = 20

	Journals_Radiant = new bool[6]
	Journals_Radiant[0] = false
	Journals_Radiant[1] = false
	Journals_Radiant[2] = false
	Journals_Radiant[3] = false
	Journals_Radiant[4] = false
	Journals_Radiant[5] = false

	Journals_Spoiler = new bool[6]
	Journals_Spoiler[0] = false
	Journals_Spoiler[1] = false
	Journals_Spoiler[2] = false
	Journals_Spoiler[3] = false
	Journals_Spoiler[4] = false
	Journals_Spoiler[5] = true

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Falskaar_ID = new string[26]
	Falskaar_ID[0] = "FSMQ01"
	Falskaar_ID[1] = "FSMQ02"
	Falskaar_ID[2] = "FSMQ03"
	Falskaar_ID[3] = "FSMQ04"
	Falskaar_ID[4] = "FSMQ05"
	Falskaar_ID[5] = "FSMQ06"
	Falskaar_ID[6] = "FSMQ07"
	Falskaar_ID[7] = "FSMQ08"
	Falskaar_ID[8] = "FSMQ09"
	Falskaar_ID[9] = "FSSQ11"
	Falskaar_ID[10] = "FSSQ08"
	Falskaar_ID[11] = "FSSQ06"
	Falskaar_ID[12] = "FSSQ05"
	Falskaar_ID[13] = "FSSQ09"
	Falskaar_ID[14] = "FSSQ10"
	Falskaar_ID[15] = "FSSQ02"
	Falskaar_ID[16] = "FSSQ01"
	Falskaar_ID[17] = "FSSQ07"
	Falskaar_ID[18] = "FSSQ13"
	Falskaar_ID[19] = "FSSQ12"
	Falskaar_ID[20] = "FSSQ04"
	Falskaar_ID[21] = "FSSQ16"
	Falskaar_ID[22] = "FSSQ17"
	Falskaar_ID[23] = "FSSQ15"
	Falskaar_ID[24] = "FSSQ14"
	Falskaar_ID[25] = "FSSQ03"

	Falskaar_Name = new string[26]
	Falskaar_Name[0] = "I. An Ancient Gate"
	Falskaar_Name[1] = "II. Welcome To Falskaar"
	Falskaar_Name[2] = "III. An Army Of Greed"
	Falskaar_Name[3] = "IV. Warning Valfred"
	Falskaar_Name[4] = "V. Strength And Wisdom"
	Falskaar_Name[5] = "VI. Lost Knowledge"
	Falskaar_Name[6] = "VII. Fort Urokk"
	Falskaar_Name[7] = "VIII. Returning The Favor"
	Falskaar_Name[8] = "IX. The Heart Of The Gods"
	Falskaar_Name[9] = "A Craftsman's Finest (Side)"
	Falskaar_Name[10] = "A Fortunate Find (Side)"
	Falskaar_Name[11] = "A Present From The Past (Side)"
	Falskaar_Name[12] = "A Special Kind Of Berry (Side)"
	Falskaar_Name[13] = "Kind Blood (Side)"
	Falskaar_Name[14] = "Old Friends (Side)"
	Falskaar_Name[15] = "Passage Home (Side)"
	Falskaar_Name[16] = "Rough Waters (Side)"
	Falskaar_Name[17] = "Songs Of The Dead (Side)"
	Falskaar_Name[18] = "The Crusher's End (Side)"
	Falskaar_Name[19] = "The Forgotten Depths (Side)"
	Falskaar_Name[20] = "The Lady In The Lighthouse (Side)"
	Falskaar_Name[21] = "(Daedric) Dread Aura"
	Falskaar_Name[22] = "(Daedric) Dreams In Oblivion"
	Falskaar_Name[23] = "(Daedric) No Harm, No Fowl"
	Falskaar_Name[24] = "(Daedric) Runaway Cattle"
	Falskaar_Name[25] = "(Daedric) The Deadliest Catch"

	Falskaar_Giver = new string[26]
	Falskaar_Giver[0] = "Jalamar (Riften)"
	Falskaar_Giver[1] = "Automatic Start during 'An Ancient Gate'"
	Falskaar_Giver[2] = "Jarl Agnar (Amber Creek)"
	Falskaar_Giver[3] = "Jarl Agnar (Amber Creek)"
	Falskaar_Giver[4] = "Jarl Agnar (Amber Creek)"
	Falskaar_Giver[5] = "Brother Thorlogh"
	Falskaar_Giver[6] = "Jarl Agnar (Amber Creek)"
	Falskaar_Giver[7] = "Jarl Agnar (Amber Creek)"
	Falskaar_Giver[8] = "Automatic Start"
	Falskaar_Giver[9] = "Rangarr (Amber Creek)"
	Falskaar_Giver[10] = "Automatic Start"
	Falskaar_Giver[11] = "Henrik (Falskaar Docks)"
	Falskaar_Giver[12] = "Freya (Falskaar Docks)"
	Falskaar_Giver[13] = "Kalevi (Amber Creek)"
	Falskaar_Giver[14] = "Oudin (Amber Creek)"
	Falskaar_Giver[15] = "Wulf (Falskaar Docks)"
	Falskaar_Giver[16] = "Automatic Start - (Falskaar Docks)"
	Falskaar_Giver[17] = "Automatic Start"
	Falskaar_Giver[18] = "Helena (Audmund's Farm)"
	Falskaar_Giver[19] = "Jalma (Amber Creek)"
	Falskaar_Giver[20] = "Wulf (Falskaar Docks)"
	Falskaar_Giver[21] = "Klara (Amber Creek)"
	Falskaar_Giver[22] = "Brother Arnand (Bailun Priory)"
	Falskaar_Giver[23] = "Kunnari (Amber Creek)"
	Falskaar_Giver[24] = "Audmund (Audmund's Farm)"
	Falskaar_Giver[25] = "Galen (Falskaar Docks)"

	Falskaar_Reqs = new string[26]
	Falskaar_Reqs[0] = "No Requirements"
	Falskaar_Reqs[1] = "No Requirements"
	Falskaar_Reqs[2] = "No Requirements"
	Falskaar_Reqs[3] = "No Requirements"
	Falskaar_Reqs[4] = "No Requirements"
	Falskaar_Reqs[5] = "No Requirements"
	Falskaar_Reqs[6] = "No Requirements"
	Falskaar_Reqs[7] = "No Requirements"
	Falskaar_Reqs[8] = "No Requirements"
	Falskaar_Reqs[9] = "No Requirements"
	Falskaar_Reqs[10] = "No Requirements"
	Falskaar_Reqs[11] = "No Requirements"
	Falskaar_Reqs[12] = "No Requirements"
	Falskaar_Reqs[13] = "No Requirements"
	Falskaar_Reqs[14] = "No Requirements"
	Falskaar_Reqs[15] = "No Requirements"
	Falskaar_Reqs[16] = "No Requirements"
	Falskaar_Reqs[17] = "No Requirements"
	Falskaar_Reqs[18] = "No Requirements"
	Falskaar_Reqs[19] = "No Requirements"
	Falskaar_Reqs[20] = "No Requirements"
	Falskaar_Reqs[21] = "No Requirements"
	Falskaar_Reqs[22] = "No Requirements"
	Falskaar_Reqs[23] = "No Requirements"
	Falskaar_Reqs[24] = "No Requirements"
	Falskaar_Reqs[25] = "No Requirements"	

	Falskaar_Notes = new string[26]
	Falskaar_Notes[0] = "NOTE: Very rarely, it is possible for Jalamar to be found dead or missing from Riften, this does not break the quest however, just head to 'Echo Deep Mine' and continue through there, as picking up the lexicon will start the quest."
	Falskaar_Notes[1] = ""
	Falskaar_Notes[2] = ""
	Falskaar_Notes[3] = "NOTE: Sometimes the game will crash after jumping into the pond, Reloading the game fixes this."
	Falskaar_Notes[4] = ""
	Falskaar_Notes[5] = "NOTE: If the dialogue at the end of the quest is skipped, the next quest will not start."
	Falskaar_Notes[6] = ""
	Falskaar_Notes[7] = "NOTE: Sometimes, after taking down the Emerald Soldier's and speaking to Ulgar to attack Staalgarde, the screen will fade to black and the game will crash."
	Falskaar_Notes[8] = "NOTE: It is possible that, after waiting a few hours and then entering the temple, the required NPCs will still not enter the temple."
	Falskaar_Notes[9] = ""
	Falskaar_Notes[10] = "NOTE: There is more than one way to trigger this quest, talk to everyone you can."
	Falskaar_Notes[11] = ""
	Falskaar_Notes[12] = ""
	Falskaar_Notes[13] = ""
	Falskaar_Notes[14] = ""
	Falskaar_Notes[15] = "NOTE: For those players with little cash, completing the quest 'The Lady in the Lighthouse' will decrease the cost of the journey from 500 gold to 100 gold."
	Falskaar_Notes[16] = ""
	Falskaar_Notes[17] = ""
	Falskaar_Notes[18] = "NOTE: Following the quest markers into 'Mammoth Keep' is ill-advised as any followers or summoned atronachs will cause immediate detection for every enemy within the fort. Either use the hidden entrance in one of the keep's towers or find the mine entrance near the dock platform to ensure a stealthier entrance."
	Falskaar_Notes[19] = "NOTE: After the end of the passages, there's a door that leads to a small drop. Due to navmeshing issues, followers will not be able to drop down from this and will walk back through the tunnel to exit."
	Falskaar_Notes[20] = ""
	Falskaar_Notes[21] = "NOTE: Depending on character level, this quest may be very hard due to the amount of high level necromancers within the hot springs."
	Falskaar_Notes[22] = "NOTE: Arnand's Journal may be impossible to interact with upon entering the lair, Saving and loading this save resolves this."
	Falskaar_Notes[23] = ""
	Falskaar_Notes[24] = ""
	Falskaar_Notes[25] = "Fun Fact: Dialogue options with Galen at the end of this quest can result in a bigger reward than 25 gold."

	Falskaar_First = new int[26]	
	Falskaar_First[0] = 5
	Falskaar_First[1] = 5	
	Falskaar_First[2] = 5	
	Falskaar_First[3] = 5	
	Falskaar_First[4] = 5	
	Falskaar_First[5] = 5	
	Falskaar_First[6] = 5	
	Falskaar_First[7] = 5	
	Falskaar_First[8] = 5	
	Falskaar_First[9] = 1
	Falskaar_First[10] = 1
	Falskaar_First[11] = 5
	Falskaar_First[12] = 5
	Falskaar_First[13] = 2
	Falskaar_First[14] = 2
	Falskaar_First[15] = -999
	Falskaar_First[16] = 5
	Falskaar_First[17] = 1
	Falskaar_First[18] = 1
	Falskaar_First[19] = 2
	Falskaar_First[20] = 5
	Falskaar_First[21] = 5
	Falskaar_First[22] = 1
	Falskaar_First[23] = 5
	Falskaar_First[24] = 5
	Falskaar_First[25] = 5
	
	Falskaar_Final = new int[26]	
	Falskaar_Final[0] = 15
	Falskaar_Final[1] =	15
	Falskaar_Final[2] = 45
	Falskaar_Final[3] =	40
	Falskaar_Final[4] = 25
	Falskaar_Final[5] =	20
	Falskaar_Final[6] = 55
	Falskaar_Final[7] =	35
	Falskaar_Final[8] = 45
	Falskaar_Final[9] =	21
	Falskaar_Final[10] = 40
	Falskaar_Final[11] = 15	
	Falskaar_Final[12] = 10
	Falskaar_Final[13] = 5
	Falskaar_Final[14] = 10
	Falskaar_Final[15] = 10
	Falskaar_Final[16] = 15
	Falskaar_Final[17] = 11	
	Falskaar_Final[18] = 25
	Falskaar_Final[19] = 15	
	Falskaar_Final[20] = 15
	Falskaar_Final[21] = 15
	Falskaar_Final[22] = 40
	Falskaar_Final[23] = 30
	Falskaar_Final[24] = 16
	Falskaar_Final[25] = 15	
	
	Falskaar_Radiant = new bool[26]
	Falskaar_Radiant[0] = false
	Falskaar_Radiant[1] = false
	Falskaar_Radiant[2] = false
	Falskaar_Radiant[3] = false
	Falskaar_Radiant[4] = false
	Falskaar_Radiant[5] = false
	Falskaar_Radiant[6] = false
	Falskaar_Radiant[7] = false
	Falskaar_Radiant[8] = false
	Falskaar_Radiant[9] = false
	Falskaar_Radiant[10] = false
	Falskaar_Radiant[11] = false
	Falskaar_Radiant[12] = false
	Falskaar_Radiant[13] = false
	Falskaar_Radiant[14] = false
	Falskaar_Radiant[15] = false
	Falskaar_Radiant[16] = false
	Falskaar_Radiant[17] = false
	Falskaar_Radiant[18] = false
	Falskaar_Radiant[19] = false
	Falskaar_Radiant[20] = false
	Falskaar_Radiant[21] = false
	Falskaar_Radiant[22] = false
	Falskaar_Radiant[23] = false
	Falskaar_Radiant[24] = false
	Falskaar_Radiant[25] = false
	
	Falskaar_Spoiler = new bool[26]
	Falskaar_Spoiler[0] = false
	Falskaar_Spoiler[1] = false
	Falskaar_Spoiler[2] = false
	Falskaar_Spoiler[3] = false
	Falskaar_Spoiler[4] = false
	Falskaar_Spoiler[5] = false
	Falskaar_Spoiler[6] = false
	Falskaar_Spoiler[7] = false
	Falskaar_Spoiler[8] = false
	Falskaar_Spoiler[9] = false
	Falskaar_Spoiler[10] = false
	Falskaar_Spoiler[11] = false
	Falskaar_Spoiler[12] = false
	Falskaar_Spoiler[13] = false
	Falskaar_Spoiler[14] = false
	Falskaar_Spoiler[15] = false
	Falskaar_Spoiler[16] = false
	Falskaar_Spoiler[17] = false
	Falskaar_Spoiler[18] = false
	Falskaar_Spoiler[19] = false
	Falskaar_Spoiler[20] = false
	Falskaar_Spoiler[21] = false
	Falskaar_Spoiler[22] = false
	Falskaar_Spoiler[23] = false
	Falskaar_Spoiler[24] = false
	Falskaar_Spoiler[25] = false	

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Moonpath_ID = new string[7]
	Moonpath_ID[0] = "AnvilMoonpathQuest"
	Moonpath_ID[1] = "AnvilQuestameir"
	Moonpath_ID[2] = "AnvilDenQuest"
	Moonpath_ID[3] = "Anvil_buildquest"
	Moonpath_ID[4] = "DBM_AirshipQuest"
	Moonpath_ID[5] = "AnvilSloadquest"
	Moonpath_ID[6] = "Anvil_armorquest"

	Moonpath_Name = new string[7]
	Moonpath_Name[0] = "I. By the Light Of the Moon"
	Moonpath_Name[1] = "II. The Sweet Taste Of Elsweyr"
	Moonpath_Name[2] = "III. Incursion"
	Moonpath_Name[3] = "IV. Rebuilding The Past"
	Moonpath_Name[4] = "V. A Gift from a Friend"
	Moonpath_Name[5] = "The Dinner Guest (Side)"
	Moonpath_Name[6] = "Desert Style (Side)"
	
	Moonpath_Giver = new string[7]
	Moonpath_Giver[0] = "Automatic Start"
	Moonpath_Giver[1] = "Yura"
	Moonpath_Giver[2] = "Mervar Denfriend"
	Moonpath_Giver[3] = "Khulan"
	Moonpath_Giver[4] = "Automatic Start"
	Moonpath_Giver[5] = "Erid'or"
	Moonpath_Giver[6] = "Automatic Start - Reach the Supply Post."
	
	Moonpath_Reqs = new string[7]
	Moonpath_Reqs[0] = "Level 18+ and reached a display count of 70."
	Moonpath_Reqs[1] = "Completion of 'By the Light of the Moon'."
	Moonpath_Reqs[2] = "'The Sweet Taste Of Elsweyr' to have been started."
	Moonpath_Reqs[3] = "Completion of 'Incursion'."
	Moonpath_Reqs[4] = "Completion of 'Rebuilding the Past' and have the Explorer's Society set up."
	Moonpath_Reqs[5] = "'The Sweet Taste Of Elsweyr' to have been started."
	Moonpath_Reqs[6] = "'Incursion' to have been started."
	
	Moonpath_Notes = new string[7]
	Moonpath_Notes[0] = "NOTE: If using the Moonpath To Elsweyr Unofficial Patch, 'The Way of the Voice' must also be completed for this quest to trigger."
	Moonpath_Notes[1] = ""
	Moonpath_Notes[2] = ""
	Moonpath_Notes[3] = ""
	Moonpath_Notes[4] = "NOTE: This quest starts automatically 5 days after the completion of 'Rebuilding The Past'."
	Moonpath_Notes[5] = ""
	Moonpath_Notes[6] = ""
	
	Moonpath_First = new int[7]	
	Moonpath_First[0] = 0
	Moonpath_First[1] = 0
	Moonpath_First[2] = 0
	Moonpath_First[3] = 0
	Moonpath_First[4] = 1
	Moonpath_First[5] = 5
	Moonpath_First[6] = 0
	
	Moonpath_Final = new int[7]	
	Moonpath_Final[0] = 60
	Moonpath_Final[1] = 20
	Moonpath_Final[2] = 150
	Moonpath_Final[3] = 60
	Moonpath_Final[4] = 100
	Moonpath_Final[5] = 100
	Moonpath_Final[6] = 30
	
	Moonpath_Radiant = new bool[7]
	Moonpath_Radiant[0] = false
	Moonpath_Radiant[1] = false
	Moonpath_Radiant[2] = false
	Moonpath_Radiant[3] = false
	Moonpath_Radiant[4] = false
	Moonpath_Radiant[5] = false
	Moonpath_Radiant[6] = false
	
	Moonpath_Spoiler = new bool[7]
	Moonpath_Spoiler[0] = false
	Moonpath_Spoiler[1] = false
	Moonpath_Spoiler[2] = false
	Moonpath_Spoiler[3] = false
	Moonpath_Spoiler[4] = false
	Moonpath_Spoiler[5] = false
	Moonpath_Spoiler[6] = false	

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Helgen_ID = new string[25]
	Helgen_ID[0] = "BalokCourierTimer"
	Helgen_ID[1] = "BalokHelgen01"
	Helgen_ID[2] = "BalokThalmorPrison"
	Helgen_ID[3] = "BalokConstructionQuest"
	Helgen_ID[4] = "BalokBitterWounds"
	Helgen_ID[5] = "BalokCiennaQuest"
	Helgen_ID[6] = "BalokHamingQuest"
	Helgen_ID[7] = "BalokRadiant01"
	Helgen_ID[8] = "BalokRadiant02"
	Helgen_ID[9] = "BalokRadiant03"
	Helgen_ID[10] = "BalokRadiant04"
	Helgen_ID[11] = "BalokRadiant05"
	Helgen_ID[12] = "BalokRadiant06"
	Helgen_ID[13] = "BalokRadiant01Stormcloak"
	Helgen_ID[14] = "BalokRadiant02Stormcloak"
	Helgen_ID[15] = "BalokRadiant03Stormcloak"
	Helgen_ID[16] = "BalokRadiant04Stormcloak"
	Helgen_ID[17] = "BalokRadiant05Stormcloak"
	Helgen_ID[18] = "BalokRadiant06Stormcloak"
	Helgen_ID[19] = "BalokRadiant01Empire"
	Helgen_ID[20] = "BalokRadiant02Empire"
	Helgen_ID[21] = "BalokRadiant03Empire"
	Helgen_ID[22] = "BalokRadiant04Empire"
	Helgen_ID[23] = "BalokRadiant05Empire"
	Helgen_ID[24] = "BalokRadiant06Empire"

	Helgen_Name = new string[25]
	Helgen_Name[0] = "I. Helgen Reborn Start Up"
	Helgen_Name[1] = "II. Desperate Times"
	Helgen_Name[2] = "III. Molon Labe"
	Helgen_Name[3] = "IV. A City on a Hill"
	Helgen_Name[4] = "V. Bitter Wounds"
	Helgen_Name[5] = "Color me Cienna (Side)"
	Helgen_Name[6] = "Going Home (Side)"
	Helgen_Name[7] = "The Changing of the Guard - Wanan-Dun"
	Helgen_Name[8] = "The Changing of the Guard - Joto"
	Helgen_Name[9] = "The Changing of the Guard - Herd"
	Helgen_Name[10] = "The Changing of the Guard - Orianthi"
	Helgen_Name[11] = "The Changing of the Guard - Sorian"
	Helgen_Name[12] = "The Changing of the Guard - Kindrick"
	Helgen_Name[13] = "The Changing of the Guard - Toralf"
	Helgen_Name[14] = "The Changing of the Guard - Savard"
	Helgen_Name[15] = "The Changing of the Guard - Herd"
	Helgen_Name[16] = "The Changing of the Guard - Kar"
	Helgen_Name[17] = "The Changing of the Guard - Viggun"
	Helgen_Name[18] = "The Changing of the Guard - Alof"
	Helgen_Name[19] = "The Changing of the Guard - Surus"
	Helgen_Name[20] = "The Changing of the Guard - Cidius"
	Helgen_Name[21] = "The Changing of the Guard - Herd"
	Helgen_Name[22] = "The Changing of the Guard - Josslin"
	Helgen_Name[23] = "The Changing of the Guard - Ciel"
	Helgen_Name[24] = "The Changing of the Guard - Miles"

	Helgen_Giver = new string[25]
	Helgen_Giver[0] = "Automatic Start - This quest starts on game load."
	Helgen_Giver[1] = "Automatic Start"
	Helgen_Giver[2] = "Marcus Jannus during 'Desperate Times'."
	Helgen_Giver[3] = "Marcus Jannus"
	Helgen_Giver[4] = "Valerius during 'A City On A Hill'."
	Helgen_Giver[5] = "Cienna"
	Helgen_Giver[6] = "Froki"
	Helgen_Giver[7] = "Korst"
	Helgen_Giver[8] = "Korst"
	Helgen_Giver[9] = "Korst"
	Helgen_Giver[10] = "Korst"
	Helgen_Giver[11] = "Korst"
	Helgen_Giver[12] = "Korst"
	Helgen_Giver[13] = "Korst"
	Helgen_Giver[14] = "Korst"
	Helgen_Giver[15] = "Korst"
	Helgen_Giver[16] = "Korst"
	Helgen_Giver[17] = "Korst"
	Helgen_Giver[18] = "Korst"
	Helgen_Giver[19] = "Korst"
	Helgen_Giver[20] = "Korst"
	Helgen_Giver[21] = "Korst"
	Helgen_Giver[22] = "Korst"
	Helgen_Giver[23] = "Korst"
	Helgen_Giver[24] = "Korst"

	Helgen_Reqs = new string[25]
	Helgen_Reqs[0] = "No Requirements"
	Helgen_Reqs[1] = "Completion of 'Helgen Reborn Start Up'."
	Helgen_Reqs[2] = "'Desperate Times' to have been started."
	Helgen_Reqs[3] = "Completion of 'Desperate Times'."
	Helgen_Reqs[4] = "'A City on a Hill' to have been started."
	Helgen_Reqs[5] = "Helgen to be rebuilt."
	Helgen_Reqs[6] = "Helgen to be rebuilt."
	Helgen_Reqs[7] = "'Desperate Times' to have been started."
	Helgen_Reqs[8] = "'Desperate Times' to have been started."
	Helgen_Reqs[9] = "'Desperate Times' to have been started."
	Helgen_Reqs[10] = "'Desperate Times' to have been started."
	Helgen_Reqs[11] = "'Desperate Times' to have been started."
	Helgen_Reqs[12] = "'Desperate Times' to have been started."
	Helgen_Reqs[13] = "'Desperate Times' to have been started."
	Helgen_Reqs[14] = "'Desperate Times' to have been started."
	Helgen_Reqs[15] = "'Desperate Times' to have been started."
	Helgen_Reqs[16] = "'Desperate Times' to have been started."
	Helgen_Reqs[17] = "'Desperate Times' to have been started."
	Helgen_Reqs[18] = "'Desperate Times' to have been started."
	Helgen_Reqs[19] = "'Desperate Times' to have been started."
	Helgen_Reqs[20] = "'Desperate Times' to have been started."
	Helgen_Reqs[21] = "'Desperate Times' to have been started."
	Helgen_Reqs[22] = "'Desperate Times' to have been started."
	Helgen_Reqs[23] = "'Desperate Times' to have been started."
	Helgen_Reqs[24] = "'Desperate Times' to have been started."	

	Helgen_Notes = new string[25]
	Helgen_Notes[0] = ""
	Helgen_Notes[1] = ""
	Helgen_Notes[2] = ""
	Helgen_Notes[3] = ""
	Helgen_Notes[4] = ""
	Helgen_Notes[5] = ""
	Helgen_Notes[6] = ""
	Helgen_Notes[7] = ""
	Helgen_Notes[8] = ""
	Helgen_Notes[9] = ""
	Helgen_Notes[10] = ""
	Helgen_Notes[11] = ""
	Helgen_Notes[12] = ""
	Helgen_Notes[13] = ""
	Helgen_Notes[14] = ""
	Helgen_Notes[15] = ""
	Helgen_Notes[16] = ""
	Helgen_Notes[17] = ""
	Helgen_Notes[18] = ""
	Helgen_Notes[19] = ""
	Helgen_Notes[20] = ""
	Helgen_Notes[21] = ""
	Helgen_Notes[22] = ""
	Helgen_Notes[23] = ""
	Helgen_Notes[24] = ""

	Helgen_First = new int[25]	
	Helgen_First[0] = 1
	Helgen_First[1] = 5	
	Helgen_First[2] = 1	
	Helgen_First[3] = 20	
	Helgen_First[4] = 10
	Helgen_First[5] = 1
	Helgen_First[6] = 1	
	Helgen_First[7] = 1	
	Helgen_First[8] = 10	
	Helgen_First[9] = 10
	Helgen_First[10] = 10
	Helgen_First[11] = 10
	Helgen_First[12] = 10
	Helgen_First[13] = 1
	Helgen_First[14] = 10
	Helgen_First[15] = 10
	Helgen_First[16] = 10
	Helgen_First[17] = 10
	Helgen_First[18] = 10
	Helgen_First[19] = 1
	Helgen_First[20] = 10
	Helgen_First[21] = 10
	Helgen_First[22] = 10
	Helgen_First[23] = 10
	Helgen_First[24] = 10
	
	Helgen_Final = new int[25]	
	Helgen_Final[0] = 10
	Helgen_Final[1] = 100
	Helgen_Final[2] = 130
	Helgen_Final[3] = 500
	Helgen_Final[4] = 270
	Helgen_Final[5] = 210
	Helgen_Final[6] = 40
	Helgen_Final[7] = 60
	Helgen_Final[8] = 60
	Helgen_Final[9] = 60
	Helgen_Final[10] = 60
	Helgen_Final[11] = 60	
	Helgen_Final[12] = 60
	Helgen_Final[13] = 40
	Helgen_Final[14] = 40
	Helgen_Final[15] = 40
	Helgen_Final[16] = 40
	Helgen_Final[17] = 40	
	Helgen_Final[18] = 40
	Helgen_Final[19] = 40	
	Helgen_Final[20] = 40
	Helgen_Final[21] = 40
	Helgen_Final[22] = 40
	Helgen_Final[23] = 40
	Helgen_Final[24] = 40
	
	Helgen_Radiant = new bool[25]
	Helgen_Radiant[0] = false
	Helgen_Radiant[1] = false
	Helgen_Radiant[2] = false
	Helgen_Radiant[3] = false
	Helgen_Radiant[4] = false
	Helgen_Radiant[5] = false
	Helgen_Radiant[6] = false
	Helgen_Radiant[7] = false
	Helgen_Radiant[8] = false
	Helgen_Radiant[9] = false
	Helgen_Radiant[10] = false
	Helgen_Radiant[11] = false
	Helgen_Radiant[12] = false
	Helgen_Radiant[13] = false
	Helgen_Radiant[14] = false
	Helgen_Radiant[15] = false
	Helgen_Radiant[16] = false
	Helgen_Radiant[17] = false
	Helgen_Radiant[18] = false
	Helgen_Radiant[19] = false
	Helgen_Radiant[20] = false
	Helgen_Radiant[21] = false
	Helgen_Radiant[22] = false
	Helgen_Radiant[23] = false
	Helgen_Radiant[24] = false
	
	Helgen_Spoiler = new bool[25]
	Helgen_Spoiler[0] = false
	Helgen_Spoiler[1] = false
	Helgen_Spoiler[2] = false
	Helgen_Spoiler[3] = false
	Helgen_Spoiler[4] = false
	Helgen_Spoiler[5] = false
	Helgen_Spoiler[6] = True
	Helgen_Spoiler[7] = false
	Helgen_Spoiler[8] = false
	Helgen_Spoiler[9] = false
	Helgen_Spoiler[10] = false
	Helgen_Spoiler[11] = false
	Helgen_Spoiler[12] = false
	Helgen_Spoiler[13] = false
	Helgen_Spoiler[14] = false
	Helgen_Spoiler[15] = false
	Helgen_Spoiler[16] = false
	Helgen_Spoiler[17] = false
	Helgen_Spoiler[18] = false
	Helgen_Spoiler[19] = false
	Helgen_Spoiler[20] = false
	Helgen_Spoiler[21] = false
	Helgen_Spoiler[22] = false
	Helgen_Spoiler[23] = false
	Helgen_Spoiler[24] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Clockwork_ID = new string[7]
	Clockwork_ID[0] = "CLWKicker01Quest"
	Clockwork_ID[1] = "CLWStory01Quest"
	Clockwork_ID[2] = "CLWStory02Quest"
	Clockwork_ID[3] = "CLWStory03Quest"
	Clockwork_ID[4] = "CLWStory04Quest"
	Clockwork_ID[5] = "CLWSide01Quest"
	Clockwork_ID[6] = "CLWSide02Quest"

	Clockwork_Name = new string[7]
	Clockwork_Name[0] = "I. Foot Of The Mountain"
	Clockwork_Name[1] = "II. Shadow Under The Mountain"
	Clockwork_Name[2] = "III. Steam-Powered"
	Clockwork_Name[3] = "IV. Crystalline Heart"
	Clockwork_Name[4] = "V. I Against I"
	Clockwork_Name[5] = "A Bed of Dust (Side)"
	Clockwork_Name[6] = "Staff Enchanting (Side)"

	Clockwork_Giver = new string[7]
	Clockwork_Giver[0] = "Automatic Start"
	Clockwork_Giver[1] = "Automatic Start"
	Clockwork_Giver[2] = "Automatic Start"
	Clockwork_Giver[3] = "Lamashtu"
	Clockwork_Giver[4] = "Automatic Start"
	Clockwork_Giver[5] = "Lahar"
	Clockwork_Giver[6] = "Lahar"

	Clockwork_Reqs = new string[7]
	Clockwork_Reqs[0] = "Level 5+"
	Clockwork_Reqs[1] = "Completion of 'Foot Of The Mountain'."
	Clockwork_Reqs[2] = "Completion of 'Shadow Under The Mountain'."
	Clockwork_Reqs[3] = "'Steam-Powered' to have been started."
	Clockwork_Reqs[4] = "Completion of 'Crystalline Heart'."
	Clockwork_Reqs[5] = "No Requirements."
	Clockwork_Reqs[6] = "No Requirements."

	Clockwork_Notes = new string[7]
	Clockwork_Notes[0] = "NOTE: this quest will trigger when travelling in Skyrim's wilderness, it is not advised to bring followers, this is meant to be a lone journey, there is no way back to Skyrim until completing the Clockwork quest line."
	Clockwork_Notes[1] = ""
	Clockwork_Notes[2] = ""
	Clockwork_Notes[3] = ""
	Clockwork_Notes[4] = ""
	Clockwork_Notes[5] = ""
	Clockwork_Notes[6] = ""

	Clockwork_First = new int[7]	
	Clockwork_First[0] = 5
	Clockwork_First[1] = 10	
	Clockwork_First[2] = 10	
	Clockwork_First[3] = 10	
	Clockwork_First[4] = 10
	Clockwork_First[5] = 10
	Clockwork_First[6] = 10
	
	Clockwork_Final = new int[7]	
	Clockwork_Final[0] = 40
	Clockwork_Final[1] = 200
	Clockwork_Final[2] = 140
	Clockwork_Final[3] = 160
	Clockwork_Final[4] = 200
	Clockwork_Final[5] = 40
	Clockwork_Final[6] = 100
	
	Clockwork_Radiant = new bool[7]
	Clockwork_Radiant[0] = false
	Clockwork_Radiant[1] = false
	Clockwork_Radiant[2] = false
	Clockwork_Radiant[3] = false
	Clockwork_Radiant[4] = false
	Clockwork_Radiant[5] = false
	Clockwork_Radiant[6] = false
	
	Clockwork_Spoiler = new bool[7]
	Clockwork_Spoiler[0] = false
	Clockwork_Spoiler[1] = false
	Clockwork_Spoiler[2] = false
	Clockwork_Spoiler[3] = false
	Clockwork_Spoiler[4] = false
	Clockwork_Spoiler[5] = false
	Clockwork_Spoiler[6] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	MoonStar_ID = new string[6]
	MoonStar_ID[0] = "MASMainQuest"
	MoonStar_ID[1] = "MASAlbertDialog"
	MoonStar_ID[2] = "MASBalRanDialog"
	MoonStar_ID[3] = "MASBelvadyrFavor"
	MoonStar_ID[4] = "MASSelyseDialog"
	MoonStar_ID[5] = "MASTorenDialog"

	MoonStar_Name = new string[6]
	MoonStar_Name[0] = "Moon And Star"
	MoonStar_Name[1] = "One Dog Ain't Enough"
	MoonStar_Name[2] = "A Favor for Bal-Ran"
	MoonStar_Name[3] = "A Favor for Belvadyr"
	MoonStar_Name[4] = "A Favor for Selyse"
	MoonStar_Name[5] = "A Favor for Toren"

	MoonStar_Giver = new string[6]
	MoonStar_Giver[0] = "Courier or Mandyn Hlaalu"
	MoonStar_Giver[1] = "Albert"
	MoonStar_Giver[2] = "Bal-Ran"
	MoonStar_Giver[3] = "Belvadyr Rathvasi"
	MoonStar_Giver[4] = "Selyse Andrathil"
	MoonStar_Giver[5] = "Toren Darrosa"

	MoonStar_Reqs = new string[6]
	MoonStar_Reqs[0] = "No Requirements"
	MoonStar_Reqs[1] = "No Requirements"
	MoonStar_Reqs[2] = "No Requirements"
	MoonStar_Reqs[3] = "No Requirements"
	MoonStar_Reqs[4] = "No Requirements"
	MoonStar_Reqs[5] = "No Requirements."

	MoonStar_Notes = new string[6]
	MoonStar_Notes[0] = ""
	MoonStar_Notes[1] = ""
	MoonStar_Notes[2] = ""
	MoonStar_Notes[3] = ""
	MoonStar_Notes[4] = ""
	MoonStar_Notes[5] = ""

	MoonStar_First = new int[6]	
	MoonStar_First[0] = 10
	MoonStar_First[1] = 10	
	MoonStar_First[2] = 10	
	MoonStar_First[3] = 10	
	MoonStar_First[4] = 10
	MoonStar_First[5] = 10
	
	MoonStar_Final = new int[6]	
	MoonStar_Final[0] = 92
	MoonStar_Final[1] = 30
	MoonStar_Final[2] = 30
	MoonStar_Final[3] = 40
	MoonStar_Final[4] = 30
	MoonStar_Final[5] = 36
	
	MoonStar_Radiant = new bool[6]
	MoonStar_Radiant[0] = false
	MoonStar_Radiant[1] = false
	MoonStar_Radiant[2] = false
	MoonStar_Radiant[3] = false
	MoonStar_Radiant[4] = false
	MoonStar_Radiant[5] = false
	
	MoonStar_Spoiler = new bool[6]
	MoonStar_Spoiler[0] = false
	MoonStar_Spoiler[1] = false
	MoonStar_Spoiler[2] = false
	MoonStar_Spoiler[3] = false
	MoonStar_Spoiler[4] = false
	MoonStar_Spoiler[5] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	ProjectAHO_ID = new string[16]
	ProjectAHO_ID[0] = "DwarfSphereQ01"
	ProjectAHO_ID[1] = "DwarfSphereQ03"
	ProjectAHO_ID[2] = "DwarfSphereQ04"
	ProjectAHO_ID[3] = "DwarfSphereQ05"
	ProjectAHO_ID[4] = "DwarfSphereQ06"
	ProjectAHO_ID[5] = "DwarfSphereQ07"
	ProjectAHO_ID[6] = "DwarfSphereSQ01"
	ProjectAHO_ID[7] = "DwarfSphereSQ02"
	ProjectAHO_ID[8] = "DwarfSphereSQ03"
	ProjectAHO_ID[9] = "DwarfSphereSQ04"
	ProjectAHO_ID[10] = "DwarfSphereSQ05"
	ProjectAHO_ID[11] = "DwarfSphereSQ06"
	ProjectAHO_ID[12] = "DwarfSphereSQ07"
	ProjectAHO_ID[13] = "DwarfSphereSQ08"
	ProjectAHO_ID[14] = "DwarfSphereSQ09"
	ProjectAHO_ID[15] = "DwarfSphereSQ11"

	ProjectAHO_Name = new string[16]
	ProjectAHO_Name[0] = "Wrong Place, Wrong Time"
	ProjectAHO_Name[1] = "A Problematic Neighbour"
	ProjectAHO_Name[2] = "No Corpse, No Case"
	ProjectAHO_Name[3] = "An Erudite Beverage"
	ProjectAHO_Name[4] = "Legacy of the Extinct Race"
	ProjectAHO_Name[5] = "Freedom of Choice"
	ProjectAHO_Name[6] = "Crack'n'Chirp (Side)"
	ProjectAHO_Name[7] = "A Nostalgic Aroma (Side)"
	ProjectAHO_Name[8] = "The Lady's Ring (Side)"
	ProjectAHO_Name[9] = "A Burden of the Past (Side)"
	ProjectAHO_Name[10] = "Orsimer of House Telvanni (Side)"
	ProjectAHO_Name[11] = "A Legacy of Ancestors (Side)"
	ProjectAHO_Name[12] = "Signs of Attention (Side)"
	ProjectAHO_Name[13] = "Forgotten Art (Side)"
	ProjectAHO_Name[14] = "Be Aware of Darkness (Side)"
	ProjectAHO_Name[15] = "Shadow of the Past (Side)"

	ProjectAHO_Giver = new string[16]
	ProjectAHO_Giver[0] = "Automatic Start"
	ProjectAHO_Giver[1] = "Shanath Selthri"
	ProjectAHO_Giver[2] = "Shanath Selthri"
	ProjectAHO_Giver[3] = "Shanath Selthri"
	ProjectAHO_Giver[4] = "Automatic Start"
	ProjectAHO_Giver[5] = "Marisa Verendas"
	ProjectAHO_Giver[6] = "Started by picking up the lever part, located in Bkhalzarf."
	ProjectAHO_Giver[7] = "Tamina Elenil"
	ProjectAHO_Giver[8] = "Tadys Andavel"
	ProjectAHO_Giver[9] = "Zarona Orys"
	ProjectAHO_Giver[10] = "Shaglak"
	ProjectAHO_Giver[11] = "Erver Milo"
	ProjectAHO_Giver[12] = "Aryni Sendu"
	ProjectAHO_Giver[13] = "Merano Rendo"
	ProjectAHO_Giver[14] = "Selveni Andavel"
	ProjectAHO_Giver[15] = "Kuovin Nrezalf"

	ProjectAHO_Reqs = new string[16]
	ProjectAHO_Reqs[0] = "Level 15 required."
	ProjectAHO_Reqs[1] = "Completion of 'Wrong Place, Wrong Time'"
	ProjectAHO_Reqs[2] = "Completion of 'A Problematic Neighbour'"
	ProjectAHO_Reqs[3] = "Completion of 'No Corpse, No Case'"
	ProjectAHO_Reqs[4] = "Completion of 'An Erudite Beverage'"
	ProjectAHO_Reqs[5] = "Completion of 'Legacy of the Extinct Race'"
	ProjectAHO_Reqs[6] = "Requires 'Freedom of Choice' to have been started."
	ProjectAHO_Reqs[7] = "No Requirements"
	ProjectAHO_Reqs[8] = "No Requirements"
	ProjectAHO_Reqs[9] = "No Requirements"
	ProjectAHO_Reqs[10] = "No Requirements"
	ProjectAHO_Reqs[11] = "No Requirements"
	ProjectAHO_Reqs[12] = "No Requirements"
	ProjectAHO_Reqs[13] = "No Requirements"
	ProjectAHO_Reqs[14] = "No Requirements"
	ProjectAHO_Reqs[15] = "No Requirements"

	ProjectAHO_Notes = new string[16]
	ProjectAHO_Notes[0] = ""
	ProjectAHO_Notes[1] = ""
	ProjectAHO_Notes[2] = ""
	ProjectAHO_Notes[3] = ""
	ProjectAHO_Notes[4] = ""
	ProjectAHO_Notes[5] = ""
	ProjectAHO_Notes[6] = ""
	ProjectAHO_Notes[7] = ""
	ProjectAHO_Notes[8] = ""
	ProjectAHO_Notes[9] = ""
	ProjectAHO_Notes[10] = ""
	ProjectAHO_Notes[11] = ""
	ProjectAHO_Notes[12] = ""
	ProjectAHO_Notes[13] = ""
	ProjectAHO_Notes[14] = ""
	ProjectAHO_Notes[15] = ""

	ProjectAHO_First = new int[16]	
	ProjectAHO_First[0] = -999
	ProjectAHO_First[1] = -999	
	ProjectAHO_First[2] = -999
	ProjectAHO_First[3] = -999
	ProjectAHO_First[4] = -999
	ProjectAHO_First[5] = -999
	ProjectAHO_First[6] = 10
	ProjectAHO_First[7] = 10	
	ProjectAHO_First[8] = 10	
	ProjectAHO_First[9] = 10
	ProjectAHO_First[10] = 10
	ProjectAHO_First[11] = 10
	ProjectAHO_First[12] = 5
	ProjectAHO_First[13] = 5
	ProjectAHO_First[14] = 5
	ProjectAHO_First[15] = 5
	
	ProjectAHO_Final = new int[16]	
	ProjectAHO_Final[0] = 25
	ProjectAHO_Final[1] = 15
	ProjectAHO_Final[2] = 30
	ProjectAHO_Final[3] = 20
	ProjectAHO_Final[4] = 330
	ProjectAHO_Final[5] = 1000
	ProjectAHO_Final[6] = 30
	ProjectAHO_Final[7] = 100
	ProjectAHO_Final[8] = 200
	ProjectAHO_Final[9] = 500
	ProjectAHO_Final[10] = 50
	ProjectAHO_Final[11] = 40	
	ProjectAHO_Final[12] = 50
	ProjectAHO_Final[13] = 30
	ProjectAHO_Final[14] = 25
	ProjectAHO_Final[15] = 50
	
	ProjectAHO_Radiant = new bool[16]
	ProjectAHO_Radiant[0] = false
	ProjectAHO_Radiant[1] = false
	ProjectAHO_Radiant[2] = false
	ProjectAHO_Radiant[3] = false
	ProjectAHO_Radiant[4] = false
	ProjectAHO_Radiant[5] = false
	ProjectAHO_Radiant[6] = false
	ProjectAHO_Radiant[7] = false
	ProjectAHO_Radiant[8] = false
	ProjectAHO_Radiant[9] = false
	ProjectAHO_Radiant[10] = false
	ProjectAHO_Radiant[11] = false
	ProjectAHO_Radiant[12] = false
	ProjectAHO_Radiant[13] = false
	ProjectAHO_Radiant[14] = false
	ProjectAHO_Radiant[15] = false
	
	ProjectAHO_Spoiler = new bool[16]
	ProjectAHO_Spoiler[0] = false
	ProjectAHO_Spoiler[1] = false
	ProjectAHO_Spoiler[2] = false
	ProjectAHO_Spoiler[3] = false
	ProjectAHO_Spoiler[4] = false
	ProjectAHO_Spoiler[5] = false
	ProjectAHO_Spoiler[6] = false
	ProjectAHO_Spoiler[7] = false
	ProjectAHO_Spoiler[8] = false
	ProjectAHO_Spoiler[9] = false
	ProjectAHO_Spoiler[10] = false
	ProjectAHO_Spoiler[11] = false
	ProjectAHO_Spoiler[12] = false
	ProjectAHO_Spoiler[13] = false
	ProjectAHO_Spoiler[14] = false
	ProjectAHO_Spoiler[15] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Underground_ID = new string[8]
	Underground_ID[0] = "AKMotierre01"
	Underground_ID[1] = "AKJRQ01"
	Underground_ID[2] = "AKJRQ02"
	Underground_ID[3] = "AKPQ01"
	Underground_ID[4] = "AKZombieGirlQuest01"
	Underground_ID[5] = "AKMotierre02"
	Underground_ID[6] = "AKDVQ01"
	Underground_ID[7] = "AKSub01"

	Underground_Name = new string[8]
	Underground_Name[0] = "A Mother's Love"
	Underground_Name[1] = "The Lusty Argonian Maid v3"
	Underground_Name[2] = "Head-Hunter"
	Underground_Name[3] = "Dark(Elf) Secrets"
	Underground_Name[4] = "The Lost Zombie Girl"
	Underground_Name[5] = "A Mother's Hate"
	Underground_Name[6] = "Secret of Dwarven Valley"
	Underground_Name[7] = "Ancient Dwemer Submarine"

	Underground_Giver = new string[8]
	Underground_Giver[0] = "Automatic Start (Read 'Treasure Hunter's Note')"
	Underground_Giver[1] = "Jarl Rangulf of Skeevertown"
	Underground_Giver[2] = "Jarl Rangulf of Skeevertown"
	Underground_Giver[3] = "Automatic Start - (Read 'Lowlife's Journal')"
	Underground_Giver[4] = "Grinn (Zombie Girl)"
	Underground_Giver[5] = "Automatic Start - Random Event"
	Underground_Giver[6] = "Wayn the Upright (Jerall Mountain Valley)"
	Underground_Giver[7] = "Automatic Start (Northern Glacial Lake)"

	Underground_Reqs = new string[8]
	Underground_Reqs[0] = "No Requirements"
	Underground_Reqs[1] = "No Requirements"
	Underground_Reqs[2] = "Completion of 'The Lusty Argonian Maid v3'"
	Underground_Reqs[3] = "No Requirements"
	Underground_Reqs[4] = "No Requirements"
	Underground_Reqs[5] = "Completion of 'A Mother's Love'"
	Underground_Reqs[6] = "No Requirements"
	Underground_Reqs[7] = "No Requirements"

	Underground_Notes = new string[8]
	Underground_Notes[0] = ""
	Underground_Notes[1] = ""
	Underground_Notes[2] = ""
	Underground_Notes[3] = ""
	Underground_Notes[4] = ""
	Underground_Notes[5] = ""
	Underground_Notes[6] = ""
	Underground_Notes[7] = ""

	Underground_First = new int[8]	
	Underground_First[0] = 10
	Underground_First[1] = 10	
	Underground_First[2] = 20
	Underground_First[3] = 10
	Underground_First[4] = 10
	Underground_First[5] = 10
	Underground_First[6] = 10
	Underground_First[7] = 10	
	
	Underground_Final = new int[8]	
	Underground_Final[0] = 50
	Underground_Final[1] = 50
	Underground_Final[2] = 50
	Underground_Final[3] = 100
	Underground_Final[4] = 200
	Underground_Final[5] = 70
	Underground_Final[6] = 110
	Underground_Final[7] = 60
	
	Underground_Radiant = new bool[8]
	Underground_Radiant[0] = false
	Underground_Radiant[1] = false
	Underground_Radiant[2] = false
	Underground_Radiant[3] = false
	Underground_Radiant[4] = false
	Underground_Radiant[5] = false
	Underground_Radiant[6] = false
	Underground_Radiant[7] = false
	
	Underground_Spoiler = new bool[8]
	Underground_Spoiler[0] = false
	Underground_Spoiler[1] = false
	Underground_Spoiler[2] = false
	Underground_Spoiler[3] = false
	Underground_Spoiler[4] = false
	Underground_Spoiler[5] = false
	Underground_Spoiler[6] = false
	Underground_Spoiler[7] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Nocturnal_ID = new string[10]
	Nocturnal_ID[0] = "manny_GF_MQ"
	Nocturnal_ID[1] = "manny_GF_ColdharbourQuest"
	Nocturnal_ID[2] = "manny_GF_Farewell"
	Nocturnal_ID[3] = "manny_GF_Books"
	Nocturnal_ID[4] = "manny_GF_Sadraaka"
	Nocturnal_ID[5] = "manny_GF_BuryValenDreth"
	Nocturnal_ID[6] = "manny_GF_MiscQuestDesertWolfPelts"
	Nocturnal_ID[7] = "manny_GF_MiscQuestDuneripperBlood"
	Nocturnal_ID[8] = "manny_GF_MiscQuestMetiliusAmulet"
	Nocturnal_ID[9] = "manny_GF_MiscQuestPraetorianCores"

	Nocturnal_Name = new string[10]
	Nocturnal_Name[0] = "I. The Call Of Gray Cowl Of Nocturnal"
	Nocturnal_Name[1] = "II. Reward Of Coldharbour"
	Nocturnal_Name[2] = "III. Time For The Farewells"
	Nocturnal_Name[3] = "Memories of the Umbranox (Side)"
	Nocturnal_Name[4] = "The Curse of Sadraaka (Side)"
	Nocturnal_Name[5] = "(Misc) Remains of Valen Dreth"
	Nocturnal_Name[6] = "(Misc) Desert Wolf Pelts"
	Nocturnal_Name[7] = "(Misc) Duneripper Blood Phials"
	Nocturnal_Name[8] = "(Misc) I Want My Amulet Back!"
	Nocturnal_Name[9] = "(Misc) Praetorian Dynamo Cores"

	Nocturnal_Giver = new string[10]
	Nocturnal_Giver[0] = "Automatic Start"
	Nocturnal_Giver[1] = "Automatic Start"
	Nocturnal_Giver[2] = "Seviana Umbranox"
	Nocturnal_Giver[3] = "Automatic Start - Read any of Caio's Journals"
	Nocturnal_Giver[4] = "Automatic Start (Forgotten City)"
	Nocturnal_Giver[5] = "Automatic Start"
	Nocturnal_Giver[6] = "Notice Board: Ben Erai"
	Nocturnal_Giver[7] = "Notice Board: Ben Erai"
	Nocturnal_Giver[8] = "Notice Board: Ben Erai"
	Nocturnal_Giver[9] = "Notice Board: Ben Erai"

	Nocturnal_Reqs = new string[10]
	Nocturnal_Reqs[0] = "Start this quest by stealing or pickpocketing something"
	Nocturnal_Reqs[1] = "'The Call Of Gray Cowl Of Nocturnal' to have been started"
	Nocturnal_Reqs[2] = "Completion of 'Memories of the Umbranox'"
	Nocturnal_Reqs[3] = "'The Call Of Gray Cowl Of Nocturnal' to have been started"
	Nocturnal_Reqs[4] = "'The Call Of Gray Cowl Of Nocturnal' to have been started"
	Nocturnal_Reqs[5] = "'The Call Of Gray Cowl Of Nocturnal' to have been started"
	Nocturnal_Reqs[6] = "No Requirements"
	Nocturnal_Reqs[7] = "No Requirements"
	Nocturnal_Reqs[8] = "No Requirements"
	Nocturnal_Reqs[9] = "No Requirements"

	Nocturnal_Notes = new string[10]
	Nocturnal_Notes[0] = "NOTE: This quest is heavily focused upon stealth, it will be a lot easier if you have high skill points in Sneak, Lockpicking, Pickpocket and Illusion. It is advised not to bring followers on the mod."
	Nocturnal_Notes[1] = ""
	Nocturnal_Notes[2] = ""
	Nocturnal_Notes[3] = ""
	Nocturnal_Notes[4] = ""
	Nocturnal_Notes[5] = "NOTE: you can find Valen Dreth's remains in the 'Imperial City Prison'."
	Nocturnal_Notes[6] = ""
	Nocturnal_Notes[7] = ""
	Nocturnal_Notes[8] = ""
	Nocturnal_Notes[9] = ""

	Nocturnal_First = new int[10]	
	Nocturnal_First[0] = 10
	Nocturnal_First[1] = 10	
	Nocturnal_First[2] = 10
	Nocturnal_First[3] = 10
	Nocturnal_First[4] = 5
	Nocturnal_First[5] = 10
	Nocturnal_First[6] = 10
	Nocturnal_First[7] = 10	
	Nocturnal_First[8] = 10	
	Nocturnal_First[9] = 5
	
	Nocturnal_Final = new int[10]	
	Nocturnal_Final[0] = 999
	Nocturnal_Final[1] = 255
	Nocturnal_Final[2] = 30
	Nocturnal_Final[3] = 200
	Nocturnal_Final[4] = 30
	Nocturnal_Final[5] = 30
	Nocturnal_Final[6] = 999
	Nocturnal_Final[7] = 20
	Nocturnal_Final[8] = 30
	Nocturnal_Final[9] = 20
	
	Nocturnal_Radiant = new bool[10]
	Nocturnal_Radiant[0] = false
	Nocturnal_Radiant[1] = false
	Nocturnal_Radiant[2] = false
	Nocturnal_Radiant[3] = false
	Nocturnal_Radiant[4] = false
	Nocturnal_Radiant[5] = false
	Nocturnal_Radiant[6] = false
	Nocturnal_Radiant[7] = false
	Nocturnal_Radiant[8] = false
	Nocturnal_Radiant[9] = false
	
	Nocturnal_Spoiler = new bool[10]
	Nocturnal_Spoiler[0] = false
	Nocturnal_Spoiler[1] = false
	Nocturnal_Spoiler[2] = false
	Nocturnal_Spoiler[3] = false
	Nocturnal_Spoiler[4] = false
	Nocturnal_Spoiler[5] = false
	Nocturnal_Spoiler[6] = false
	Nocturnal_Spoiler[7] = false
	Nocturnal_Spoiler[8] = false
	Nocturnal_Spoiler[9] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Wheels_ID = new string[16]
	Wheels_ID[0] = "_Lull_MQ01"
	Wheels_ID[1] = "_Lull_MQ02"
	Wheels_ID[2] = "_Lull_MQ03"
	Wheels_ID[3] = "_Lull_MQ04"
	Wheels_ID[4] = "_Lull_MQ05"
	Wheels_ID[5] = "_Lull_MQ06"
	Wheels_ID[6] = "_Lull_MQ07"
	Wheels_ID[7] = "_Lull_SQ_Watchman_Restore"
	Wheels_ID[8] = "_Lull_SQ_Water"
	Wheels_ID[9] = "_Lull_SQ_HammarUpdate"
	Wheels_ID[10] = "_Lull_SQ_CartRide"
	Wheels_ID[11] = "_Lull_SQ_ArcheronMines"
	Wheels_ID[12] = "_Lull_SQ_Seamonster"
	Wheels_ID[13] = "_Lull_SQ_DyeTrader"
	Wheels_ID[14] = "_Lull_SQ_ArmsMerchant"
	Wheels_ID[15] = ""

	Wheels_Name = new string[16]
	Wheels_Name[0] = "I. Deep Down"
	Wheels_Name[1] = "II. Sky Spy"
	Wheels_Name[2] = "III. The Mer In The High Castle"
	Wheels_Name[3] = "IV. The Boiling Foundry"
	Wheels_Name[4] = "V. The Brass Forest"
	Wheels_Name[5] = "VI. At The Bottom Of The World"
	Wheels_Name[6] = "VII. The Wheels Of Lull"
	Wheels_Name[7] = "Up And Atom (Side)"
	Wheels_Name[8] = "Water Under The Bridge (Side)"
	Wheels_Name[9] = "Upkeep (Side)"
	Wheels_Name[10] = "Riddling Rails (Side)"
	Wheels_Name[11] = "Closing Ports (Side)"
	Wheels_Name[12] = "Under Pressure (Side)"
	Wheels_Name[13] = "Dye Trader (Side)"
	Wheels_Name[14] = "Black Arms Market (Side)"
	Wheels_Name[15] = "Crafting Quests (Radiant)"

	Wheels_Giver = new string[16]
	Wheels_Giver[0] = "Fast travel to any settlement"
	Wheels_Giver[1] = "Numinar"
	Wheels_Giver[2] = "Numinar"
	Wheels_Giver[3] = "Numinar"
	Wheels_Giver[4] = "Numinar"
	Wheels_Giver[5] = "Numinar"
	Wheels_Giver[6] = "Numinar"
	Wheels_Giver[7] = "Automatic Start - Activate the Watchman"
	Wheels_Giver[8] = "Subori's Husband"
	Wheels_Giver[9] = "Medeliu Hammar"
	Wheels_Giver[10] = "Board the tram at Lull-Mor"
	Wheels_Giver[11] = "Automatic Start - kill the Boiler Atronach"
	Wheels_Giver[12] = "Automatic Start - Use the Upgate"
	Wheels_Giver[13] = "Speak to the colored FRF's"
	Wheels_Giver[14] = "Speak to the colored FRF's"
	
	Wheels_Giver[15] = "Avarri"

	Wheels_Reqs = new string[16]
	Wheels_Reqs[0] = "Level 16+"
	Wheels_Reqs[1] = "Level 16+ and completion of 'Deep Down'"
	Wheels_Reqs[2] = "Level 20+ and completion of 'Sky Spy'"
	Wheels_Reqs[3] = "Level 20+ and completion of 'The Mer In The High Castle'"
	Wheels_Reqs[4] = "Level 25+ and completion of 'The Boiling Foundry'"
	Wheels_Reqs[5] = "Level 30+ and completion of 'The Brass Forest'"
	Wheels_Reqs[6] = "Level 30+ and completion of 'At The Bottom Of The World'"
	Wheels_Reqs[7] = "Completion of 'Deep Down'"
	Wheels_Reqs[8] = "No Requirements"
	Wheels_Reqs[9] = "No Requirements"
	Wheels_Reqs[10] = "No Requirements"
	Wheels_Reqs[11] = "No Requirements"
	Wheels_Reqs[12] = "No Requirements"
	Wheels_Reqs[13] = "No Requirements"
	Wheels_Reqs[14] = "No Requirements"
	Wheels_Reqs[15] = "No Requirements"	

	Wheels_Notes = new string[16]
	Wheels_Notes[0] = ""
	Wheels_Notes[1] = ""
	Wheels_Notes[2] = ""
	Wheels_Notes[3] = ""
	Wheels_Notes[4] = ""
	Wheels_Notes[5] = ""
	Wheels_Notes[6] = ""
	Wheels_Notes[7] = ""
	Wheels_Notes[8] = ""
	Wheels_Notes[9] = ""
	Wheels_Notes[10] = ""
	Wheels_Notes[11] = ""
	Wheels_Notes[12] = ""
	Wheels_Notes[13] = ""
	Wheels_Notes[14] = ""
	Wheels_Notes[15] = ""

	Wheels_First = new int[16]	
	Wheels_First[0] = 10
	Wheels_First[1] = 5	
	Wheels_First[2] = 5
	Wheels_First[3] = 10
	Wheels_First[4] = 10
	Wheels_First[5] = 10
	Wheels_First[6] = 2
	Wheels_First[7] = 1	
	Wheels_First[8] = 1	
	Wheels_First[9] = 10
	Wheels_First[10] = 1
	Wheels_First[11] = 2
	Wheels_First[12] = 5
	Wheels_First[13] = 1
	Wheels_First[14] = 0
	
	Wheels_First[15] = -999
	
	Wheels_Final = new int[16]	
	Wheels_Final[0] = 999
	Wheels_Final[1] = 999
	Wheels_Final[2] = 999
	Wheels_Final[3] = 999
	Wheels_Final[4] = 999
	Wheels_Final[5] = 999
	Wheels_Final[6] = 999
	Wheels_Final[7] = 999
	Wheels_Final[8] = 999
	Wheels_Final[9] = 999
	Wheels_Final[10] = 999
	Wheels_Final[11] = 999	
	Wheels_Final[12] = 999
	Wheels_Final[13] = 999
	Wheels_Final[14] = 999
	Wheels_Final[15] = 999
	
	Wheels_Radiant = new bool[16]
	Wheels_Radiant[0] = false
	Wheels_Radiant[1] = false
	Wheels_Radiant[2] = false
	Wheels_Radiant[3] = false
	Wheels_Radiant[4] = false
	Wheels_Radiant[5] = false
	Wheels_Radiant[6] = false
	Wheels_Radiant[7] = false
	Wheels_Radiant[8] = false
	Wheels_Radiant[9] = false
	Wheels_Radiant[10] = false
	Wheels_Radiant[11] = false
	Wheels_Radiant[12] = false
	Wheels_Radiant[13] = false
	Wheels_Radiant[14] = false
	Wheels_Radiant[15] = true
	
	Wheels_Spoiler = new bool[16]
	Wheels_Spoiler[0] = false
	Wheels_Spoiler[1] = false
	Wheels_Spoiler[2] = false
	Wheels_Spoiler[3] = false
	Wheels_Spoiler[4] = false
	Wheels_Spoiler[5] = false
	Wheels_Spoiler[6] = True
	Wheels_Spoiler[7] = false
	Wheels_Spoiler[8] = false
	Wheels_Spoiler[9] = false
	Wheels_Spoiler[10] = false
	Wheels_Spoiler[11] = false
	Wheels_Spoiler[12] = false
	Wheels_Spoiler[13] = false
	Wheels_Spoiler[14] = false
	Wheels_Spoiler[15] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Undeath_ID = new string[7]
	Undeath_ID[0] = "NecroQuest01"
	Undeath_ID[1] = "NecroQuest02"
	Undeath_ID[2] = "NecroQuest03"
	Undeath_ID[3] = "NecroQuest04"
	Undeath_ID[4] = "NecroQuest05"
	Undeath_ID[5] = "NecroBlackBookQuest01"
	Undeath_ID[6] = "NecroLichRitualQuest"

	Undeath_Name = new string[7]
	Undeath_Name[0] = "I. In Their Footsteps"
	Undeath_Name[1] = "II. Exhuming Power"
	Undeath_Name[2] = "III. Arkay The Enemy"
	Undeath_Name[3] = "IV. Infernal Alchemy"
	Undeath_Name[4] = "V. Scourg Barrow"
	Undeath_Name[5] = "VI. Black Book: Whispers of the Veil"
	Undeath_Name[6] = "VII. The Path of Transcendance"

	Undeath_Giver = new string[7]
	Undeath_Giver[0] = "Automatic Start"
	Undeath_Giver[1] = "Automatic Start during 'In Their Footsteps'"
	Undeath_Giver[2] = "Automatic Start during 'In Their Footsteps'"
	Undeath_Giver[3] = "Automatic Start during 'In Their Footsteps'"
	Undeath_Giver[4] = "Automatic Start"
	Undeath_Giver[5] = "Automatic Start"
	Undeath_Giver[6] = "Automatic Start"

	Undeath_Reqs = new string[7]
	Undeath_Reqs[0] = "Level 30+"
	Undeath_Reqs[1] = "'In Their Footsteps' to have been started"
	Undeath_Reqs[2] = "'In Their Footsteps' to have been started"
	Undeath_Reqs[3] = "'In Their Footsteps' to have been started"
	Undeath_Reqs[4] = "'Arkay The Enemy' and 'Infernal Alchemy'"
	Undeath_Reqs[5] = "Completion of 'Arkay The Enemy'"
	Undeath_Reqs[6] = "Completion of 'Black Book: Whispers of the Veil'"

	Undeath_Notes = new string[7]
	Undeath_Notes[0] = ""
	Undeath_Notes[1] = ""
	Undeath_Notes[2] = ""
	Undeath_Notes[3] = ""
	Undeath_Notes[4] = ""
	Undeath_Notes[5] = "NOTE: This quest can only be obtained by killing the captive priest during the quest 'Arkay The Enemy'"
	Undeath_Notes[6] = ""

	Undeath_First = new int[7]	
	Undeath_First[0] = 10
	Undeath_First[1] = 0	
	Undeath_First[2] = 0	
	Undeath_First[3] = 0	
	Undeath_First[4] = 10
	Undeath_First[5] = 10
	Undeath_First[6] = 10
	
	Undeath_Final = new int[7]	
	Undeath_Final[0] = 70
	Undeath_Final[1] = 33
	Undeath_Final[2] = 35
	Undeath_Final[3] = 61
	Undeath_Final[4] = 50
	Undeath_Final[5] = 20
	Undeath_Final[6] = 100
	
	Undeath_Radiant = new bool[7]
	Undeath_Radiant[0] = false
	Undeath_Radiant[1] = false
	Undeath_Radiant[2] = false
	Undeath_Radiant[3] = false
	Undeath_Radiant[4] = false
	Undeath_Radiant[5] = false
	Undeath_Radiant[6] = false
	
	Undeath_Spoiler = new bool[7]
	Undeath_Spoiler[0] = false
	Undeath_Spoiler[1] = false
	Undeath_Spoiler[2] = false
	Undeath_Spoiler[3] = false
	Undeath_Spoiler[4] = false
	Undeath_Spoiler[5] = false
	Undeath_Spoiler[6] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	Wyrmstooth_ID = new string[17]
	Wyrmstooth_ID[0] = "WTDragonHunt"
	Wyrmstooth_ID[1] = "WTBarrowOfTheWyrm"
	Wyrmstooth_ID[2] = "WTBountyAnimal"
	Wyrmstooth_ID[3] = "WTBountyBandit"
	Wyrmstooth_ID[4] = "WTBountyVampire"
	Wyrmstooth_ID[5] = "WTBountyWarlock"
	Wyrmstooth_ID[6] = "WTWolfFollower"
	Wyrmstooth_ID[7] = "WTPricelessCommodity"
	Wyrmstooth_ID[8] = "WTPlayerHome"
	Wyrmstooth_ID[9] = "WTShargamFavor"
	Wyrmstooth_ID[10] = "WTAthirFavor"
	Wyrmstooth_ID[11] = "WTDaenlitFavor"
	Wyrmstooth_ID[12] = "WTUberEncounter"
	Wyrmstooth_ID[13] = "WTKillThalmor"
	Wyrmstooth_ID[14] = "WTWrapMeUp"
	Wyrmstooth_ID[15] = "WTBlindRobbersCache"
	Wyrmstooth_ID[16] = "WTElmeraFavor"

	Wyrmstooth_Name = new string[17]
	Wyrmstooth_Name[0] = "I. Dragon Hunt"
	Wyrmstooth_Name[1] = "II. Barrow Of The Wyrm"
	Wyrmstooth_Name[2] = "Bounty: Animal"
	Wyrmstooth_Name[3] = "Bounty: Bandit"
	Wyrmstooth_Name[4] = "Bounty: Vampire"
	Wyrmstooth_Name[5] = "Bounty: Warlock"
	Wyrmstooth_Name[6] = "Howl Load Of Trouble (Side)"
	Wyrmstooth_Name[7] = "A Priceless Commodity (Side)"
	Wyrmstooth_Name[8] = "Reclaiming The Past (Side)"
	Wyrmstooth_Name[9] = "Repaying A Debt (Side)"
	Wyrmstooth_Name[10] = "Retrieving Embersunder (Side)"
	Wyrmstooth_Name[11] = "Robbed Blind (Side)"
	Wyrmstooth_Name[12] = "Someone With Backbone (Side)"
	Wyrmstooth_Name[13] = "Unwanted Guests (Side)"
	Wyrmstooth_Name[14] = "Wrap Me Up (Side)"
	Wyrmstooth_Name[15] = "Blind Robber's Cache (Side)"
	Wyrmstooth_Name[16] = "Stickler In The Mud (Side)"

	Wyrmstooth_Giver = new string[17]
	Wyrmstooth_Giver[0] = "Theodyn Bienne"
	Wyrmstooth_Giver[1] = "Automatic Start"
	Wyrmstooth_Giver[2] = "Read the note (Imperial Mining Settlement)"
	Wyrmstooth_Giver[3] = "Read the note from Dunyick (Imperial Mining Settlement)"
	Wyrmstooth_Giver[4] = "Read 'Amon's Note' (Stendarr's Outpost)"
	Wyrmstooth_Giver[5] = "Read the note (Stormcloak Camp)"
	Wyrmstooth_Giver[6] = "Dunyick (Dunyick's Camp)"
	Wyrmstooth_Giver[7] = "Bolmar (Gronndal Grove)"
	Wyrmstooth_Giver[8] = "Enter any building in Fort Valus."
	Wyrmstooth_Giver[9] = "Shargam (Imperial Mining Settlement)"
	Wyrmstooth_Giver[10] = "Athir (Imperial Mining Settlement)"
	Wyrmstooth_Giver[11] = "Daenlit (Imperial Mining Settlement)"
	Wyrmstooth_Giver[12] = "Read the book 'History of Wyrmstooth' or enter the Tomb of Vulom"
	Wyrmstooth_Giver[13] = "Alberthor"
	Wyrmstooth_Giver[14] = "Alberthor"
	Wyrmstooth_Giver[15] = "Read Fjeimir's Note next to his body at Chillbone Camp."
	Wyrmstooth_Giver[16] = "Elmera"

	Wyrmstooth_Reqs = new string[17]
	Wyrmstooth_Reqs[0] = "Level 10+ and completion of 'The Way of the Voice'"
	Wyrmstooth_Reqs[1] = "Completion of 'Dragon Hunt'"
	Wyrmstooth_Reqs[2] = "No Requirements"
	Wyrmstooth_Reqs[3] = "No Requirements"
	Wyrmstooth_Reqs[4] = "No Requirements"
	Wyrmstooth_Reqs[5] = "No Requirements"
	Wyrmstooth_Reqs[6] = "No Requirements"
	Wyrmstooth_Reqs[7] = "No Requirements"
	Wyrmstooth_Reqs[8] = "No Requirements"
	Wyrmstooth_Reqs[9] = "Completion of Wyrmstooth main quest line"
	Wyrmstooth_Reqs[10] = "Completion of Wyrmstooth main quest line"
	Wyrmstooth_Reqs[11] = "Completion of Wyrmstooth main quest line"
	Wyrmstooth_Reqs[12] = "No Requirements"
	Wyrmstooth_Reqs[13] = "Completion of 'Barrow Of The Wyrm'"
	Wyrmstooth_Reqs[14] = "Completion of 'Barrow Of The Wyrm'"
	Wyrmstooth_Reqs[15] = "No Requirements"
	Wyrmstooth_Reqs[16] = "No Requirements"

	Wyrmstooth_Notes = new string[17]
	Wyrmstooth_Notes[0] = ""
	Wyrmstooth_Notes[1] = ""
	Wyrmstooth_Notes[2] = ""
	Wyrmstooth_Notes[3] = ""
	Wyrmstooth_Notes[4] = ""
	Wyrmstooth_Notes[5] = ""
	Wyrmstooth_Notes[6] = ""
	Wyrmstooth_Notes[7] = ""
	Wyrmstooth_Notes[8] = ""
	Wyrmstooth_Notes[9] = ""
	Wyrmstooth_Notes[10] = ""
	Wyrmstooth_Notes[11] = ""
	Wyrmstooth_Notes[12] = ""
	Wyrmstooth_Notes[13] = ""
	Wyrmstooth_Notes[14] = ""
	Wyrmstooth_Notes[15] = ""
	Wyrmstooth_Notes[16] = ""

	Wyrmstooth_First = new int[17]	
	Wyrmstooth_First[0] = 10
	Wyrmstooth_First[1] = 10
	Wyrmstooth_First[2] = 10
	Wyrmstooth_First[3] = 10	
	Wyrmstooth_First[4] = 5
	Wyrmstooth_First[5] = 10
	Wyrmstooth_First[6] = 10
	Wyrmstooth_First[7] = 10
	Wyrmstooth_First[8] = 10	
	Wyrmstooth_First[9] = 10
	Wyrmstooth_First[10] = 10
	Wyrmstooth_First[11] = 10
	Wyrmstooth_First[12] = 10
	Wyrmstooth_First[13] = 10
	Wyrmstooth_First[14] = 10
	Wyrmstooth_First[15] = 10
	Wyrmstooth_First[16] = 10
	
	Wyrmstooth_Final = new int[17]	
	Wyrmstooth_Final[0] = 130
	Wyrmstooth_Final[1] = 270
	Wyrmstooth_Final[2] = 20
	Wyrmstooth_Final[3] = 20
	Wyrmstooth_Final[4] = 20
	Wyrmstooth_Final[5] = 20
	Wyrmstooth_Final[6] = 40
	Wyrmstooth_Final[7] = 60
	Wyrmstooth_Final[8] = 40
	Wyrmstooth_Final[9] = 30
	Wyrmstooth_Final[10] = 30
	Wyrmstooth_Final[11] = 30	
	Wyrmstooth_Final[12] = 50
	Wyrmstooth_Final[13] = 30
	Wyrmstooth_Final[14] = 30
	Wyrmstooth_Final[15] = 30
	Wyrmstooth_Final[16] = 30
	
	Wyrmstooth_Radiant = new bool[17]
	Wyrmstooth_Radiant[0] = false
	Wyrmstooth_Radiant[1] = false
	Wyrmstooth_Radiant[2] = false
	Wyrmstooth_Radiant[3] = false
	Wyrmstooth_Radiant[4] = false
	Wyrmstooth_Radiant[5] = false
	Wyrmstooth_Radiant[6] = false
	Wyrmstooth_Radiant[7] = false
	Wyrmstooth_Radiant[8] = false
	Wyrmstooth_Radiant[9] = false
	Wyrmstooth_Radiant[10] = false
	Wyrmstooth_Radiant[11] = false
	Wyrmstooth_Radiant[12] = false
	Wyrmstooth_Radiant[13] = false
	Wyrmstooth_Radiant[14] = false
	Wyrmstooth_Radiant[15] = false
	Wyrmstooth_Radiant[16] = false
	
	Wyrmstooth_Spoiler = new bool[17]
	Wyrmstooth_Spoiler[0] = false
	Wyrmstooth_Spoiler[1] = false
	Wyrmstooth_Spoiler[2] = false
	Wyrmstooth_Spoiler[3] = false
	Wyrmstooth_Spoiler[4] = false
	Wyrmstooth_Spoiler[5] = false
	Wyrmstooth_Spoiler[6] = false
	Wyrmstooth_Spoiler[7] = false
	Wyrmstooth_Spoiler[8] = false
	Wyrmstooth_Spoiler[9] = false
	Wyrmstooth_Spoiler[10] = false
	Wyrmstooth_Spoiler[11] = false
	Wyrmstooth_Spoiler[12] = false
	Wyrmstooth_Spoiler[13] = false
	Wyrmstooth_Spoiler[14] = false
	Wyrmstooth_Spoiler[15] = false
	Wyrmstooth_Spoiler[16] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	VigilantMain_ID = new string[20]
	VigilantMain_ID[0] = "zzzAoMMq00"
	VigilantMain_ID[1] = "zzzAoMMq01"
	VigilantMain_ID[2] = "zzzAoMMq02"
	VigilantMain_ID[3] = "zzzAoMMq03"
	VigilantMain_ID[4] = "zzzAoMMq04"
	VigilantMain_ID[5] = "zzzAoMMq05"
	VigilantMain_ID[6] = "zzzAoMMq06"
	VigilantMain_ID[7] = "zzzAoMMq07"
	VigilantMain_ID[8] = "zzzAoMMq08"
	VigilantMain_ID[9] = "zzzAoMMq09"
	VigilantMain_ID[10] = "zzzAoMMq10"
	VigilantMain_ID[11] = "zzzAoMSubQ01"
	VigilantMain_ID[12] = "zzzBMMq01"
	VigilantMain_ID[13] = "zzzBMMq02"
	VigilantMain_ID[14] = "zzzBMMq03"
	VigilantMain_ID[15] = "zzzCOMq01"
	VigilantMain_ID[16] = "zzzCHMQ00"
	VigilantMain_ID[17] = "zzzCHMQ01"
	VigilantMain_ID[18] = "zzzCHMQ02"
	VigilantMain_ID[19] = "zzzCHEpilogueQuest01"

	VigilantMain_Name = new string[20]
	VigilantMain_Name[0] = "(Act I) Vigilant of Stendarr"
	VigilantMain_Name[1] = "(Act I) Bloodsucker"
	VigilantMain_Name[2] = "(Act I) He Who Cannot Be Touched"
	VigilantMain_Name[3] = "(Act I) Lazy Afternoon"
	VigilantMain_Name[4] = "(Act I) The Eye of Madness"
	VigilantMain_Name[5] = "(Act I) Dine and Dash"
	VigilantMain_Name[6] = "(Act I) Thus Spoke Khajiit"
	VigilantMain_Name[7] = "(Act I) Old Guilts"
	VigilantMain_Name[8] = "(Act I) No Mercy"
	VigilantMain_Name[9] = "(Act I) The Endless Fall"
	VigilantMain_Name[10] = "(Act I) The Landing"
	VigilantMain_Name[11] = "(Act I) The witch of Ivarstead"
	VigilantMain_Name[12] = "(Act II) Empty Cells"
	VigilantMain_Name[13] = "(Act II) Loose Ends"
	VigilantMain_Name[14] = "(Act II) The Blood Matron"
	VigilantMain_Name[15] = "(Act III) Child of Oblivion"
	VigilantMain_Name[16] = "(Act IV) Coldharbour"
	VigilantMain_Name[17] = "(Act IV) Aetherius"
	VigilantMain_Name[18] = "(Act IV) Exsultate Jubilate"
	VigilantMain_Name[19] = "(Act IV) A Million Cats"

	VigilantMain_Giver = new string[20]
	VigilantMain_Giver[0] = "Altano (Windpeak Inn)"
	VigilantMain_Giver[1] = "Automatic Start"
	VigilantMain_Giver[2] = "Automatic Start"
	VigilantMain_Giver[3] = "Automatic Start"
	VigilantMain_Giver[4] = "Automatic Start"
	VigilantMain_Giver[5] = "Automatic Start"
	VigilantMain_Giver[6] = "Automatic Start"
	VigilantMain_Giver[7] = "Automatic Start"
	VigilantMain_Giver[8] = "Automatic Start"
	VigilantMain_Giver[9] = "Automatic Start"
	VigilantMain_Giver[10] = "Automatic Start"
	VigilantMain_Giver[11] = "Automatic Start"
	VigilantMain_Giver[12] = "Automatic Start"
	VigilantMain_Giver[13] = "Automatic Start"
	VigilantMain_Giver[14] = "Automatic Start"
	VigilantMain_Giver[15] = "Automatic Start"
	VigilantMain_Giver[16] = "Automatic Start"
	VigilantMain_Giver[17] = "Automatic Start"
	VigilantMain_Giver[18] = "Automatic Start"
	VigilantMain_Giver[19] = "Automatic Start"

	VigilantMain_Reqs = new string[20]
	VigilantMain_Reqs[0] = "No Requirements"
	VigilantMain_Reqs[1] = "Completion of 'Vigilant of Stendarr'"
	VigilantMain_Reqs[2] = "Completion of 'Bloodsucker'"
	VigilantMain_Reqs[3] = "Completion of 'He Who Cannot Be Touched'"
	VigilantMain_Reqs[4] = "Completion of 'Lazy Afternoon'"
	VigilantMain_Reqs[5] = "Completion of 'The Eye of Madness'"
	VigilantMain_Reqs[6] = "Completion of 'Dine and Dash'"
	VigilantMain_Reqs[7] = "Completion of 'Thus Spoke Khajiit'"
	VigilantMain_Reqs[8] = "Completion of 'Old Guilts'"
	VigilantMain_Reqs[9] = "Completion of 'No Mercy'"
	VigilantMain_Reqs[10] = "Completion of 'The Endless Fall'"
	VigilantMain_Reqs[11] = "Completion of 'The Landing'"
	VigilantMain_Reqs[12] = "Completion of 'The Landing'"
	VigilantMain_Reqs[13] = "Must have started 'Empty Cells'"
	VigilantMain_Reqs[14] = "Must have started 'Empty Cells'"
	VigilantMain_Reqs[15] = "Completion of 'Empty Cells'"
	VigilantMain_Reqs[16] = "Completion of 'Child Of Oblivion'"
	VigilantMain_Reqs[17] = "Completion of 'Coldharbour'"
	VigilantMain_Reqs[18] = "Completion of 'Exsultate Jubilate'"
	VigilantMain_Reqs[19] = "Completion of 'Exsultate Jubilate'"

	VigilantMain_Notes = new string[20]
	VigilantMain_Notes[0] = ""
	VigilantMain_Notes[1] = ""
	VigilantMain_Notes[2] = ""
	VigilantMain_Notes[3] = ""
	VigilantMain_Notes[4] = ""
	VigilantMain_Notes[5] = ""
	VigilantMain_Notes[6] = ""
	VigilantMain_Notes[7] = ""
	VigilantMain_Notes[8] = "NOTE: Karma Neutral path - Start conversation with 'What are you doing here?'"
	VigilantMain_Notes[9] = "NOTE: Karma Gain path - Defy Molag Bal with 'Begone...' and 'I said, begone...' dialogue options"
	VigilantMain_Notes[10] = ""
	VigilantMain_Notes[11] = "NOTE: This quest will register as 'Ongoing' when the quest 'The Landing' is started, once 'The Landing' has been completed, travel back to the Witch's Pond and speak with Reyda.\n Karma Gain path - Ignore her lies and tell her that her fate is sealed"
	VigilantMain_Notes[12] = "NOTE: Start this quest by speaking to the Windhelm guard outside the Temple of Stendarr, this quest will complete after speaking to Jorleif, 'Loose Ends' and 'The Blood Matron'"
	VigilantMain_Notes[13] = "Note: This quest is contained within 'Empty Cells',\n Karma Gain path - Kill the giant Vampire Brute.\n Karma Neutral Path - Answer Lamae with 'Begone, monster', or attack her if you already agreed to her offer"
	VigilantMain_Notes[14] = "Note: This quest is contained within 'Empty Cells'.\n Karma Gain path - automatic on completion"
	VigilantMain_Notes[15] = "NOTE: Start this quest by returning to the Temple of Stendarr after leaving Windhelm, Choosing the death option will result in missing the Museum quest display for act III, it is highly recommended to complete this quest accepting the help of Molag Bal"
	VigilantMain_Notes[16] = "NOTE: This quest does not appear in your journal"
	VigilantMain_Notes[17] = "NOTE: This quest does not appear in your journal, Must have a Karma Level of 50+ for a chance to trigger the good ending"
	VigilantMain_Notes[18] = "NOTE: This quest does not appear in your journal"
	VigilantMain_Notes[19] = "NOTE: This quest does not appear in your journal"

	VigilantMain_First = new int[20]	
	VigilantMain_First[0] = 0
	VigilantMain_First[1] = 0	
	VigilantMain_First[2] = 0	
	VigilantMain_First[3] = 0	
	VigilantMain_First[4] = 0
	VigilantMain_First[5] = 0
	VigilantMain_First[6] = 0	
	VigilantMain_First[7] = 0	
	VigilantMain_First[8] = 0	
	VigilantMain_First[9] = 0
	VigilantMain_First[10] = 0
	VigilantMain_First[11] = 10
	VigilantMain_First[12] = 0
	VigilantMain_First[13] = 0
	VigilantMain_First[14] = 0
	VigilantMain_First[15] = 0
	VigilantMain_First[16] = 0
	VigilantMain_First[17] = 0
	VigilantMain_First[18] = 0
	VigilantMain_First[19] = 0
	
	VigilantMain_Final = new int[20]	
	VigilantMain_Final[0] = 999
	VigilantMain_Final[1] = 999
	VigilantMain_Final[2] = 999
	VigilantMain_Final[3] = 999
	VigilantMain_Final[4] = 999
	VigilantMain_Final[5] = 999
	VigilantMain_Final[6] = 999
	VigilantMain_Final[7] = 999
	VigilantMain_Final[8] = 999
	VigilantMain_Final[9] = 999
	VigilantMain_Final[10] = 999
	VigilantMain_Final[11] = 300	
	VigilantMain_Final[12] = 999
	VigilantMain_Final[13] = 999
	VigilantMain_Final[14] = 999
	VigilantMain_Final[15] = 999
	VigilantMain_Final[16] = 999
	VigilantMain_Final[17] = 255	
	VigilantMain_Final[18] = 50
	VigilantMain_Final[19] = 20	
	
	VigilantMain_Radiant = new bool[20]
	VigilantMain_Radiant[0] = false
	VigilantMain_Radiant[1] = false
	VigilantMain_Radiant[2] = false
	VigilantMain_Radiant[3] = false
	VigilantMain_Radiant[4] = false
	VigilantMain_Radiant[5] = false
	VigilantMain_Radiant[6] = false
	VigilantMain_Radiant[7] = false
	VigilantMain_Radiant[8] = false
	VigilantMain_Radiant[9] = false
	VigilantMain_Radiant[10] = false
	VigilantMain_Radiant[11] = false
	VigilantMain_Radiant[12] = false
	VigilantMain_Radiant[13] = false
	VigilantMain_Radiant[14] = false
	VigilantMain_Radiant[15] = false
	VigilantMain_Radiant[16] = false
	VigilantMain_Radiant[17] = false
	VigilantMain_Radiant[18] = false
	VigilantMain_Radiant[19] = false
	
	VigilantMain_Spoiler = new bool[20]
	VigilantMain_Spoiler[0] = false
	VigilantMain_Spoiler[1] = false
	VigilantMain_Spoiler[2] = false
	VigilantMain_Spoiler[3] = false
	VigilantMain_Spoiler[4] = false
	VigilantMain_Spoiler[5] = false
	VigilantMain_Spoiler[6] = false
	VigilantMain_Spoiler[7] = false
	VigilantMain_Spoiler[8] = false
	VigilantMain_Spoiler[9] = false
	VigilantMain_Spoiler[10] = false
	VigilantMain_Spoiler[11] = true
	VigilantMain_Spoiler[12] = false
	VigilantMain_Spoiler[13] = false
	VigilantMain_Spoiler[14] = false
	VigilantMain_Spoiler[15] = false
	VigilantMain_Spoiler[16] = false
	VigilantMain_Spoiler[17] = false
	VigilantMain_Spoiler[18] = false
	VigilantMain_Spoiler[19] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	VigilantSide_ID = new string[18]
	VigilantSide_ID[0] = ""
	VigilantSide_ID[1] = ""
	VigilantSide_ID[2] = ""
	VigilantSide_ID[3] = ""
	VigilantSide_ID[4] = ""
	VigilantSide_ID[5] = "zzzCHSubQuest02"
	VigilantSide_ID[6] = "zzzCHSubQuest03"
	VigilantSide_ID[7] = "zzzCHSubQuest04"
	VigilantSide_ID[8] = "zzzCHSubQuest01"
	VigilantSide_ID[9] = "zzzCHSubQuest09"
	VigilantSide_ID[10] = "zzzCHSubQuest10"
	VigilantSide_ID[11] = "zzzCHSubQuest08"
	VigilantSide_ID[12] = "zzzCHSubQuest07"
	VigilantSide_ID[13] = "zzzCHSubQuest12"
	VigilantSide_ID[14] = "zzzCHSubQuest05"
	VigilantSide_ID[15] = "zzzCHSubQuest06"
	VigilantSide_ID[16] = "zzzCHSubQuest11"
	VigilantSide_ID[17] = "zzzCHGreymarchQuest"

	VigilantSide_Name = new string[18]
	VigilantSide_Name[0] = "Knight of Akatosh"
	VigilantSide_Name[1] = "Knight of Talos"
	VigilantSide_Name[2] = "Knight of Mara"
	VigilantSide_Name[3] = "Knight of Stendarr"
	VigilantSide_Name[4] = "Knight of Dibella"
	VigilantSide_Name[5] = "Archer of Kyne"
	VigilantSide_Name[6] = "The Black Worm"
	VigilantSide_Name[7] = "Funeral"
	VigilantSide_Name[8] = "More Skooma"
	VigilantSide_Name[9] = "Paladin Melus"
	VigilantSide_Name[10] = "Knight of Arkay"
	VigilantSide_Name[11] = "Knight of Zenithar"
	VigilantSide_Name[12] = "Knight of Julianos"
	VigilantSide_Name[13] = "Knight of Kynareth"
	VigilantSide_Name[14] = "The Madness"
	VigilantSide_Name[15] = "The Avenger"
	VigilantSide_Name[16] = "Kyne's Dragon"
	VigilantSide_Name[17] = "Greymarch"

	VigilantSide_Giver = new string[18]
	VigilantSide_Giver[0] = "Sir Amiel (Barrier Tower of Anyammis)"
	VigilantSide_Giver[1] = "Sir Berich (Old Temple of the Eight Divines)"
	VigilantSide_Giver[2] = "Sir Casimir (Old Temple of the Eight Divines)"
	VigilantSide_Giver[3] = "Sir Caius (Prison Sewer)"
	VigilantSide_Giver[4] = "Sir Gregory"
	VigilantSide_Giver[5] = "Bourlor"
	VigilantSide_Giver[6] = "Black Worm (Silorn's Priory)"
	VigilantSide_Giver[7] = "Martha (Watchtowers)"
	VigilantSide_Giver[8] = "Ja'zhan Sr (Prison Tower)"
	VigilantSide_Giver[9] = "Melus Petilius"
	VigilantSide_Giver[10] = "Sir Torolf (Church of Arkay)"
	VigilantSide_Giver[11] = "Sir Ralvas (Prison Tower)"
	VigilantSide_Giver[12] = "Sir Henrik"
	VigilantSide_Giver[13] = "Sir Juncan"
	VigilantSide_Giver[14] = "Mad King Dro'Zel (Malatar Mansion)"
	VigilantSide_Giver[15] = "Aredhel (St. Dulsa's Charnel)"
	VigilantSide_Giver[16] = "Kahkaankrein (Second Inquisition Court)"
	VigilantSide_Giver[17] = "Automatic Start"

	VigilantSide_Reqs = new string[18]
	VigilantSide_Reqs[0] = "No Requirements"
	VigilantSide_Reqs[1] = "No Requirements"
	VigilantSide_Reqs[2] = "No Requirements"
	VigilantSide_Reqs[3] = "No Requirements"
	VigilantSide_Reqs[4] = "No Requirements"
	VigilantSide_Reqs[5] = "No Requirements"
	VigilantSide_Reqs[6] = "No Requirements"
	VigilantSide_Reqs[7] = "No Requirements"
	VigilantSide_Reqs[8] = "No Requirements"
	VigilantSide_Reqs[9] = "No Requirements"
	VigilantSide_Reqs[10] = "Obtained Sithis' Eye Ring"
	VigilantSide_Reqs[11] = "No Requirements"
	VigilantSide_Reqs[12] = "No Requirements"
	VigilantSide_Reqs[13] = "No Requirements"
	VigilantSide_Reqs[14] = "No Requirements"
	VigilantSide_Reqs[15] = "No Requirements"
	VigilantSide_Reqs[16] = "Kyne's Feather & White Flowers(Funeral Quest)"
	VigilantSide_Reqs[17] = "No Requirements"

	VigilantSide_Notes = new string[18]
	VigilantSide_Notes[0] = "NOTE: Speak to sir Amiel, Becomes a follower if you have more than 0 karma"
	VigilantSide_Notes[1] = "NOTE: Speak to Sir Berich, Becomes a follower if you have more than 20 karma"
	VigilantSide_Notes[2] = "NOTE: Find and battle Sir Casimir in the 'Old Temple of the Eight Divines'"
	VigilantSide_Notes[3] = "NOTE: If you kill Atima and appeal to Caius' sense of duty, he can become a follower.\n WARNING: Killing Atima results in missing a relic from the Museum"
	VigilantSide_Notes[4] = "NOTE: Collect all 7 of Sir Gregory's notes found inside little Dibella statues around ColdHarbour"
	VigilantSide_Notes[5] = "NOTE: Becomes a follower if you defeat Vernaccus in Fort Verin, loot Bourlor's Bow from Vernaccus and bring it back to Bourlor"
	VigilantSide_Notes[6] = "NOTE: If you let him out (karma loss), he'll move to Mathmalatu Priory and become a merchant.\n Karma Gain path - Kill him in the prison"
	VigilantSide_Notes[7] = "NOTE: Return to the graveyard and speak to Martha to complete this quest"
	VigilantSide_Notes[8] = "NOTE: Complete this quest by speaking to 'Ja'zhan Sr' after clearing the Prison Tower"
	VigilantSide_Notes[9] = "NOTE: Can be met a total of 3 times, the final being a Boss Battle"
	VigilantSide_Notes[10] = "NOTE: Boss Battle, striking the wall with Arkay's skeleton using the 'Greatsword of Anui-El' will reveal the door to the Hall of Bones"
	VigilantSide_Notes[11] = "NOTE: Return Ralvas his head and he can become a follower"
	VigilantSide_Notes[12] = "NOTE: Can be met a total of 4 times, the final time with a decision to be made"
	VigilantSide_Notes[13] = "NOTE: Can be met a total of 5 times, the final being a Boss Battle"
	VigilantSide_Notes[14] = "NOTE: Find and defeat 'Mad King Dro'Zel'"
	VigilantSide_Notes[15] = "NOTE: Defeat Aredhel in St. Dulsa's Charnel"
	VigilantSide_Notes[16] = "NOTE: If you have Kyne's Feather in your inventory, he'll ask you for it and giving it to him will set him free"
	VigilantSide_Notes[17] = "NOTE: This quest starts when you kill Marukh in Malada"

	VigilantSide_First = new int[18]	
	VigilantSide_First[0] = -999
	VigilantSide_First[1] = -999	
	VigilantSide_First[2] = -999	
	VigilantSide_First[3] = -999	
	VigilantSide_First[4] = -999
	VigilantSide_First[5] = 10
	VigilantSide_First[6] = 10	
	VigilantSide_First[7] = 10	
	VigilantSide_First[8] = 10	
	VigilantSide_First[9] = 5
	VigilantSide_First[10] = 0
	VigilantSide_First[11] = 0
	VigilantSide_First[12] = 0
	VigilantSide_First[13] = 0
	VigilantSide_First[14] = 10
	VigilantSide_First[15] = 5
	VigilantSide_First[16] = 10
	VigilantSide_First[17] = 10
	
	VigilantSide_Final = new int[18]	
	VigilantSide_Final[0] = 0
	VigilantSide_Final[1] = 0
	VigilantSide_Final[2] = 0
	VigilantSide_Final[3] = 0
	VigilantSide_Final[4] = 0
	VigilantSide_Final[5] = 255
	VigilantSide_Final[6] = 255
	VigilantSide_Final[7] = 255
	VigilantSide_Final[8] = 255
	VigilantSide_Final[9] = 20
	VigilantSide_Final[10] = 20
	VigilantSide_Final[11] = 999	
	VigilantSide_Final[12] = 999
	VigilantSide_Final[13] = 50
	VigilantSide_Final[14] = 60
	VigilantSide_Final[15] = 30
	VigilantSide_Final[16] = 999
	VigilantSide_Final[17] = 20	
	
	VigilantSide_Radiant = new bool[18]
	VigilantSide_Radiant[0] = true
	VigilantSide_Radiant[1] = true
	VigilantSide_Radiant[2] = true
	VigilantSide_Radiant[3] = true
	VigilantSide_Radiant[4] = true
	VigilantSide_Radiant[5] = false
	VigilantSide_Radiant[6] = false
	VigilantSide_Radiant[7] = false
	VigilantSide_Radiant[8] = false
	VigilantSide_Radiant[9] = false
	VigilantSide_Radiant[10] = false
	VigilantSide_Radiant[11] = false
	VigilantSide_Radiant[12] = false
	VigilantSide_Radiant[13] = false
	VigilantSide_Radiant[14] = false
	VigilantSide_Radiant[15] = false
	VigilantSide_Radiant[16] = false
	VigilantSide_Radiant[17] = false
	
	VigilantSide_Spoiler = new bool[18]
	VigilantSide_Spoiler[0] = false
	VigilantSide_Spoiler[1] = false
	VigilantSide_Spoiler[2] = false
	VigilantSide_Spoiler[3] = false
	VigilantSide_Spoiler[4] = false
	VigilantSide_Spoiler[5] = false
	VigilantSide_Spoiler[6] = false
	VigilantSide_Spoiler[7] = false
	VigilantSide_Spoiler[8] = false
	VigilantSide_Spoiler[9] = false
	VigilantSide_Spoiler[10] = false
	VigilantSide_Spoiler[11] = false
	VigilantSide_Spoiler[12] = false
	VigilantSide_Spoiler[13] = false
	VigilantSide_Spoiler[14] = false
	VigilantSide_Spoiler[15] = false
	VigilantSide_Spoiler[16] = false
	VigilantSide_Spoiler[17] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	VigilantMem_ID = new string[12]
	VigilantMem_ID[0] = "zzzCHMemoryQuest03"
	VigilantMem_ID[1] = "zzzCHMemoryQuest04"
	VigilantMem_ID[2] = "zzzCHMemoryQuest10"
	VigilantMem_ID[3] = "zzzCHMemoryQuest01"
	VigilantMem_ID[4] = "zzzCHMemoryQuest02"
	VigilantMem_ID[5] = "zzzCHMemoryQuest05"
	VigilantMem_ID[6] = "zzzCHMemoryQuest11"
	VigilantMem_ID[7] = "zzzCHMemoryQuest12"
	VigilantMem_ID[8] = "zzzCHMemoryQuest06"
	VigilantMem_ID[9] = "zzzCHMemoryQuest07"
	VigilantMem_ID[10] = "zzzCHMemoryQuest08"
	VigilantMem_ID[11] = "zzzCHMemoryQuest09"

	VigilantMem_Name = new string[12]
	VigilantMem_Name[0] = "The Knight of Hounds"
	VigilantMem_Name[1] = "Johan the Fool"
	VigilantMem_Name[2] = "Pelinal the Bloody"
	VigilantMem_Name[3] = "The Grand Inquisitor"
	VigilantMem_Name[4] = "The Mad King"
	VigilantMem_Name[5] = "Ada Bal"
	VigilantMem_Name[6] = "After the Storm"
	VigilantMem_Name[7] = "The Last Night"
	VigilantMem_Name[8] = "Remains of the Miracle"
	VigilantMem_Name[9] = "Temptation of Marukh"
	VigilantMem_Name[10] = "The Nameless Bard"
	VigilantMem_Name[11] = "Beyond the Madness"

	VigilantMem_Giver = new string[12]
	VigilantMem_Giver[0] = "Automatic Start"
	VigilantMem_Giver[1] = "Automatic Start"
	VigilantMem_Giver[2] = "Automatic Start"
	VigilantMem_Giver[3] = "Automatic Start"
	VigilantMem_Giver[4] = "Automatic Start"
	VigilantMem_Giver[5] = "Automatic Start"
	VigilantMem_Giver[6] = "Automatic Start"
	VigilantMem_Giver[7] = "Automatic Start"
	VigilantMem_Giver[8] = "Automatic Start"
	VigilantMem_Giver[9] = "Automatic Start"
	VigilantMem_Giver[10] = "Automatic Start"
	VigilantMem_Giver[11] = "Automatic Start"

	VigilantMem_Reqs = new string[12]
	VigilantMem_Reqs[0] = "Win the Boss Battle against Varla in 'Fort Welkynd'"
	VigilantMem_Reqs[1] = "No Requirements"
	VigilantMem_Reqs[2] = "Win the battle against Pelinal The Bloody at the Barrier Tower of Agea"
	VigilantMem_Reqs[3] = "No Requirements"
	VigilantMem_Reqs[4] = "Defeating 'Mad King Dro'Zel' in Malatar Mansion"
	VigilantMem_Reqs[5] = "No Requirements"
	VigilantMem_Reqs[6] = "Comnpletion of the quest 'Pelinal the Bloody'"
	VigilantMem_Reqs[7] = "Completion of the quest 'After the Storm'"
	VigilantMem_Reqs[8] = "Completion of 'Coldharbour'"
	VigilantMem_Reqs[9] = "Completion of 'Coldharbour'"
	VigilantMem_Reqs[10] = "Completion of 'Coldharbour'"
	VigilantMem_Reqs[11] = "Completion of 'Coldharbour'"

	VigilantMem_Notes = new string[12]
	VigilantMem_Notes[0] = "NOTE: Loot Enola's Skull to start the Memory Quest.\n Karma Gain path - keep refusing to kill Enola until Belharza relents"
	VigilantMem_Notes[1] = "NOTE: Activate Johan's Grave to start this memory quest.\n Karma Gain path - Refuse the mace and drive the bard away"
	VigilantMem_Notes[2] = "NOTE: Walk into the red stream of light and confirm you want to synchronize your soul.\n Karma Gain path - Activate the shackles on Mary's hands, lead her back to the main hall, listen to Pelinal"
	VigilantMem_Notes[3] = "NOTE: Kill Mary in the 'Cradle of Filth' to start this quest.\n Karma Gain path - Remain quiet through the entirety of Pepe's rant"
	VigilantMem_Notes[4] = "NOTE: Fight Dro'Zel in Malatar Mansion to the last room where he cowers next to Hasaama's corpse.\n Karma Gain path - don't tell Dro'Zel about Gilverdale"
	VigilantMem_Notes[5] = "NOTE: Activate Dulsa's bones in St. Dulsa's Charnel to start this quest.\n Karma Gain path - Kill Marukh without being hit by him more than once"
	VigilantMem_Notes[6] = "NOTE: This memory is different depending on the path you took in Pelinal's quest"
	VigilantMem_Notes[7] = "NOTE: This memory is different depending on the path you took in Pelinal's quest"
	VigilantMem_Notes[8] = "NOTE: Activate the first Strange Sand Pile to start this quest, only available if you had 50 or more karma when you reached the top of the tower and placed Ada Bal in the set on the floor"
	VigilantMem_Notes[9] = "NOTE: Activate the Second Strange Sand Pile to start this quest,Only available if you had 50 or more karma when you reached the top of the tower and placed Ada Bal in the set on the floor.\nKarma Gain path -  Answer Alessia with '...' dialogue option and kill her"
	VigilantMem_Notes[10] = "NOTE: Activate the Third Strange Sand Pile to start this quest after defeating Molag Bal, Only available if you had 50 or more karma when you reached the top of the tower and placed Ada Bal in the set on the floor"
	VigilantMem_Notes[11] = "NOTE: This Quest is only available if you select 'Ada Bal' during the quest 'The Nameless Bard'.\nManually toggle this quest complete if it doesn't auto update"

	VigilantMem_First = new int[12]	
	VigilantMem_First[0] = 0
	VigilantMem_First[1] = 0	
	VigilantMem_First[2] = 0	
	VigilantMem_First[3] = 0
	VigilantMem_First[4] = 0
	VigilantMem_First[5] = 0
	VigilantMem_First[6] = 0	
	VigilantMem_First[7] = 0	
	VigilantMem_First[8] = 0	
	VigilantMem_First[9] = 0
	VigilantMem_First[10] = 0
	VigilantMem_First[11] = -999
	
	VigilantMem_Final = new int[12]	
	VigilantMem_Final[0] = 999
	VigilantMem_Final[1] = 999
	VigilantMem_Final[2] = 999
	VigilantMem_Final[3] = 999
	VigilantMem_Final[4] = 999
	VigilantMem_Final[5] = 999
	VigilantMem_Final[6] = 999
	VigilantMem_Final[7] = 999
	VigilantMem_Final[8] = 999
	VigilantMem_Final[9] = 999
	VigilantMem_Final[10] = 999
	VigilantMem_Final[11] = 999	
	
	VigilantMem_Radiant = new bool[12]
	VigilantMem_Radiant[0] = false
	VigilantMem_Radiant[1] = false
	VigilantMem_Radiant[2] = false
	VigilantMem_Radiant[3] = false
	VigilantMem_Radiant[4] = false
	VigilantMem_Radiant[5] = false
	VigilantMem_Radiant[6] = false
	VigilantMem_Radiant[7] = false
	VigilantMem_Radiant[8] = false
	VigilantMem_Radiant[9] = false
	VigilantMem_Radiant[10] = false
	VigilantMem_Radiant[11] = false
	
	VigilantMem_Spoiler = new bool[12]
	VigilantMem_Spoiler[0] = false
	VigilantMem_Spoiler[1] = false
	VigilantMem_Spoiler[2] = false
	VigilantMem_Spoiler[3] = false
	VigilantMem_Spoiler[4] = false
	VigilantMem_Spoiler[5] = false
	VigilantMem_Spoiler[6] = false
	VigilantMem_Spoiler[7] = false
	VigilantMem_Spoiler[8] = false
	VigilantMem_Spoiler[9] = false
	VigilantMem_Spoiler[10] = false
	VigilantMem_Spoiler[11] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	InterestingNPCMain_ID = new string[24]
	InterestingNPCMain_ID[0] = "DJGQuest"
	InterestingNPCMain_ID[1] = "ErevanQuest"
	InterestingNPCMain_ID[2] = "DJGQuest2"
	InterestingNPCMain_ID[3] = "AmaleeQuest"
	InterestingNPCMain_ID[4] = "hagquest"
	InterestingNPCMain_ID[5] = "RaynesGriffithQuest"
	InterestingNPCMain_ID[6] = "CWQQ2"
	InterestingNPCMain_ID[7] = "AnumLaQuest"
	InterestingNPCMain_ID[8] = "AmicusDialogue"
	InterestingNPCMain_ID[9] = "GorrQuest"
	InterestingNPCMain_ID[10] = "warrensquest"
	InterestingNPCMain_ID[11] = "DialogueNair"
	InterestingNPCMain_ID[12] = "ZoraQuest"
	InterestingNPCMain_ID[13] = "Herranquest"
	InterestingNPCMain_ID[14] = "ArilwaenQuest"
	InterestingNPCMain_ID[15] = "DialogueJasparGaerston"
	InterestingNPCMain_ID[16] = "RDQuest"
	InterestingNPCMain_ID[17] = "AsteriaQuest"
	InterestingNPCMain_ID[18] = "RumarinQuest2"
	InterestingNPCMain_ID[19] = "AldiQuest"
	InterestingNPCMain_ID[20] = "SvashniQuest"
	InterestingNPCMain_ID[21] = "HorkerQuest"
	InterestingNPCMain_ID[22] = "KjoliQuest"
	InterestingNPCMain_ID[23] = "ViranyaQuest"
	
	InterestingNPCMain_Name = new string[24]
	InterestingNPCMain_Name[0] = "A Debt of Blood"
	InterestingNPCMain_Name[1] = "A Rose Without Thorns"
	InterestingNPCMain_Name[2] = "As You Like It"
	InterestingNPCMain_Name[3] = "Bards, Beasts, and Beauties"
	InterestingNPCMain_Name[4] = "Birds of a Feather"
	InterestingNPCMain_Name[5] = "Brother and Keeper"
	InterestingNPCMain_Name[6] = "Forgotten Lore"
	InterestingNPCMain_Name[7] = "Honor's Calling"
	InterestingNPCMain_Name[8] = "Idle Dreams"
	InterestingNPCMain_Name[9] = "Pit Dogs"
	InterestingNPCMain_Name[10] = "Stolen Property"
	InterestingNPCMain_Name[11] = "The Aldmeri Prisoner"
	InterestingNPCMain_Name[12] = "The Children Fair"
	InterestingNPCMain_Name[13] = "The Gales of Guilt"
	InterestingNPCMain_Name[14] = "The Immortal Coil"
	InterestingNPCMain_Name[15] = "The Loudest Whisper"
	InterestingNPCMain_Name[16] = "The Radiant Dark"
	InterestingNPCMain_Name[17] = "The Raven of Anvil"
	InterestingNPCMain_Name[18] = "The Sleeping Giant"
	InterestingNPCMain_Name[19] = "The Teleportation Machine"
	InterestingNPCMain_Name[20] = "The Way of the Nine"
	InterestingNPCMain_Name[21] = "The Way to a Big Oaf's Heart"
	InterestingNPCMain_Name[22] = "To Warm Sands"
	InterestingNPCMain_Name[23] = "Vigilance and Virtue"
	
	InterestingNPCMain_Giver = new string[24]
	InterestingNPCMain_Giver[0] = "Automatic Start after 'The Aldmeri Prisoner'"
	InterestingNPCMain_Giver[1] = "Hiram - (Braidwood Inn)"
	InterestingNPCMain_Giver[2] = "Automatic Start after 'A Debt of Blood'"
	InterestingNPCMain_Giver[3] = "Amalee - (Temple of Dibella)"
	InterestingNPCMain_Giver[4] = "Misha - (The Bird's Eye)"
	InterestingNPCMain_Giver[5] = "Raynes"
	InterestingNPCMain_Giver[6] = "Olivia Meronin - (Winterhold College Arcanaeum)"
	InterestingNPCMain_Giver[7] = "Courier"
	InterestingNPCMain_Giver[8] = "Amicus - (Haelga's Bunkhouse)"
	InterestingNPCMain_Giver[9] = "Zora Fair-Child / Gorr"
	InterestingNPCMain_Giver[10] = "Beggar - (Markarth Warrens)"
	InterestingNPCMain_Giver[11] = "Daenlyn Oakhollow"
	InterestingNPCMain_Giver[12] = "Zora Fair-Child"
	InterestingNPCMain_Giver[13] = "Herran - (Winterhold Frozen Hearth)"
	InterestingNPCMain_Giver[14] = "Anonymous Note - (Solitude Temple of the Divines Talos Altar)"
	InterestingNPCMain_Giver[15] = "Jaspar - (Dawnstar)"
	InterestingNPCMain_Giver[16] = "Corpulus - (Winking Skeever)"
	InterestingNPCMain_Giver[17] = "Asteria - (Old Hroldan)"
	InterestingNPCMain_Giver[18] = "Rumarin"
	InterestingNPCMain_Giver[19] = "Kleppr - (Silver-Blood Inn)"
	InterestingNPCMain_Giver[20] = "S'vashni - (Peakshade Tower)"
	InterestingNPCMain_Giver[21] = "Callen - (Nightgate Inn)"
	InterestingNPCMain_Giver[22] = "Kjoli - (Trees Southeast of Shor's Stone)"
	InterestingNPCMain_Giver[23] = "Viranya / Keerava"
	
	InterestingNPCMain_Reqs = new string[24]
	InterestingNPCMain_Reqs[0] = "Completion of 'The Aldmeri Prisoner'"
	InterestingNPCMain_Reqs[1] = "Spoken with Erevan and completed 'A Blade in the Dark '"
	InterestingNPCMain_Reqs[2] = "Completion of 'A Debt of Blood'"
	InterestingNPCMain_Reqs[3] = "Spoken to Amalee at The Temple of Dibella"
	InterestingNPCMain_Reqs[4] = "No Requirements"
	InterestingNPCMain_Reqs[5] = "Spoken to Griffith"
	InterestingNPCMain_Reqs[6] = "No Requirements"
	InterestingNPCMain_Reqs[7] = "Anum-La's Jorrvaskr Conversation"
	InterestingNPCMain_Reqs[8] = "No Requirements"
	InterestingNPCMain_Reqs[9] = "Completion of 'Children Fair' and met Gorr in both Ivarstead and Markarth"
	InterestingNPCMain_Reqs[10] = "Completion of 'The Forsworn Conspiracy'"
	InterestingNPCMain_Reqs[11] = "Completion of 'Honor's Calling' and 'Brother and Keeper'"
	InterestingNPCMain_Reqs[12] = "Be Outside of Riverwood and be Inside an Inn with at least one location or quest based conversation with Zora completed"
	InterestingNPCMain_Reqs[13] = "No Requirements"
	InterestingNPCMain_Reqs[14] = "No Requirements"
	InterestingNPCMain_Reqs[15] = "Read the book 'The Stone Hand' and have spoken to Jaspar about his Orc Muse"
	InterestingNPCMain_Reqs[16] = "Completion of 'Forgotten Lore', 'The Black Star' and 'Dragon Rising'"
	InterestingNPCMain_Reqs[17] = "Speak to Orenius, Listen to Dusk on Anvil Harbor"
	InterestingNPCMain_Reqs[18] = "Met Fjona, Cleared Moss Mother Cavern, Have no followers, Blood of Kings Questline Not Running"
	InterestingNPCMain_Reqs[19] = "Spoken to Two-Tails"
	InterestingNPCMain_Reqs[20] = "No Requirements"
	InterestingNPCMain_Reqs[21] = "No Requirements"
	InterestingNPCMain_Reqs[22] = "No Requirements"	
	InterestingNPCMain_Reqs[23] = "Spoken to Among-the-Hist and Rinori, Received Viranya's Blessing in the Way of the Nine and have no followers in party"	

	InterestingNPCMain_Notes = new string[24]
	InterestingNPCMain_Notes[0] = ""
	InterestingNPCMain_Notes[1] = ""
	InterestingNPCMain_Notes[2] = ""
	InterestingNPCMain_Notes[3] = ""
	InterestingNPCMain_Notes[4] = ""
	InterestingNPCMain_Notes[5] = ""
	InterestingNPCMain_Notes[6] = ""
	InterestingNPCMain_Notes[7] = ""
	InterestingNPCMain_Notes[8] = ""
	InterestingNPCMain_Notes[9] = ""
	InterestingNPCMain_Notes[10] = ""
	InterestingNPCMain_Notes[11] = ""
	InterestingNPCMain_Notes[12] = ""
	InterestingNPCMain_Notes[13] = ""
	InterestingNPCMain_Notes[14] = ""
	InterestingNPCMain_Notes[15] = ""
	InterestingNPCMain_Notes[16] = ""
	InterestingNPCMain_Notes[17] = ""
	InterestingNPCMain_Notes[18] = ""
	InterestingNPCMain_Notes[19] = ""
	InterestingNPCMain_Notes[20] = ""
	InterestingNPCMain_Notes[21] = ""
	InterestingNPCMain_Notes[22] = ""
	InterestingNPCMain_Notes[23] = ""
	
	InterestingNPCMain_First = new int[24]	
	InterestingNPCMain_First[0] = -999
	InterestingNPCMain_First[1] = -999	
	InterestingNPCMain_First[2] = -999	
	InterestingNPCMain_First[3] = -999	
	InterestingNPCMain_First[4] = -999
	InterestingNPCMain_First[5] = -999
	InterestingNPCMain_First[6] = -999	
	InterestingNPCMain_First[7] = -999	
	InterestingNPCMain_First[8] = -999	
	InterestingNPCMain_First[9] = -999
	InterestingNPCMain_First[10] = -999
	InterestingNPCMain_First[11] = -999
	InterestingNPCMain_First[12] = -999
	InterestingNPCMain_First[13] = -999
	InterestingNPCMain_First[14] = -999
	InterestingNPCMain_First[15] = -999
	InterestingNPCMain_First[16] = -999
	InterestingNPCMain_First[17] = -999
	InterestingNPCMain_First[18] = -999
	InterestingNPCMain_First[19] = -999
	InterestingNPCMain_First[20] = -999
	InterestingNPCMain_First[21] = -999
	InterestingNPCMain_First[22] = -999
	InterestingNPCMain_First[23] = -999

	InterestingNPCMain_Final = new int[24]	
	InterestingNPCMain_Final[0] = 999
	InterestingNPCMain_Final[1] = 999	
	InterestingNPCMain_Final[2] = 999	
	InterestingNPCMain_Final[3] = 999	
	InterestingNPCMain_Final[4] = 999
	InterestingNPCMain_Final[5] = 999
	InterestingNPCMain_Final[6] = 999	
	InterestingNPCMain_Final[7] = 999	
	InterestingNPCMain_Final[8] = 999	
	InterestingNPCMain_Final[9] = 999
	InterestingNPCMain_Final[10] = 999
	InterestingNPCMain_Final[11] = 999
	InterestingNPCMain_Final[12] = 999
	InterestingNPCMain_Final[13] = 999
	InterestingNPCMain_Final[14] = 999
	InterestingNPCMain_Final[15] = 999
	InterestingNPCMain_Final[16] = 999
	InterestingNPCMain_Final[17] = 999
	InterestingNPCMain_Final[18] = 999
	InterestingNPCMain_Final[19] = 999
	InterestingNPCMain_Final[20] = 999
	InterestingNPCMain_Final[21] = 999
	InterestingNPCMain_Final[22] = 999
	InterestingNPCMain_Final[23] = 999
	
	InterestingNPCMain_Radiant = new bool[24]
	InterestingNPCMain_Radiant[0] = false
	InterestingNPCMain_Radiant[1] = false
	InterestingNPCMain_Radiant[2] = false
	InterestingNPCMain_Radiant[3] = false
	InterestingNPCMain_Radiant[4] = false
	InterestingNPCMain_Radiant[5] = false
	InterestingNPCMain_Radiant[6] = false
	InterestingNPCMain_Radiant[7] = false
	InterestingNPCMain_Radiant[8] = false
	InterestingNPCMain_Radiant[9] = false
	InterestingNPCMain_Radiant[10] = false
	InterestingNPCMain_Radiant[11] = false
	InterestingNPCMain_Radiant[12] = false
	InterestingNPCMain_Radiant[13] = false
	InterestingNPCMain_Radiant[14] = false
	InterestingNPCMain_Radiant[15] = false
	InterestingNPCMain_Radiant[16] = false
	InterestingNPCMain_Radiant[17] = false
	InterestingNPCMain_Radiant[18] = false
	InterestingNPCMain_Radiant[19] = false
	InterestingNPCMain_Radiant[20] = false
	InterestingNPCMain_Radiant[21] = false
	InterestingNPCMain_Radiant[22] = false
	InterestingNPCMain_Radiant[23] = false

	InterestingNPCMain_Spoiler = new bool[24]
	InterestingNPCMain_Spoiler[0] = false
	InterestingNPCMain_Spoiler[1] = false
	InterestingNPCMain_Spoiler[2] = false
	InterestingNPCMain_Spoiler[3] = false
	InterestingNPCMain_Spoiler[4] = false
	InterestingNPCMain_Spoiler[5] = false
	InterestingNPCMain_Spoiler[6] = false
	InterestingNPCMain_Spoiler[7] = false
	InterestingNPCMain_Spoiler[8] = false
	InterestingNPCMain_Spoiler[9] = false
	InterestingNPCMain_Spoiler[10] = false
	InterestingNPCMain_Spoiler[11] = false
	InterestingNPCMain_Spoiler[12] = false
	InterestingNPCMain_Spoiler[13] = false
	InterestingNPCMain_Spoiler[14] = false
	InterestingNPCMain_Spoiler[15] = false
	InterestingNPCMain_Spoiler[16] = false
	InterestingNPCMain_Spoiler[17] = false
	InterestingNPCMain_Spoiler[18] = false
	InterestingNPCMain_Spoiler[19] = false
	InterestingNPCMain_Spoiler[20] = false
	InterestingNPCMain_Spoiler[21] = false
	InterestingNPCMain_Spoiler[22] = false
	InterestingNPCMain_Spoiler[23] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	InterestingNPCBOK_ID = new string[7]
	InterestingNPCBOK_ID[0] = "3DNPCMQ1"
	InterestingNPCBOK_ID[1] = "3DNPCMQ2"
	InterestingNPCBOK_ID[2] = "3DNPCMQ3"
	InterestingNPCBOK_ID[3] = "3DNPCMQ4"
	InterestingNPCBOK_ID[4] = "3DNPCMQ5"
	InterestingNPCBOK_ID[5] = "3DNPCMQ6"
	InterestingNPCBOK_ID[6] = "3DNPCMQ7"

	InterestingNPCBOK_Name = new string[7]
	InterestingNPCBOK_Name[0] = "01. From the Blood of Kings"
	InterestingNPCBOK_Name[1] = "02. Faces and Names"
	InterestingNPCBOK_Name[2] = "03. The Bloodsmith"
	InterestingNPCBOK_Name[3] = "04. The Harbinger of Us All"
	InterestingNPCBOK_Name[4] = "05. Blood and Bones"
	InterestingNPCBOK_Name[5] = "06. The Beast Who Cannot Be Slain"
	InterestingNPCBOK_Name[6] = "07. An End to Keep"
	
	InterestingNPCBOK_Giver = new string[7]
	InterestingNPCBOK_Giver[0] = "Elrindir - (Drunken Huntsman)"
	InterestingNPCBOK_Giver[1] = "Zora Fair-Child - (Riverwood)"
	InterestingNPCBOK_Giver[2] = "Isobel"
	InterestingNPCBOK_Giver[3] = "Courier"
	InterestingNPCBOK_Giver[4] = "Falatild - (Rorikstead)"
	InterestingNPCBOK_Giver[5] = "Karras - (Greenwood Shack)"
	InterestingNPCBOK_Giver[6] = "Helcyon - (Drunken Huntsman)"

	InterestingNPCBOK_Reqs = new string[7]
	InterestingNPCBOK_Reqs[0] = "No Followers, Completion of 'Dragon Rising', 'The Children Fair', 'Pit Dogs', 'Honor's Calling' and spoken to Skjarn and Rumarin"
	InterestingNPCBOK_Reqs[1] = "Completion of 'From the Blood of Kings'"
	InterestingNPCBOK_Reqs[2] = "Completion of 'From the Blood of Kings'"
	InterestingNPCBOK_Reqs[3] = "Completion of 'Faces and Names' & 'The Bloodsmith'"
	InterestingNPCBOK_Reqs[4] = "Completion of 'The Harbinger of Us All'"
	InterestingNPCBOK_Reqs[5] = "Completion of 'Blood and Bones'"
	InterestingNPCBOK_Reqs[6] = "Completion of 'The Beast Who Cannot Be Slain'"

	InterestingNPCBOK_Notes = new string[7]
	InterestingNPCBOK_Notes[0] = ""
	InterestingNPCBOK_Notes[1] = ""
	InterestingNPCBOK_Notes[2] = ""
	InterestingNPCBOK_Notes[3] = ""
	InterestingNPCBOK_Notes[4] = ""
	InterestingNPCBOK_Notes[5] = ""
	InterestingNPCBOK_Notes[6] = ""

	InterestingNPCBOK_First = new int[7]	
	InterestingNPCBOK_First[0] = -999
	InterestingNPCBOK_First[1] = -999	
	InterestingNPCBOK_First[2] = -999
	InterestingNPCBOK_First[3] = -999
	InterestingNPCBOK_First[4] = -999
	InterestingNPCBOK_First[5] = -999
	InterestingNPCBOK_First[6] = -999
	
	InterestingNPCBOK_Final = new int[7]	
	InterestingNPCBOK_Final[0] = 999
	InterestingNPCBOK_Final[1] = 999
	InterestingNPCBOK_Final[2] = 999
	InterestingNPCBOK_Final[3] = 999
	InterestingNPCBOK_Final[4] = 999
	InterestingNPCBOK_Final[5] = 999
	InterestingNPCBOK_Final[6] = 999
	
	InterestingNPCBOK_Radiant = new bool[7]
	InterestingNPCBOK_Radiant[0] = false
	InterestingNPCBOK_Radiant[1] = false
	InterestingNPCBOK_Radiant[2] = false
	InterestingNPCBOK_Radiant[3] = false
	InterestingNPCBOK_Radiant[4] = false
	InterestingNPCBOK_Radiant[5] = false
	InterestingNPCBOK_Radiant[6] = false
	
	InterestingNPCBOK_Spoiler = new bool[7]
	InterestingNPCBOK_Spoiler[0] = false
	InterestingNPCBOK_Spoiler[1] = false
	InterestingNPCBOK_Spoiler[2] = false
	InterestingNPCBOK_Spoiler[3] = false
	InterestingNPCBOK_Spoiler[4] = false
	InterestingNPCBOK_Spoiler[5] = false
	InterestingNPCBOK_Spoiler[6] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	InterestingNPCDS_ID = new string[6]
	InterestingNPCDS_ID[0] = "3dmcue"
	InterestingNPCDS_ID[1] = "3dmcue2"
	InterestingNPCDS_ID[2] = "3dmcue3"
	InterestingNPCDS_ID[3] = "3dmcue4"
	InterestingNPCDS_ID[4] = "3dmcue5"
	InterestingNPCDS_ID[5] = "3dmcue6"

	InterestingNPCDS_Name = new string[6]
	InterestingNPCDS_Name[0] = "01. Darkened Steel"
	InterestingNPCDS_Name[1] = "02. A Daedra in the Dark"
	InterestingNPCDS_Name[2] = "03. Cat and Mouse"
	InterestingNPCDS_Name[3] = "04. Deathbroker"
	InterestingNPCDS_Name[4] = "05. A Path Of Bones"
	InterestingNPCDS_Name[5] = "06. The Face of the Ghost"

	InterestingNPCDS_Giver = new string[6]
	InterestingNPCDS_Giver[0] = "Thoring - (Windpeak Inn)"
	InterestingNPCDS_Giver[1] = "Gancielo - (Winking Skeever)"
	InterestingNPCDS_Giver[2] = "Tikrid - (Solitude)"
	InterestingNPCDS_Giver[3] = "Erevan - (Temple of Talos)"
	InterestingNPCDS_Giver[4] = "Erwen - (Shrine of Azura)"
	InterestingNPCDS_Giver[5] = "Tikrid / Krillo - (Dawnstar)"

	InterestingNPCDS_Reqs = new string[6]
	InterestingNPCDS_Reqs[0] = "Completion of 'A Rose Without Thorns', Killed Nimhe, Tikrid's backstory accessed and Tikrid, Erevan not following"
	InterestingNPCDS_Reqs[1] = "Completion of 'Darkened Steel'"
	InterestingNPCDS_Reqs[2] = "Completion of 'A Daedra in the Dark'"
	InterestingNPCDS_Reqs[3] = "Completion of 'Cat and Mouse'"
	InterestingNPCDS_Reqs[4] = "Completion of 'Deathbroker'"
	InterestingNPCDS_Reqs[5] = "Completion of 'A Path Of Bones'"

	InterestingNPCDS_Notes = new string[6]
	InterestingNPCDS_Notes[0] = ""
	InterestingNPCDS_Notes[1] = ""
	InterestingNPCDS_Notes[2] = ""
	InterestingNPCDS_Notes[3] = ""
	InterestingNPCDS_Notes[4] = ""
	InterestingNPCDS_Notes[5] = ""

	InterestingNPCDS_First = new int[6]	
	InterestingNPCDS_First[0] = -999
	InterestingNPCDS_First[1] = -999	
	InterestingNPCDS_First[2] = -999	
	InterestingNPCDS_First[3] = -999	
	InterestingNPCDS_First[4] = -999
	InterestingNPCDS_First[5] = -999
	
	InterestingNPCDS_Final = new int[6]	
	InterestingNPCDS_Final[0] = 999
	InterestingNPCDS_Final[1] = 999
	InterestingNPCDS_Final[2] = 999
	InterestingNPCDS_Final[3] = 999
	InterestingNPCDS_Final[4] = 999
	InterestingNPCDS_Final[5] = 999
	
	InterestingNPCDS_Radiant = new bool[6]
	InterestingNPCDS_Radiant[0] = false
	InterestingNPCDS_Radiant[1] = false
	InterestingNPCDS_Radiant[2] = false
	InterestingNPCDS_Radiant[3] = false
	InterestingNPCDS_Radiant[4] = false
	InterestingNPCDS_Radiant[5] = false
	
	InterestingNPCDS_Spoiler = new bool[6]
	InterestingNPCDS_Spoiler[0] = false
	InterestingNPCDS_Spoiler[1] = false
	InterestingNPCDS_Spoiler[2] = false
	InterestingNPCDS_Spoiler[3] = false
	InterestingNPCDS_Spoiler[4] = false
	InterestingNPCDS_Spoiler[5] = false

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	InterestingNPCMisc_ID = new string[24]
	InterestingNPCMisc_ID[0] = "Jurykquest"
	InterestingNPCMisc_ID[1] = "Rumarinquest"
	InterestingNPCMisc_ID[2] = "Paintingquest"
	InterestingNPCMisc_ID[3] = "DialogueAzzarian"
	InterestingNPCMisc_ID[4] = "Lurgokquest"
	InterestingNPCMisc_ID[5] = "BlackRobesQuest"
	InterestingNPCMisc_ID[6] = "Arielequest"
	InterestingNPCMisc_ID[7] = "Morndasargonianquest"
	InterestingNPCMisc_ID[8] = "DialogueBrakh"
	InterestingNPCMisc_ID[9] = "Beatricequest"
	InterestingNPCMisc_ID[10] = "DialogueTheRelic"
	InterestingNPCMisc_ID[11] = "RobbersRefuge3DNPC"
	InterestingNPCMisc_ID[12] = "CassockQuest"
	InterestingNPCMisc_ID[13] = "Skjelquest"
	InterestingNPCMisc_ID[14] = "DialogueYtharil"
	InterestingNPCMisc_ID[15] = "DialogueDarrakki"
	InterestingNPCMisc_ID[16] = "Hagcursequest"
	InterestingNPCMisc_ID[17] = "Vartheimquest"
	InterestingNPCMisc_ID[18] = "HWSQuest"
	InterestingNPCMisc_ID[19] = "DialogueRaynes"
	InterestingNPCMisc_ID[20] = "DialogueJilkmar"
	InterestingNPCMisc_ID[21] = "Bookquest3dnpc"
	InterestingNPCMisc_ID[22] = "DialogueThriceBitten"
	InterestingNPCMisc_ID[23] = "Terynnequest"
	
	InterestingNPCMisc_Name = new string[24]
	InterestingNPCMisc_Name[0] = "A Crabber's Wife"
	InterestingNPCMisc_Name[1] = "A Spell for Rumarin"
	InterestingNPCMisc_Name[2] = "A Thousand Words"
	InterestingNPCMisc_Name[3] = "Azzarian's Gold"
	InterestingNPCMisc_Name[4] = "Bite the Hand That Feeds You"
	InterestingNPCMisc_Name[5] = "Black Robes"
	InterestingNPCMisc_Name[6] = "Children of the Dust"
	InterestingNPCMisc_Name[7] = "Fenced In"
	InterestingNPCMisc_Name[8] = "Hunter's Quarry"
	InterestingNPCMisc_Name[9] = "Mogo's Mead"
	InterestingNPCMisc_Name[10] = "Relic's Revival"
	InterestingNPCMisc_Name[11] = "Robber's Refuge"
	InterestingNPCMisc_Name[12] = "Spell it Out For Me"
	InterestingNPCMisc_Name[13] = "Tailor Made / A Good Fit"
	InterestingNPCMisc_Name[14] = "The Carver and The Collector"
	InterestingNPCMisc_Name[15] = "The Conspiracy of the 7000 Steps"
	InterestingNPCMisc_Name[16] = "The Curse"
	InterestingNPCMisc_Name[17] = "The Elven Sword"
	InterestingNPCMisc_Name[18] = "The House on the Hill"
	InterestingNPCMisc_Name[19] = "The Law Always Wins"
	InterestingNPCMisc_Name[20] = "The Milk-Drinker"
	InterestingNPCMisc_Name[21] = "The Paper Mirror"
	InterestingNPCMisc_Name[22] = "Thrice-Bitten, Once Shy"
	InterestingNPCMisc_Name[23] = "Transformation"
	
	InterestingNPCMisc_Giver = new string[24]
	InterestingNPCMisc_Giver[0] = "Juryk - Crabber's Shanty"
	InterestingNPCMisc_Giver[1] = "Rumarin - (Yorgrim's Overlook)"
	InterestingNPCMisc_Giver[2] = "Halcar - (Solitude Radiant Raiment)"
	InterestingNPCMisc_Giver[3] = "Azzarian - (Windhelm New Gnisis Cornerclub)"
	InterestingNPCMisc_Giver[4] = "Anum-La - (Riften)"
	InterestingNPCMisc_Giver[5] = "Anum-La - (Riften)"
	InterestingNPCMisc_Giver[6] = "Ariele - (Ariele's Cabin)"
	InterestingNPCMisc_Giver[7] = "Morndas"
	InterestingNPCMisc_Giver[8] = "Keerava - (Bee and Barb)"
	InterestingNPCMisc_Giver[9] = "Beatrice - (Camp North of Druadach Redoubt)"
	InterestingNPCMisc_Giver[10] = "Relic - (Blackreach War Quarters)"
	InterestingNPCMisc_Giver[11] = "Automatic Start"
	InterestingNPCMisc_Giver[12] = "Cassock - (Solitude Winking Skeever)"
	InterestingNPCMisc_Giver[13] = "Skjel - (Lost Prospect Mine)"
	InterestingNPCMisc_Giver[14] = "Ytharil - (Barrow Near Dushnikh Yal and Reachwind Eyrie)"
	InterestingNPCMisc_Giver[15] = "Dar'rakki - (Ivarstead)"
	InterestingNPCMisc_Giver[16] = "Morthal or Dawnstar Innkeeper"
	InterestingNPCMisc_Giver[17] = "Pelgurt - (Candlehearth Hall)"
	InterestingNPCMisc_Giver[18] = "Bilbus - (Robber's Refuge)"
	InterestingNPCMisc_Giver[19] = "Raynes - (Lost Echo Cave)"
	InterestingNPCMisc_Giver[20] = "Jilkmar - Robber's Refuge"
	InterestingNPCMisc_Giver[21] = "Book - (Anise's Cabin Cellar)"
	InterestingNPCMisc_Giver[22] = "Thrice-Bitten - (Falkreath Grave Concoctions)"
	InterestingNPCMisc_Giver[23] = "Terynne - Windhelm Palace of the Kings"
	
	InterestingNPCMisc_Reqs = new string[24]
	InterestingNPCMisc_Reqs[0] = "No Requirements"
	InterestingNPCMisc_Reqs[1] = "Completion of 'Forgotten Lore' and the Mages Guild Questline, Be at an Inn and have completed One quest or location specific conversation with Rumarin"
	InterestingNPCMisc_Reqs[2] = "No Requirements"
	InterestingNPCMisc_Reqs[3] = "No Requirements"
	InterestingNPCMisc_Reqs[4] = "Completion of 'The Cursed Tribe' and spoken to Anum-La at the end of Blood of Kings"
	InterestingNPCMisc_Reqs[5] = "Completion of 'Bite the Hand that Feeds You'"
	InterestingNPCMisc_Reqs[6] = "No Requirements"
	InterestingNPCMisc_Reqs[7] = "Completion of 'Bite the Hand that Feeds You'"
	InterestingNPCMisc_Reqs[8] = "Spoken to Brakh at Hunter's Rest and the Shrine of Boethiah"
	InterestingNPCMisc_Reqs[9] = "No Requirements"
	InterestingNPCMisc_Reqs[10] = "No Requirements"
	InterestingNPCMisc_Reqs[11] = "Completion of the Darkened Steel Questline"
	InterestingNPCMisc_Reqs[12] = "Spoken to Fironet"
	InterestingNPCMisc_Reqs[13] = "Recruit Skjel as follower and speak to him"
	InterestingNPCMisc_Reqs[14] = "No Requirements"
	InterestingNPCMisc_Reqs[15] = "No Requirements"
	InterestingNPCMisc_Reqs[16] = "No Requirements"
	InterestingNPCMisc_Reqs[17] = "No Requirements"
	InterestingNPCMisc_Reqs[18] = "Supplied Food Stocks to Robber's Refuge and the day is Turdas"
	InterestingNPCMisc_Reqs[19] = "No Requirements"
	InterestingNPCMisc_Reqs[20] = "Supplied Food Stocks to Robber's Refuge and the day is Middas"
	InterestingNPCMisc_Reqs[21] = "No Requirements"
	InterestingNPCMisc_Reqs[22] = "No Requirements"
	InterestingNPCMisc_Reqs[23] = "Wuunferth must be away or sleeping"

	InterestingNPCMisc_Notes = new string[24]
	InterestingNPCMisc_Notes[0] = "NOTE: This is a hidden quest and will not appear in the quest journal."
	InterestingNPCMisc_Notes[1] = ""
	InterestingNPCMisc_Notes[2] = ""
	InterestingNPCMisc_Notes[3] = ""
	InterestingNPCMisc_Notes[4] = ""
	InterestingNPCMisc_Notes[5] = ""
	InterestingNPCMisc_Notes[6] = ""
	InterestingNPCMisc_Notes[7] = ""
	InterestingNPCMisc_Notes[8] = ""
	InterestingNPCMisc_Notes[9] = ""
	InterestingNPCMisc_Notes[10] = ""
	InterestingNPCMisc_Notes[11] = ""
	InterestingNPCMisc_Notes[12] = ""
	InterestingNPCMisc_Notes[13] = ""
	InterestingNPCMisc_Notes[14] = ""
	InterestingNPCMisc_Notes[15] = ""
	InterestingNPCMisc_Notes[16] = ""
	InterestingNPCMisc_Notes[17] = ""
	InterestingNPCMisc_Notes[18] = ""
	InterestingNPCMisc_Notes[19] = ""
	InterestingNPCMisc_Notes[20] = ""
	InterestingNPCMisc_Notes[21] = ""
	InterestingNPCMisc_Notes[22] = ""
	InterestingNPCMisc_Notes[23] = ""
	
	InterestingNPCMisc_First = new int[24]	
	InterestingNPCMisc_First[0] = -999
	InterestingNPCMisc_First[1] = -999	
	InterestingNPCMisc_First[2] = -999	
	InterestingNPCMisc_First[3] = -999	
	InterestingNPCMisc_First[4] = -999
	InterestingNPCMisc_First[5] = -999
	InterestingNPCMisc_First[6] = -999	
	InterestingNPCMisc_First[7] = -999	
	InterestingNPCMisc_First[8] = -999	
	InterestingNPCMisc_First[9] = -999
	InterestingNPCMisc_First[10] = -999
	InterestingNPCMisc_First[11] = -999
	InterestingNPCMisc_First[12] = -999
	InterestingNPCMisc_First[13] = -999
	InterestingNPCMisc_First[14] = -999
	InterestingNPCMisc_First[15] = -999
	InterestingNPCMisc_First[16] = -999
	InterestingNPCMisc_First[17] = -999
	InterestingNPCMisc_First[18] = -999
	InterestingNPCMisc_First[19] = -999
	InterestingNPCMisc_First[20] = -999
	InterestingNPCMisc_First[21] = -999
	InterestingNPCMisc_First[22] = -999
	InterestingNPCMisc_First[23] = -999

	InterestingNPCMisc_Final = new int[24]	
	InterestingNPCMisc_Final[0] = 999
	InterestingNPCMisc_Final[1] = 999	
	InterestingNPCMisc_Final[2] = 999	
	InterestingNPCMisc_Final[3] = 999	
	InterestingNPCMisc_Final[4] = 999
	InterestingNPCMisc_Final[5] = 999
	InterestingNPCMisc_Final[6] = 999	
	InterestingNPCMisc_Final[7] = 999	
	InterestingNPCMisc_Final[8] = 999	
	InterestingNPCMisc_Final[9] = 999
	InterestingNPCMisc_Final[10] = 999
	InterestingNPCMisc_Final[11] = 999
	InterestingNPCMisc_Final[12] = 999
	InterestingNPCMisc_Final[13] = 999
	InterestingNPCMisc_Final[14] = 999
	InterestingNPCMisc_Final[15] = 999
	InterestingNPCMisc_Final[16] = 999
	InterestingNPCMisc_Final[17] = 999
	InterestingNPCMisc_Final[18] = 999
	InterestingNPCMisc_Final[19] = 999
	InterestingNPCMisc_Final[20] = 999
	InterestingNPCMisc_Final[21] = 999
	InterestingNPCMisc_Final[22] = 999
	InterestingNPCMisc_Final[23] = 999
	
	InterestingNPCMisc_Radiant = new bool[24]
	InterestingNPCMisc_Radiant[0] = false
	InterestingNPCMisc_Radiant[1] = false
	InterestingNPCMisc_Radiant[2] = false
	InterestingNPCMisc_Radiant[3] = false
	InterestingNPCMisc_Radiant[4] = false
	InterestingNPCMisc_Radiant[5] = false
	InterestingNPCMisc_Radiant[6] = false
	InterestingNPCMisc_Radiant[7] = false
	InterestingNPCMisc_Radiant[8] = false
	InterestingNPCMisc_Radiant[9] = false
	InterestingNPCMisc_Radiant[10] = false
	InterestingNPCMisc_Radiant[11] = false
	InterestingNPCMisc_Radiant[12] = false
	InterestingNPCMisc_Radiant[13] = false
	InterestingNPCMisc_Radiant[14] = false
	InterestingNPCMisc_Radiant[15] = false
	InterestingNPCMisc_Radiant[16] = false
	InterestingNPCMisc_Radiant[17] = false
	InterestingNPCMisc_Radiant[18] = false
	InterestingNPCMisc_Radiant[19] = false
	InterestingNPCMisc_Radiant[20] = false
	InterestingNPCMisc_Radiant[21] = false
	InterestingNPCMisc_Radiant[22] = false
	InterestingNPCMisc_Radiant[23] = false

	InterestingNPCMisc_Spoiler = new bool[24]
	InterestingNPCMisc_Spoiler[0] = false
	InterestingNPCMisc_Spoiler[1] = false
	InterestingNPCMisc_Spoiler[2] = false
	InterestingNPCMisc_Spoiler[3] = false
	InterestingNPCMisc_Spoiler[4] = false
	InterestingNPCMisc_Spoiler[5] = false
	InterestingNPCMisc_Spoiler[6] = false
	InterestingNPCMisc_Spoiler[7] = false
	InterestingNPCMisc_Spoiler[8] = false
	InterestingNPCMisc_Spoiler[9] = false
	InterestingNPCMisc_Spoiler[10] = false
	InterestingNPCMisc_Spoiler[11] = false
	InterestingNPCMisc_Spoiler[12] = false
	InterestingNPCMisc_Spoiler[13] = false
	InterestingNPCMisc_Spoiler[14] = false
	InterestingNPCMisc_Spoiler[15] = false
	InterestingNPCMisc_Spoiler[16] = false
	InterestingNPCMisc_Spoiler[17] = false
	InterestingNPCMisc_Spoiler[18] = false
	InterestingNPCMisc_Spoiler[19] = false
	InterestingNPCMisc_Spoiler[20] = false
	InterestingNPCMisc_Spoiler[21] = false
	InterestingNPCMisc_Spoiler[22] = false
	InterestingNPCMisc_Spoiler[23] = false	
endEvent
