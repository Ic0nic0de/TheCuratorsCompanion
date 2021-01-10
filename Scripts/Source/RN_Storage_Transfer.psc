Scriptname RN_Storage_Transfer extends ReferenceAlias 

;;Formlist Property dbmDisp Auto
Formlist Property dbmNew Auto
Formlist Property dbmFound Auto

;;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

;;Mod start up global variable.
GlobalVariable Property RN_Setup_Start auto

;;Relic Notifications Storage Container
Objectreference Property RN_Storage_Container auto

Objectreference Property PlayerRef auto

formlist property TCC_ItemList_Safehouse auto

formlist property DBM_ProtectedItems auto

Keyword Property VendorItemGem Auto

;-- Events --------------------------------

Event onInit()

	GoToState("DISABLED")	
endEvent

;-- Events --------------------------------

Event OnPlayerLoadGame()

	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(dbmNew)
	AddInventoryEventFilter(dbmFound)
	
	if MCM.AutoTransferRelics
		GoToState("")
	else
		GoToState("DISABLED")
	endIf
endEvent

;;------------------------------------------------------------------------------------------

Function OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	
	if !RN_Setup_Start.GetValue() && akSourceContainer != RN_Storage_Container && (dbmNew.HasForm(akBaseItem) || dbmFound.HasForm(akBaseItem))
		if !DBM_ProtectedItems.HasForm(akBaseItem) && !TCC_ItemList_Safehouse.HasForm(akBaseItem)
			if MCM.AutoTransferRelics
				if akBaseItem as Weapon && MCM.AllowWeapon
					ProcessForm(akBaseItem)
				
				elseif akBaseItem as Armor && MCM.AllowArmor
					ProcessForm(akBaseItem)	

				elseif akBaseItem as Book && MCM.AllowBook 	
					ProcessForm(akBaseItem)	
				
				elseif akBaseItem as Potion && MCM.AllowPotion
					ProcessForm(akBaseItem)
				
				elseif akBaseItem as Key && MCM.AllowKey	
					ProcessForm(akBaseItem)
				
				elseif akBaseItem.HasKeyword(VendorItemGem) && MCM.AllowGems
					ProcessForm(akBaseItem)	
				
				elseif akBaseItem as SoulGem && MCM.AllowGems 
					ProcessForm(akBaseItem)
				
				elseif akBaseItem as MiscObject && MCM.AllowMisc
					ProcessForm(akBaseItem)	
				endIf
			endIf
		endIf
	endIf
			
endFunction

Function ProcessForm(Form akBaseItem)

	PlayerRef.RemoveItem(akBaseItem, 1, TRUE, RN_Storage_Container)
endFunction

;;------------------------------------------------------------------------------------------

state DISABLED

	Event onItemAdded (Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	endEvent

endState





