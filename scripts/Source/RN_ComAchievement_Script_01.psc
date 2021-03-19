Scriptname RN_ComAchievement_Script_01 extends referencealias

Import Debug

RN_Achivement_Script_Master property Master Auto

;;General Properties
Bool Ach01
Bool Ach02
Bool Ach03
Bool Ach04
Bool Ach05
Bool Ach06

Int _Complete

;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;Rewards Container.
objectreference property TCC_Achievements_Container auto

;Globals to control counts.
GlobalVariable Property RN_ComAchievements_Listener_Count Auto

;Globals to control completion.
GlobalVariable Property RN_ComAch_01EdwardDaggerhands Auto
GlobalVariable Property RN_ComAch_02HeadHoncho Auto
GlobalVariable Property RN_ComAch_03Skulls Auto
GlobalVariable Property RN_ComAch_04FoodGods Auto
GlobalVariable Property RN_ComAch_05Cubes Auto
GlobalVariable Property RN_ComAch_06Jade Auto

;Properties for Checking completion.
formlist property RN_ComAch_DaggerDisplays auto
formlist property RN_ComAch_HelmetDisplays auto
formlist property RN_ComAch_SkullDisplays auto
formlist property RN_ComAch_CubesDisplays auto
formlist property RN_ComAch_JadeDisplays auto

Bool Checking

potion property TCC_CherryBakewell auto

miscobject property TCCJadeMuseumLogo auto

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

			If !Ach01
				Int _Count = 0
				Int _Index = RN_ComAch_DaggerDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_DaggerDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_DaggerDisplays.GetSize()
					Ach01 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_01EdwardDaggerhands.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Edward Daggerhands")
				endIf
			endIf	

;;---------------------------------------------------- Head Honcho - (Fill HOH Helmet Display)

			If !Ach02
				Int _Count = 0
				Int _Index = RN_ComAch_HelmetDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_HelmetDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_HelmetDisplays.GetSize()
					Ach02 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_02HeadHoncho.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Head Honcho")
				endIf
			endIf				
			
;;---------------------------------------------------- Don't ask where I got them - (Display all skulls in the HOS)

			If !Ach03
				Int _Count = 0
				Int _Index = RN_ComAch_SkullDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_SkullDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_SkullDisplays.GetSize()
					Ach03 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_03Skulls.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Don't ask where I got them")
				endIf
			endIf	

;;---------------------------------------------------- Food of the Gods - (Take home a snack from Sovngarde)

			If !Ach04
				if Game.GetPlayer().GetItemCount(TCC_CherryBakewell) > 0
					Ach04 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_04FoodGods.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Food of the Gods")
				endIf
			endIf	

;;---------------------------------------------------- One Small Step - (Locate and display all the planetarium cubes)

			If !Ach05
				Int _Count = 0
				Int _Index = RN_ComAch_CubesDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_CubesDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_CubesDisplays.GetSize()
					Ach05 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_05Cubes.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("One Small Step")
				endIf
			endIf

;;---------------------------------------------------- Jade Emperor - (Collect and display all the Jade statues)

			If !Ach06
				Int _Count = 0
				Int _Index = RN_ComAch_JadeDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_JadeDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_JadeDisplays.GetSize()
					Ach06 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_06Jade.SetValue(1)
					_Complete += 1
					Master.Reward(false, false, TCCJadeMuseumLogo)
					Master.Notify("Jade Emperor")
				endIf
			endIf
		endIf
	endIf
	Checking = False
endEvent
		