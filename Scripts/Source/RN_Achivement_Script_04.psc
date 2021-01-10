Scriptname RN_Achivement_Script_04 extends ObjectReference

Import Debug

RN_Achivement_Script_Master property Master Auto

;;General Properties
Bool Ach18
Bool Ach19
Bool Ach20
Bool Ach21
Bool Ach22
Bool Ach23
Int _Complete

;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;Rewards Container.
objectreference property TCC_Achievements_Container auto

;Globals to control counts.
GlobalVariable Property RN_Achievements_Listener_Count Auto

;Properties for Checking completion.
GlobalVariable Property DBM_GV_SectionArmory Auto

;Globals to control completion.
GlobalVariable Property RN_Ach18Complete Auto
GlobalVariable Property RN_Ach19Complete Auto
GlobalVariable Property RN_Ach20Complete Auto
GlobalVariable Property RN_Ach21Complete Auto
GlobalVariable Property RN_Ach22Complete Auto
GlobalVariable Property RN_Ach23Complete Auto

;Formlist to control completion.
Formlist Property RN_Ach_List_18 Auto
Formlist Property RN_Ach_List_19 Auto
Formlist Property RN_Ach_List_20 Auto
Formlist Property RN_Ach_List_21 Auto
Formlist Property RN_Ach_List_22 Auto
Formlist Property RN_Ach_List_23 Auto

Bool Checking

;;-- Functions ---------------------------------------

Event OnCellAttach()

	if MCM.Achievements_Enabled && !Checking
		Checking = True
	
		If _Complete < 6

;;---------------------------------------------------- Temper Tantrum - (Full Armory, Smithing at 100)

			If !Ach18
				Int _Count = 0
				Int _Index = RN_Ach_List_18.GetSize()
				
				While _Index
					_Index -= 1
					GlobalVariable _O = RN_Ach_List_18.GetAt(_Index) as GlobalVariable
					if _O.GetValue()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_18.GetSize() && Game.GetPlayer().GetActorValue("Smithing") == 100
					Ach18 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach18Complete.SetValue(1)
					_Complete += 1
					
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Temper Tantrum")						
				endIf
			endIf	
			
;;---------------------------------------------------- Taxidermist - (Completed all Animal Exhibits in the Hall of Nat. Science)

			If !Ach19
				Int _Count = 0
				Int _Index = RN_Ach_List_19.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_19.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_19.GetSize()
					Ach19 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach19Complete.SetValue(1)
					_Complete += 1
					
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Taxidermist")						
				endIf
			endIf	
			
;;---------------------------------------------------- By All of the Gods! - (Displayed all Divines Shrines)

			If !Ach20
				Int _Count = 0
				Int _Index = RN_Ach_List_20.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_20.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_20.GetSize()
					Ach20 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach20Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("By All of the Gods!")					
				endIf
			endIf	
			
;;---------------------------------------------------- Gearhead - (Displayed All Dwemer Artifacts)

			If !Ach21
				Int _Count = 0
				Int _Index = RN_Ach_List_21.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_21.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_21.GetSize()
					Ach21 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach21Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Gearhead")							
				endIf
			endIf	

;;---------------------------------------------------- Blind Construction - (Displayed All Falmer Artifacts)

			If !Ach22
				Int _Count = 0
				Int _Index = RN_Ach_List_22.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_22.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_22.GetSize()
					Ach22 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach22Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Blind Construction")	
				endIf
			endIf	
			
;;---------------------------------------------------- Children of the Sky - (Displayed All Nordic Artifacts)

			If !Ach23
				Int _Count = 0
				Int _Index = RN_Ach_List_23.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_23.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_23.GetSize()
					Ach23 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach23Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Children of the Sky")	
				endIf
			endIf						
		endIf
	endIf
	Checking = False
endEvent
