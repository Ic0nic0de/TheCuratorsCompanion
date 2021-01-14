scriptname Ic0n_Completionist_Arrays extends quest

Ic0n_Completionist_MCM property MCM auto

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

String[] property _Array_Name_Main auto hidden
String[] property _Array_Name_Dawnstar auto hidden
String[] property _Array_Name_Falkreath auto hidden
String[] property _Array_Name_Markarth auto hidden
String[] property _Array_Name_Morthal auto hidden
String[] property _Array_Name_Riften auto hidden
String[] property _Array_Name_Solitude auto hidden
String[] property _Array_Name_Whiterun auto hidden
String[] property _Array_Name_Windhelm auto hidden
String[] property _Array_Name_Winterhold auto hidden
String[] property _Array_Name_Towns auto hidden
String[] property _Array_Name_Dungeons auto hidden
String[] property _Array_Name_Misc auto hidden
String[] property _Array_Name_Companions auto hidden
String[] property _Array_Name_College auto hidden
String[] property _Array_Name_Thieves auto hidden
String[] property _Array_Name_Brotherhood auto hidden
String[] property _Array_Name_CWMain auto hidden

String[] property _Array_Name_DGMain auto hidden
String[] property _Array_Name_Dawnguard auto hidden
String[] property _Array_Name_Vampires auto hidden
String[] property _Array_Name_DGMisc auto hidden

String[] property _Array_Name_DBMain auto hidden
String[] property _Array_Name_RavenRock auto hidden
String[] property _Array_Name_SkaalVillage auto hidden
String[] property _Array_Name_TelMithryn auto hidden
String[] property _Array_Name_Thirsk auto hidden
String[] property _Array_Name_DBMisc auto hidden

String[] property _Array_Quest_ID auto hidden
String[] property _Array_Quest_Name auto hidden
String[] property _Array_Quest_Overview auto hidden
String[] property _Array_Quest_Giver auto hidden
String[] property _Array_Quest_Option_Name auto hidden

Bool[] property _Array_Toggle_Main auto hidden
Bool[] property _Array_Toggle_Dawnstar auto hidden
Bool[] property _Array_Toggle_Falkreath auto hidden
Bool[] property _Array_Toggle_Markarth auto hidden
Bool[] property _Array_Toggle_Morthal auto hidden
Bool[] property _Array_Toggle_Riften auto hidden
Bool[] property _Array_Toggle_Solitude auto hidden
Bool[] property _Array_Toggle_Whiterun auto hidden
Bool[] property _Array_Toggle_Windhelm auto hidden
Bool[] property _Array_Toggle_Winterhold auto hidden
Bool[] property _Array_Toggle_Towns auto hidden
Bool[] property _Array_Toggle_Dungeons auto hidden
Bool[] property _Array_Toggle_Misc auto hidden
Bool[] property _Array_Toggle_Companions auto hidden
Bool[] property _Array_Toggle_College auto hidden
Bool[] property _Array_Toggle_Thieves auto hidden
Bool[] property _Array_Toggle_Brotherhood auto hidden
Bool[] property _Array_Toggle_CWMain auto hidden

Bool[] property _Array_Toggle_DGMain auto hidden
Bool[] property _Array_Toggle_Dawnguard auto hidden
Bool[] property _Array_Toggle_Vampires auto hidden
Bool[] property _Array_Toggle_DGMisc auto hidden

Bool[] property _Array_Toggle_DBMain auto hidden
Bool[] property _Array_Toggle_RavenRock auto hidden
Bool[] property _Array_Toggle_SkaalVillage auto hidden
Bool[] property _Array_Toggle_TelMithryn auto hidden
Bool[] property _Array_Toggle_Thirsk auto hidden
Bool[] property _Array_Toggle_DBMisc auto hidden

Bool[] property _Array_Quest_Radiant auto hidden
Bool[] property _Array_Quest_ToggleState auto hidden
            
Int[] property _Array_Stage_First auto hidden 			
Int[] property _Array_Stage_Final auto hidden
Int[] property _Array_Quest_Option_ID auto hidden

Int property _Array_Int auto hidden
Int property _Array_Quest_Index auto hidden

;-- Events --------------------------------------

Event OnInit()

	_Array_Name_Main = new String[128]
	_Array_Toggle_Main = new Bool[128]

	_Array_Name_Dawnstar = new String[128]
	_Array_Toggle_Dawnstar = new Bool[128]
	
	_Array_Name_Falkreath = new String[128]
	_Array_Toggle_Falkreath = new Bool[128]

	_Array_Name_Markarth = new String[128]
	_Array_Toggle_Markarth = new Bool[128]

	_Array_Name_Morthal = new String[128]
	_Array_Toggle_Morthal = new Bool[128]

	_Array_Name_Riften = new String[128]
	_Array_Toggle_Riften = new Bool[128]

	_Array_Name_Solitude = new String[128]
	_Array_Toggle_Solitude = new Bool[128]

	_Array_Name_Whiterun = new String[128]
	_Array_Toggle_Whiterun = new Bool[128]

	_Array_Name_Windhelm = new String[128]
	_Array_Toggle_Windhelm = new Bool[128]

	_Array_Name_Winterhold = new String[128]
	_Array_Toggle_Winterhold = new Bool[128]

	_Array_Name_Towns = new String[128]
	_Array_Toggle_Towns = new Bool[128]

	_Array_Name_Dungeons = new String[128]
	_Array_Toggle_Dungeons = new Bool[128]

	_Array_Name_Misc = new String[128]
	_Array_Toggle_Misc = new Bool[128]

	_Array_Name_College = new String[128]
	_Array_Toggle_College = new Bool[128]
	
	_Array_Name_Companions = new String[128]
	_Array_Toggle_Companions = new Bool[128]

	_Array_Name_Thieves = new String[128]
	_Array_Toggle_Thieves = new Bool[128]

	_Array_Name_Brotherhood = new String[128]
	_Array_Toggle_Brotherhood = new Bool[128]

	_Array_Name_CWMain = new String[128]
	_Array_Toggle_CWMain = new Bool[128]

	_Array_Name_DGMain = new String[128]
	_Array_Toggle_DGMain = new Bool[128]

	_Array_Name_Dawnguard = new String[128]
	_Array_Toggle_Dawnguard = new Bool[128]

	_Array_Name_Vampires = new String[128]
	_Array_Toggle_Vampires = new Bool[128]

	_Array_Name_DGMisc = new String[128]
	_Array_Toggle_DGMisc = new Bool[128]

	_Array_Name_DBMain = new String[128]
	_Array_Toggle_DBMain = new Bool[128]

	_Array_Name_RavenRock = new String[128]
	_Array_Toggle_RavenRock = new Bool[128]

	_Array_Name_SkaalVillage = new String[128]
	_Array_Toggle_SkaalVillage = new Bool[128]

	_Array_Name_TelMithryn = new String[128]
	_Array_Toggle_TelMithryn = new Bool[128]

	_Array_Name_Thirsk = new String[128]
	_Array_Toggle_Thirsk = new Bool[128]

	_Array_Name_DBMisc = new String[128]
	_Array_Toggle_DBMisc = new Bool[128]

endEvent
	
;-- Events --------------------------------------

Event _Build_Arrays()

	_Array_Quest_Option_ID = new Int[128]
	_Array_Quest_Option_Name = new String[128]
	_Array_Quest_ToggleState = new Bool[128]
	_Array_Quest_Index = 0	
	_Array_Quest_ID = new String[128]
	_Array_Quest_Name = new String[128]
	_Array_Quest_Radiant = new Bool[128]
	_Array_Quest_Overview = new String[128]
	_Array_Quest_Giver = new String[128]
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

