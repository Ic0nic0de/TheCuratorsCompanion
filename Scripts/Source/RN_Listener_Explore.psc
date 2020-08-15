scriptName RN_Listener_Explore extends Quest

Import Debug

Bool Exploration_Complete = false

;;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;;Global to control activation
GlobalVariable Property RN_Exploration_Listener_Count Auto
GlobalVariable Property RN_Exploration_Listener_Complete Auto
GlobalVariable Property iDisplaySectionComplete Auto

;;Formlists to contol the displays
Formlist Property DBM_RN_ExplorationDisplays Auto
Formlist Property DBM_RN_ExplorationDisplays_Enabled Auto

;;550 Display Count Display (Spirit Of Adventure)
Bool DBM_RN_SpiritComplete = false
GlobalVariable Property DBM_DisplayCount Auto

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
								Notification("Museum Display Added: " + (Exploration_Display as DBM_RN_ExplorationDisplay).sDisplayName)
							endIf
						endIf
					endIf				
				endIf		
			endWhile
			if (DBM_RN_ExplorationDisplays_Enabled.GetSize() >= DBM_RN_ExplorationDisplays.GetSize())
				Exploration_Complete = TRUE
			endIf
		endIf		

		if !DBM_RN_SpiritComplete
			if (DBM_DisplayCount.GetValue() as Int) >= 550
				DBM_RN_SpiritComplete = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: The Spoils of Adventure")
				endIf
			endIf
		endIf

		if Exploration_Complete && DBM_RN_SpiritComplete
			
			Notification("The Curators Companion: All Exploration Displays Unlocked")			
			RN_Exploration_Listener_Complete.SetValue(1)
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

