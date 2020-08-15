scriptName RN_Listener_Quest extends Quest

Import Debug

;;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;;General Quest Properties 
Bool CheckQuests = False
Bool CheckStage = False
Bool CheckBards = False
Bool CheckCivilWar = False
Bool CheckDawnguard = False

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

;;Global to control activation
GlobalVariable Property RN_Quest_Listener_Count Auto
GlobalVariable Property RN_Quest_Listener_Complete Auto
GlobalVariable Property iDisplaySectionComplete Auto

Bool FirstRun = True

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event onInit()

	GoToState("DISABLED")	
endEvent

;;-- Functions ---------------------------------------

Event OnPlayerLoadGame()

	GoToState("")
	RegisterForSingleUpdate(5)
endEvent

;;-- Functions ---------------------------------------
			
Function OnUpdate()
	
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
						if (RN_Utility_Global.CheckQuestComplete((Quest_Display as DBM_RN_QuestDisplay).sQuestName))
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
			
		if !CheckStage
			Index = DBM_RN_Quest_Stage_Displays.GetSize()
			while Index
				index -=1
				Display = DBM_RN_Quest_Stage_Displays.GetAt(Index) As Form
				
				if (Display As ObjectReference)
					Quest_Display = Display As ObjectReference
					
					if Quest_Display && (!DBM_RN_Quest_Stage_Displays_Enabled.HasForm(Quest_Display))
						if (RN_Utility_Global.CheckQuestStageComplete((Quest_Display as DBM_RN_QuestDisplayStage).sQuestStage, (Quest_Display as DBM_RN_QuestDisplayStage).sQuestName))
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
				CheckStage = TRUE
			endIf
		endIf

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

		if CheckStage && CheckQuests && CheckBards && CheckCivilWar && CheckDawnguard
			
			Notification("The Curators Companion: All Quest Displays Unlocked")
			RN_Quest_Listener_Complete.SetValue(1)
			iDisplaySectionComplete.SetValue(1)
			Stop()
		else
			RegisterForSingleUpdate(1)
		endIf

		FirstRun = False
		
endFunction

;;-- Functions ---------------------------------------

State Disabled

	Function OnUpdate()
	endFunction
	
endState
	
	
	
	
	
	
	
	
	
	
		