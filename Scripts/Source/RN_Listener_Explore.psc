scriptName RN_Listener_Explore extends referencealias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

Bool Exploration_Complete

;;Global to control activation
GlobalVariable Property RN_Exploration_Listener_Count Auto
GlobalVariable Property RN_Exploration_Listener_Complete Auto

;;Formlists to contol the displays
Formlist Property DBM_RN_ExplorationDisplays Auto
Formlist Property DBM_RN_ExplorationDisplays_Enabled Auto

;;550 Display Count Display (Spirit Of Adventure)
Bool FirstRun = True
Bool SpiritDone
Bool Done

GlobalVariable Property DBM_DisplayCount Auto

message property TCC_SectionComplete_Exploration auto

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
		
		if !Exploration_Complete
			Int Index = DBM_RN_ExplorationDisplays.GetSize()
			while Index
				index -=1
				form Display = DBM_RN_ExplorationDisplays.GetAt(Index) As Form
						
				if (Display As ObjectReference)
					ObjectReference Exploration_Display = Display As ObjectReference
					
					if Exploration_Display && (!DBM_RN_ExplorationDisplays_Enabled.HasForm(Exploration_Display))
						if (!Exploration_Display.IsDisabled())
							DBM_RN_ExplorationDisplays_Enabled.AddForm(Exploration_Display)
							RN_Exploration_Listener_Count.Mod(1)
							if (MCM.ShowListenerVal) && !FirstRun
								Notify("Museum Display Added: " + (Exploration_Display as DBM_RN_ExplorationDisplay).sDisplayName, MCM.ColourString)
							endIf
						endIf
					endIf				
				endIf		
			endWhile
			if (DBM_RN_ExplorationDisplays_Enabled.GetSize() >= DBM_RN_ExplorationDisplays.GetSize())
				Exploration_Complete = TRUE
			endIf
		endIf		

		if !SpiritDone
			if (DBM_DisplayCount.GetValue() as Int) >= 550
				SpiritDone = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notify("Museum Display Added: The Spoils of Adventure", MCM.ColourString)
				endIf
			endIf
		endIf

		if Exploration_Complete && SpiritDone
					
			RN_Exploration_Listener_Complete.SetValue(999)
			TCC_SectionComplete_Exploration.Show()
			Done = true
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

