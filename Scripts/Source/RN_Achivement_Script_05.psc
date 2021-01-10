Scriptname RN_Achivement_Script_05 extends ObjectReference

Import Debug

RN_Achivement_Script_Master property Master Auto

;;General Properties
Bool Ach24
Bool Ach25
Bool Ach26
Bool Ach27
Bool Ach28
Bool Ach29
Int _Complete

;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;Player.
objectreference property PlayerRef auto

;Rewards Container.
objectreference property TCC_Achievements_Container auto

;Globals to control counts.
GlobalVariable Property RN_Achievements_Listener_Count Auto

;Properties for Checking completion.
Quest Property DBM_HauntedMuseumQuest Auto
Quest Property DBM_Excavation03Cleanup Auto
Quest Property DBM_MuseumHeist Auto

;Globals to control completion.
GlobalVariable Property RN_Ach24Complete Auto
GlobalVariable Property RN_Ach25Complete Auto
GlobalVariable Property RN_Ach26Complete Auto
GlobalVariable Property RN_Ach27Complete Auto
GlobalVariable Property RN_Ach28Complete Auto
GlobalVariable Property RN_Ach29Complete Auto

;Formlist to control completion.
Formlist Property RN_Ach_List_25 Auto
Formlist Property RN_Ach_List_27 Auto 
Formlist Property RN_Ach_List_29 Auto 

;;Properties for reward items.
MiscObject Property TCCFafnirTeddy Auto

Bool Checking

;;-- Functions --------------------------------------- 

Event OnCellAttach()

	if MCM.Achievements_Enabled && !Checking
		Checking = True
		
		If _Complete < 6

;;---------------------------------------------------- Ghostbuster - (Braved the Haunted Quest)
		 
			If !Ach24 && DBM_HauntedMuseumQuest.GetStageDone(15)
				Ach24 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach24Complete.SetValue(1)
				_Complete += 1
				Master.Reward(MCM.Ach_Perks, true, None)
				Master.Notify("Ghostbuster")
			endIf	

;;---------------------------------------------------- Canvas Collector - (Displayed All Museum Paintings)

			If !Ach25
				Int _Count = 0
				Int _Index = RN_Ach_List_25.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_25.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_25.GetSize()
					Ach25 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach25Complete.SetValue(1)
					_Complete += 1
					Master.Reward(MCM.Ach_Perks, true, None)
					Master.Notify("Canvas Collector")
				endIf
			endIf	

;;---------------------------------------------------- That's all Folks - (Roll the credits)	

			If !Ach26 && DBM_Excavation03Cleanup.GetStageDone(20)
				Ach26 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach26Complete.SetValue(1)
				_Complete += 1
				Master.Notify("That's all Folks")
				Master.Reward(MCM.Ach_Perks, true, None)
				Game.GetPlayer().ModActorValue("Speechcraft", 50.0)
			endIf
			
;;---------------------------------------------------- Expansionist - (Built All Guild Outposts)

			If !Ach27
				Int _Count = 0
				Int _Index = RN_Ach_List_27.GetSize()
				
				While _Index
					_Index -= 1
					Quest _O = RN_Ach_List_27.GetAt(_Index) as Quest
					if _O.IsCompleted()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_27.GetSize()
					Ach27 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach27Complete.SetValue(1)
					_Complete += 1
					Master.Reward(false, false, TCCFafnirTeddy)
					Master.Notify("Expansionist")
				endIf
			endIf	

;;---------------------------------------------------- Forgive and Forget - (Forgave Avram)	

			If !Ach28 && DBM_MuseumHeist.GetStageDone(57)
				Ach28 = True
				RN_Achievements_Listener_Count.Mod(1)
				RN_Ach28Complete.SetValue(1)
				_Complete += 1
				Master.Reward(false, true, None, "Speechcraft", 50)
				Master.Notify("Forgive and Forget")
			endIf

;;---------------------------------------------------- Yer a Wizard [NAME] - (Mastered Every Spell School)

			If !Ach29
				Int _Count = 0
				Int _Index = RN_Ach_List_29.GetSize()
				
				While _Index
					_Index -= 1
					ObjectReference _O = RN_Ach_List_29.GetAt(_Index) as ObjectReference
					if _O.IsEnabled()
						_Count += 1
					endIf
				endWhile
				
				if _Count >= RN_Ach_List_29.GetSize()
					Ach29 = True
					RN_Achievements_Listener_Count.Mod(1)
					RN_Ach29Complete.SetValue(1)
					_Complete += 1
					Master.Reward(false, true, None, "Magicka", 50)
					Master.Notify("Yer a Wizard " + PlayerRef.GetBaseObject().GetName())									
				endIf
			endIf							
		endIf
	endIf
	Checking = False
endEvent
