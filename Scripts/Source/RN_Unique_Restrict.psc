ScriptName RN_Unique_Restrict extends referencealias

RN_Utility_MCM property MCM auto

;-------------------------------

Formlist Property DBM_TCC_Handler_ItemsAlt Auto

Keyword property TCCCuratorsEquipment auto

Weapon Property weapSwordTCC auto
Weapon Property TCCBladeReplica auto

Weapon Property weapStaffTCC auto
Weapon Property TCCStaffReplica auto

Armor Property ArmorShieldTCC Auto
Armor Property TCCShieldReplica Auto

Armor Property ArmorCloakTCC Auto
Armor Property TCCCloakReplica Auto

MiscObject Property TCCFafnirTeddy Auto
MiscObject Property TCCFafnirTeddyReplica Auto

MiscObject Property TCCGoldApple Auto
Book Property StorybookTCC Auto

GlobalVariable Property RN_Ach02Complete auto
GlobalVariable Property RN_Ach04Complete auto
GlobalVariable Property RN_Ach05Complete auto
GlobalVariable Property RN_Ach27Complete auto
GlobalVariable Property RN_Ach32Complete auto
GlobalVariable Property RN_Ach33Complete auto
GlobalVariable Property RN_Ach34Complete auto

;;------------------------------------

Event OnInit()
	
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(DBM_TCC_Handler_ItemsAlt)
endEvent

;;------------------------------------

Event OnPlayerLoadGame()
	
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(DBM_TCC_Handler_ItemsAlt)
endEvent

;;------------------------------------

Function OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseItem.HasKeyWord(TCCCuratorsEquipment) && !MCM.RUI
	
		if akBaseItem == weapSwordTCC && !RN_Ach02Complete.GetValue() || akBaseItem == TCCBladeReplica && !RN_Ach02Complete.GetValue()
			Error(akbaseItem, aiItemCount, "Hoarder")

		elseif akBaseItem == ArmorShieldTCC && !RN_Ach05Complete.GetValue() || akBaseItem == TCCShieldReplica && !RN_Ach05Complete.GetValue()
			Error(akbaseItem, aiItemCount, "Spelunker")

		elseif akBaseItem == weapStaffTCC && !RN_Ach33Complete.GetValue() || akBaseItem == TCCStaffReplica && !RN_Ach33Complete.GetValue()
			Error(akbaseItem, aiItemCount, "Champion of All")

		elseif akBaseItem == ArmorCloakTCC && !RN_Ach32Complete.GetValue() || akBaseItem == TCCCloakReplica && !RN_Ach32Complete.GetValue()
			Error(akbaseItem, aiItemCount, "Guild Master Master")

		elseif akBaseItem == TCCFafnirTeddy && !RN_Ach27Complete.GetValue() || akBaseItem == TCCFafnirTeddyReplica && !RN_Ach27Complete.GetValue()
			Error(akbaseItem, aiItemCount, "Expansionist")	

		elseif akBaseItem == TCCGoldApple && !RN_Ach34Complete.GetValue()
			Error(akbaseItem, aiItemCount, "Midas Touch")	
		
		elseif akBaseItem == StorybookTCC && !RN_Ach04Complete.GetValue()
			Error(akbaseItem, aiItemCount, "Bibliophile")
		endIf	
	endIf	
endFunction

Function Error(Form akBaseItem, Int aiItemCount, String _AchName)
	Debug.MessageBox("=== The Curators Companion === \n\n You can't have " + akBaseItem.GetName() + " without completing the " + _AchName + " achievement. \n\n Nice try though!")
	Game.GetPlayer().RemoveItem(akBaseItem, aiItemCount, false)
endFunction



