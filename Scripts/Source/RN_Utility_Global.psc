Scriptname RN_Utility_Global

Import Debug

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Utility function Notify(String MessageAsString = "", String Colour) Global

	if (MessageAsString)	
		Debug.Notification("<font color='#" + Colour + "'>"+ MessageAsString + "</font>")
	endif
endFunction
	
;;-- Functions ---------------------------------------

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

Int function _onConsolidateDisplaysAll (Formlist afListA, Formlist afListB, GlobalVariable RoomCount = none) global
	
	Int ReturnSize = 0
	
	Int Index = afListA.GetSize()
	while Index
		Index -= 1
		Form formToProcess = afListA.GetAt(Index) As Form		
		if (formToProcess As Formlist)
			Formlist nestedList = formToProcess As Formlist
			Int Index2 = nestedList.GetSize()							
			While Index2
				Index2 -= 1
				formToProcess = nestedList.GetAt(Index2) as ObjectReference	
				afListB.AddForm(formToProcess)
			EndWhile
			
			if nestedList.GetSize() > 1
				ReturnSize += nestedList.GetSize() - 1
			endif
			
		elseif (formToProcess As ObjectReference) 
			afListB.AddForm(formToProcess)
		endIf	
	endWhile
	
	if RoomCount
		RoomCount.Mod(ReturnSize)
	endIf
	
	Return ReturnSize
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

Utility function _onDisplayCheck(Formlist afListA, Formlist afListB, GlobalVariable akVariable, String RoomName) global
	
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
					TCCDebug.Log("Scan Script Updated " + RoomName + " display " + DisplayRef.GetName() + DisplayRef, 0)
				elseif aflistB.HasForm(DisplayRef) && DisplayRef.IsDisabled()
					afListB.RemoveAddedForm(DisplayRef)
					TCCDebug.Log("Scan Script Removed " + RoomName + " display " + DisplayRef.GetName() + DisplayRef, 0)
				endIf
			EndWhile
				
		elseif (formToProcess As ObjectReference)
			ObjectReference DisplayRef = formToProcess As ObjectReference
			if !afListB.HasForm(DisplayRef) && !DisplayRef.IsDisabled()
				afListB.AddForm(DisplayRef)			
				TCCDebug.Log("Scan Script Updated " + RoomName + " display " + DisplayRef.GetName() + DisplayRef, 0)
			elseif aflistB.HasForm(DisplayRef) && DisplayRef.IsDisabled()
				afListB.RemoveAddedForm(DisplayRef)
				TCCDebug.Log("Scan Script Removed " + RoomName + " display " + DisplayRef.GetName() + DisplayRef, 0)
			endIf
		endIf
	endWhile
		akVariable.Setvalue(afListB.GetSize())
endFunction

;;-- Functions ---------------------------------------

Utility function _onDisplayArrayCheck (ObjectReference[] afListA, Formlist afListB, GlobalVariable akVariable, String RoomName) global
	
	Int Index = afListA.Length
	while Index
		Index -= 1			
		if !afListB.HasForm(afListA[Index]) && !afListA[Index].IsDisabled()
			afListB.AddForm(afListA[Index])			
			TCCDebug.Log("Scan Script Updated " + RoomName + " display " + afListA[Index].GetName() + afListA[Index], 0)
		elseif aflistB.HasForm(afListA[Index]) && afListA[Index].IsDisabled()
			afListB.RemoveAddedForm(afListA[Index])
			TCCDebug.Log("Scan Script Removed " + RoomName + " display " + afListA[Index].GetName() + afListA[Index], 0)
		endIf
	endWhile
		akVariable.Setvalue(afListB.GetSize())
endFunction

;;-- Functions ---------------------------------------

Bool Function CheckValueCount1(GlobalVariable aKVariable_Count, GlobalVariable aKVariable_Total, GlobalVariable akVariable) global
	if aKVariable_Count.GetValue() >= aKVariable_Total.GetValue()
		akVariable.SetValue(999)	
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

Bool Function CheckQuestStageDone (Int akStage, Quest akQuest) global
	if (akQuest.GetStageDone(akStage))
		return true
	endif
  
  return false
EndFunction 

;;-- Functions ---------------------------------------

Bool Function CheckQuestStagePassed (Int akStage, Quest akQuest) global
	if (akQuest.GetStage() >= (akStage))
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

String function GetHexValue(String[] HexDigits, Int m, String sAdd = "", Bool bAdd = False) global
 
    if m >= 0 
        string s
        int v = 0x10000000
            While (v > 0)
                int j = m / v
                s += HexDigits[j]
                m = m % v
                if (v > 1)
                    v = v / 16
                else
                    v = 0
                endif
            endWhile
        if (bAdd)
            return (s + sAdd)
        endif

        return (sAdd + s)
    else
        m += 1
        string s
        int v = 0x10000000
            While (v > 0)
                int k = m / v
                int j = 15 - (k - (k * 2))
                s += HexDigits[j]
                m = m % v
                if (v > 1)
                    v = v / 16
                else
                    v = 0
                endif
            endWhile
        if (bAdd) 
            return (s + sAdd)
        endif

        return (sAdd + s)
    endif 
endFunction	

;;-- Functions ---------------------------------------

Int Function GetArrayPos(String _ModName) global
	
	if (_ModName == "Additional Hearthfire Dolls")
		Return 0
		
	elseif (_ModName == "Adventurer's Backpack")
		Return 1
		
	elseif (_ModName == "Aetherium Armor and Weapons")
		Return 2

	elseif (_ModName == "Alternate Armors - Daedric Mail")
		Return 3

	elseif (_ModName == "Alternate Armors - Dragonscale")
		Return 4
	
	elseif (_ModName == "Alternate Armors - Dwarven Mail")
		Return 5
	
	elseif (_ModName == "Alternate Armors - Ebony Plate")
		Return 6
	
	elseif (_ModName == "Alternate Armors - Elven Hunter")
		Return 7
	
	elseif (_ModName == "Alternate Armors - Stalhrim Fur")
		Return 8
	
	elseif (_ModName == "Alternate Armors - Steel Soldier")
		Return 9
	
	elseif (_ModName == "Amulets of Skyrim")
		Return 10
	
	elseif (_ModName == "Arcane Accessories")
		Return 11
	
	elseif (_ModName == "Arcane Archer Pack")
		Return 12
	
	elseif (_ModName == "Arms of Chaos")
		Return 13
	
	elseif (_ModName == "Artifacts of Boethiah")
		Return 14
	
	elseif (_ModName == "Artifacts of Skyrim")
		Return 15
	
	elseif (_ModName == "Bad Gremlins Collectables")
		Return 16
	
	elseif (_ModName == "Bone Wolf")
		Return 17
	
	elseif (_ModName == "Camping")
		Return 18
	
	elseif (_ModName == "Civil War Champions")
		Return 19
	
	elseif (_ModName == "Cloaks of Skyrim")
		Return 20
	
	elseif (_ModName == "Clockwork")
		Return 21
	
	elseif (_ModName == "Dawnfang & Duskfang")
		Return 22

	elseif (_ModName == "Dawnguard Arsenal")
		Return 23
	
	elseif (_ModName == "Dead Man's Dread")
		Return 24
	
	elseif (_ModName == "Divine Crusader")
		Return 25
	
	elseif (_ModName == "Dwarven Armored Mudcrab")
		Return 26
	
	elseif (_ModName == "Dwemer Spectres")
		Return 27
	
	elseif (_ModName == "Elite Crossbows")
		Return 28

	elseif (_ModName == "ESO Skyshards")
		Return 29

	elseif (_ModName == "ESO Skyshards - Falskaar")
		Return 30
		
	elseif (_ModName == "ESO Skyshards - Wyrmstooth")
		Return 31
		
	elseif (_ModName == "Expanded Crossbow Pack")
		Return 32

	elseif (_ModName == "Falskaar")
		Return 33
	
	elseif (_ModName == "Follower - Auri")
		Return 34
	
	elseif (_ModName == "Follower - Inigo")
		Return 35
	
	elseif (_ModName == "Follower - Kaidan")
		Return 36
		
	elseif (_ModName == "Forgotten Seasons")
		Return 37
	
	elseif (_ModName == "Fossil Mining")
		Return 38

	elseif (_ModName == "Goblins")
		Return 39

	elseif (_ModName == "Grandma Shirley")
		Return 40
		
	elseif (_ModName == "Guards Armor Replacer")
		Return 41
		
	elseif (_ModName == "Heavy Armory")
		Return 42
	
	elseif (_ModName == "Helgen Reborn")
		Return 43
	
	elseif (_ModName == "Ice Blade of the Monarch")
		Return 44
	
	elseif (_ModName == "Immersive Armors")
		Return 45
	
	elseif (_ModName == "Immersive College Of Winterhold")
		Return 46

	elseif (_ModName == "Immersive Weapons")
		Return 47
	
	elseif (_ModName == "Inn Soaps")
		Return 48
	
	elseif (_ModName == "Interesting NPC's")
		Return 49
	
	elseif (_ModName == "Jaysus Swords")
		Return 50
	
	elseif (_ModName == "konahrik's accoutrements")
		Return 51
	
	elseif (_ModName == "Kthonia's Weapon Pack")
		Return 52
	
	elseif (_ModName == "Moon And Star")
		Return 53

	elseif (_ModName == "Moonpath To Elsweyr")
		Return 54
	
	elseif (_ModName == "Netch Leather Armor")
		Return 55
	
	elseif (_ModName == "New Treasure Hunt")
		Return 56
	
	elseif (_ModName == "Nix-Hound")
		Return 57
	
	elseif (_ModName == "Nordic Jewelry")
		Return 58
	
	elseif (_ModName == "Oblivion Artifacts")
		Return 59
		
	elseif (_ModName == "Path of the Revanant")
		Return 60

	elseif (_ModName == "Pets of Skyrim")
		Return 61
		
	elseif (_ModName == "Plague of the Dead")
		Return 62
		
	elseif (_ModName == "Project AHO")
		Return 63

	elseif (_ModName == "Relic Hunter - Guildmaster")
		Return 64
		
	elseif (_ModName == "Rare Curios")
		Return 65
	
	elseif (_ModName == "Reliquary of Myth")
		Return 66
	
	elseif (_ModName == "Royal Armory")
		Return 67
	
	elseif (_ModName == "Ruin's Edge")
		Return 68

	elseif (_ModName == "Saints & Seducers")
		Return 69
	
	elseif (_ModName == "Saturalia Holiday Pack")
		Return 70
	
	elseif (_ModName == "Shadowrend")
		Return 71
	
	elseif (_ModName == "Skyrim Sewers")
		Return 72
	
	elseif (_ModName == "Skyrim Underground")
		Return 73
	
	elseif (_ModName == "Skyrim Unique Treasures")
		Return 74
	
	elseif (_ModName == "Spell Knight Armor")
		Return 75

	elseif (_ModName == "Staff of Hasedoki")
		Return 76
	
	elseif (_ModName == "Staff of Sheogorath")
		Return 77
	
	elseif (_ModName == "Stendarr's Hammer")
		Return 78

	elseif (_ModName == "The Curators Companion")
		Return 79
		
	elseif (_ModName == "Teldryn Serious")
		Return 80
	
	elseif (_ModName == "The Forgotten City")
		Return 81
		
	elseif (_ModName == "The Gray Cowl Of Nocturnal")
		Return 82
	
	elseif (_ModName == "The Gray Cowl Returns!")
		Return 83

	elseif (_ModName == "The Wheels Of Lull")
		Return 84
	
	elseif (_ModName == "Tools of Kagrenac")
		Return 85
	
	elseif (_ModName == "Treasure Hunter")
		Return 86
	
	elseif (_ModName == "Umbra")
		Return 87
	
	elseif (_ModName == "Undeath")
		Return 88
	
	elseif (_ModName == "Vigil Enforcer Armor Set")
		Return 89
	
	elseif (_ModName == "Vigilant.")
		Return 90

	elseif (_ModName == "Volkihar Knight")
		Return 91
	
	elseif (_ModName == "Wild Horses")
		Return 92
	
	elseif (_ModName == "Wintersun")
		Return 93
		
	elseif (_ModName == "Wyrmstooth")
		Return 94

	elseif (_ModName == "Your Choices Matter")
		Return 95
		
	elseif (_ModName == "Zim's Thane Weapons")
		Return 96
	endIf
		
	return 999
endFunction







