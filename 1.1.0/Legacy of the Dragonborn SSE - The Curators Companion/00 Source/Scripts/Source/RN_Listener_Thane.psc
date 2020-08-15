scriptName RN_Listener_Thane extends Quest

Import Debug 

FavorJarlsMakeFriendsScript Property ThaneScript Auto

;;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;;Global to control activation
GlobalVariable Property RN_Thane_Listener_Count Auto
GlobalVariable Property RN_Thane_Listener_Complete Auto
GlobalVariable Property iDisplaySectionComplete Auto

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
		
		If !Reach
			If(thaneScript.ReachImpGetOutofJail > 0 || thaneScript.ReachSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Reach = TRUE
				AllThane += 1	
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Thane Of The Reach")
				endif
			endIf
		endIf
		
		If !Rift
			If(thaneScript.RiftImpGetOutofJail > 0 || thaneScript.RiftSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Rift = TRUE
				AllThane += 1	
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Thane Of The Rift")
				endIf
			endIf
		endIf

		if !Haafingar
			If(thaneScript.HaafingarImpGetOutofJail > 0 || thaneScript.HaafingarSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Haafingar = TRUE
				AllThane += 1	
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Thane Of Haafingar")
				endIf
			endIf
		endIf
		
		if !Whiterun
			if(thaneScript.WhiterunImpGetOutofJail > 0 || thaneScript.WhiterunSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Whiterun = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Thane Of Whiterun")
				endIf
			endIf
		endIf
		
		if !Eastmarch
			If(thaneScript.EastmarchImpGetOutofJail > 0 || thaneScript.EastmarchSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Eastmarch = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Thane Of Eastmarch")
				endIf
			endIf
		endIf
		
		
		if !Hjaalmarch
			if(thaneScript.HjaalmarchImpGetOutofJail > 0 || thaneScript.HjaalmarchSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Hjaalmarch = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Thane Of Hjaalmarch")
				endIf
			endIf
		endIf

		if !Pale
			If(thaneScript.PaleImpGetOutofJail > 0 || thaneScript.PaleSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Pale = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Thane Of The Pale")
				endIf	
			endIf
		endIf
		
		if !Winterhold
			if(thaneScript.WinterholdImpGetOutofJail > 0 || thaneScript.WinterholdSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Winterhold = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Thane Of Winterhold")
				endIf
			endIf
		endIf

		if !Falkreath
			if(thaneScript.FalkreathImpGetOutofJail > 0 || thaneScript.FalkreathSonsGetOutofJail > 0)
				RN_Thane_Listener_Count.Mod(1)
				Falkreath = TRUE
				AllThane += 1
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Thane Of Falkreath")
				endIf
			endIf
		endIf

		If AllThane == 9
		
			Notification("The Curators Companion: All Thane Banners Unlocked")
			
			RN_Thane_Listener_Complete.SetValue(1)
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
