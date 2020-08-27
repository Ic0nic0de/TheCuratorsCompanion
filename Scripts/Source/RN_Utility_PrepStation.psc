scriptName RN_Utility_PrepStation extends ObjectReference

RN_Utility_MCM property RN_MCM auto
RN_Utility_Script Property RN_Utility Auto
RN_Utility_Mods Property RN_Mod Auto

Message Property DBM_SortError Auto
Message Property DBM_RN_Scan_Message Auto
Message Property DBM_RN_SetCheck_Message Auto
Message Property DBM_RN_TransferRelics_Message Auto

message property TransferComplete auto

GlobalVariable Property DBM_SortWait Auto

ObjectReference Property RN_Storage_Container Auto

Objectreference Property RN_Excluded_Act Auto

ObjectReference Property DBM_AutoSortDropOff Auto

ObjectReference Property PlayerRef auto

formlist property RN_TokenFormlist auto

formlist property dbmMaster auto
formlist property dbmDisp auto
formlist property RN_ExcludedItems_Custom auto
formlist property RN_ExcludedItems_Generic auto

Int OPButton
Int SCButton
Int TRButton

;;------------------------------------------------------------------------------------------

Function OnActivate(ObjectReference akActionRef)

	if (DBM_SortWait.GetValue())
		DBM_SortError.show()
	else
		OptionsMenu()
	endIf
endFunction

;;------------------------------------------------------------------------------------------

function OptionsMenu()
	OPButton = DBM_RN_SetCheck_Message.show()
	if OPButton == 0
		Scan()
	elseif OPButton == 1
		Transfer()
	elseif OPButton == 2
		return
	endIf
endFunction

;;------------------------------------------------------------------------------------------

function Scan()

	SCButton = DBM_RN_Scan_Message.Show()
	if SCButton == 0
		RN_Utility.ScanAll()
	
	elseif SCButton == 1
		RN_Utility.ScanMuseum()

	elseif SCButton == 2
		RN_Utility.ScanArmory()
		
	elseif SCButton == 3
		RN_Utility.ScanMods()

	elseif SCButton == 4
		OptionsMenu()
	endIf
endFunction

;;------------------------------------------------------------------------------------------

function Transfer()
	
	TRButton = DBM_RN_TransferRelics_Message.Show()
	
	if TRButton == 0

		if RN_MCM.PrepTransfer == 0
		
			Int Index = RN_TokenFormlist.GetSize()
			While Index
				Index -= 1
				ObjectReference _Container = RN_TokenFormlist.GetAt(Index) as ObjectReference
				if _Container != PlayerRef
					Int Index2 = _Container.GetNumItems()
					While Index2
						Index2 -= 1
						Form ItemRelic = _Container.GetNthForm(Index2)
						if dbmMaster.HasForm(ItemRelic) && !dbmDisp.HasForm(ItemRelic) && !Game.GetPlayer().IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic)
							if !RN_ExcludedItems_Custom.HasForm(ItemRelic) || !RN_ExcludedItems_Generic.HasForm(ItemRelic)
							_Container.RemoveItem(ItemRelic, 1, false, DBM_AutoSortDropOff)
							endIf
						endif
					endWhile
				endIf
			endWhile
		
		elseif RN_MCM.PrepTransfer == 1
			
			Int Index = RN_TokenFormlist.GetSize()
			While Index
				Index -= 1
				ObjectReference _Container = RN_TokenFormlist.GetAt(Index) as ObjectReference		
				Int Index2 = _Container.GetNumItems()
				While Index2
					Index2 -= 1
					Form ItemRelic = _Container.GetNthForm(Index2)
					if dbmMaster.HasForm(ItemRelic) && !dbmDisp.HasForm(ItemRelic) && !Game.GetPlayer().IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic)
						if !RN_ExcludedItems_Custom.HasForm(ItemRelic) || !RN_ExcludedItems_Generic.HasForm(ItemRelic)
						_Container.RemoveItem(ItemRelic, 1, false, DBM_AutoSortDropOff)
						endIf
					endif
				endWhile
			endWhile
		
		elseif RN_MCM.PrepTransfer == 2
	
			Int Index = RN_Storage_Container.GetNumItems()
			While Index
				Index -= 1
				Form ItemRelic = RN_Storage_Container.GetNthForm(Index)
				if dbmMaster.HasForm(ItemRelic) && !dbmDisp.HasForm(ItemRelic) && !Game.GetPlayer().IsEquipped(ItemRelic) && !Game.IsObjectFavorited(ItemRelic)
					if !RN_ExcludedItems_Custom.HasForm(ItemRelic) || !RN_ExcludedItems_Generic.HasForm(ItemRelic)
						RN_Storage_Container.RemoveItem(ItemRelic, 1, false, DBM_AutoSortDropOff)
					endIf
				endif
			endWhile
		
		endIf
		
		TransferComplete.Show()
		
	elseif TRButton == 1
		
		RN_Excluded_Act.Activate(Game.GetPlayer())

	elseif TRButton == 2
	
		OptionsMenu()
		
	endIf
	
endFunction


				
								

