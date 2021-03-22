scriptname RN_Utilitiy_AddShipmentCrate extends objectreference

formlist property TCC_TokenList auto

Event OnCellAttach()
	
	if !TCC_TokenList.HasForm(self)
		TCC_TokenList.AddForm(Self)
		SendModEvent("Update_TokenArray", "Updating Token Array")
		TCCDebug.Log("Museum Shipment Crate " + Self + " added to formlist")
	endIf
endEvent

