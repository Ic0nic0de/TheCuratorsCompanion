scriptName RN_Listener_Quest extends quest

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
Bool CheckSpellKnight = False

Bool CheckVigilant = False
Bool Act1Complete = False
Bool Act2Complete = False
Bool Act3Complete = False
Bool Act4Complete = False

;;Actors for Dead Check
Actor Property UlfricRef Auto
Actor Property DLC1FeranRef Auto
Actor Property GeneralTulliusREF Auto

;;Formlists to contol the displays
Formlist Property DBM_RN_QuestDisplays Auto
Formlist Property DBM_RN_Quest_Stage_Displays Auto
Formlist Property DBM_RN_Quest_StagePassed_Displays Auto
Formlist Property TCC_QuestNotifications_Enabled Auto

Bool FirstRun = True

Int Tracker
Int SectionDone

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
	
	GoToState("Prepare")
endEvent	

;;-- Functions ---------------------------------------

State Running

	Event OnUpdate()
			
;;------------------------------- Quests Based On IsCompleted(akQuest)

		if	Tracker == 1
			Tracker = 2
			RegisterForSingleUpdate(0)	
			
			Int CountComplete = 0
			
			if (!CheckQuests)
				Int Index = DBM_RN_QuestDisplays.GetSize()
				while Index
					index -=1
					Form Display = DBM_RN_QuestDisplays.GetAt(Index) As Form	
					if (Display As ObjectReference)
						ObjectReference Quest_Display = Display As ObjectReference
						if (Quest_Display) 
							if (!TCC_QuestNotifications_Enabled.HasForm(Quest_Display))
								if (CheckQuestComplete((Quest_Display as DBM_RN_QuestDisplay).sQuestName))
									TCC_QuestNotifications_Enabled.AddForm(Quest_Display)
									if ((MCM.ShowListenerVal) && (!FirstRun))
										Notify("Museum Display Added: " + (Quest_Display as DBM_RN_QuestDisplay).sDisplayName, MCM.ColourString)
									endIf										
								endIf
							endif
							
							if !Quest_Display.IsDisabled()
								CountComplete += 1
							endif						
						endIf				
					endif
				endWhile
				if (CountComplete >= DBM_RN_QuestDisplays.GetSize())
					CheckStageDone = True
				endIf
			endIf

;;------------------------------- Quests Based On GetStageDone(akStage)

		elseif	Tracker == 2
			Tracker = 3
			RegisterForSingleUpdate(0)
			
			Int CountDone = 0
			
			if (!CheckStageDone)
				Int Index = DBM_RN_Quest_Stage_Displays.GetSize()
				while Index
					index -=1
					Form Display = DBM_RN_Quest_Stage_Displays.GetAt(Index) As Form
					if (Display As ObjectReference)
						ObjectReference Quest_Display = Display As ObjectReference
						if Quest_Display 
							if (!TCC_QuestNotifications_Enabled.HasForm(Quest_Display))
								if (CheckQuestStageDone((Quest_Display as DBM_RN_QuestDisplayStage).sQuestStage, (Quest_Display as DBM_RN_QuestDisplayStage).sQuestName))
									TCC_QuestNotifications_Enabled.AddForm(Quest_Display)
									if ((MCM.ShowListenerVal) && (!FirstRun))
										Notify("Museum Display Added: " + (Quest_Display as DBM_RN_QuestDisplayStage).sDisplayName, MCM.ColourString)
									endIf	
								endIf
							endif
							
							if !Quest_Display.IsDisabled()
								CountDone += 1
							endif	
						endIf				
					endIf
				endWhile
				if (CountDone >= DBM_RN_Quest_Stage_Displays.GetSize())
					CheckStageDone = True
				endIf
			endIf

;;------------------------------- Quests Based On GetStage() >= akStage

		elseif	Tracker == 3
			Tracker = 4
			RegisterForSingleUpdate(0)
			
			Int CountPassed = 0
			
			if (!CheckStagePassed)
				Int Index = DBM_RN_Quest_StagePassed_Displays.GetSize()
				while Index
					index -=1
					Form Display = DBM_RN_Quest_StagePassed_Displays.GetAt(Index) As Form
					if (Display As ObjectReference)
						ObjectReference Quest_Display = Display As ObjectReference
						if Quest_Display 
							if (!TCC_QuestNotifications_Enabled.HasForm(Quest_Display))
								if (CheckQuestStagePassed((Quest_Display as DBM_RN_QuestDisplayStagePassed).sQuestStage, (Quest_Display as DBM_RN_QuestDisplayStagePassed).sQuestName))
									TCC_QuestNotifications_Enabled.AddForm(Quest_Display)
									if ((MCM.ShowListenerVal) && (!FirstRun))
										Notify("Museum Display Added: " + (Quest_Display as DBM_RN_QuestDisplayStagePassed).sDisplayName, MCM.ColourString)
									endIf	
								endIf
							endif
							
							if !Quest_Display.IsDisabled()
								CountPassed += 1
							endif	
						endIf				
					endIf
				endWhile
				if (CountPassed >= DBM_RN_Quest_StagePassed_Displays.GetSize())
					CheckStagePassed = True
				endIf
			endIf

;;------------------------------- Forgotten City

		elseif	Tracker == 4
			Tracker = 5
			RegisterForSingleUpdate(0)
			
			if ((Game.GetModByName("LOTD_TCC_TFC.esp") != 255) && (!CheckTFC))
				Actor JarlMetelusRef = Game.GetFormFromFile(0x031A96, "ForgottenCity.esp") as Actor
				
				if (Quest.GetQuest("000FCQuest02").GetStage() >= 6000) 
					CheckTFC = True
					if ((MCM.ShowListenerVal) && (!FirstRun))
						Notify("Museum Display Added: The Forgotten City", MCM.ColourString)
					endif
				elseif ((JarlMetelusRef) && (JarlMetelusRef.IsDead()))
					CheckTFC = True
					if ((MCM.ShowListenerVal) && (!FirstRun))
						Notify("Museum Display Added: The Forgotten City", MCM.ColourString)
					endif
				endif		
			endif

;;------------------------------- Spell Knight Armor

		elseif	Tracker == 5
			Tracker = 6
			RegisterForSingleUpdate(0)
			
			if ((Game.GetModByName("LOTD_TCC_SpellKnightArmor.esp") != 255) && !CheckSpellKnight)
				Bool QuestFound = Quest.GetQuest("ccEDHSSE002_Quest")
				if ((QuestFound) && Quest.GetQuest("ccEDHSSE002_Quest").GetStageDone(1500)) || ((QuestFound) && Quest.GetQuest("ccEDHSSE002_Quest").GetStageDone(2000))
					CheckSpellKnight = True
					if ((MCM.ShowListenerVal) && (!FirstRun))
						Notify("Museum Display Added: Crypt of the Heart Display", MCM.ColourString)
					endif
				endif		
			endif

;;------------------------------- Dawnguard

		elseif	Tracker == 6
			Tracker = 7
			RegisterForSingleUpdate(0)
			
			if (!CheckDawnguard)				
				if (Quest.GetQuest("DLC1VQ08").IsCompleted())
					CheckDawnguard = True
					if ((MCM.ShowListenerVal) && (!FirstRun))
						Notify("Museum Display Added: Dawnguard - Vampire Victory", MCM.ColourString)
					endif
				elseif (DLC1FeranRef.IsDead())
					CheckDawnguard = True
					if ((MCM.ShowListenerVal) && (!FirstRun))
						Notify("Museum Display Added: Dawnguard - Dawnguard Victory", MCM.ColourString)
					endif
				endif
			endif

;;------------------------------- Civil War

		elseif	Tracker == 7
			Tracker = 8
			RegisterForSingleUpdate(0)
			
			if (!CheckCivilWar)
				if (UlfricRef.IsDead())
					CheckCivilWar = True
					if ((MCM.ShowListenerVal) && (!FirstRun))
						Notify("Museum Display Added: Civil War - Imperial Victory", MCM.ColourString)
					endif
				elseif (GeneralTulliusREF.IsDead())
					CheckCivilWar = True
					if ((MCM.ShowListenerVal) && (!FirstRun))
						Notify("Museum Display Added: Civil War - Stormcloak Victory", MCM.ColourString)
					endif
				endif
			endif

;;------------------------------- Bards College

		elseif	Tracker == 8
			Tracker = 9
			RegisterForSingleUpdate(0)
			
			if (!CheckBards)
				if ((Quest.GetQuest("BardsCollegeDrum").IsCompleted()) && (Quest.GetQuest("BardsCollegeFlute").IsCompleted()) && (Quest.GetQuest("BardsCollegeLute").IsCompleted()))
					CheckBards = True
					if ((MCM.ShowListenerVal) && (!FirstRun))
						Notify("Museum Display Added: The Bards College", MCM.ColourString)
					endIf				
				endIf
			endIf
			
;;------------------------------- Vigilant

		elseif	Tracker == 9
			Tracker = 10
			RegisterForSingleUpdate(0)	
			
			if (Game.GetModByName("Vigilant.esm") != 255)
				if (!CheckVigilant)
					if (!Act1Complete)
						if (Quest.GetQuest("zzzAoMMQ10").GetStageDone(50)) ;; GOOD ENDING
							Act1Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 1 (Good Ending)", MCM.ColourString)
							endif

						elseif ((Quest.GetQuest("zzzAoMMQGoodEnd").GetStageDone(110)) && (Quest.GetQuest("zzzAoMMQGoodEnd").IsCompleted())) ;; MERCIFUL ENDING
							Act1Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 1 (Merciful Ending)", MCM.ColourString)
							endif
							
						elseif (Quest.GetQuest("zzzAoMMQ09").GetStageDone(999)) || ((!Quest.GetQuest("zzzAoMMQGoodEnd").GetStageDone(110)) && (Quest.GetQuest("zzzAoMMQGoodEnd").IsCompleted())) ;; BAD ENDING
							Act1Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 1 (Bad Ending)", MCM.ColourString)
							endif
						endif
					endif

					if (!Act2Complete)
						if (Quest.GetQuest("zzzBmMq01").GetStageDone(110)) ;; GOOD ENDING
							Act2Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 2 (Good Ending)", MCM.ColourString)
							endif
							
						elseif (Quest.GetQuest("zzzBmMq03").GetStageDone(220)) ;; BAD ENDING
							Act2Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 2 (Bad Ending)", MCM.ColourString)
							endif
						endif
					endif

					if (!Act3Complete)
						if ((Quest.GetQuest("zzzCOMq01").GetStageDone(100)) || (Quest.GetQuest("zzzCOMq01").GetStageDone(200)));; GOOD ENDING
							Act3Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 3 (Good Ending)", MCM.ColourString)	
							endif
						endif
					endif
					
					if (!Act4Complete)
						if ((Quest.GetQuest("zzzCHMemoryQuest08").GetStageDone(360)) || (Quest.GetQuest("zzzCHMemoryQuest09").GetStageDone(200))) ;; WORST ENDING
							Act4Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 4 (Worst Ending)", MCM.ColourString)
							endif
							
						elseif (Quest.GetQuest("zzzCHMemoryQuest08").GetStageDone(90)) ;; TRUE ENDING
							Act4Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 4 (True Ending)", MCM.ColourString)
							endif

						elseif (Quest.GetQuest("zzzCHMemoryQuest08").GetStageDone(230)) ;; BITTER ENDING
							Act4Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 4 (Bitter Ending)", MCM.ColourString)
							endif
							
						elseif ((Quest.GetQuest("zzzCHMQ01").GetStageDone(150)) || (Quest.GetQuest("zzzCHMQ01").GetStageDone(180))) ;; BAD ENDING
							Act4Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 4 (Bad Ending)", MCM.ColourString)
							endif
							
						elseif ((Quest.GetQuest("zzzCHMemoryQuest09").GetStageDone(100)) || (Quest.GetQuest("zzzCHMemoryQuest09").GetStageDone(150))) ;; MADNESS ENDING
							Act4Complete = True
							if ((MCM.ShowListenerVal) && (!FirstRun))
								Notify("Museum Display Added: Vigiant Act 4 (Madness Ending)", MCM.ColourString)
							endif
						endif
					endif	
				endif
				
				
				if ((Act1Complete) && (Act2Complete) && (Act3Complete) && (Act4Complete))
					CheckVigilant = True	
				endif
			endIf

;;------------------------------- Loop Complete

		elseif	Tracker == 10
			
			if (FirstRun)
				FirstRun = False
			endIf
			
			GoToState("Prepare")		
		endif
	endEvent
endState

;;-- Functions ---------------------------------------
	
state Prepare

	Event OnBeginState()
		
		UnRegisterForUpdate()
		
		if ((CheckStageDone) && (CheckQuests) && (CheckBards) && (CheckCivilWar) && (CheckDawnguard) && (CheckTFC) && (CheckStagePassed) && (CheckSpellKnight) && (CheckVigilant))
			GoToState("Disabled")
		else
			Tracker = 1
			GoToState("Running")
			RegisterForSingleUpdate(0)			
		endIf	
	endEvent
endState

;;-- Functions ---------------------------------------
	
auto state Disabled

	Event OnUpdate()
	endEvent
endState
