Scriptname RN_Achivement_Script_01 extends referencealias

Import Debug

RN_Achivement_Script_Master property Master Auto

;;General Properties
Bool Ach01
Bool Ach02
Bool Ach03
Bool Ach04
Bool Ach05
Bool AchBackPack
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
GlobalVariable Property RN_AchBackpackComplete Auto

;Properties for Checking completion.
GlobalVariable Property DBM_DisplayCount Auto
GlobalVariable Property GV_SectionLibrary_Count Auto
GlobalVariable Property GV_SectionGuildhouse_Count Auto
GlobalVariable Property GV_SectionGuildhouse Auto

;;Properties for reward items.
MiscObject Property Gold001 Auto
ObjectReference Property TCCShieldRef Auto
ObjectReference Property TCCSwordRef Auto
ObjectReference Property TCCBackpackRef Auto
ObjectReference Property StoryBookReward Auto

Event OnUpdate()
		
	If _Complete < 6

		If !Ach01 && DBM_DisplayCount.GetValue() >= 500			
			Ach01 = True
			RN_Achievements_Listener_Count.Mod(1)
			RN_Ach01Complete.SetValue(1)
			_Complete += 1
			Master.Reward(MCM.Ach_Perks, true, None)
			Master.Notify("Hobbyist")
		endIf

;;---------------------------------------------------- Collector - (Reached 750 Displays)
		
		If !AchBackPack && DBM_DisplayCount.GetValue() >= 750			
			AchBackPack = True
			RN_Achievements_Listener_Count.Mod(1)
			RN_AchBackpackComplete.SetValue(1)
			_Complete += 1
			TCCBackpackRef.Enable()
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

		If !Ach03 && GV_SectionLibrary_Count.GetValue() >= 100		
			Ach03 = True
			RN_Achievements_Listener_Count.Mod(1)
			RN_Ach03Complete.SetValue(1)
			_Complete += 1
			Master.Reward(MCM.Ach_Perks, true, None)
			Master.Notify("Junior Librarian")
		endIf
		
;;---------------------------------------------------- Bibliophile - (Displayed 250 Books)

		If !Ach04 && GV_SectionLibrary_Count.GetValue() >= 250		
			Ach04 = True
			RN_Achievements_Listener_Count.Mod(1)
			RN_Ach04Complete.SetValue(1)
			_Complete += 1
			Master.Reward(MCM.Ach_Perks, true, None)
			StoryBookReward.Enable()
			Master.Notify("Bibliophile")
		endIf	

;;---------------------------------------------------- Spelunker - (Displayed all Explorer Relics)

		If !Ach05 && GV_SectionGuildhouse_Count.GetValue() == GV_SectionGuildhouse.GetValue()		
			Ach05 = True
			RN_Achievements_Listener_Count.Mod(1)
			RN_Ach05Complete.SetValue(1)
			_Complete += 1
			TCCShieldRef.Enable()
			Master.Reward(MCM.Ach_Perks, true, None)
			Master.Notify("Spelunker")
		endIf
	endIf
endEvent
		