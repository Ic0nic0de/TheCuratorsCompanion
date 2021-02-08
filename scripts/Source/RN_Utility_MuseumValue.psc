Scriptname RN_Utility_MuseumValue extends ReferenceAlias

;--Museum Value
formlist property _MuseumContainerList auto
objectreference[] MuseumContainerArray
globalvariable property RN_MuseumValue auto

bool Working

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event onInit()
	
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
	RegisterForModEvent("DBM DisplaySortComplete", "_OnDisplaySortComplete")
	BuildArray()
endEvent

;;-- Events ---------------------------------------		

Event OnPlayerLoadGame()
	
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
	RegisterForModEvent("DBM DisplaySortComplete", "_OnDisplaySortComplete")
	BuildArray()
endEvent

;;-- Events ---------------------------------------	

Event _OnDisplaySortComplete(Form fSender, Int iNum)
	if !Working
		CalcVal()
	endIf
endEvent

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)	

	if !Working
		CalcVal()
	endIf
endEvent

;;-------------------------------

function CalcVal()
	
	Working = True
	Int Value = 0
	Int _Index = MuseumContainerArray.length
	While _Index 
		_Index -= 1
		if MuseumContainerArray[_Index] != none
			Int _Index2 = MuseumContainerArray[_Index].GetNumItems()
			while _Index2
				_Index2 -= 1	
				Form Item = MuseumContainerArray[_Index].GetNthForm(_Index2)
				Value += Item.GetGoldValue()
			endWhile
		endIf
	endWhile
	
	RN_MuseumValue.SetValue(Value)
	Working = False
endFunction

;;-------------------------------

function BuildArray()

	MuseumContainerArray = new objectreference[128]
	Int _Index = 0
	While _Index < _MuseumContainerList.GetSize()
		objectreference x = _MuseumContainerList.GetAt(_Index) as objectreference
		MuseumContainerArray[_Index] = x
		_Index += 1
	endWhile

	if (Game.GetModByName("LOTD_TCC_Cloaks.esp") != 255)
		objectreference DBM_CloaksStorage = Game.GetFormFromFile(2122, "DBM_CloaksofSkyrim_Patch.esp") as objectreference
		MuseumContainerArray[_Index] = DBM_CloaksStorage
		TCCDebug.Log("Scan Script Misc - Added Cloaks Storage to array", 0)
	endIf
endFunction
