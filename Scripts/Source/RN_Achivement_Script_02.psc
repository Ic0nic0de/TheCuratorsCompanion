Scriptname RN_Achivement_Script_02 extends referencealias

Import Debug

RN_Achivement_Script_Master property Master Auto

;;General Properties
Bool Ach06
Bool Ach07
Bool Ach08
Bool Ach09
Bool Ach10
Bool Ach11
Int _Complete

;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;Rewards Container.
objectreference property TCC_Achievements_Container auto

;Globals to control counts.
GlobalVariable Property RN_Achievements_Listener_Count Auto

;Globals to control completion.
GlobalVariable Property RN_Ach06Complete Auto
GlobalVariable Property RN_Ach07Complete Auto
GlobalVariable Property RN_Ach08Complete Auto
GlobalVariable Property RN_Ach09Complete Auto
GlobalVariable Property RN_Ach10Complete Auto
GlobalVariable Property RN_Ach11Complete Auto

;Formlist to control completion.
Formlist Property RN_Ach_List_06 Auto
Formlist Property RN_Ach_List_07 Auto
Formlist Property RN_Ach_List_08 Auto
Formlist Property RN_Ach_List_09 Auto
Formlist Property RN_Ach_List_10 Auto
Formlist Property RN_Ach_List_11 Auto

Event OnUpdate()
	
	If _Complete < 6

;;---------------------------------------------------- Lapidarist - (Displayed all Gems)
		
		If !Ach06
			Int _Count = 0
			Int _Index = RN_Ach_List_06.GetSize()
			
			While _Index
				_Index -= 1
				ObjectReference _O = RN_Ach_List_06.GetAt(_Index) as ObjectReference
				if _O.IsEnabled()
					_Count += 1
				endIf
			endWhile
			
			if _Count >= RN_Ach_List_06.GetSize()
				Ach06 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach06Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, true, None)
				Master.Notify("Lapidarist")				
			endIf
		endIf	
		
;;---------------------------------------------------- Conchologist - (Displayed all Sea Shell)

		If !Ach07
			Int _Count = 0
			Int _Index = RN_Ach_List_07.GetSize()
			
			While _Index
				_Index -= 1
				ObjectReference _O = RN_Ach_List_07.GetAt(_Index) as ObjectReference
				if _O.IsEnabled()
					_Count += 1
				endIf
			endWhile
			
			if _Count >= RN_Ach_List_07.GetSize()
				Ach07 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach07Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, true, None)
				Master.Notify("Conchologist")							
			endIf
		endIf	
		
;;---------------------------------------------------- Fusilatelist - (Displayed all Decks of Cards)

		If !Ach08
			Int _Count = 0
			Int _Index = RN_Ach_List_08.GetSize()
			
			While _Index
				_Index -= 1
				ObjectReference _O = RN_Ach_List_08.GetAt(_Index) as ObjectReference
				if _O.IsEnabled()
					_Count += 1
				endIf
			endWhile
			
			if _Count >= RN_Ach_List_08.GetSize()
				Ach08 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach08Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, true, None)
				Master.Notify("Fusilatelist")	
			endIf
		endIf	
		
;;---------------------------------------------------- Numismatist - (Displayed all Coins)

		If !Ach09
			Int _Count = 0
			Int _Index = RN_Ach_List_09.GetSize()
			
			While _Index
				_Index -= 1
				ObjectReference _O = RN_Ach_List_09.GetAt(_Index) as ObjectReference
				if _O.IsEnabled()
					_Count += 1
				endIf
			endWhile
			
			if _Count >= RN_Ach_List_09.GetSize()
				Ach09 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach09Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, true, None)
				Master.Notify("Numismatist")									
			endIf
		endIf	
		
;;---------------------------------------------------- Expert Sleuth - (Completed All of Auryen's Notes)

		If !Ach10
			Int _Count = 0
			Int _Index = RN_Ach_List_10.GetSize()
			
			While _Index
				_Index -= 1
				Quest _O = RN_Ach_List_10.GetAt(_Index) as Quest
				if _O.IsCompleted()
					_Count += 1
				endIf
			endWhile
			
			if _Count >= RN_Ach_List_10.GetSize()
				Ach10 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach10Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, true, None)
				Master.Notify("Expert Sleuth")
			endIf
		endIf	
		
;;---------------------------------------------------- Pillar of Nirn - (Displayed all Standing Stones )

		If !Ach11
			Int _Count = 0
			Int _Index = RN_Ach_List_11.GetSize()
			
			While _Index
				_Index -= 1
				ObjectReference _O = RN_Ach_List_11.GetAt(_Index) as ObjectReference
				if _O.IsEnabled()
					_Count += 1
				endIf
			endWhile
			
			if _Count >= RN_Ach_List_11.GetSize()
				Ach11 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach11Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, true, None)
				Master.Notify("Pillar of Nirn")
			endIf
		endIf		
	endIf
endEvent
