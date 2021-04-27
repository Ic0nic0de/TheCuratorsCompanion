scriptName RN_Listener_Thane extends referencealias

Import Debug 

Import RN_Utility_Global

FavorJarlsMakeFriendsScript Property ThaneScript Auto

;;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;;Global to control activation
GlobalVariable Property RN_Thane_Listener_Count Auto
GlobalVariable Property RN_Thane_Listener_Complete Auto

message property TCC_SectionComplete_Thane auto

Int AllThane = 0
Bool Reach = false
Bool Rift = false
Bool Haafingar = false
Bool Whiterun = false
Bool Eastmarch = false
Bool Hjaalmarch = false
Bool Pale = false
Bool Winterhold = false
Bool Falkreath = false

Bool FirstRun = True
Bool Done
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
		
		If !Reach
			If(thaneScript.ReachImpGetOutofJail > 0 || thaneScript.ReachSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Reach = TRUE
				AllThane += 1	
				if (MCM.ShowListenerVal) && !FirstRun
					Notify("Museum Display Added: Thane Of The Reach", MCM.ColourString)
				endif
			endIf
		endIf
		
		If !Rift
			If(thaneScript.RiftImpGetOutofJail > 0 || thaneScript.RiftSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Rift = TRUE
				AllThane += 1	
				if (MCM.ShowListenerVal) && !FirstRun
					Notify("Museum Display Added: Thane Of The Rift", MCM.ColourString)
				endIf
			endIf
		endIf

		if !Haafingar
			If(thaneScript.HaafingarImpGetOutofJail > 0 || thaneScript.HaafingarSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Haafingar = TRUE
				AllThane += 1	
				if (MCM.ShowListenerVal) && !FirstRun
					Notify("Museum Display Added: Thane Of Haafingar", MCM.ColourString)
				endIf
			endIf
		endIf
		
		if !Whiterun
			if(thaneScript.WhiterunImpGetOutofJail > 0 || thaneScript.WhiterunSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Whiterun = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notify("Museum Display Added: Thane Of Whiterun", MCM.ColourString)
				endIf
			endIf
		endIf
		
		if !Eastmarch
			If(thaneScript.EastmarchImpGetOutofJail > 0 || thaneScript.EastmarchSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Eastmarch = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notify("Museum Display Added: Thane Of Eastmarch", MCM.ColourString)
				endIf
			endIf
		endIf
		
		
		if !Hjaalmarch
			if(thaneScript.HjaalmarchImpGetOutofJail > 0 || thaneScript.HjaalmarchSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Hjaalmarch = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notify("Museum Display Added: Thane Of Hjaalmarch", MCM.ColourString)
				endIf
			endIf
		endIf

		if !Pale
			If(thaneScript.PaleImpGetOutofJail > 0 || thaneScript.PaleSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Pale = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notify("Museum Display Added: Thane Of The Pale", MCM.ColourString)
				endIf	
			endIf
		endIf
		
		if !Winterhold
			if(thaneScript.WinterholdImpGetOutofJail > 0 || thaneScript.WinterholdSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Winterhold = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notify("Museum Display Added: Thane Of Winterhold", MCM.ColourString)
				endIf
			endIf
		endIf

		if !Falkreath
			if(thaneScript.FalkreathImpGetOutofJail > 0 || thaneScript.FalkreathSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Falkreath = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notify("Museum Display Added: Thane Of Falkreath", MCM.ColourString)
				endIf
			endIf
		endIf

		If AllThane == 9

			RN_Thane_Listener_Complete.SetValue(999)
			TCC_SectionComplete_Thane.Show()
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
