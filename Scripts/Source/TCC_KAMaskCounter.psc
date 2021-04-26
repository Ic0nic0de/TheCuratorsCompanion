scriptname TCC_KAMaskCounter extends ReferenceAlias

Formlist Property MaskList Auto
Formlist Property MaskListKA Auto

GlobalVariable Property DBM_DisplayCount Auto


Event onInit()
	
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()
	
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
endEvent
	
;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)
	
	ObjectReference Disp = DisplayRef as ObjectReference
	
	if (MaskList.HasForm(Disp))
		
		if (EnableState)
			Int Index = MaskList.Find(Disp)
			if Index != -1
				DBM_DisplayCount.Mod(1)
				DBMDebug.SendDisplayEvent(GetOwningQuest(), MaskListKA.GetAt(Index) as ObjectReference, None, True)
				TCCDebug.Log("KA Mask handler Updated [Dragonborn Hall] display " + MaskListKA.GetAT(Index) as ObjectReference, 0)
			endif
			
		elseif (!EnableState)
			Int Index = MaskList.Find(Disp)
			if Index != -1
				DBM_DisplayCount.Mod(-1)
				DBMDebug.SendDisplayEvent(GetOwningQuest(), MaskListKA.GetAT(Index) as ObjectReference, None, False)
				TCCDebug.Log("KA Mask handler Updated [Dragonborn Hall] display " + MaskListKA.GetAT(Index) as ObjectReference, 0)
			endif
		endIf
	endIf
endEvent	

