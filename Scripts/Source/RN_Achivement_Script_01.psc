Scriptname RN_Achivement_Script_01 extends referencealias

Import Debug

RN_Achivement_Script_Master property Master Auto

;;General Properties
Bool Ach01
Bool Ach02
Bool Ach03
Bool Ach04
Bool Ach05
Int _Complete

;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;Rewards Container.
objectreference property TCC_Achievements_Container auto

;Globals to control counts.
GlobalVariable Property RN_Achievements_Listener_Count Auto

;Globals to control completion.
GlobalVariable Property RN_Ach01Complete Auto
GlobalVariable Property RN_Ach02Complete Auto
GlobalVariable Property RN_Ach03Complete Auto
GlobalVariable Property RN_Ach04Complete Auto
GlobalVariable Property RN_Ach05Complete Auto

;Properties for Checking completion.
Formlist Property TCC_DisplayList_Guildhouse Auto
GlobalVariable Property DBM_DisplayCount Auto
Formlist Property TCC_DisplayList_Library Auto

;;Properties for reward items.
MiscObject Property Gold001 Auto
ObjectReference Property TCCShieldRef Auto
ObjectReference Property TCCSwordRef Auto
ObjectReference Property StoryBookReward Auto

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

	if !Checking
		Checking = True
		
		If _Complete < 5
			
			If !Ach01 && DBM_DisplayCount.GetValue() >= 750			
				Ach01 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach01Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, true, None)
				Master.Notify("Collector")
			endIf

;;---------------------------------------------------- Hoarder - (Reached 1000 Displays)

			If !Ach02 && DBM_DisplayCount.GetValue() >= 1000			
				Ach02 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach02Complete.SetValue(1)
				_Complete += 1
				TCCSwordRef.Enable()
				Master.Reward(MCM.Ach_Perks, true, None)
				Master.Notify("Hoarder")
			endIf			

;;---------------------------------------------------- Junior Librarian	- (Displayed 100 Books)

			If !Ach03
				Int _Count = 0
				Int _Index = TCC_DisplayList_Library.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = TCC_DisplayList_Library.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= 100
					Ach03 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach03Complete.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Junior Librarian")
				endIf
			endIf	
			
;;---------------------------------------------------- Bibliophile - (Displayed 250 Books)

			If !Ach04
				Int _Count = 0
				Int _Index = TCC_DisplayList_Library.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = TCC_DisplayList_Library.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= 10
					Ach04 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach04Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					StoryBookReward.Enable()
					Master.Notify("Bibliophile")
				endIf
			endIf	

;;---------------------------------------------------- Spelunker - (Displayed all Explorer Relics)

			If !Ach05
				Int _Count = 0
				Int _Index = TCC_DisplayList_Guildhouse.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = TCC_DisplayList_Guildhouse.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= TCC_DisplayList_Guildhouse.GetSize()
					Ach05 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach05Complete.SetValue(1)
					_Complete += 1
					TCCShieldRef.Enable()
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Spelunker")
				endIf
			endIf
		endIf
	endIf
	Checking = False
endEvent
		