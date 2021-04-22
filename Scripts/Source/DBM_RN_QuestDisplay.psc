Scriptname DBM_RN_QuestDisplay extends ObjectReference  

String Property sDisplayName Auto
Quest Property sQuestName Auto 

ObjectReference Property ShatteredLegacy Auto

Quest Property DBM_ShatteredLegacy Auto

Auto State Waiting
	Event OnCellAttach()
		if (ShatteredLegacy && DBM_ShatteredLegacy.IsCompleted())
			if (DBMDebug.getSKSE())
				DBMDebug.SendDisplayEvent(Self, ShatteredLegacy, NONE, True)
				GoToState("Done")
			endif
		endif
	endEvent
endState

State Done
	Event OnCellAttach()
		; Do Nothing if display is enabled.
	endEvent
endState
			
