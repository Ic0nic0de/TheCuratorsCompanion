scriptname RN_PatchAPI extends quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_Script property Util auto
RN_Utility_PropManager property Prop auto

string[] property SupportedModNames auto hidden
form[] property SupportedModHandlers auto hidden

Formlist[] property ArmoryDisplayNames auto 
Formlist[] property ArmoryDisplayRefs auto 
String[] property ArmoryDisplaySection auto 

Formlist[] property DaedricGalleryDisplayNames auto 
Formlist[] property DaedricGalleryDisplayRefs auto 
String[] property DaedricGalleryDisplaySection auto 

Formlist[] property DragonbornHallDisplayNames auto 
Formlist[] property DragonbornHallDisplayRefs auto 
String[] property DragonbornHallDisplaySection auto 

Formlist[] property GuildhouseDisplayNames auto 
Formlist[] property GuildhouseDisplayRefs auto 
String[] property GuildhouseDisplaySection auto 

Formlist[] property HallofHeroesDisplayNames auto 
Formlist[] property HallofHeroesDisplayRefs auto 
String[] property HallofHeroesDisplaySection auto 

Formlist[] property HallofLostEmpiresDisplayNames auto 
Formlist[] property HallofLostEmpiresDisplayRefs auto 
String[] property HallofLostEmpiresDisplaySection auto 

Formlist[] property LibraryDisplayNames auto 
Formlist[] property LibraryDisplayRefs auto 
String[] property LibraryDisplaySection auto 

Formlist[] property NaturalScienceDisplayNames auto 
Formlist[] property NaturalScienceDisplayRefs auto 
String[] property NaturalScienceDisplaySection auto 

Formlist[] property StoreroomDisplayNames auto 
Formlist[] property StoreroomDisplayRefs auto 
String[] property StoreroomDisplaySection auto 

Formlist[] property HallofSecretsDisplayNames auto 
Formlist[] property HallofSecretsDisplayRefs auto 
String[] property HallofSecretsDisplaySection auto 

Formlist[] property HallofOdditiesDisplayNames auto 
Formlist[] property HallofOdditiesDisplayRefs auto 
String[] property HallofOdditiesDisplaySection auto 

Formlist[] property ThaneBannerDisplayNames auto 
Formlist[] property ThaneBannerDisplayRefs auto 
String[] property ThaneBannerDisplaySection auto 

Formlist[] property SkillDisplayNames auto 
Formlist[] property SkillDisplayRefs auto 
String[] property SkillDisplaySection auto 

Formlist[] property MiscDisplayNames auto 
Formlist[] property MiscDisplayRefs auto 
String[] property MiscDisplaySection auto 

Formlist[] property QuestDisplayNames auto hidden
Formlist[] property QuestDisplayRefs auto hidden
String[] property QuestDisplaySection auto hidden

Formlist property DBM_RN_Quest_Items_Tracking auto 
Formlist property DBM_RN_Quest_Displays_Tracking auto 

Formlist[] property ExplorationDisplayNames auto hidden
Formlist[] property ExplorationDisplayRefs auto hidden
String[] property ExplorationDisplaySection auto hidden

Formlist property DBM_RN_Exploration_Items_Tracking auto 
Formlist property DBM_RN_Exploration_Displays_Tracking auto 

Formlist[] property SafehouseDisplayNames auto hidden
Formlist[] property SafehouseDisplayRefs auto hidden
String[] property SafehouseDisplaySection auto hidden

Formlist[] property HallofWondersDisplayNames auto hidden
Formlist[] property HallofWondersDisplayRefs auto hidden
String[] property HallofWondersDisplaySection auto hidden

globalvariable property RN_SupportedModCount auto
globalvariable property RN_CustomModCount auto
bool property UnregisteredPatch auto hidden

ObjectReference[] Property TokenRefList auto
ObjectReference[] Property TokenRefList_NoShipment auto
GlobalVariable Property TokenRefList_NoShipmentSize auto

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
	
	while !SafehouseDisplayNames || !SafehouseDisplayRefs || !HallofWondersDisplayNames || !HallofWondersDisplayRefs
		TCCDebug.Log("Patch API - Waiting for display arrays to initialise.")
		Utility.Wait(2)
	endwhile
	
	if (DisplayList && DisplayList.GetSize() > 0) && (ItemList && ItemList.GetSize() > 0)
		
		if RoomName == "Safehouse"
			Int Index = SafehouseDisplayNames.Find(ItemList)
			if Index == -1
			
				Index = SafehouseDisplayNames.Find(None)
				Int Ref = SafehouseDisplayRefs.Find(None)
				
				if (Ref == Index) && (Index != -1)
					SafehouseDisplaySection[Index] = sName
					SafehouseDisplayRefs[Index] = DisplayList
					SafehouseDisplayNames[Index] = ItemList	
					TCCDebug.Log("Patch API Registered " + DisplayList.GetSize() + " Safehouse Display(s) from - " + sName)
					Return True
				else
					TCCDebug.Log("Patch API - Failed to add " + sName + " Safehouse display support. Array sizes are: \n SafehouseDisplayRefs = " + Ref + "\n SafehouseDisplayNames = "+ Index)
					Return False
				endif
			endif
		
		elseif RoomName == "Hall of Wonders"
			Int Index = HallofWondersDisplayNames.Find(ItemList)
			if Index == -1
			
				Index = HallofWondersDisplayNames.Find(None)
				Int Ref = HallofWondersDisplayRefs.Find(None)
				
				if (Ref == Index) && (Index != -1)
					HallofWondersDisplaySection[Index] = sName
					HallofWondersDisplayRefs[Index] = DisplayList
					HallofWondersDisplayNames[Index] = ItemList	
					TCCDebug.Log("Patch API Registered " + DisplayList.GetSize() + " Hall of Wonders Display(s) from - " + sName)
					Return True
				else
					TCCDebug.Log("Patch API - Failed to add " + sName + " Hall of Wonders display support. Array sizes are: \n HallofWondersDisplayRefs = " + Ref + "\n HallofWondersDisplayNames = "+ Index)
					Return False
				endif
			endif		
		endif
	endif
EndFunction

;;-- Functions ---------------------------------------

Bool Function RegisterQuestDisplayList(String sName, Formlist DisplayList = None, Formlist ItemList = None)
	
	while !QuestDisplayNames || !QuestDisplayRefs
		TCCDebug.Log("Patch API - Waiting for quest display arrays to initialise.")
		Utility.Wait(2)
	endwhile
	
	if (DisplayList && DisplayList.GetSize() > 0) && (ItemList && ItemList.GetSize() > 0)
	
		Int Index = QuestDisplayNames.Find(ItemList)
		if Index == -1
		
			Index = QuestDisplayNames.Find(None)
			Int Ref = QuestDisplayRefs.Find(None)
			
			if (Ref == Index) && (Index != -1)
				QuestDisplaySection[Index] = sName
				QuestDisplayRefs[Index] = DisplayList
				QuestDisplayNames[Index] = ItemList	
				TCCDebug.Log("Patch API Registered " + DisplayList.GetSize() + " Quest Display(s) from - " + sName)	
				Return True
			else
				TCCDebug.Log("Patch API - Failed to add " + sName + " quest display support. Array sizes are: \n QuestDisplayRefs = " + Ref + "\n QuestDisplayNames = "+ Index)
				Return False
			endif				
		endif
	endif
EndFunction

;;-- Functions ---------------------------------------

Bool Function RegisterExplorationDisplayList(String sName, Formlist DisplayList = None, Formlist ItemList = None)
	
	while !ExplorationDisplayNames || !ExplorationDisplayRefs
		TCCDebug.Log("Patch API - Waiting for exploration display arrays to initialise.")
		Utility.Wait(2)
	endwhile
	
	if (DisplayList && DisplayList.GetSize() > 0) && (ItemList && ItemList.GetSize() > 0)
		Int Index = ExplorationDisplayNames.Find(ItemList)
		if Index == -1
		
			Index = ExplorationDisplayNames.Find(None)
			Int Ref = ExplorationDisplayRefs.Find(None)
			
			if (Ref == Index) && (Index != -1)
				ExplorationDisplaySection[Index] = sName
				ExplorationDisplayRefs[Index] = DisplayList
				ExplorationDisplayNames[Index] = ItemList	
				TCCDebug.Log("Patch API Registered " + DisplayList.GetSize() + " exploration Display(s) from - " + sName)
				Return True
			else
				TCCDebug.Log("Patch API - Failed to add " + sName + " exploration display support. Array sizes are: \n ExplorationDisplayRefs = " + Ref + "\n ExplorationDisplayNames = "+ Index)
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

Bool function AddToTokenRefList(ObjectReference RefToAdd, Bool NoShipment)
	
	Int Index = TokenRefList.Find(RefToAdd)
	if Index == -1
		Index = TokenRefList.Find(None)
		
		TokenRefList[Index] = RefToAdd
		if NoShipment
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

Bool function RemoveFromTokenRefList(ObjectReference RefToRemove, Bool NoShipment)
	
	Int Index = TokenRefList.Find(RefToRemove)
	if Index == -1
		TCCDebug.Log("Patch API - Unable to remove [" + RefToRemove.GetBaseObject().GetName() + "] " + RefToRemove + " from TokenRefList as the array does not hold this reference")
		Return False
	else
		
		TokenRefList[Index] = None
		if NoShipment
			TokenRefList_NoShipment[Index] = None
			TokenRefList_NoShipmentSize.Mod(-1)
			TCCDebug.Log("Patch API - Removed [" + RefToRemove.GetBaseObject().GetName() + "] " + RefToRemove + " from TokenRefList_NoShipment")
		endif
		TCCDebug.Log("Patch API - Removed [" + RefToRemove.GetBaseObject().GetName() + "] " + RefToRemove + " from TokenRefList")	
		Return True
	endif				
endfunction

;;-- Functions ---------------------------------------

function ResetArrays()

	QuestDisplayNames = new Formlist[128]
	QuestDisplayNames[0] = DBM_RN_Quest_Items_Tracking
	
	QuestDisplayRefs = new Formlist[128]
	QuestDisplayRefs[0] = DBM_RN_Quest_Displays_Tracking
	
	QuestDisplaySection = new String[128]
	QuestDisplaySection[0] = "Legacy of the Dragonborn"
	
	ExplorationDisplayNames = new Formlist[128]
	ExplorationDisplayNames[0] = DBM_RN_Exploration_Items_Tracking
	
	ExplorationDisplayRefs = new Formlist[128]
	ExplorationDisplayRefs[0] = DBM_RN_Exploration_Displays_Tracking

	ExplorationDisplaySection = new String[128]
	ExplorationDisplaySection[0] = "Legacy of the Dragonborn"
	
	SafehouseDisplayNames = new Formlist[128]
	SafehouseDisplayRefs = new Formlist[128]
	SafehouseDisplaySection = new String[128]

	HallofWondersDisplayNames = new Formlist[128]
	HallofWondersDisplayRefs = new Formlist[128]
	HallofWondersDisplaySection = new String[128]

	TCCDebug.Log("Patch API - Arrays initialised.")
EndFunction		
