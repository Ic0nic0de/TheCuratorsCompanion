Scriptname RN_ComAchievement_Script_02 extends referencealias

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
GlobalVariable Property RN_ComAch_07Staff Auto
GlobalVariable Property RN_ComAch_08Booze Auto
GlobalVariable Property RN_ComAch_09TCCItems Auto
GlobalVariable Property RN_ComAch_10Scrolls Auto
GlobalVariable Property RN_ComAch_11Maps Auto
GlobalVariable Property RN_ComAch_12Culture Auto

;Properties for Checking completion.
formlist property RN_ComAch_StaffDisplays auto
formlist property RN_ComAch_BoozeDisplays auto
formlist property RN_ComAch_TCCDisplays auto
formlist property RN_ComAch_ScrollsDisplays auto
formlist property RN_ComAch_MapDisplays auto
formlist property RN_ComAch_CultureDisplays auto

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

			If !Ach01
				Int _Count = 0
				Int _Index = RN_ComAch_StaffDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_StaffDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_StaffDisplays.GetSize()
					Ach01 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_07Staff.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Bibbidi-Bobbidi-Boo")
				endIf
			endIf	

;;---------------------------------------------------- Sommelier - (Display all beverages in the Museum Storeroom)

			If !Ach02
				Int _Count = 0
				Int _Index = RN_ComAch_BoozeDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_BoozeDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_BoozeDisplays.GetSize()
					Ach02 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_08Booze.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Sommelier")
				endIf
			endIf				
			
;;---------------------------------------------------- Ic0nic collector - (Collect and display all the unique items from The Curators Companion)

			If !Ach03
				Int _Count = 0
				Int _Index = RN_ComAch_TCCDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_TCCDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_TCCDisplays.GetSize()
					Ach03 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_09TCCItems.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Ic0nic Collector")
				endIf
			endIf	

;;---------------------------------------------------- Franchise - (Display the Elder Scrolls)

			If !Ach04
				Int _Count = 0
				Int _Index = RN_ComAch_ScrollsDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_ScrollsDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_ScrollsDisplays.GetSize()
					Ach04 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_10Scrolls.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Franchise")
				endIf
			endIf

;;---------------------------------------------------- X Marker - (Find and display all treasure maps in the library)

			If !Ach05
				Int _Count = 0
				Int _Index = RN_ComAch_MapDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_MapDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_MapDisplays.GetSize()
					Ach05 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_11Maps.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("X Marker")
				endIf
			endIf

;;---------------------------------------------------- Culture Cultivator - (Discover all the culture displays for the Hall of Heroes)

			If !Ach06
				Int _Count = 0
				Int _Index = RN_ComAch_CultureDisplays.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_ComAch_CultureDisplays.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count == RN_ComAch_CultureDisplays.GetSize()
					Ach06 = True
					RN_ComAchievements_Listener_Count.Mod(1)
					RN_ComAch_12Culture.SetValue(1)
					_Complete += 1	
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Culture Cultivator")
				endIf
			endIf
		endIf
	endIf
	Checking = False
endEvent
		