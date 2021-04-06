Scriptname TCC_StorybookStart extends ObjectReference  

Quest Property DBM_CuratorsCompanion_Storybook  Auto  

Bool Done = False

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	
	if akNewContainer == Game.GetPlayer() && !Done
		DBM_CuratorsCompanion_Storybook.Start()
		DBM_CuratorsCompanion_Storybook.SetObJectiveDisplayed(0)
	endif
endEvent
