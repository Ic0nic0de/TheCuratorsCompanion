scriptname RN_TCC_NonIconDisplay extends objectreference

message property DBM_NonIconMessage auto

referencealias property RN_Alias_Found auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
	
		ObjectReference FoundRelic = Game.GetPlayer().PlaceAtMe(self, 1, false, true)
		RN_Alias_Found.ForceRefTo(FoundRelic)					
		DBM_NonIconMessage.Show()
		RN_Alias_Found.Clear()
		FoundRelic.Delete()
	endIf
endEvent

