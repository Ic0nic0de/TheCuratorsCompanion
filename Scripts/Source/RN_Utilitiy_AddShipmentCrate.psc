scriptname RN_Utilitiy_AddShipmentCrate extends objectreference

RN_PatchAPI property API auto

Event OnCellAttach()
	
	API.AddToTokenRefList(Self, False)
endEvent

Event OnCellDetach()
	
	if Self.GetNumItems() == 0
		API.RemoveFromTokenRefList(Self, False)
	endif
endEvent
		
Event OnUpdateGameTime()
	
	Utility.Wait(5.0)

	if Self.GetNumItems() == 0
		API.RemoveFromTokenRefList(Self, False)
		TCCDebug.Log("Shipment Crate - auto removing [" + Self.GetBaseObject().GetName() + "] " + Self + " from TokenRefList as the shipment crate is empty")
	endif
endEvent
