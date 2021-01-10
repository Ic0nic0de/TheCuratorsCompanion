scriptName RN_Utility_Setup_C1 extends Quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

Import Debug

;Display Ref List - Hall Of Heroes
formlist property DBM_SectionHOHGroundFloorLeft auto
formlist property DBM_SectionHOHGroundFloorRight auto
formlist property DBM_SectionHOHReceptionHall auto
formlist property DBM_SectionHOHUpperGallery auto
formlist property DBM_SectionHOHMasksAndClaws auto
formlist property DBM_SectionHOHJewelry auto
formlist property DBM_SectionHOHCultureandArts auto
formlist property TCC_DisplayList_HallofHeroes auto

;Display Ref List - Hall Of Lost Empires
formlist property DBM_SectionHOLEMainFloor auto
formlist property DBM_SectionHOLEUpperRing auto
formlist property TCC_DisplayList_HallofLostEmpires auto

;Display Ref List - Hall Of Secrets
formlist property DBM_SectionHOSDisplays auto
formlist property TCC_DisplayList_HallofSecrets auto

;Display Ref List - Guildhouse
formlist property DBM_SectionGuildhouse auto
formlist property TCC_DisplayList_Guildhouse auto

;Display Ref List - Storeroom
formlist property DBM_SectionStoreRoomReserveVintages auto
formlist property TCC_DisplayList_Storeroom auto

;Display Ref List - Daedric Gallery
formlist property DBM_SectionDaedricGallery auto
formlist property TCC_DisplayList_DaedricGallery auto

;Display Ref List - Hall Of Oddities
formlist property DBM_SectionHOOMainFloor auto
formlist property TCC_DisplayList_HallofOddities auto

;Display Ref List - Dragonborn Hall
formlist property DBM_SectionDBHallAchievements auto
formlist property TCC_DisplayList_DragonbornHall auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Setup_Done Auto
globalvariable property RN_Setup_Registered auto

bool _setupDone

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()
	
	_RunSetup(false)
endFunction
	
;;-- Functions ---------------------------------------

function _RunSetup(bool forced)	
	
	RN_Setup_Registered.Mod(1)
	
	if forced
		_setupDone = false
	endIf
	
	if !_setupDone

		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Received for: Setup C1")
		endIf
	
		;;Merge Hall Of Heroes Display Lists
		_onConsolidateDisplays(DBM_SectionHOHGroundFloorLeft, TCC_DisplayList_HallofHeroes)
		_onConsolidateDisplays(DBM_SectionHOHGroundFloorRight, TCC_DisplayList_HallofHeroes)
		_onConsolidateDisplays(DBM_SectionHOHReceptionHall, TCC_DisplayList_HallofHeroes)
		_onConsolidateDisplays(DBM_SectionHOHUpperGallery, TCC_DisplayList_HallofHeroes)
		_onConsolidateDisplays(DBM_SectionHOHMasksAndClaws, TCC_DisplayList_HallofHeroes)
		_onConsolidateDisplays(DBM_SectionHOHJewelry, TCC_DisplayList_HallofHeroes)
		_onConsolidateDisplays(DBM_SectionHOHCultureandArts, TCC_DisplayList_HallofHeroes)

		;;Merge Hall Of Lost Empires Display Lists
		_onConsolidateDisplays(DBM_SectionHOLEMainFloor, TCC_DisplayList_HallofLostEmpires)  
		_onConsolidateDisplays(DBM_SectionHOLEUpperRing, TCC_DisplayList_HallofLostEmpires)	
		
		;;Merge All Halls Display Lists
		_onConsolidateDisplays(DBM_SectionDBHallAchievements, TCC_DisplayList_DragonbornHall)
		_onConsolidateDisplays(DBM_SectionDaedricGallery, TCC_DisplayList_DaedricGallery)
		_onConsolidateDisplays(DBM_SectionHOOMainFloor, TCC_DisplayList_HallofOddities)
		_onConsolidateDisplays(DBM_SectionHOSDisplays, TCC_DisplayList_HallofSecrets)
		_onConsolidateDisplays(DBM_SectionGuildhouse, TCC_DisplayList_Guildhouse)
		_onConsolidateDisplays(DBM_SectionStoreRoomReserveVintages, TCC_DisplayList_Storeroom)
		
		RN_Setup_Done.Mod(1)
		_setupDone = true
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Completed for: Setup C1")
		endIf
	
	else
		
		RN_Setup_Done.Mod(1)
		If MCM.DevDebugVal
			DBMDebug.Log(Self, "TCC: Setup Event Already Completed for: Setup C1")
		endIf
	endIf
endFunction
