scriptname RN_PatchAPI extends quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_Script property Util auto
RN_Utility_PropManager property Prop auto

ObjectReference Property PlayerRef Auto
Formlist Property dbmMaster Auto

string[] property SupportedModNames auto hidden
form[] property SupportedModHandlers auto hidden

Formlist[] property _ArmoryDisplayNames auto hidden
Formlist[] property _ArmoryDisplayRefs auto hidden
String[] property _ArmoryDisplaySection auto hidden

Formlist[] property _DaedricGalleryDisplayNames auto hidden
Formlist[] property _DaedricGalleryDisplayRefs auto hidden
String[] property _DaedricGalleryDisplaySection auto hidden

Formlist[] property _DragonbornHallDisplayNames auto hidden
Formlist[] property _DragonbornHallDisplayRefs auto hidden
String[] property _DragonbornHallDisplaySection auto hidden

Formlist[] property _GuildhouseDisplayNames auto hidden
Formlist[] property _GuildhouseDisplayRefs auto hidden
String[] property _GuildhouseDisplaySection auto hidden

Formlist[] property _HallofHeroesDisplayNames auto hidden
Formlist[] property _HallofHeroesDisplayRefs auto hidden 
String[] property _HallofHeroesDisplaySection auto hidden 

Formlist[] property _HallofLostEmpiresDisplayNames auto hidden 
Formlist[] property _HallofLostEmpiresDisplayRefs auto hidden 
String[] property _HallofLostEmpiresDisplaySection auto hidden 

Formlist[] property _LibraryDisplayNames auto hidden 
Formlist[] property _LibraryDisplayRefs auto hidden 
String[] property _LibraryDisplaySection auto hidden 

Formlist[] property _NaturalScienceDisplayNames auto hidden 
Formlist[] property _NaturalScienceDisplayRefs auto hidden
String[] property _NaturalScienceDisplaySection auto hidden 

Formlist[] property _StoreroomDisplayNames auto hidden 
Formlist[] property _StoreroomDisplayRefs auto hidden 
String[] property _StoreroomDisplaySection auto hidden 

Formlist[] property _HallofSecretsDisplayNames auto hidden 
Formlist[] property _HallofSecretsDisplayRefs auto hidden 
String[] property _HallofSecretsDisplaySection auto hidden 

Formlist[] property _HallofOdditiesDisplayNames auto hidden 
Formlist[] property _HallofOdditiesDisplayRefs auto hidden 
String[] property _HallofOdditiesDisplaySection auto hidden 

Formlist[] property _MiscDisplayNames auto hidden 
Formlist[] property _MiscDisplayRefs auto hidden 
String[] property _MiscDisplaySection auto hidden 

Formlist[] property _SafehouseDisplayNames auto hidden
Formlist[] property _SafehouseDisplayRefs auto hidden
String[] property _SafehouseDisplaySection auto hidden

Formlist[] property _HallofWondersDisplayNames auto hidden
Formlist[] property _HallofWondersDisplayRefs auto hidden
String[] property _HallofWondersDisplaySection auto hidden

globalvariable property RN_SupportedModCount auto
globalvariable property RN_CustomModCount auto
bool property UnregisteredPatch auto hidden

ObjectReference[] Property TokenRefList auto
ObjectReference[] Property TokenRefList_NoShipment auto
GlobalVariable Property TokenRefList_NoShipmentSize auto

Formlist Property TCC_TrackingNameFiller auto
Formlist Property TCC_TrackingDispFiller auto

;;-- Functions ---------------------------------------

Event OnInit()

	SupportedModNames = new String[128]
	SupportedModHandlers = new Form[128]
	ResetArrays()
endEvent

;;-- Functions ---------------------------------------

Bool Function RegisterSupportedMod(String sName, RN_SupportedMod_Script sHandler, TCC_CustomPatchScript cHandler)
	
	while !SupportedModNames || !SupportedModHandlers
		TCCDebug.Log("Patch API - Waiting for supported mod arrays to initialise.")
		Utility.Wait(2)
	endwhile
	
	int iNamesIndex = SupportedModNames.Find(sName)
	if iNamesIndex == -1
	
		iNamesIndex = SupportedModNames.Find("")
		int iHandlerIndex = SupportedModHandlers.Find(None)
		
		if (iHandlerIndex == iNamesIndex) && (iNamesIndex != -1)
			if sHandler
				SupportedModHandlers[iNamesIndex] = sHandler
			endif
			
			if cHandler
				SupportedModHandlers[iNamesIndex] = cHandler
			endif			
			
			SupportedModNames[iNamesIndex] = sName	
			TCCDebug.Log("Patch API Registered - " + sName)	
			Return True
		else
			TCCDebug.Log("Patch API - Failed to add " + sName + " support. Array sizes are: \n SupportedModHandlers = " + iHandlerIndex + "\n SupportedModNames = "+ iNamesIndex)
			Return False
		endif
	endif
EndFunction

;;-- Functions ---------------------------------------

Bool Function RegisterDisplayList(String RoomName, String sName, Formlist DisplayList = None, Formlist ItemList = None)
	
	while !_SafehouseDisplayNames || !_SafehouseDisplayRefs || !_HallofWondersDisplayNames || !_HallofWondersDisplayRefs
		TCCDebug.Log("Patch API - Waiting for display arrays to initialise.")
		Utility.Wait(2)
	endwhile
	
	if (DisplayList && DisplayList.GetSize() > 0) && (ItemList && ItemList.GetSize() > 0)
		
		Formlist[] NameList = GetNameArray(RoomName)
		Formlist[] DispList = GetRefArray(RoomName)
		String[] SectionList = GetSectionArray(RoomName)
		
		Int Index = NameList.Find(ItemList)
		if Index == -1
		
			Index = NameList.Find(None)
			Int Ref = DispList.Find(None)
			
			if (Ref == Index) && (Index != -1)
				SectionList[Index] = sName
				DispList[Index] = DisplayList
				NameList[Index] = ItemList	
				TCCDebug.Log("Patch API Registered " + DisplayList.GetSize() + " " + RoomName + " Display(s) from - " + sName)
				Return True
			else
				TCCDebug.Log("Patch API - Failed to add " + sName + " " + RoomName + " display support. Array sizes are: \n References = " + Ref + "\n Names = "+ Index)
				Return False
			endif
		endif
	endif
EndFunction

;;-- Functions ---------------------------------------

function UpdateCounts()

	Int Index = SupportedModHandlers.length
	while Index
		Index -= 1
		if SupportedModHandlers[Index] != none
			RN_SupportedMod_Script smCurrent = SupportedModHandlers[Index] as RN_SupportedMod_Script
			TCC_CustomPatchScript cmCurrent = SupportedModHandlers[Index] as TCC_CustomPatchScript
			if (smCurrent)
				smCurrent.UpdateCounts()
			endif
			
			if (cmCurrent)
				cmCurrent.UpdateCounts()
			endif				
		endif
	endwhile
endfunction

;;-- Functions ---------------------------------------

function UpdateArrays()

	RN_SupportedModCount.SetValue(0)
	RN_CustomModCount.SetValue(0)
		
	Int Index = SupportedModHandlers.length
	while Index
		Index -= 1
		if SupportedModHandlers[Index] != none
			RN_SupportedMod_Script smCurrent = SupportedModHandlers[Index] as RN_SupportedMod_Script
			TCC_CustomPatchScript cmCurrent = SupportedModHandlers[Index] as TCC_CustomPatchScript
			if (smCurrent)
				smCurrent.UpdateArrays()
			endif
			
			if (cmCurrent)
				cmCurrent.UpdateArrays()
			endif				
		endif
	endwhile
endfunction	

;;-- Functions ---------------------------------------

function UpdateTracking()
	
	ResetArrays()
	
	Int Index = SupportedModHandlers.length
	while Index
		Index -= 1
		if SupportedModHandlers[Index] != none
			RN_SupportedMod_Script smCurrent = SupportedModHandlers[Index] as RN_SupportedMod_Script
			TCC_CustomPatchScript cmCurrent = SupportedModHandlers[Index] as TCC_CustomPatchScript
			if (smCurrent)
				smCurrent.ResetTracking()
			endif
			
			if (cmCurrent)
				cmCurrent.ResetTracking()
			endif				
		endif
	endwhile
endfunction	

;;-- Functions ---------------------------------------

function CheckPatches()

	bool WaitForSetup
	string PatchName
	
	Int Index = SupportedModHandlers.length
	while Index
		Index -= 1
		if SupportedModHandlers[Index] != none
		
			RN_SupportedMod_Script smCurrent = SupportedModHandlers[Index] as RN_SupportedMod_Script
			TCC_CustomPatchScript cmCurrent = SupportedModHandlers[Index] as TCC_CustomPatchScript
		
			if (smCurrent)
				PatchName = smCurrent._ModName
				if (!smCurrent._setupDone)
					TCCDebug.Log("Patch API - Waiting for " + PatchName + " To Finish setting up")
					While (!smCurrent._setupDone)
						if (smCurrent._setupDone)
							TCCDebug.Log("Patch API - Finished setting up support for " + PatchName)
						endif
					endwhile
				else
				
					smCurrent.RegisterForSingleUpdate(0)
					TCCDebug.Log("Patch API - Finished setting up support for " + PatchName)
				endif
			endif

			if (cmCurrent)
				PatchName = cmCurrent.DBM.sSupportedModName
				if (!cmCurrent._setupDone)
					TCCDebug.Log("Patch API - Waiting for " + PatchName + " To Finish setting up")
					While (!cmCurrent._setupDone)
						if (cmCurrent._setupDone)
							TCCDebug.Log("Patch API - Finished setting up support for " + PatchName)
						endif
					endwhile
				else
				
					cmCurrent.RegisterForSingleUpdate(0)
					TCCDebug.Log("Patch API - Finished setting up support for " + PatchName)
				endif
			endif					
		endif
	endwhile
	TCCDebug.Log("Patch API - Finished registering " +  SupportedModHandlers.Find(none) + " Patches")
endFunction	

;;-- Functions ---------------------------------------

Bool function AddToTokenRefList(ObjectReference RefToAdd, Bool CustomContainer)
	
	Int Index = TokenRefList.Find(RefToAdd)
	if Index == -1
		Index = TokenRefList.Find(None)
		
		TokenRefList[Index] = RefToAdd
		if CustomContainer
			TokenRefList_NoShipment[Index] = RefToAdd
			TokenRefList_NoShipmentSize.Mod(1)
			TCCDebug.Log("Patch API - Added [" + RefToAdd.GetBaseObject().GetName() + "] " + RefToAdd + " to TokenRefList_NoShipment")
		endif
		TCCDebug.Log("Patch API - Added [" + RefToAdd.GetBaseObject().GetName() + "] " + RefToAdd + " to TokenRefList")
		Return True
	else
		TCCDebug.Log("Patch API - Unable to add [" + RefToAdd.GetBaseObject().GetName() + "] " + RefToAdd + " to TokenRefList as the array already holds this reference")
		Return False
	endif				
endfunction

;;-- Functions ---------------------------------------

Bool function RemoveFromTokenRefList(ObjectReference RefToRemove, Bool CustomContainer)
	
	Int Index = TokenRefList.Find(RefToRemove)
	if Index == -1
		TCCDebug.Log("Patch API - Unable to remove [" + RefToRemove.GetBaseObject().GetName() + "] " + RefToRemove + " from TokenRefList as the array does not hold this reference")
		Return False
	
	else
	
		TokenRefList[Index] = None
		if CustomContainer
			TokenRefList_NoShipment[Index] = None
			TokenRefList_NoShipmentSize.Mod(-1)
			TCCDebug.Log("Patch API - Removed [" + RefToRemove.GetBaseObject().GetName() + "] " + RefToRemove + " from TokenRefList_NoShipment")
		endif
		TCCDebug.Log("Patch API - Removed [" + RefToRemove.GetBaseObject().GetName() + "] " + RefToRemove + " from TokenRefList")	
		Return True
	endif				
endfunction

;;-- Functions ---------------------------------------

function EmptyContainerToPlayer(ObjectReference ContainerRef)

	Int Index = ContainerRef.GetNumItems() 
	While Index
		Index -= 1
		Form akBaseItem = ContainerRef.GetNthForm(Index)		
		if (dbmMaster.HasForm(akBaseItem))
			ContainerRef.RemoveItem(akBaseItem, ContainerRef.GetitemCount(akBaseItem), false, PlayerRef)
		endIf
	endWhile
endFunction	

;;-- Functions ---------------------------------------

Formlist[] function GetNameArray(String RoomName)
	
	if (RoomName == "Armory")
		return _ArmoryDisplayNames
	
	elseif (RoomName == "Daedric Gallery")
		return _DaedricGalleryDisplayNames
		
	elseif (RoomName == "Dragonborn Hall")
		return _DragonbornHallDisplayNames

	elseif (RoomName == "Guildhouse")
		return _GuildhouseDisplayNames

	elseif (RoomName == "Hall of Heroes")
		return _HallofHeroesDisplayNames

	elseif (RoomName == "Hall of Lost Empires")
		return _HallofLostEmpiresDisplayNames

	elseif (RoomName == "Hall of Oddities")
		return _HallofOdditiesDisplayNames

	elseif (RoomName == "Hall of Secrets")
		return _HallofSecretsDisplayNames

	elseif (RoomName == "Hall of Wonders")
		return _HallofWondersDisplayNames

	elseif (RoomName == "Gallery Library")
		return _LibraryDisplayNames

	elseif (RoomName == "Natural Science")
		return _NaturalScienceDisplayNames

	elseif (RoomName == "Safehouse")
		return _SafehouseDisplayNames

	elseif (RoomName == "Museum Storeroom")
		return _StoreroomDisplayNames
	endif
	
	Return None
endFunction

;;-- Functions ---------------------------------------

Formlist[] function GetRefArray(String RoomName)

	if (RoomName == "Armory")
		return _ArmoryDisplayRefs
	
	elseif (RoomName == "Daedric Gallery")
		return _DaedricGalleryDisplayRefs
		
	elseif (RoomName == "Dragonborn Hall")
		return _DragonbornHallDisplayRefs

	elseif (RoomName == "Guildhouse")
		return _GuildhouseDisplayRefs

	elseif (RoomName == "Hall of Heroes")
		return _HallofHeroesDisplayRefs

	elseif (RoomName == "Hall of Lost Empires")
		return _HallofLostEmpiresDisplayRefs

	elseif (RoomName == "Hall of Oddities")
		return _HallofOdditiesDisplayRefs

	elseif (RoomName == "Hall of Secrets")
		return _HallofSecretsDisplayRefs

	elseif (RoomName == "Hall of Wonders")
		return _HallofWondersDisplayRefs

	elseif (RoomName == "Gallery Library")
		return _LibraryDisplayRefs

	elseif (RoomName == "Natural Science")
		return _NaturalScienceDisplayRefs

	elseif (RoomName == "Safehouse")
		return _SafehouseDisplayRefs

	elseif (RoomName == "Museum Storeroom")
		return _StoreroomDisplayRefs
	endif
	
	Return None
endFunction

;;-- Functions ---------------------------------------

String[] function GetSectionArray(String RoomName)

	if (RoomName == "Armory")
		return _ArmoryDisplaySection
	
	elseif (RoomName == "Daedric Gallery")
		return _DaedricGalleryDisplaySection
		
	elseif (RoomName == "Dragonborn Hall")
		return _DragonbornHallDisplaySection

	elseif (RoomName == "Guildhouse")
		return _GuildhouseDisplaySection

	elseif (RoomName == "Hall of Heroes")
		return _HallofHeroesDisplaySection

	elseif (RoomName == "Hall of Lost Empires")
		return _HallofLostEmpiresDisplaySection

	elseif (RoomName == "Hall of Oddities")
		return _HallofOdditiesDisplaySection

	elseif (RoomName == "Hall of Secrets")
		return _HallofSecretsDisplaySection

	elseif (RoomName == "Hall of Wonders")
		return _HallofWondersDisplaySection

	elseif (RoomName == "Gallery Library")
		return _LibraryDisplaySection

	elseif (RoomName == "Natural Science")
		return _NaturalScienceDisplaySection

	elseif (RoomName == "Safehouse")
		return _SafehouseDisplaySection

	elseif (RoomName == "Museum Storeroom")
		return _StoreroomDisplaySection
	endif
	
	Return None
endFunction

;;-- Functions ---------------------------------------

function ResetArrays()
	
	_ArmoryDisplayNames = new Formlist[128]
	_ArmoryDisplayNames[0] = TCC_TrackingNameFiller.GetAt(0) as Formlist
	_ArmoryDisplayNames[1] = TCC_TrackingNameFiller.GetAt(1) as Formlist
	_ArmoryDisplayNames[2] = TCC_TrackingNameFiller.GetAt(2) as Formlist
	_ArmoryDisplayNames[3] = TCC_TrackingNameFiller.GetAt(3) as Formlist
	_ArmoryDisplayNames[4] = TCC_TrackingNameFiller.GetAt(4) as Formlist
	_ArmoryDisplayNames[5] = TCC_TrackingNameFiller.GetAt(5) as Formlist
	_ArmoryDisplayNames[6] = TCC_TrackingNameFiller.GetAt(6) as Formlist
	_ArmoryDisplayNames[7] = TCC_TrackingNameFiller.GetAt(7) as Formlist
	_ArmoryDisplayNames[8] = TCC_TrackingNameFiller.GetAt(8) as Formlist
	_ArmoryDisplayNames[9] = TCC_TrackingNameFiller.GetAt(9) as Formlist
	_ArmoryDisplayNames[10] = TCC_TrackingNameFiller.GetAt(10) as Formlist
	_ArmoryDisplayNames[11] = TCC_TrackingNameFiller.GetAt(11) as Formlist
	_ArmoryDisplayNames[12] = TCC_TrackingNameFiller.GetAt(12) as Formlist
	_ArmoryDisplayNames[13] = TCC_TrackingNameFiller.GetAt(13) as Formlist
	_ArmoryDisplayNames[14] = TCC_TrackingNameFiller.GetAt(14) as Formlist
	_ArmoryDisplayNames[15] = TCC_TrackingNameFiller.GetAt(15) as Formlist
	_ArmoryDisplayNames[16] = TCC_TrackingNameFiller.GetAt(16) as Formlist
	_ArmoryDisplayNames[17] = TCC_TrackingNameFiller.GetAt(17) as Formlist
	_ArmoryDisplayNames[18] = TCC_TrackingNameFiller.GetAt(18) as Formlist
	_ArmoryDisplayNames[19] = TCC_TrackingNameFiller.GetAt(19) as Formlist
	
	_ArmoryDisplayRefs = new Formlist[128]
	_ArmoryDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(0) as Formlist
	_ArmoryDisplayRefs[1] = TCC_TrackingDispFiller.GetAt(1) as Formlist
	_ArmoryDisplayRefs[2] = TCC_TrackingDispFiller.GetAt(2) as Formlist
	_ArmoryDisplayRefs[3] = TCC_TrackingDispFiller.GetAt(3) as Formlist
	_ArmoryDisplayRefs[4] = TCC_TrackingDispFiller.GetAt(4) as Formlist
	_ArmoryDisplayRefs[5] = TCC_TrackingDispFiller.GetAt(5) as Formlist
	_ArmoryDisplayRefs[6] = TCC_TrackingDispFiller.GetAt(6) as Formlist
	_ArmoryDisplayRefs[7] = TCC_TrackingDispFiller.GetAt(7) as Formlist
	_ArmoryDisplayRefs[8] = TCC_TrackingDispFiller.GetAt(8) as Formlist
	_ArmoryDisplayRefs[9] = TCC_TrackingDispFiller.GetAt(9) as Formlist
	_ArmoryDisplayRefs[10] = TCC_TrackingDispFiller.GetAt(10) as Formlist
	_ArmoryDisplayRefs[11] = TCC_TrackingDispFiller.GetAt(11) as Formlist
	_ArmoryDisplayRefs[12] = TCC_TrackingDispFiller.GetAt(12) as Formlist
	_ArmoryDisplayRefs[13] = TCC_TrackingDispFiller.GetAt(13) as Formlist
	_ArmoryDisplayRefs[14] = TCC_TrackingDispFiller.GetAt(14) as Formlist
	_ArmoryDisplayRefs[15] = TCC_TrackingDispFiller.GetAt(15) as Formlist
	_ArmoryDisplayRefs[16] = TCC_TrackingDispFiller.GetAt(16) as Formlist
	_ArmoryDisplayRefs[17] = TCC_TrackingDispFiller.GetAt(17) as Formlist
	_ArmoryDisplayRefs[18] = TCC_TrackingDispFiller.GetAt(18) as Formlist
	_ArmoryDisplayRefs[19] = TCC_TrackingDispFiller.GetAt(19) as Formlist
	
	_ArmoryDisplaySection = new String[128]
	_ArmoryDisplaySection[0] = "Ancient Nord Set"
	_ArmoryDisplaySection[1] = "Blades Set"
	_ArmoryDisplaySection[2] = "Daedric Set"
	_ArmoryDisplaySection[3] = "Dawnguard Set"
	_ArmoryDisplaySection[4] = "Dragon Set"
	_ArmoryDisplaySection[5] = "Dwarven Set"
	_ArmoryDisplaySection[6] = "Ebony Set"
	_ArmoryDisplaySection[7] = "Elven Set"
	_ArmoryDisplaySection[8] = "Falmer Set"
	_ArmoryDisplaySection[9] = "Forsworn Set"
	_ArmoryDisplaySection[10] = "Glass Set"
	_ArmoryDisplaySection[11] = "Guard Armor Set"
	_ArmoryDisplaySection[12] = "Iron Set"
	_ArmoryDisplaySection[13] = "Misc Set"
	_ArmoryDisplaySection[14] = "Nordic Set"
	_ArmoryDisplaySection[15] = "Orcish Set"
	_ArmoryDisplaySection[16] = "Snow Elf Set"
	_ArmoryDisplaySection[17] = "Stalhrim Set"
	_ArmoryDisplaySection[18] = "Steel Set"
	_ArmoryDisplaySection[19] = "Thane Weapons Set"

;;-----------
	
	_DaedricGalleryDisplayNames = new Formlist[128]
	_DaedricGalleryDisplayNames[0] = TCC_TrackingNameFiller.GetAt(20) as Formlist
	
	_DaedricGalleryDisplayRefs = new Formlist[128]
	_DaedricGalleryDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(20) as Formlist
	
	_DaedricGalleryDisplaySection = new String[128]
	_DaedricGalleryDisplaySection[0] = "Daedric Displays"

;;-----------
	
	_DragonbornHallDisplayNames = new Formlist[128]
	_DragonbornHallDisplayNames[0] = TCC_TrackingNameFiller.GetAt(21) as Formlist
	
	_DragonbornHallDisplayRefs = new Formlist[128]
	_DragonbornHallDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(21) as Formlist
	
	_DragonbornHallDisplaySection = new String[128]
	_DragonbornHallDisplaySection[0] = "Quest & Achievement Displays"

;;-----------
	
	_GuildhouseDisplayNames = new Formlist[128]
	_GuildhouseDisplayNames[0] = TCC_TrackingNameFiller.GetAt(22) as Formlist
	
	_GuildhouseDisplayRefs = new Formlist[128]
	_GuildhouseDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(22) as Formlist
	
	_GuildhouseDisplaySection = new String[128]
	_GuildhouseDisplaySection[0] = "Explorer Displays"

;;-----------

	_HallofHeroesDisplayNames = new Formlist[128]
	_HallofHeroesDisplayNames[0] = TCC_TrackingNameFiller.GetAt(23) as Formlist
	_HallofHeroesDisplayNames[1] = TCC_TrackingNameFiller.GetAt(24) as Formlist
	_HallofHeroesDisplayNames[2] = TCC_TrackingNameFiller.GetAt(25) as Formlist
	_HallofHeroesDisplayNames[3] = TCC_TrackingNameFiller.GetAt(26) as Formlist
	_HallofHeroesDisplayNames[4] = TCC_TrackingNameFiller.GetAt(27) as Formlist
	_HallofHeroesDisplayNames[5] = TCC_TrackingNameFiller.GetAt(28) as Formlist
	_HallofHeroesDisplayNames[6] = TCC_TrackingNameFiller.GetAt(29) as Formlist
	
	_HallofHeroesDisplayRefs = new Formlist[128]
	_HallofHeroesDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(23) as Formlist
	_HallofHeroesDisplayRefs[1] = TCC_TrackingDispFiller.GetAt(24) as Formlist
	_HallofHeroesDisplayRefs[2] = TCC_TrackingDispFiller.GetAt(25) as Formlist
	_HallofHeroesDisplayRefs[3] = TCC_TrackingDispFiller.GetAt(26) as Formlist
	_HallofHeroesDisplayRefs[4] = TCC_TrackingDispFiller.GetAt(27) as Formlist
	_HallofHeroesDisplayRefs[5] = TCC_TrackingDispFiller.GetAt(28) as Formlist
	_HallofHeroesDisplayRefs[6] = TCC_TrackingDispFiller.GetAt(29) as Formlist
	
	_HallofHeroesDisplaySection = new String[128]
	_HallofHeroesDisplaySection[0] = "Culture & Art Displays"
	_HallofHeroesDisplaySection[1] = "Ground Floor - Left"
	_HallofHeroesDisplaySection[2] = "Ground Floor - Right"
	_HallofHeroesDisplaySection[3] = "Jewellery Cabinet"
	_HallofHeroesDisplaySection[4] = "Masks & Claws"
	_HallofHeroesDisplaySection[5] = "Reception Hall"
	_HallofHeroesDisplaySection[6] = "Upper Ring"

;;-----------

	_HallofLostEmpiresDisplayNames = new Formlist[128]
	_HallofLostEmpiresDisplayNames[0] = TCC_TrackingNameFiller.GetAt(30) as Formlist
	_HallofLostEmpiresDisplayNames[1] = TCC_TrackingNameFiller.GetAt(31) as Formlist
	
	_HallofLostEmpiresDisplayRefs = new Formlist[128]
	_HallofLostEmpiresDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(30) as Formlist
	_HallofLostEmpiresDisplayRefs[1] = TCC_TrackingDispFiller.GetAt(31) as Formlist
	
	_HallofLostEmpiresDisplaySection = new String[128]
	_HallofLostEmpiresDisplaySection[0] = "Main Floor"
	_HallofLostEmpiresDisplaySection[1] = "Upper Ring"

;;-----------

	_HallofOdditiesDisplayNames = new Formlist[128]
	_HallofOdditiesDisplayNames[0] = TCC_TrackingNameFiller.GetAt(32) as Formlist
	
	_HallofOdditiesDisplayRefs = new Formlist[128]
	_HallofOdditiesDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(32) as Formlist
	
	_HallofOdditiesDisplaySection = new String[128]
	_HallofOdditiesDisplaySection[0] = "Main Floor"

;;-----------
	
	_HallofSecretsDisplayNames = new Formlist[128]
	_HallofSecretsDisplayNames[0] = TCC_TrackingNameFiller.GetAt(33) as Formlist
	
	_HallofSecretsDisplayRefs = new Formlist[128]
	_HallofSecretsDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(33) as Formlist
	
	_HallofSecretsDisplaySection = new String[128]
	_HallofSecretsDisplaySection[0] = "Secret Displays"

;;-----------

	_HallofWondersDisplayNames = new Formlist[128]
	_HallofWondersDisplayRefs = new Formlist[128]
	_HallofWondersDisplaySection = new String[128]

;;-----------
	
	_LibraryDisplayNames = new Formlist[128]
	_LibraryDisplayNames[0] = TCC_TrackingNameFiller.GetAt(34) as Formlist
	_LibraryDisplayNames[1] = TCC_TrackingNameFiller.GetAt(35) as Formlist
	_LibraryDisplayNames[2] = TCC_TrackingNameFiller.GetAt(36) as Formlist
	_LibraryDisplayNames[3] = TCC_TrackingNameFiller.GetAt(37) as Formlist
	_LibraryDisplayNames[4] = TCC_TrackingNameFiller.GetAt(38) as Formlist
	
	_LibraryDisplayRefs = new Formlist[128]
	_LibraryDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(34) as Formlist
	_LibraryDisplayRefs[1] = TCC_TrackingDispFiller.GetAt(35) as Formlist
	_LibraryDisplayRefs[2] = TCC_TrackingDispFiller.GetAt(36) as Formlist
	_LibraryDisplayRefs[3] = TCC_TrackingDispFiller.GetAt(37) as Formlist
	_LibraryDisplayRefs[4] = TCC_TrackingDispFiller.GetAt(38) as Formlist
	
	_LibraryDisplaySection = new String[128]
	_LibraryDisplaySection[0] = "Lower Floor - Left"
	_LibraryDisplaySection[1] = "Lower Floor - Right"
	_LibraryDisplaySection[2] = "Maps"
	_LibraryDisplaySection[3] = "Rare Books"
	_LibraryDisplaySection[4] = "Mezzanine"
	
;;-----------
	
	_NaturalScienceDisplayNames = new Formlist[128]
	_NaturalScienceDisplayNames[0] = TCC_TrackingNameFiller.GetAt(39) as Formlist
	_NaturalScienceDisplayNames[1] = TCC_TrackingNameFiller.GetAt(40) as Formlist
	_NaturalScienceDisplayNames[2] = TCC_TrackingNameFiller.GetAt(41) as Formlist
	
	_NaturalScienceDisplayRefs = new Formlist[128]
	_NaturalScienceDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(39) as Formlist
	_NaturalScienceDisplayRefs[1] = TCC_TrackingDispFiller.GetAt(40) as Formlist
	_NaturalScienceDisplayRefs[2] = TCC_TrackingDispFiller.GetAt(41) as Formlist
	
	_NaturalScienceDisplaySection = new String[128]
	_NaturalScienceDisplaySection[0] = "Animal Displays"
	_NaturalScienceDisplaySection[1] = "Gemstone Displays"
	_NaturalScienceDisplaySection[2] = "Tide Pool Displays"

;;-----------

	_SafehouseDisplayNames = new Formlist[128]
	_SafehouseDisplayRefs = new Formlist[128]
	_SafehouseDisplaySection = new String[128]

;;-----------
	
	_StoreroomDisplayNames = new Formlist[128]
	_StoreroomDisplayNames[0] = TCC_TrackingNameFiller.GetAt(42) as Formlist
	
	_StoreroomDisplayRefs = new Formlist[128]
	_StoreroomDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(42) as Formlist
	
	_StoreroomDisplaySection = new String[128]
	_StoreroomDisplaySection[0] = "Reserve Vintages"

;;-----------

	_MiscDisplayNames = new Formlist[128]
	_MiscDisplayNames[0] = TCC_TrackingNameFiller.GetAt(43) as Formlist
	_MiscDisplayNames[1] = TCC_TrackingNameFiller.GetAt(44) as Formlist
	_MiscDisplayNames[2] = TCC_TrackingNameFiller.GetAt(45) as Formlist
	_MiscDisplayNames[3] = TCC_TrackingNameFiller.GetAt(46) as Formlist
	_MiscDisplayNames[4] = TCC_TrackingNameFiller.GetAt(47) as Formlist
	_MiscDisplayNames[5] = TCC_TrackingNameFiller.GetAt(48) as Formlist
	
	_MiscDisplayRefs = new Formlist[128]
	_MiscDisplayRefs[0] = TCC_TrackingDispFiller.GetAt(43) as Formlist
	_MiscDisplayRefs[1] = TCC_TrackingDispFiller.GetAt(44) as Formlist
	_MiscDisplayRefs[2] = TCC_TrackingDispFiller.GetAt(45) as Formlist
	_MiscDisplayRefs[3] = TCC_TrackingDispFiller.GetAt(46) as Formlist
	_MiscDisplayRefs[4] = TCC_TrackingDispFiller.GetAt(47) as Formlist
	_MiscDisplayRefs[5] = TCC_TrackingDispFiller.GetAt(48) as Formlist
	
	_MiscDisplaySection = new String[128]
	_MiscDisplaySection[0] = "Safehouse"
	_MiscDisplaySection[1] = "Guildhouse"
	_MiscDisplaySection[2] = "Hall of Lost Empires"
	_MiscDisplaySection[3] = "Hall of Secrets"
	_MiscDisplaySection[4] = "Hall of Heroes"
	_MiscDisplaySection[5] = "East Exhibit Halls"
	
	TCCDebug.Log("Patch API - Arrays initialised.")
EndFunction	
		