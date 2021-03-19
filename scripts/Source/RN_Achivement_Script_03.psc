Scriptname RN_Achivement_Script_03 extends referencealias

Import Debug

RN_Achivement_Script_Master property Master Auto

;;General Properties
Bool Ach12
Bool Ach13
Bool Ach14
Bool Ach15
Bool Ach16
Bool Ach17
Int _Complete

;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;Rewards Container.
objectreference property TCC_Achievements_Container auto

;Globals to control counts.
GlobalVariable Property RN_Achievements_Listener_Count Auto

;Properties for Checking completion.
Quest Property DBM_MuseumIntro Auto

;Globals to control completion.
GlobalVariable Property RN_Ach12Complete Auto
GlobalVariable Property RN_Ach13Complete Auto
GlobalVariable Property RN_Ach14Complete Auto
GlobalVariable Property RN_Ach15Complete Auto
GlobalVariable Property RN_Ach16Complete Auto
GlobalVariable Property RN_Ach17Complete Auto

;Formlist to control completion.
Formlist Property RN_Ach_List_12 Auto
Formlist Property RN_Ach_List_13 Auto
Formlist Property RN_Ach_List_14 Auto
Formlist Property RN_Ach_List_15 Auto
Formlist Property RN_Ach_List_17 Auto

Bool Checking

;;----------------------------------------------------

Event OnInit()

	RegisterForModEvent("_RunAchievementsCheck", "_OnCheck")
endEvent

;;----------------------------------------------------

Event OnPlayerLoadGame()

	RegisterForModEvent("_RunAchievementsCheck", "_OnCheck")
endEvent

;;----------------------------------------------------

Event _OnCheck(string eventName, string strArg, float numArg, Form sender)

	if MCM.Achievements_Enabled && !Checking
		Checking = True
	
		If _Complete < 6

;;---------------------------------------------------- Noise Complaint - (Found all Words of Power)
			
			If !Ach12
				Int _Count = 0
				Int _Index = RN_Ach_List_12.GetSize()
				
				While _Index
					_Index -= 1
					WordOfPower _O = RN_Ach_List_12.GetAt(_Index) as WordOfPower
					if Game.IsWordUnlocked(_O)
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_12.GetSize()
					Ach12 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach12Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Noise Complaint")							
				endIf
			endIf	

;;---------------------------------------------------- Masquerader - (Displayed all Masks and Claws)

			If !Ach13
				Int _Count = 0
				Int _Index = RN_Ach_List_13.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_13.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_13.GetSize()
					Ach13 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach13Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Masquerader")
				endIf
			endIf	

;;---------------------------------------------------- That's Sir Thane to You - (Thane of Every Hold)

			If !Ach14
				Int _Count = 0
				Int _Index = RN_Ach_List_14.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_14.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_14.GetSize()
					Ach14 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach14Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("That's Sir Thane to You")
				endIf
			endIf

;;---------------------------------------------------- Guardian of the Divine - (Displayed All Arms of the Crusader)

			If !Ach15
				Int _Count = 0
				Int _Index = RN_Ach_List_15.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_15.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_15.GetSize()
					Ach15 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach15Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Guardian of the Divine")
				endIf
			endIf

;;---------------------------------------------------- Cut the Ribbon - (Open the Museum)
			
			Bool GuildMaster = Game.GetModByName("DBM_RelicHunter.esp") != 255	
			Bool ASLAL = Game.GetModByName("Alternate Start - Live Another Life.esp") != 255
			
			If !Ach16 && DBM_MuseumIntro.IsCompleted() || !Ach16 && GuildMaster && Quest.GetQuest("DBM_GuildMasterStart").IsCompleted() || !Ach16 && ASLAL && Quest.GetQuest("DBM_LALStart").IsCompleted()
				Ach16 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach16Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, true, None)
				Master.Notify("Cut the Ribbon")
			endIf

;;---------------------------------------------------- Tentacle Afficianado - (Displayed All Black Books)

			If !Ach17
				Int _Count = 0
				Int _Index = RN_Ach_List_17.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_17.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_17.GetSize()
					Ach17 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach17Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Tentacle Afficianado")
				endIf
			endIf			
		endIf
	endIf
	Checking = False
endEvent
