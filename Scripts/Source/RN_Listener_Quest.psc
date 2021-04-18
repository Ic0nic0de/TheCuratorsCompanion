scriptName RN_Listener_Quest extends referencealias

Import Debug
Import RN_Utility_Global

;;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;;General Quest Properties 
Bool CheckQuests = False
Bool CheckStageDone = False
Bool CheckStagePassed = False
Bool CheckBards = False
Bool CheckCivilWar = False
Bool CheckDawnguard = False
Bool CheckTFC = False

Quest Property DLC1VQ08 Auto

Quest[] Property Bards Auto

;;Actors for Dead Check
Actor Property UlfricRef Auto
Actor Property DLC1FeranRef Auto
Actor Property GeneralTulliusREF Auto

;;Formlists to contol the displays
Formlist Property DBM_RN_QuestDisplays Auto
Formlist Property DBM_RN_QuestDisplays_Enabled Auto

Formlist Property DBM_RN_Quest_Stage_Displays Auto
Formlist Property DBM_RN_Quest_Stage_Displays_Enabled Auto

Formlist Property DBM_RN_Quest_StagePassed_Displays Auto
Formlist Property DBM_RN_Quest_StagePassed_Displays_Enabled Auto

;;Global to control activation
GlobalVariable Property RN_Quest_Listener_Count Auto
GlobalVariable Property RN_Quest_Listener_Complete Auto

Bool FirstRun = True
Bool Done

message property TCC_SectionComplete_Quest auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event onInit()

	RegisterForModEvent("FireScripts", "_OnFireScripts")
endEvent

;;-- Functions ---------------------------------------

Event OnPlayerLoadGame()

	RegisterForModEvent("FireScripts", "_OnFireScripts")
endEvent

;;-- Functions ---------------------------------------

Event _OnFireScripts (string eventName, string strArg, float numArg, Form sender)

	GoToState("Running")
endEvent	

;;-- Functions ---------------------------------------

State Running

	Event OnBeginState()
		if !Done
			RegisterForSingleUpdate(5)
		endif
	endEvent
	
	Event OnUpdate()
	
		Int Index
		form Display
		ObjectReference Quest_Display

		if !CheckQuests		
			Index = DBM_RN_QuestDisplays.GetSize()
			while Index
				index -=1
				Display = DBM_RN_QuestDisplays.GetAt(Index) As Form
						
				if (Display As ObjectReference)
					Quest_Display = Display As ObjectReference
					
					if Quest_Display && (!DBM_RN_QuestDisplays_Enabled.HasForm(Quest_Display))
						if (CheckQuestComplete((Quest_Display as DBM_RN_QuestDisplay).sQuestName))
							DBM_RN_QuestDisplays_Enabled.AddForm(Quest_Display)
							RN_Quest_Listener_Count.Mod(1)
							if (MCM.ShowListenerVal) && !FirstRun
								Notification("Museum Display Added: " + (Quest_Display as DBM_RN_QuestDisplay).sDisplayName)
							endIf										
						endIf
					endIf				
				endIf
			endWhile
			if (DBM_RN_QuestDisplays_Enabled.GetSize() >= DBM_RN_QuestDisplays.GetSize())
				CheckQuests = TRUE
			endIf
		endIf
			
		if !CheckStageDone
			Index = DBM_RN_Quest_Stage_Displays.GetSize()
			while Index
				index -=1
				Display = DBM_RN_Quest_Stage_Displays.GetAt(Index) As Form
				
				if (Display As ObjectReference)
					Quest_Display = Display As ObjectReference
					
					if Quest_Display && (!DBM_RN_Quest_Stage_Displays_Enabled.HasForm(Quest_Display))
						if (CheckQuestStageDone((Quest_Display as DBM_RN_QuestDisplayStage).sQuestStage, (Quest_Display as DBM_RN_QuestDisplayStage).sQuestName))
							DBM_RN_Quest_Stage_Displays_Enabled.AddForm(Quest_Display)
							RN_Quest_Listener_Count.Mod(1)
							if (MCM.ShowListenerVal) && !FirstRun
								Notification("Museum Display Added: " + (Quest_Display as DBM_RN_QuestDisplayStage).sDisplayName)
							endIf	
						endIf
					endIf				
				endIf
			endWhile
			if (DBM_RN_Quest_Stage_Displays_Enabled.GetSize() >= DBM_RN_Quest_Stage_Displays.GetSize())
				CheckStageDone = TRUE
			endIf
		endIf

		if !CheckStagePassed
			Index = DBM_RN_Quest_StagePassed_Displays.GetSize()
			while Index
				index -=1
				Display = DBM_RN_Quest_StagePassed_Displays.GetAt(Index) As Form
				
				if (Display As ObjectReference)
					Quest_Display = Display As ObjectReference
					
					if Quest_Display && (!DBM_RN_Quest_StagePassed_Displays_Enabled.HasForm(Quest_Display))
						if (CheckQuestStagePassed((Quest_Display as DBM_RN_QuestDisplayStagePassed).sQuestStage, (Quest_Display as DBM_RN_QuestDisplayStagePassed).sQuestName))
							DBM_RN_Quest_StagePassed_Displays_Enabled.AddForm(Quest_Display)
							RN_Quest_Listener_Count.Mod(1)
							if (MCM.ShowListenerVal) && !FirstRun
								Notification("Museum Display Added: " + (Quest_Display as DBM_RN_QuestDisplayStagePassed).sDisplayName)
							endIf	
						endIf
					endIf				
				endIf
			endWhile
			if (DBM_RN_Quest_StagePassed_Displays_Enabled.GetSize() >= DBM_RN_Quest_StagePassed_Displays.GetSize())
				CheckStagePassed = TRUE
			endIf
		endIf
		
		if (Game.GetModByName("LOTD_TCC_TFC.esp") != 255) && !CheckTFC
			Actor JarlMetelusRef = Game.GetFormFromFile(0x031A96, "ForgottenCity.esp") as Actor
			
			if Quest.GetQuest("000FCQuest02").GetStage() >= 6000 
				RN_Quest_Listener_Count.Mod(1)
				CheckTFC = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: The Forgotten City")
				endif
			elseif JarlMetelusRef.IsDead()
				RN_Quest_Listener_Count.Mod(1)
				CheckTFC = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: The Forgotten City")
				endif
			endif		
		endif
		
		if !CheckDawnguard
			if DLC1VQ08.IsCompleted()
				RN_Quest_Listener_Count.Mod(1)
				CheckDawnguard = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Dawnguard - Vampire Victory")
				endif
			elseif DLC1FeranRef.IsDead()
				RN_Quest_Listener_Count.Mod(1)
				CheckDawnguard = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Dawnguard - Dawnguard Victory")
				endif
			endif
		endif

		if !CheckCivilWar
			if UlfricRef.IsDead()
				RN_Quest_Listener_Count.Mod(1)
				CheckCivilWar = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Civil War - Imperial Victory")
				endif
			elseif GeneralTulliusREF.IsDead()
				RN_Quest_Listener_Count.Mod(1)
				CheckCivilWar = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Civil War - Stormcloak Victory")
				endif
			endif
		endif

		if !CheckBards
			if Bards[0].IsCompleted() && Bards[1].IsCompleted() && Bards[2].IsCompleted()
				RN_Quest_Listener_Count.Mod(1)
				CheckBards = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: The Bards College")
				endIf				
			endIf
		endIf

		if CheckStageDone && CheckQuests && CheckBards && CheckCivilWar && CheckDawnguard && CheckTFC && CheckStagePassed
			
			RN_Quest_Listener_Complete.SetValue(999)
			TCC_SectionComplete_Quest.Show()
			Done = True
		else
			RegisterForSingleUpdate(1)
		endIf

		FirstRun = False
	endEvent
endState

;;-- Functions ---------------------------------------

auto state Disabled

	Event OnUpdate()
	endEvent
endState
	
	
	
	
	
	
	
	
	
	
		