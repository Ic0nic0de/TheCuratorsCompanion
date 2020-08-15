scriptName RN_Listener_Skills extends Quest

Import Debug

;; Game.GetPlayer() Ref
Actor Property PlayerRef Auto

;;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;; Global to control activation
GlobalVariable Property RN_Skills_Listener_Count Auto
Globalvariable Property RN_Skills_Listener_Complete Auto
GlobalVariable Property iDisplaySectionComplete Auto

;; Skill Mastery Values
Bool DBM_RN_Smithing = false
Bool DBM_RN_Enchanting = false
Bool DBM_RN_Alchemy = false

Int WarriorCount = 0
Bool Warrior_One_Handed = false
Bool Warrior_Two_Handed = false
Bool Warrior_HeavyArmor = false
Bool Warrior_Marksman = false
Bool Warrior_Block = false

Int MageCount = 0
Bool Mage_Alteration = false
Bool Mage_Conjuration = false
Bool Mage_Destruction = false
Bool Mage_Illusion = false
Bool Mage_Restoration = false

Int StealthCount = 0
Bool Stealth_LightArmor = false
Bool Stealth_Lockpicking = false
Bool Stealth_Pickpocket = false
Bool Stealth_Sneak = false
Bool Stealth_Speechcraft = false

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

		if !DBM_RN_Smithing
			if (PlayerRef.GetActorValue("Smithing") >= 100) ;;Smithing
				RN_Skills_Listener_Count.Mod(1)	
				DBM_RN_Smithing = TRUE	
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Skill Mastery: Smithing")
				endIf
			endIf
		endIf

		if !DBM_RN_Enchanting
			if (PlayerRef.GetActorValue("Enchanting") >= 100) ;;Enchanting
				RN_Skills_Listener_Count.Mod(1)
				DBM_RN_Enchanting = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Skill Mastery: Enchanting")
				endIf
			endIf
		endIf

		if !DBM_RN_Alchemy
			if (PlayerRef.GetActorValue("Alchemy") >= 100) ;;Alchemy
				RN_Skills_Listener_Count.Mod(1)
				DBM_RN_Alchemy = TRUE
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Skill Mastery: Alchemy")
				endIf
			endIf
		endIf

	;;-------- Skill Mastery (Warrior)

		if WarriorCount < 3
			if !Warrior_One_Handed	
				if (PlayerRef.GetActorValue("OneHanded") >= 100) ;;OneHanded
					Warrior_One_Handed = TRUE
					WarriorCount += 1
				endIf
			endIf

			if !Warrior_Two_Handed
				if (PlayerRef.GetActorValue("TwoHanded") >= 100) ;;TwoHanded
					Warrior_Two_Handed = TRUE
					WarriorCount += 1
				endIf
			endIf

			if !Warrior_HeavyArmor
				if (PlayerRef.GetActorValue("HeavyArmor") >= 100) ;;heavy Armor
					Warrior_HeavyArmor = TRUE
					WarriorCount += 1
				endIf
			endIf

			if !Warrior_Marksman	
				if (PlayerRef.GetActorValue("Marksman") >= 100) ;;Marksman
					Warrior_Marksman = TRUE
					WarriorCount += 1
				endIf
			endIf

			if !Warrior_Block	
				if (PlayerRef.GetActorValue("Block") >= 100) ;;Block
					Warrior_Block = TRUE
					WarriorCount += 1
				endIf
			endIf
			
			if WarriorCount >= 3
				RN_Skills_Listener_Count.Mod(1)
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Skill Mastery: Warrior")
				endIf
			endIf
		endIf

	;;-------- Skill Mastery (Magic)

		if MageCount < 3
			if !Mage_Alteration	
				if (PlayerRef.GetActorValue("Alteration") >= 100) ;;Alteration
					Mage_Alteration = TRUE
					MageCount += 1
				endIf
			endIf

			if !Mage_Conjuration	
				if (PlayerRef.GetActorValue("Conjuration") >= 100) ;;Conjuration
					Mage_Conjuration = TRUE
					MageCount += 1
				endIf
			endIf

			if !Mage_Destruction	
				if (PlayerRef.GetActorValue("Destruction") >= 100) ;;Destruction
					Mage_Destruction = TRUE
					MageCount += 1
				endIf
			endIf

			if !Mage_Illusion	
				if (PlayerRef.GetActorValue("Illusion") >= 100) ;;Illusion
					Mage_Illusion = TRUE
					MageCount += 1
				endIf
			endIf

			if !Mage_Restoration	
				if (PlayerRef.GetActorValue("Restoration") >= 100) ;;Restoration
					Mage_Restoration = TRUE
					MageCount += 1
				endIf
			endIf
			
			if MageCount >= 3
				RN_Skills_Listener_Count.Mod(1)
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Skill Mastery: Mage")
				endIf
			endIf
		endIf

	;;-------- Skill Mastery (Stealth)

		if StealthCount < 3
			if !Stealth_LightArmor	
				if (PlayerRef.GetActorValue("LightArmor") >= 100) ;;LightArmor
					Stealth_LightArmor = TRUE
					StealthCount += 1
				endIf
			endIf

			if !Stealth_Lockpicking	
				if (PlayerRef.GetActorValue("Lockpicking") >= 100) ;;Lockpicking
					Stealth_Lockpicking = TRUE
					StealthCount += 1
				endIf
			endIf

			if !Stealth_Pickpocket
				if (PlayerRef.GetActorValue("Pickpocket") >= 100) ;;Pickpocket
					Stealth_Pickpocket = TRUE
					StealthCount += 1
				endIf
			endIf

			if !Stealth_Sneak	
				if (PlayerRef.GetActorValue("Sneak") >= 100) ;;Sneak
					Stealth_Sneak = TRUE
					StealthCount += 1
				endIf
			endIf

			if !Stealth_Speechcraft	
				if (PlayerRef.GetActorValue("Speechcraft") >= 100) ;;Speechcraft
					Stealth_Speechcraft = TRUE
					StealthCount += 1
				endIf
			endIf
			
			if StealthCount >= 3
				RN_Skills_Listener_Count.Mod(1)
				if (MCM.ShowListenerVal) && !FirstRun
					Notification("Museum Display Added: Skill Mastery: Thief")
				endIf
			endIf
		endIf

		if (WarriorCount >= 3) && (MageCount >= 3) && (StealthCount >= 3) && DBM_RN_Smithing && DBM_RN_Enchanting && DBM_RN_Alchemy
			
			Notification("The Curators Companion: All Skills Displays Unlocked")
			RN_Skills_Listener_Complete.SetValue(1)
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
