scriptname RN_PatchAPI extends quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_Script property Util auto
RN_Utility_PropManager property Prop auto

string[] property SupportedModNames auto hidden
form[] property SupportedModHandlers auto hidden

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

Event OnInit()

	SupportedModNames = new String[128]
	SupportedModHandlers = new Form[128]

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
EndEvent

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
				SupportedModNames[iNamesIndex] = sName	
			elseif cHandler
				SupportedModHandlers[iNamesIndex] = cHandler
				SupportedModNames[iNamesIndex] = sName	
			endif
			TCCDebug.Log("Patch API Registered - " + sName)	
			Return True
		else
			TCCDebug.Log("Patch API - Failed to add " + sName + " support. Array sizes are: \n SupportedModHandlers = " + iHandlerIndex + "\n SupportedModNames = "+ iNamesIndex)
			Return False
		endif
	endif
EndFunction

Bool Function RegisterQuestDisplayList(String sName, Formlist DisplayList = None, Formlist ItemList = None)
	
	while !QuestDisplayNames || !QuestDisplayRefs
		TCCDebug.Log("Patch API - Waiting for quest display arrays to initialise.")
		Utility.Wait(2)
	endwhile
	
	if (DisplayList && DisplayList.GetSize() > 0) && (ItemList && ItemList.GetSize() > 0)
	
		Int Index = QuestDisplaySection.Find(sName)
		if Index == -1
		
			Index = QuestDisplayNames.Find(None)
			Int Ref = QuestDisplayRefs.Find(None)
			
			if (Ref == Index) && (Index != -1)
				QuestDisplaySection[Index] = sName
				QuestDisplayRefs[Index] = DisplayList
				QuestDisplayNames[Index] = ItemList	
				TCCDebug.Log("Patch API Registered Quest Displays from - " + sName)	
				Return True
			else
				TCCDebug.Log("Patch API - Failed to add " + sName + " quest display support. Array sizes are: \n QuestDisplayRefs = " + Ref + "\n QuestDisplayNames = "+ Index)
				Return False
			endif
			
		else
			
			Int Index2 = DisplayList.GetSize()
			While Index2
				Index2 -= 1
				
				ObjectReference _Disp = DisplayList.GetAt(Index2) as ObjectReference
				Form _item = ItemList.GetAt(Index2) as Form
				QuestDisplayRefs[Index].AddForm(_Disp)
				QuestDisplayNames[Index].AddForm(_item)
			endWhile
					
		endif
	endif
EndFunction

Bool Function RegisterSafehouseDisplayList(String sName, Formlist DisplayList = None, Formlist ItemList = None)
	
	while !SafehouseDisplayNames || !SafehouseDisplayRefs
		TCCDebug.Log("Patch API - Waiting for Safehouse display arrays to initialise.")
		Utility.Wait(2)
	endwhile
	
	if (DisplayList && DisplayList.GetSize() > 0) && (ItemList && ItemList.GetSize() > 0)
		Int Index = SafehouseDisplayNames.Find(ItemList)
		if Index == -1
		
			Index = SafehouseDisplayNames.Find(None)
			Int Ref = SafehouseDisplayRefs.Find(None)
			
			if (Ref == Index) && (Index != -1)
				SafehouseDisplaySection[Index] = sName
				SafehouseDisplayRefs[Index] = DisplayList
				SafehouseDisplayNames[Index] = ItemList	
				TCCDebug.Log("Patch API Registered Safehouse Displays from - " + sName)
				Return True
			else
				TCCDebug.Log("Patch API - Failed to add " + sName + " Safehouse display support. Array sizes are: \n SafehouseDisplayRefs = " + Ref + "\n SafehouseDisplayNames = "+ Index)
				Return False
			endif
		endif
	endif
EndFunction

Bool Function RegisterHallofWondersDisplayList(String sName, Formlist DisplayList = None, Formlist ItemList = None)
	
	while !HallofWondersDisplayNames || !HallofWondersDisplayRefs
		TCCDebug.Log("Patch API - Waiting for Hall of Wonders display arrays to initialise.")
		Utility.Wait(2)
	endwhile
	
	if (DisplayList && DisplayList.GetSize() > 0) && (ItemList && ItemList.GetSize() > 0)
		Int Index = HallofWondersDisplayNames.Find(ItemList)
		if Index == -1
		
			Index = HallofWondersDisplayNames.Find(None)
			Int Ref = HallofWondersDisplayRefs.Find(None)
			
			if (Ref == Index) && (Index != -1)
				HallofWondersDisplaySection[Index] = sName
				HallofWondersDisplayRefs[Index] = DisplayList
				HallofWondersDisplayNames[Index] = ItemList	
				TCCDebug.Log("Patch API Registered Hall of Wonders Displays from - " + sName)
				Return True
			else
				TCCDebug.Log("Patch API - Failed to add " + sName + " Hall of Wonders display support. Array sizes are: \n HallofWondersDisplayRefs = " + Ref + "\n HallofWondersDisplayNames = "+ Index)
				Return False
			endif
		endif
	endif
EndFunction

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
				TCCDebug.Log("Patch API Registered exploration Displays from - " + sName)
				Return True
			else
				TCCDebug.Log("Patch API - Failed to add " + sName + " exploration display support. Array sizes are: \n ExplorationDisplayRefs = " + Ref + "\n ExplorationDisplayNames = "+ Index)
				Return False
			endif
		endif
	endif
EndFunction

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

function CheckPatches()

	bool _Wait
	string _Name
	
	Int Index = SupportedModHandlers.length
	while Index
		Index -= 1
		if SupportedModHandlers[Index] != none
		
			RN_SupportedMod_Script smCurrent = SupportedModHandlers[Index] as RN_SupportedMod_Script
			TCC_CustomPatchScript cmCurrent = SupportedModHandlers[Index] as TCC_CustomPatchScript
		
			if (smCurrent)
				_Name = smCurrent._ModName
				if (!smCurrent._setupDone)
					_Wait = true
					TCCDebug.Log("Patch API - Waiting for " + _Name + " To Finish setting up")
				else
					TCCDebug.Log("Patch API - Finished setting up support for " + _Name)
				endif
				
			elseif (cmCurrent)
				_Name = cmCurrent.DBM.sSupportedModName
				if (!cmCurrent._setupDone)
					_Wait = true
					TCCDebug.Log("Patch API - Waiting for " + _Name + " To Finish setting up")
				else
					TCCDebug.Log("Patch API - Finished setting up support for " + _Name)
				endif
			endif

			While _Wait
				if (smCurrent && smCurrent._setupDone) || (cmCurrent && cmCurrent._setupDone)
					_Wait = false
					TCCDebug.Log("Patch API - Finished setting up support for " + _Name)
				endif
			endwhile					
		endif
	endwhile                 
endFunction
