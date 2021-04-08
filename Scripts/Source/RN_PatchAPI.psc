scriptname RN_PatchAPI extends quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_Script property Util auto
RN_Utility_PropManager property Prop auto

string[] property SupportedModNames auto hidden
form[] property SupportedModHandlers auto hidden

globalvariable property RN_SupportedModCount auto
globalvariable property RN_CustomModCount auto
bool property UnregisteredPatch auto hidden

Event OnInit()

	SupportedModNames = new String[128]
	SupportedModHandlers = new Form[128]
EndEvent

Bool Function RegisterSupportedMod(String sName, RN_SupportedMod_Script sHandler, TCC_CustomPatchScript cHandler)
	
	while !SupportedModNames || !SupportedModHandlers
		TCCDebug.Log("Patch API - Waiting for arrays to initialise.")
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
					smCurrent.RegisterForSingleUpdate(0)
					TCCDebug.Log("Patch API - Finished setting up support for " + _Name)
				endif
				
			elseif (cmCurrent)
				_Name = cmCurrent.DBM.sSupportedModName
				if (!cmCurrent._setupDone)
					_Wait = true
					TCCDebug.Log("Patch API - Waiting for " + _Name + " To Finish setting up")
				else
					cmCurrent.RegisterForSingleUpdate(0)
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
