Scriptname RN_Utility_Global

Import Debug

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Utility function _onConsolidateItems (Formlist afListA, Formlist afListB, Formlist afListC, Formlist afListD = None) global
	
	Int Index = afListA.GetSize()
	while Index
		Index -= 1
		Form formToProcess = afListA.GetAt(Index) As Form		
			if (formToProcess As Formlist)
			Formlist nestedList = formToProcess As Formlist
			Int Index2 = nestedList.GetSize()							
				While Index2
					Index2 -= 1
					formToProcess = nestedList.GetAt(Index2) as Form	
					if !formToProcess as Activator 
						afListB.AddForm(formToProcess)
						afListC.AddForm(formToProcess)
						afListD.AddForm(formToProcess)
					endIf
				EndWhile
				
			elseif !formToProcess as Activator 
				afListB.AddForm(formToProcess)
				afListC.AddForm(formToProcess)
				afListD.AddForm(formToProcess)
			endIf	
	endWhile
endFunction

;;-- Functions ---------------------------------------

Utility function _onConsolidateDisplays (Formlist afListA, Formlist afListB) global
	
	Int Index = afListA.GetSize() 
	while Index
		Index -= 1
		Form formToProcess = afListA.GetAt(Index) As Form   		
		if (formToProcess As Formlist)			
			afListB.AddForm((formToProcess as Formlist).GetAt(0) as ObjectReference)
		elseif (formToProcess As ObjectReference)
			afListB.AddForm(formToProcess As ObjectReference)
		endIf
	endWhile
endFunction

;;-- Functions ---------------------------------------

Utility function _onDisplayCheck (Formlist afListA, Formlist afListB, GlobalVariable akVariable) global
	
	Int Index = afListA.GetSize()
	while Index
		Index -= 1
		Form formToProcess = afListA.GetAt(Index) As Form
		if (formToProcess As Formlist)			
		FormList nestedList = formToProcess As Formlist
		Int Index2 = nestedList.GetSize()
			While Index2
				Index2 -= 1
				ObjectReference DisplayRef = nestedList.GetAt(Index2) as ObjectReference	
				if !afListB.HasForm(DisplayRef) && !DisplayRef.IsDisabled()
					afListB.AddForm(DisplayRef)				
				elseif aflistB.HasForm(DisplayRef) && DisplayRef.IsDisabled()
					afListB.RemoveAddedForm(DisplayRef)
				endIf
			EndWhile
				
		elseif (formToProcess As ObjectReference)
			ObjectReference DisplayRef = formToProcess As ObjectReference
			if !afListB.HasForm(DisplayRef) && !DisplayRef.IsDisabled()
				afListB.AddForm(DisplayRef)			
			elseif aflistB.HasForm(DisplayRef) && DisplayRef.IsDisabled()
				afListB.RemoveAddedForm(DisplayRef)
			endIf

			akVariable.Setvalue(afListB.GetSize())
		endIf
	endWhile
endFunction

;;-- Functions ---------------------------------------

Bool Function CheckValueCount1(GlobalVariable aKVariable_Count, GlobalVariable aKVariable_Total, GlobalVariable akVariable) global
	if aKVariable_Count.GetValue() >= aKVariable_Total.GetValue()
		akVariable.SetValue(1)	
		return true
	endIf
  
  akVariable.SetValue(0)
  return false
EndFunction

;;-- Functions ---------------------------------------

Bool Function CheckQuestComplete (Quest akQuest) global
	if (akQuest.IsCompleted())
		return true
	endif
  
  return false
EndFunction 

;;-- Functions ---------------------------------------

Bool Function CheckQuestStageComplete (Int akStage, Quest akQuest) global
	if (akQuest.Getstage() >= akStage) || (akQuest.IsCompleted())
		return true
	endif
  
  return false
EndFunction 

;;-- Functions ---------------------------------------

Bool Function CheckDeadActor (Actor akActor) global
	if (akActor.IsDead())
		return true
	endif
  
  return false
EndFunction 

;;-- Functions ---------------------------------------

Int Function GetArrayPos(String _ModName) global
	
	if (_ModName == "Adventurer's Backpack:")
		Return 0
		
	elseif (_ModName == "Aetherium Armor and Weapons:")
		Return 1

	elseif (_ModName == "Alternate Armors - Daedric Mail:")
		Return 2
	
	elseif (_ModName == "Alternate Armors - Dragonscale:")
		Return 3
	
	elseif (_ModName == "Alternate Armors - Dwarven Mail:")
		Return 4
	
	elseif (_ModName == "Alternate Armors - Ebony Plate:")
		Return 5
	
	elseif (_ModName == "Alternate Armors - Elven Hunter:")
		Return 6
	
	elseif (_ModName == "Alternate Armors - Stalhrim Fur:")
		Return 7
	
	elseif (_ModName == "Alternate Armors - Steel Soldier:")
		Return 8
	
	elseif (_ModName == "Amulets of Skyrim:")
		Return 9
	
	elseif (_ModName == "Arcane Accessories:")
		Return 10
	
	elseif (_ModName == "Arcane Archer Pack:")
		Return 11
	
	elseif (_ModName == "Arms of Chaos:")
		Return 12
	
	elseif (_ModName == "Artifacts of Boethiah:")
		Return 13
	
	elseif (_ModName == "Artifacts of Skyrim:")
		Return 14
	
	elseif (_ModName == "Bad Gremlins Collectables:")
		Return 15
	
	elseif (_ModName == "Bone Wolf:")
		Return 16
	
	elseif (_ModName == "Camping:")
		Return 17
	
	elseif (_ModName == "Civil War Champions:")
		Return 18
	
	elseif (_ModName == "Cloaks of Skyrim:")
		Return 19
	
	elseif (_ModName == "Clockwork:")
		Return 20
	
	elseif (_ModName == "Dawnfang & Duskfang:")
		Return 21

	elseif (_ModName == "Dawnguard Arsenal:")
		Return 22
	
	elseif (_ModName == "Dead Man's Dread:")
		Return 23
	
	elseif (_ModName == "Divine Crusader:")
		Return 24
	
	elseif (_ModName == "Dwarven Armored Mudcrab:")
		Return 25
	
	elseif (_ModName == "Dwemer Spectres:")
		Return 26
	
	elseif (_ModName == "Elite Crossbows:")
		Return 27

	elseif (_ModName == "ESO Skyshards:")
		Return 28

	elseif (_ModName == "ESO Skyshards - Falskaar:")
		Return 29
		
	elseif (_ModName == "ESO Skyshards - Wyrmstooth:")
		Return 30
		
	elseif (_ModName == "Expanded Crossbow Pack:")
		Return 31

	elseif (_ModName == "Falskaar:")
		Return 32
	
	elseif (_ModName == "Follower - Auri:")
		Return 33
	
	elseif (_ModName == "Follower - Inigo:")
		Return 34
	
	elseif (_ModName == "Follower - Kaidan:")
		Return 35
		
	elseif (_ModName == "Follower - M'rissi:")
		Return 36
	
	elseif (_ModName == "Forgotten Seasons:")
		Return 37
	
	elseif (_ModName == "Fossil Mining:")
		Return 38

	elseif (_ModName == "Goblins:")
		Return 39
	
	elseif (_ModName == "Guard Armor Replacer:")
		Return 40
	
	elseif (_ModName == "Heavy Armory:")
		Return 41
	
	elseif (_ModName == "Helgen Reborn:")
		Return 42
	
	elseif (_ModName == "Ice Blade of the Monarch:")
		Return 43
	
	elseif (_ModName == "Immersive Armors:")
		Return 44
	
	elseif (_ModName == "Immersive College Of Winterhold:")
		Return 45

	elseif (_ModName == "Immersive Weapons:")
		Return 46
	
	elseif (_ModName == "Inn Soaps:")
		Return 47
	
	elseif (_ModName == "Interesting NPC's:")
		Return 48
	
	elseif (_ModName == "Jaysus Swords:")
		Return 49
	
	elseif (_ModName == "konahrik's accoutrements:")
		Return 50
	
	elseif (_ModName == "Kthonia's Weapon Pack:")
		Return 51
	
	elseif (_ModName == "Moon And Star:")
		Return 52

	elseif (_ModName == "Moonpath To Elsweyr:")
		Return 53
	
	elseif (_ModName == "Netch Leather Armor:")
		Return 54
	
	elseif (_ModName == "New Treasure Hunt:")
		Return 55
	
	elseif (_ModName == "Nix-Hound:")
		Return 56
	
	elseif (_ModName == "Nordic Jewelry:")
		Return 57
	
	elseif (_ModName == "Oblivion Artifacts:")
		Return 58
	
	elseif (_ModName == "Path of the Revanant:")
		Return 59

	elseif (_ModName == "Pets of Skyrim:")
		Return 60
	
	elseif (_ModName == "Plague of the Dead:")
		Return 61
	
	elseif (_ModName == "Project AHO:")
		Return 62
	
	elseif (_ModName == "Rare Curios:")
		Return 63
	
	elseif (_ModName == "Reliquary of Myth:")
		Return 64
	
	elseif (_ModName == "Royal Armory:")
		Return 65
	
	elseif (_ModName == "Ruin's Edge:")
		Return 66

	elseif (_ModName == "Saints & Seducers:")
		Return 67
	
	elseif (_ModName == "Saturalia Holiday Pack:")
		Return 68
	
	elseif (_ModName == "Shadowrend:")
		Return 69
	
	elseif (_ModName == "Skyrim Sewers:")
		Return 70
	
	elseif (_ModName == "Skyrim Underground:")
		Return 71
	
	elseif (_ModName == "Skyrim Unique Treasures:")
		Return 72
	
	elseif (_ModName == "Spell Knight Armor:")
		Return 73

	elseif (_ModName == "Staff of Hasedoki:")
		Return 74
	
	elseif (_ModName == "Staff of Sheogorath:")
		Return 75
	
	elseif (_ModName == "Stendarr's Hammer:")
		Return 76
	
	elseif (_ModName == "Teldryn Serious:")
		Return 75
	
	elseif (_ModName == "The Forgotten City:")
		Return 76
	
	elseif (_ModName == "The Gray Cowl Of Nocturnal:")
		Return 77
	
	elseif (_ModName == "The Gray Cowl Returns!:")
		Return 78

	elseif (_ModName == "The Wheels Of Lull:")
		Return 79
	
	elseif (_ModName == "Tools of Kagrenac:")
		Return 80
	
	elseif (_ModName == "Treasure Hunter:")
		Return 81
	
	elseif (_ModName == "Umbra:")
		Return 82
	
	elseif (_ModName == "Undeath:")
		Return 83
	
	elseif (_ModName == "Vigil Enforcer Armor Set:")
		Return 84
	
	elseif (_ModName == "Vigilant:")
		Return 85

	elseif (_ModName == "Volkihar Knight:")
		Return 86
	
	elseif (_ModName == "Wild Horses:")
		Return 87
	
	elseif (_ModName == "Wintersun:")
		Return 88
	
	elseif (_ModName == "Wyrmstooth:")
		Return 89
	
	elseif (_ModName == "Zim's Thane Weapons:")
		Return 90
	endIf
		
	return 999
endFunction








