Scriptname RN_Achivement_Script_06 extends referencealias

Import Debug

RN_Achivement_Script_Master property Master Auto

;;General Properties
Bool Ach30
Bool Ach31
Bool Ach32
Bool Ach33
Bool Ach34

Bool AchExcavation
Bool AchExpedition
Bool AchAcademia

Int _Complete

;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;Rewards Container.
objectreference property TCC_Achievements_Container auto

;Globals to control counts.
GlobalVariable Property RN_Achievements_Listener_Count Auto

;Properties for Checking completion.
ObjectReference Property DBM_StalhrimSpoonStat Auto
ObjectReference Property dbm_goldpile03 Auto
Quest Property DBM_DHQuest Auto

;Globals to control completion.
GlobalVariable Property RN_Ach30Complete Auto
GlobalVariable Property RN_Ach31Complete Auto
GlobalVariable Property RN_Ach32Complete Auto
GlobalVariable Property RN_Ach33Complete Auto
GlobalVariable Property RN_Ach34Complete Auto

GlobalVariable Property RN_AchExcavationComplete Auto
GlobalVariable Property RN_AchExpeditionComplete Auto
GlobalVariable Property RN_AchAcademiaComplete Auto

;Formlist to control completion.
Formlist Property RN_Ach_List_32 Auto
Formlist Property RN_Ach_List_33 Auto

Formlist Property RN_Ach_List_Excavation Auto
Formlist Property RN_Ach_List_Expedition Auto
Formlist Property RN_Ach_List_Academia Auto

;;Properties for reward items.
Weapon Property WeapStaffTCC Auto
Armor Property ArmorCloakTCC Auto
MiscObject Property TCCGoldApple Auto

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
	
		If _Complete < 8

;;---------------------------------------------------- Master of Secrets - (Found & Displayed Ice's Spoon)

			If !Ach30 && !DBM_StalhrimSpoonStat.IsDisabled()
				Ach30 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach30Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, false, None)
				Master.Notify("Master of Secrets")
			endIf

;;---------------------------------------------------- Deep Pockets - (Renovated Deepholme)

			If !Ach31 && DBM_DHQuest.IsCompleted()
				Ach31 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach31Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, false, None)
				Master.Notify("Deep Pockets")
			endIf

;;---------------------------------------------------- Guild Master Master - (All Guild Displays)

			If !Ach32
				Int _Count = 0
				Int _Index = RN_Ach_List_32.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_32.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_32.GetSize()
					Ach32 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach32Complete.SetValue(1)
					_Complete += 1
					Master.Reward(false, false, ArmorCloakTCC)
					Master.Notify("Guild Master Master")	
				endIf
			endIf	

;;---------------------------------------------------- Champion of All - (Completed All Daedric Quests)

			If !Ach33
				Int _Count = 0
				Int _Index = RN_Ach_List_33.GetSize()
				
				While _Index
					_Index -= 1
					Quest _O = RN_Ach_List_33.GetAt(_Index) as Quest
					if _O.IsCompleted()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_33.GetSize()
					Ach33 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach33Complete.SetValue(1)
					_Complete += 1
					Master.Reward(false, false, WeapStaffTCC)
					Master.Notify("Champion of All")		
				endIf
			endIf	

			

;;---------------------------------------------------- Midas Touch - (Fill the treasury)

			If !Ach34 && !dbm_goldpile03.IsDisabled() 						
				Ach34 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach34Complete.SetValue(1)
				_Complete += 1
				Master.Reward(false, false, TCCGoldApple)
				Master.Notify("Midas Touch")
			endIf

;;---------------------------------------------------- Deft Digger - (Take all perks from the Excavation skill tree)

			If !AchExcavation
				Int _Count = 0
				Int _Index = RN_Ach_List_Excavation.GetSize()
				
				While _Index
					_Index -= 1
					perk _O = RN_Ach_List_Excavation.GetAt(_Index) as perk
					if Game.GetPlayer().HasPerk(_O)
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_Excavation.GetSize()
					AchExcavation = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_AchExcavationComplete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Deft Digger")		
				endIf
			endIf	

;;---------------------------------------------------- Expedient - (Take all perks from the Expedition skill tree)

			If !AchExpedition
				Int _Count = 0
				Int _Index = RN_Ach_List_Expedition.GetSize()
				
				While _Index
					_Index -= 1
					perk _O = RN_Ach_List_Expedition.GetAt(_Index) as perk
					if Game.GetPlayer().HasPerk(_O)
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_Expedition.GetSize()
					AchExpedition = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_AchExpeditionComplete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Expedient")		
				endIf
			endIf

;;---------------------------------------------------- Expedient - (Take all perks from the Academia skill tree)

			If !AchAcademia
				Int _Count = 0
				Int _Index = RN_Ach_List_Academia.GetSize()
				
				While _Index
					_Index -= 1
					perk _O = RN_Ach_List_Academia.GetAt(_Index) as perk
					if Game.GetPlayer().HasPerk(_O)
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_Academia.GetSize()
					AchAcademia = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_AchAcademiaComplete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Professor")		
				endIf
			endIf
		endIf
	endIf
	Checking = False
endEvent
