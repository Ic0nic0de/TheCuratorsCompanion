Scriptname Ic0n_RoomSelectionTrigger extends Objectreference

DBM_FurnitureBuyScript Property _Setup01 Auto
DBM_FurnitureBuyScript Property _Setup02 Auto
DBM_FurnitureBuyScript Property _Setup03 Auto
DBM_FurnitureBuyScript Property _Setup04 Auto
DBM_FurnitureBuyScript Property _Setup05 Auto
DBM_FurnitureBuyScript Property _SetupArmoryA Auto
DBM_FurnitureBuyScript Property _SetupArmoryB Auto
DBM_FurnitureBuyScript Property _SetupGardenA Auto
DBM_FurnitureBuyScript Property _SetupPrisonB Auto
DBM_FurnitureBuyScript Property _SetupTeleporterA Auto

Objectreference Property _RoomSelectionChest Auto

Message Property SH_RoomSelection_Message AUTO
Message Property SH_FollowerRoom_Message Auto
Message Property SH_KidsRoom_Message Auto
Message Property SH_Garden_Message Auto
Message Property SH_Error Auto

GlobalVariable Property DBM_FurnitureGlobal01 Auto
GlobalVariable Property DBM_FurnitureGlobal02 Auto
GlobalVariable Property DBM_FurnitureGlobal03 Auto
GlobalVariable Property DBM_FurnitureGlobal04 Auto
GlobalVariable Property DBM_FurnitureGlobal05 Auto
GlobalVariable Property DBM_FurnitureGlobalArmoryA Auto
GlobalVariable Property DBM_FurnitureGlobalArmoryB Auto
GlobalVariable Property DBM_FurnitureGlobalGardenA Auto
GlobalVariable Property DBM_FurnitureGlobalPrisonB Auto
GlobalVariable Property DBM_FurnitureGlobalTeleporterA Auto

;;------------------------------------------------------------------

Event OnActivate(ObjectReference akActionRef)
	
	MainMenu()
endEvent

;;------------------------------------------------------------------

Event MainMenu()

	Int BTN = SH_RoomSelection_Message.Show()
	
	if BTN == 0
		_RoomSelectionChest.Activate(Game.GetPlayer())
	
	elseif BTN == 1 
		FollowerRoom()
		
	elseif BTN == 2
		KidsRoom()

	elseif BTN == 3					
		Garden()
	
	elseif BTN == 4					
		Return
	Endif
EndEvent

;;------------------------------------------------------------------

Event FollowerRoom()

	Int F = SH_FollowerRoom_Message.Show()
	
	if F == 0
		if DBM_FurnitureGlobal01.GetValue()
			_Setup01._OnSetup()
		else
			SH_Error.Show()
		endIF
	
	elseif F == 1
		if DBM_FurnitureGlobalArmoryA.GetValue()
			_SetupArmoryA._OnSetup()
		else
			SH_Error.Show()
		endIF				

	elseif F == 2
		if DBM_FurnitureGlobalGardenA.GetValue()
			_SetupGardenA._OnSetup()
		else
			SH_Error.Show()
		endIF	

	elseif F == 3
		if DBM_FurnitureGlobalTeleporterA.GetValue()
			_SetupTeleporterA._OnSetup()
		else
			SH_Error.Show()
		endIF	

	elseif F == 4
		MainMenu()	
	endIF
endEvent

;;------------------------------------------------------------------

Event KidsRoom()
		
	Int K = SH_KidsRoom_Message.Show()

	if K == 0
		if DBM_FurnitureGlobal02.GetValue()
			_Setup02._OnSetup()
		else
			SH_Error.Show()
		endIF
	
	elseif K == 1
		if DBM_FurnitureGlobal05.GetValue()
			_Setup05._OnSetup()
		else
			SH_Error.Show()
		endIF				

	elseif K == 2
		if DBM_FurnitureGlobalArmoryB.GetValue()
			_SetupArmoryB._OnSetup()
		else
			SH_Error.Show()
		endIF	

	elseif K == 3
		if DBM_FurnitureGlobalPrisonB.GetValue()
			_SetupPrisonB._OnSetup()
		else
			SH_Error.Show()
		endIF	

	elseif K == 4
		MainMenu()
	endIF	
endEvent

;;------------------------------------------------------------------

Event Garden()

	Int G = SH_Garden_Message.Show()

	if G == 0
		if DBM_FurnitureGlobal03.GetValue()
			_Setup03._OnSetup()
		else
			SH_Error.Show()
		endIF
	
	elseif G == 1
		if DBM_FurnitureGlobal04.GetValue()
			_Setup04._OnSetup()
		else
			SH_Error.Show()
		endIF

	elseif G == 2
		MainMenu()
	endIF
EndEvent




