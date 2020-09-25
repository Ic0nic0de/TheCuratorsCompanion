scriptName RN_Utility_Setup_C1 extends Quest

Import RN_Utility_Global

;Display Ref List - Hall Of Heroes
formlist property DBM_SectionHOHGroundFloorLeft auto
formlist property DBM_SectionHOHGroundFloorRight auto
formlist property DBM_SectionHOHReceptionHall auto
formlist property DBM_SectionHOHUpperGallery auto
formlist property DBM_SectionHOHMasksAndClaws auto
formlist property DBM_SectionHOHJewelry auto
formlist property DBM_SectionHOHCultureandArts auto
formlist property DBM_SectionHOH_Merged auto

;Display Ref List - Hall Of Lost Empires
formlist property DBM_SectionHOLEMainFloor auto
formlist property DBM_SectionHOLEUpperRing auto
formlist property DBM_SectionHOLE_Merged auto

;Display Ref List - Hall Of Secrets
formlist property DBM_SectionHOSDisplays auto
formlist property DBM_SectionHallofSecrets_Merged auto

;Display Ref List - Guildhouse
formlist property DBM_SectionGuildhouse auto
formlist property DBM_SectionGuildhouse_Merged auto

;Display Ref List - Storeroom
formlist property DBM_SectionStoreRoomReserveVintages auto
formlist property DBM_SectionStoreRoom_Merged auto

;Display Ref List - Daedric Gallery
formlist property DBM_SectionDaedricGallery auto
formlist property DBM_SectionDaedricGallery_Merged auto

;Display Ref List - Hall Of Oddities
formlist property DBM_SectionHOOMainFloor auto
formlist property DBM_SectionHallofOddities_Merged auto

;Display Ref List - Dragonborn Hall
formlist property DBM_SectionDBHallAchievements auto
formlist property DBM_SectionDragonbornHall_Merged auto

;; Global for ModEvent Return.
GlobalVariable Property RN_Setup_Done Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;;-- Functions ---------------------------------------

function OnInit()

	RegisterForModEvent("RunSetup_C1", "OnRunSetup_C1")
endFunction

;;-- Functions ---------------------------------------

Function OnPlayerLoadGame()

	RegisterForModEvent("RunSetup_C1", "OnRunSetup_C1")
endFunction

;;-- Functions ---------------------------------------

function OnRunSetup_C1(string eventName, string strArg, float numArg, Form sender) ;;Runs Once, Automatic Call from (RN_Utility_Script)
	
	;;Merge Hall Of Heroes Display Lists
	_onConsolidateDisplays(DBM_SectionHOHGroundFloorLeft, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHGroundFloorRight, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHReceptionHall, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHUpperGallery, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHMasksAndClaws, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHJewelry, DBM_SectionHOH_Merged)
	_onConsolidateDisplays(DBM_SectionHOHCultureandArts, DBM_SectionHOH_Merged)

	;;Merge Hall Of Lost Empires Display Lists
	_onConsolidateDisplays(DBM_SectionHOLEMainFloor, DBM_SectionHOLE_Merged)  
	_onConsolidateDisplays(DBM_SectionHOLEUpperRing, DBM_SectionHOLE_Merged)	
	
	;;Merge All Halls Display Lists
	_onConsolidateDisplays(DBM_SectionDBHallAchievements, DBM_SectionDragonbornHall_Merged)
	_onConsolidateDisplays(DBM_SectionDaedricGallery, DBM_SectionDaedricGallery_Merged)
	_onConsolidateDisplays(DBM_SectionHOOMainFloor, DBM_SectionHallofOddities_Merged)
	_onConsolidateDisplays(DBM_SectionHOSDisplays, DBM_SectionHallofSecrets_Merged)
	_onConsolidateDisplays(DBM_SectionGuildhouse, DBM_SectionGuildhouse_Merged)
	_onConsolidateDisplays(DBM_SectionStoreRoomReserveVintages, DBM_SectionStoreRoom_Merged)
	
	RN_Setup_Done.Mod(1)
endFunction
