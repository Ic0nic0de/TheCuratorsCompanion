scriptname RN_Utility_MCM extends SKI_ConfigBase

import FISSFactory

import AhzmoreHUD
import AhzmoreHUDIE

import utility

RN_Utility_Script property RN_Utility auto

RN_Utility_Mods property RN_Mod auto

RN_Storage_Transfer property RN_Transfer auto

RN_Utility_QuestTracker property RN_Tracker auto

DBM_ReplicaHandler property ReplicaHandler auto

RN_Utility_ArrayHolder property RN_Array auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General Properties -------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; string Returns

string[] MCM_Strings
string[] PagesList
string InputBox = "Enter Password"
string Status_Return

Perk property DBM_ArcPerkRelicHunter auto

;; Scan Variables
bool bScanning = false
globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Sent auto

message property DBM_ScanMuseum_Message auto
message property DBM_ScanMuseum_Finished_Message auto

;; Debug Variables
int inputOID_I
message property moreHUDListRebuilt auto

;; Player Ref for Game.GetPlayer()
objectreference property PlayerRef auto

;; location Properties
location property DBM_DragonbornGalleryLocation auto
location property DBM_GuildHouseSolitudeLocation auto

;; Storage Options
spell property RN_Storage_Spell auto
globalvariable property CustomContainer auto

;; Treasury Value
quest property DBM_Excavation02 auto
quest property DBM_DHQuest auto

;; moreHUD
formlist property dbmNew auto
formlist property dbmDisp auto
formlist property dbmFound auto
formlist property dbmMaster auto

formlist property RN_TokenFormlist_NoShipment auto

;; Formlists to control merged and found lists
formlist property Supported_Items_Merged auto
formlist property Supported_Items_Found auto

string[] moreHUDChoiceList 
int IndexmoreHUD = 0
int moreHUDOptions

;; Custom Storage
formlist property RN_TokenFormlist auto
formlist property DBM_ReplicaBaseItems auto
formlist property DBM_ReplicaItems auto

bool property _UserSettings auto hidden

;; bool Properties
bool property ShowMuseumVal = true auto hidden ;;Museum Notifications
bool iRelicMuseumNotifications = false

bool property ShowArmoryVal = true auto hidden ;;Armory Notifications
bool iRelicArmoryNotifications = false

bool property ShowModsVal = true auto hidden ;;Supported Mod Notifications
bool iRelicModsNotifications = false

bool property ShowSetCompleteVal = true auto hidden ;;Section / Set Completion Notifications
bool iRelicSetCompleteNotifications = false

bool property ShowSimpleNotificationVal = true auto hidden ;;Simple Notification (No MessageBox)
bool iRelicSimpleNotifications = false

bool property ShowListenerVal = true auto hidden ;;Notifications for Display Listeners
bool iRelicListenerNotifications = false

bool property ShowLocationOverrideVal auto hidden ;;Debug Disable location Checks
bool iRelicLocationDebug = false

bool property ShowStorageSpellOverideVal auto hidden ;;Debug Disable spell Checks
bool iRelicSpellDebug = false

bool property StorageSpellVal auto hidden ;;Storage spell Value
bool iRelicStorageOptions = false

bool property AutoTransferRelics auto hidden ;;auto Transfer To Storage Container
bool iRelicStorageTransfer = false

bool property AllowWeapon auto hidden ;;auto Transfer To Storage Container
bool Transfer_Weapon = false

bool property AllowArmor auto hidden ;;auto Transfer To Storage Container
bool Transfer_Armor = false

bool property AllowBook auto hidden ;;auto Transfer To Storage Container
bool Transfer_Book = false

bool property AllowPotion auto hidden ;;auto Transfer To Storage Container
bool Transfer_Potion = false

bool property AllowKey auto hidden ;;auto Transfer To Storage Container
bool Transfer_Key = false

bool property AllowGems auto hidden ;;auto Transfer To Storage Container
bool Transfer_Gems = false

bool property AllowMisc auto hidden ;;auto Transfer To Storage Container
bool Transfer_Misc = false

bool property DevDebugVal auto hidden ;; Debug alerts for Dev usage.
bool Dev_Alerts = false

bool property ShowStartup = true auto hidden ;; Shows Startup Messages
bool iRelicShowStartup = false

Int property PrepTransfer auto hidden ;; Prep Station transfer settings.
bool PrepStationTransfer = false

bool property ReplicaTag auto hidden
bool ReplicaTagging = false

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Global Variables ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;; Globals for Complete Set Listings.
globalvariable property iMuseumSets auto
globalvariable property iArmorySets auto
globalvariable property iImmWeapSets auto
globalvariable property iHeavyArmSets auto
globalvariable property iModComplete auto
globalvariable property iDisplaySectionComplete auto
globalvariable property RN_SupportedModCount auto

;; General Globals

globalvariable property RN_Total_Value auto
globalvariable property RN_Treasury_Count auto
globalvariable property RN_Treasury_Count2 auto
globalvariable property RN_Treasury_Count3 auto

globalvariable property RN_moreHUD_Option auto

globalvariable property DBM_SortWait auto

globalvariable property RN_Setup_Start auto

globalvariable property RN_Debug_Access auto
globalvariable property RN_Debug_Randomiser auto

;;Globals for Display Listener
globalvariable property RN_Quest_Listener_Total auto
globalvariable property RN_Quest_Listener_Count auto
globalvariable property RN_Quest_Listener_Complete auto

globalvariable property RN_Exploration_Listener_Total auto
globalvariable property RN_Exploration_Listener_Count auto
globalvariable property RN_Exploration_Listener_Complete auto

globalvariable property RN_Thane_Listener_Total auto
globalvariable property RN_Thane_Listener_Count auto
globalvariable property RN_Thane_Listener_Complete auto

globalvariable property RN_Skills_Listener_Total auto
globalvariable property RN_Skills_Listener_Count auto
globalvariable property RN_Skills_Listener_Complete auto

;; Globals for set completion - Mods - (Aetherium)
globalvariable property DBM_MC_GV_Aetherium auto
globalvariable property GV_SectionHOLEAetherium_Count auto
globalvariable property GV_SectionHOLEAetherium auto

;; Globals for set completion - Mods - (Amulets)
globalvariable property DBM_MC_GV_Amulets auto
globalvariable property GV_AmuletsDisplay_Count auto
globalvariable property GV_AmuletsDisplay auto

;; Globals for set completion - Mods - (Artifacts)
globalvariable property DBM_MC_GV_AOS auto
globalvariable property GV_Artifacts_Skyrim_Count auto
globalvariable property GV_Artifacts_Skyrim auto

;; Globals for set completion - Mods - (Bad Gremlins)
globalvariable property DBM_MC_GV_BG auto
globalvariable property GV_BadGremlin_Count auto
globalvariable property GV_BadGremlin auto

;; Globals for set completion - Mods - (Boethiah)
globalvariable property DBM_MC_GV_Boethiah auto
globalvariable property GV_AOB_Count auto
globalvariable property GV_AOB auto

;; Globals for set completion - Mods - (Cloaks)
globalvariable property DBM_MC_GV_Cloaks auto
globalvariable property GV_Cloaks_Count auto
globalvariable property GV_Cloaks auto

;; Globals for set completion - Mods - (Clockwork)
globalvariable property DBM_MC_GV_Clockwork auto
globalvariable property GV_Clockwork_Count auto
globalvariable property GV_Clockwork auto

;; Globals for set completion - Mods - (Dawnguard Arsenal)
globalvariable property DBM_MC_GV_DA auto
globalvariable property GV_DGA_Count auto
globalvariable property GV_DGA auto

;; Globals for set completion - Mods - (Falskaar)
globalvariable property DBM_MC_GV_Falskaar auto
globalvariable property GV_Falskaar_Count auto
globalvariable property GV_Falskaar auto

;; Globals for set completion - Mods - (Fossils)
globalvariable property DBM_MC_GV_Fossils auto
globalvariable property GV_Fossils_Count auto
globalvariable property GV_Fossils auto

;; Globals for set completion - Mods - (Gray Cowl)
globalvariable property DBM_MC_GV_GrayCowl auto
globalvariable property GV_GCON_Count auto
globalvariable property GV_GCON auto

;; Globals for set completion - Mods - (Guard Armor Replacer)
globalvariable property DBM_MC_GV_GAR auto
globalvariable property GV_GAR_Count auto
globalvariable property GV_GAR auto

;; Globals for set completion - Mods - (Heavy Armory)
globalvariable property DBM_MC_GV_HA auto
globalvariable property GV_Heavy_Count auto
globalvariable property GV_Heavy auto

;; Globals for set completion - Mods - (Helgen Reborn)
globalvariable property DBM_MC_GV_Helgen auto
globalvariable property GV_Helgen_Count auto
globalvariable property GV_Helgen auto

;; Globals for set completion - Mods - (IceBlade)
globalvariable property DBM_MC_GV_IceBlade auto
globalvariable property GV_IBOM_Count auto
globalvariable property GV_IBOM auto

;; Globals for set completion - Mods - (ICOW)
globalvariable property DBM_MC_GV_ICOW auto
globalvariable property GV_ICOW_Count auto
globalvariable property GV_ICOW auto

;; Globals for set completion - Mods - (Immersive Armors)
globalvariable property DBM_MC_GV_IA auto
globalvariable property GV_IA_Count auto
globalvariable property GV_IA auto

;; Globals for set completion - Mods - (Immersive Weapons)
globalvariable property DBM_MC_GV_IW auto
globalvariable property GV_IW_Count auto
globalvariable property GV_IW auto

;; Globals for set completion - Mods - (jaysus)
globalvariable property DBM_MC_GV_Jaysus auto
globalvariable property GV_Jaysus_Count auto
globalvariable property GV_Jaysus auto

;; Globals for set completion - Mods - (KA)
globalvariable property DBM_MC_GV_KA auto
globalvariable property GV_KA_Count auto
globalvariable property GV_KA auto

;; Globals for set completion - Mods - (TOK)
globalvariable property DBM_MC_GV_TOK auto
globalvariable property GV_Kagrenac_Count auto
globalvariable property GV_Kagrenac auto

;; Globals for set completion - Mods - (Kthonia)
globalvariable property DBM_MC_GV_KW auto
globalvariable property GV_Kthonia_Count auto
globalvariable property GV_Kthonia auto

;; Globals for set completion - Mods - (Moonpath)
globalvariable property DBM_MC_GV_Moonpath auto
globalvariable property GV_MoonPath_Count auto
globalvariable property GV_MoonPath auto

;; Globals for set completion - Mods - (MoonStar)
globalvariable property DBM_MC_GV_MoonStar auto
globalvariable property GV_MoonStar_Count auto
globalvariable property GV_MoonStar auto

;; Globals for set completion - Mods - (NTHunter)
globalvariable property DBM_MC_GV_NTH auto
globalvariable property GV_NTHunter_Count auto
globalvariable property GV_NTHunter auto

;; Globals for set completion - Mods - (OAP)
globalvariable property DBM_MC_GV_OA auto
globalvariable property GV_OA_Count auto
globalvariable property GV_OA auto

;; Globals for set completion - Mods - (PathRev)
globalvariable property DBM_MC_GV_PathRev auto
globalvariable property GV_PathRev_Count auto
globalvariable property GV_PathRev auto

;; Globals for set completion - Mods - (P-AHO)
globalvariable property DBM_MC_GV_PAHO auto
globalvariable property GV_AHO_Count auto
globalvariable property GV_AHO auto

;; Globals for set completion - Mods - (Royal Armory)
globalvariable property DBM_MC_GV_RA auto
globalvariable property GV_Royal_Count auto
globalvariable property GV_Royal auto

;; Globals for set completion - Mods - (Ruins Edge)
globalvariable property DBM_MC_GV_Ruins auto
globalvariable property GV_Ruins_Count auto
globalvariable property GV_Ruins auto

;; Globals for set completion - Mods - (Sheo Staff)
globalvariable property DBM_MC_GV_Sheo auto
globalvariable property GV_Sheo_Count auto
globalvariable property GV_Sheo auto

;; Globals for set completion - Mods - (Inn Soaps)
globalvariable property DBM_MC_GV_Soaps auto
globalvariable property GV_Soaps_Count auto
globalvariable property GV_Soaps auto

;; Globals for set completion - Mods - (Skyrim Sewers)
globalvariable property DBM_MC_GV_Sewers auto
globalvariable property GV_Sewers_Count auto
globalvariable property GV_Sewers auto

;; Globals for set completion - Mods - (SUT)
globalvariable property DBM_MC_GV_SUT auto
globalvariable property GV_SUT_Count auto
globalvariable property GV_SUT auto

;; Globals for set completion - Mods - (TFC)
globalvariable property DBM_MC_GV_TFC auto
globalvariable property GV_TFC_Count auto
globalvariable property GV_TFC auto

;; Globals for set completion - Mods - (Treasure Hunter)
globalvariable property DBM_MC_GV_TH auto
globalvariable property GV_TH_Count auto
globalvariable property GV_TH auto

;; Globals for set completion - Mods - (Undeath)
globalvariable property DBM_MC_GV_Undeath auto
globalvariable property GV_Undeath_Count auto
globalvariable property GV_Undeath auto

;; Globals for set completion - Mods - (Skyrim Underground)
globalvariable property DBM_MC_GV_SU auto
globalvariable property GV_SU_Count auto
globalvariable property GV_SU auto

;; Globals for set completion - Mods - (Vigilant)
globalvariable property DBM_MC_GV_Vig auto
globalvariable property GV_Vig_Count auto
globalvariable property GV_Vig auto

;; Globals for set completion - Mods - (Volkihar Knight)
globalvariable property DBM_MC_GV_Volk auto
globalvariable property GV_Volk_Count auto
globalvariable property GV_Volk auto

;; Globals for set completion - Mods - (Wheels Of Lull)
globalvariable property DBM_MC_GV_WOL auto
globalvariable property GV_Wheels_Count auto
globalvariable property GV_Wheels auto

;; Globals for set completion - Mods - (Wintersun)
globalvariable property DBM_MC_GV_Winter auto
globalvariable property GV_Wintersun_Count auto
globalvariable property GV_Wintersun auto

;; Globals for set completion - Mods - (Wyrmstooth)
globalvariable property DBM_MC_GV_Wyrms auto
globalvariable property GV_Wyrmstooth_Count auto
globalvariable property GV_Wyrmstooth auto

;; Globals for set completion - Mods - (Zims Thane Weapons)
globalvariable property DBM_MC_GV_ZTW auto
globalvariable property GV_ZIA_Count auto
globalvariable property GV_ZIA auto

;; Globals for set completion - Mods - (3DNPC)
globalvariable property DBM_MC_GV_3DNPC auto
globalvariable property GV_3DNPC_Count auto
globalvariable property GV_3DNPC auto

;; Globals for set completion - Museum
globalvariable property DBM_GV_SectionDragonbornHall auto
globalvariable property DBM_GV_SectionHallOfHeroes auto
globalvariable property DBM_GV_SectionLibrary auto
globalvariable property DBM_GV_SectionDaedricGallery auto
globalvariable property DBM_GV_SectionHOLE auto
globalvariable property DBM_GV_SectionHallOfOddities auto
globalvariable property DBM_GV_SectionNaturalScience auto
globalvariable property DBM_GV_SectionHallOfSecrets auto
globalvariable property DBM_GV_SectionGuildhouse auto
globalvariable property DBM_GV_SectionStoreroom auto

;; Globals For Total Count.
globalvariable property GV_SectionDragonbornHall auto
globalvariable property GV_SectionHallofHeroes auto
globalvariable property GV_SectionLibrary auto
globalvariable property GV_SectionDaedricGallery auto
globalvariable property GV_SectionHOLE auto
globalvariable property GV_SectionHallOfOddities auto
globalvariable property GV_SectionNaturalScience auto
globalvariable property GV_SectionHallOfSecrets auto
globalvariable property GV_SectionGuildhouse auto
globalvariable property GV_SectionStoreroom auto
	
;; Globals For Current Count.
globalvariable property GV_SectionDragonbornHall_Count auto
globalvariable property GV_SectionHallOfHeroes_Count auto
globalvariable property GV_SectionLibrary_Count auto
globalvariable property GV_SectionDaedricGallery_Count auto
globalvariable property GV_SectionHOLE_Count auto
globalvariable property GV_SectionHallOfOddities_Count auto
globalvariable property GV_SectionNaturalScience_Count auto
globalvariable property GV_SectionHallOfSecrets_Count auto
globalvariable property GV_SectionGuildhouse_Count auto
globalvariable property GV_SectionStoreroom_Count auto

;; Globals for set completion - Armory
globalvariable property DBM_GV_SectionArmoryAncientNord auto
globalvariable property DBM_GV_SectionArmoryBlades auto
globalvariable property DBM_GV_SectionArmoryDaedric auto
globalvariable property DBM_GV_SectionArmoryDawnguard auto
globalvariable property DBM_GV_SectionArmoryDragon auto
globalvariable property DBM_GV_SectionArmoryDwarven auto
globalvariable property DBM_GV_SectionArmoryEbony auto
globalvariable property DBM_GV_SectionArmoryElven auto
globalvariable property DBM_GV_SectionArmoryExtraDisplays auto
globalvariable property DBM_GV_SectionArmoryFalmer auto
globalvariable property DBM_GV_SectionArmoryForsworn auto
globalvariable property DBM_GV_SectionArmoryGlass auto
globalvariable property DBM_GV_SectionArmoryGuardArmorDisplay auto
globalvariable property DBM_GV_SectionArmoryIron auto
globalvariable property DBM_GV_SectionArmoryNordic auto
globalvariable property DBM_GV_SectionArmoryOrcish auto
globalvariable property DBM_GV_SectionArmorySnowElf auto
globalvariable property DBM_GV_SectionArmoryStalhrim auto
globalvariable property DBM_GV_SectionArmorySteel auto
globalvariable property DBM_GV_SectionArmoryThaneWeapons auto

;; Globals For Current Count.
globalvariable property GV_ArmoryAncientNord_Count auto
globalvariable property GV_ArmoryBlades_Count auto
globalvariable property GV_ArmoryDaedric_Count auto
globalvariable property GV_ArmoryDawnguard_Count auto
globalvariable property GV_ArmoryDragon_Count auto
globalvariable property GV_ArmoryDwarven_Count auto
globalvariable property GV_ArmoryEbony_Count auto
globalvariable property GV_ArmoryElven_Count auto
globalvariable property GV_ArmoryExtraDisplays_Count auto
globalvariable property GV_ArmoryFalmer_Count auto
globalvariable property GV_ArmoryForsworn_Count auto
globalvariable property GV_ArmoryGlass_Count auto
globalvariable property GV_ArmoryGuardArmor_Count auto
globalvariable property GV_ArmoryIron_Count auto
globalvariable property GV_ArmoryNordic_Count auto
globalvariable property GV_ArmoryOrcish_Count auto
globalvariable property GV_ArmorySnowElf_Count auto
globalvariable property GV_ArmoryStalhrim_Count auto
globalvariable property GV_ArmorySteel_Count auto
globalvariable property GV_ArmoryThane_Count auto

;; Globals For Total Count.
globalvariable property GV_ArmoryAncientNord auto
globalvariable property GV_ArmoryBlades auto
globalvariable property GV_ArmoryDaedric auto
globalvariable property GV_ArmoryDawnguard auto
globalvariable property GV_ArmoryDragon auto
globalvariable property GV_ArmoryDwarven auto
globalvariable property GV_ArmoryEbony auto
globalvariable property GV_ArmoryElven auto
globalvariable property GV_ArmoryExtraDisplays auto
globalvariable property GV_ArmoryFalmer auto
globalvariable property GV_ArmoryForsworn auto
globalvariable property GV_ArmoryGlass auto
globalvariable property GV_ArmoryGuardArmor auto
globalvariable property GV_ArmoryIron auto
globalvariable property GV_ArmoryNordic auto
globalvariable property GV_ArmoryOrcish auto
globalvariable property GV_ArmorySnowElf auto
globalvariable property GV_ArmoryStalhrim auto
globalvariable property GV_ArmorySteel auto
globalvariable property GV_ArmoryThane auto

;; Globals for set completion - Heavy Armory
globalvariable property DBM_GV_SectionArmoryHAAncientNordic auto
globalvariable property DBM_GV_SectionArmoryHABlades auto
globalvariable property DBM_GV_SectionArmoryHADaedric auto
globalvariable property DBM_GV_SectionArmoryHADawnguard auto
globalvariable property DBM_GV_SectionArmoryHADragon auto
globalvariable property DBM_GV_SectionArmoryHADwarven auto
globalvariable property DBM_GV_SectionArmoryHAEbony auto
globalvariable property DBM_GV_SectionArmoryHAElven auto
globalvariable property DBM_GV_SectionArmoryHAFalmer auto
globalvariable property DBM_GV_SectionArmoryHAForsworn auto
globalvariable property DBM_GV_SectionArmoryHAGlass auto
globalvariable property DBM_GV_SectionArmoryHAImperial auto
globalvariable property DBM_GV_SectionArmoryHAIron auto
globalvariable property DBM_GV_SectionArmoryHANordHero auto
globalvariable property DBM_GV_SectionArmoryHANordic auto
globalvariable property DBM_GV_SectionArmoryHAOrcish auto
globalvariable property DBM_GV_SectionArmoryHASilver auto
globalvariable property DBM_GV_SectionArmoryHAStalhrim auto
globalvariable property DBM_GV_SectionArmoryHASteel auto

;; Globals For Current Count.
globalvariable property GV_SectionArmoryHAAncientNordic_Count auto
globalvariable property GV_SectionArmoryHABlades_Count auto
globalvariable property GV_SectionArmoryHADaedric_Count auto
globalvariable property GV_SectionArmoryHADawnguard_Count auto
globalvariable property GV_SectionArmoryHADragon_Count auto
globalvariable property GV_SectionArmoryHADwarven_Count auto
globalvariable property GV_SectionArmoryHAEbony_Count auto
globalvariable property GV_SectionArmoryHAElven_Count auto
globalvariable property GV_SectionArmoryHAFalmer_Count auto
globalvariable property GV_SectionArmoryHAForsworn_Count auto
globalvariable property GV_SectionArmoryHAGlass_Count auto
globalvariable property GV_SectionArmoryHAImperial_Count auto
globalvariable property GV_SectionArmoryHAIron_Count auto
globalvariable property GV_SectionArmoryHANordHero_Count auto
globalvariable property GV_SectionArmoryHANordic_Count auto
globalvariable property GV_SectionArmoryHAOrcish_Count auto
globalvariable property GV_SectionArmoryHASilver_Count auto
globalvariable property GV_SectionArmoryHAStalhrim_Count auto
globalvariable property GV_SectionArmoryHASteel_Count auto

;; Globals For Total Count.
globalvariable property GV_SectionArmoryHAAncientNordic auto
globalvariable property GV_SectionArmoryHABlades auto
globalvariable property GV_SectionArmoryHADaedric auto
globalvariable property GV_SectionArmoryHADawnguard auto
globalvariable property GV_SectionArmoryHADragon auto
globalvariable property GV_SectionArmoryHADwarven auto
globalvariable property GV_SectionArmoryHAEbony auto
globalvariable property GV_SectionArmoryHAElven auto
globalvariable property GV_SectionArmoryHAFalmer auto
globalvariable property GV_SectionArmoryHAForsworn auto
globalvariable property GV_SectionArmoryHAGlass auto
globalvariable property GV_SectionArmoryHAImperial auto
globalvariable property GV_SectionArmoryHAIron auto
globalvariable property GV_SectionArmoryHANordHero auto
globalvariable property GV_SectionArmoryHANordic auto
globalvariable property GV_SectionArmoryHAOrcish auto
globalvariable property GV_SectionArmoryHASilver auto
globalvariable property GV_SectionArmoryHAStalhrim auto
globalvariable property GV_SectionArmoryHASteel auto

;; Globals for set completion - Immersive Weapons
globalvariable property DBM_GV_DaedricGalleryImmersiveWeapons auto
globalvariable property DBM_GV_ImmersiveWeaponsAncientNordic auto
globalvariable property DBM_GV_ImmersiveWeaponsBlades auto
globalvariable property DBM_GV_ImmersiveWeaponsDaedric auto
globalvariable property DBM_GV_ImmersiveWeaponsDawnguard auto
globalvariable property DBM_GV_ImmersiveWeaponsDragon auto
globalvariable property DBM_GV_ImmersiveWeaponsDwarven auto
globalvariable property DBM_GV_ImmersiveWeaponsEbony auto
globalvariable property DBM_GV_ImmersiveWeaponsElven auto
globalvariable property DBM_GV_ImmersiveWeaponsFalmer auto
globalvariable property DBM_GV_ImmersiveWeaponsGlass auto
globalvariable property DBM_GV_ImmersiveWeaponsIron auto
globalvariable property DBM_GV_ImmersiveWeaponsOrcish auto
globalvariable property DBM_GV_ImmersiveWeaponsSteel auto
globalvariable property DBM_GV_ImmersiveWeaponsWolf auto
globalvariable property DBM_GV_SectionHOHImmersiveWeapons auto

;; Globals For Current Count.
globalvariable property GV_DaedricGalleryImmersiveWeapons_Count auto
globalvariable property GV_ImmersiveWeaponsAncientNordic_Count auto
globalvariable property GV_ImmersiveWeaponsBlades_Count auto
globalvariable property GV_ImmersiveWeaponsDaedric_Count auto
globalvariable property GV_ImmersiveWeaponsDawnguard_Count auto
globalvariable property GV_ImmersiveWeaponsDragon_Count auto
globalvariable property GV_ImmersiveWeaponsDwarven_Count auto
globalvariable property GV_ImmersiveWeaponsEbony_Count auto
globalvariable property GV_ImmersiveWeaponsElven_Count auto
globalvariable property GV_ImmersiveWeaponsFalmer_Count auto
globalvariable property GV_ImmersiveWeaponsGlass_Count auto
globalvariable property GV_ImmersiveWeaponsIron_Count auto
globalvariable property GV_ImmersiveWeaponsOrcish_Count auto
globalvariable property GV_ImmersiveWeaponsSteel_Count auto
globalvariable property GV_ImmersiveWeaponsWolf_Count auto
globalvariable property GV_SectionHOHImmersiveWeapons_Count auto

;; Globals For Total Count.
globalvariable property GV_DaedricGalleryImmersiveWeapons auto
globalvariable property GV_ImmersiveWeaponsAncientNordic auto
globalvariable property GV_ImmersiveWeaponsBlades auto
globalvariable property GV_ImmersiveWeaponsDaedric auto
globalvariable property GV_ImmersiveWeaponsDawnguard auto
globalvariable property GV_ImmersiveWeaponsDragon auto
globalvariable property GV_ImmersiveWeaponsDwarven auto
globalvariable property GV_ImmersiveWeaponsEbony auto
globalvariable property GV_ImmersiveWeaponsElven auto
globalvariable property GV_ImmersiveWeaponsFalmer auto
globalvariable property GV_ImmersiveWeaponsGlass auto
globalvariable property GV_ImmersiveWeaponsIron auto
globalvariable property GV_ImmersiveWeaponsOrcish auto
globalvariable property GV_ImmersiveWeaponsSteel auto
globalvariable property GV_ImmersiveWeaponsWolf auto
globalvariable property GV_SectionHOHImmersiveWeapons auto

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event OnConfigInit()
	
	RN_Thane_Listener_Total.SetValue(9)
	RN_Skills_Listener_Total.SetValue(6)
	CustomContainer.SetValue(1)
	AddDynamicPagesList()
EndEvent

;-- Events --------------------------------

Event AddDynamicPagesList()

	ModName = "LOTD: The Curators Companion"
	PagesList = new String[10]
	PagesList[0] = "General Settings"
	PagesList[1] = "Scan & Advanced"
	PagesList[2] = "Relic Storage"
	PagesList[3] = ""
	PagesList[4] = "~~Completion~~"
	PagesList[5] = "Museum Sections"
	PagesList[6] = "Armory Sections"
	PagesList[7] = "Supported Mods"
	PagesList[8] = ""
	PagesList[9] = "Debug Options"
	
	Int Q = 0
	Int x = 10
		
  Pages = Utility.CreateStringArray(x)
  Int index = x
  While index >= 1
    index -= 1 
    Pages[index] = PagesList[index]  
  EndWhile
EndEvent	

;-- Events --------------------------------

Event OnPageReset(string page)

	if page == ""
		LoadCustomContent("TCC/CuratorSplash.swf", 50, -32)
	else
		UnloadCustomContent()
	endIf
	
	AddSettingsPage()
	AddAdvancedPage()
	AddRelicStoragePage()
	AddMuseumSetsPage()
	AddArmorySetsPage()
	AddCompletedModsPage()
	AddDebugPage()
	InitmoreHUDChoiceList()
	InitMCMStrings()
EndEvent

;-- Events --------------------------------

Event InitmoreHUDChoiceList()

	moreHUDChoiceList = new string[5]
	moreHUDChoiceList[0] = "Show All Icons"
	moreHUDChoiceList[1] = "Show New Icons"
	moreHUDChoiceList[2] = "Show Found Icons"
	moreHUDChoiceList[3] = "Show Displayed Icons"
	moreHUDChoiceList[4] = "Hide All Icons"
EndEvent

;-- Events --------------------------------

Event InitMCMStrings()

	MCM_Strings = new string[28]
	MCM_Strings[0] = "Developed By (Ic0n)Ic0de"
	MCM_Strings[1] = "Version 1.1.3"
	MCM_Strings[2] = "<font color='#750e0e'>Invalid Version</font>"
	MCM_Strings[3] = "<font color='#750e0e'>Not Found</font>"
	MCM_Strings[4] = "Complete"
	MCM_Strings[5] = "Scan"
	MCM_Strings[6] = "Hide"
	MCM_Strings[7] = "Disabled"
	MCM_Strings[8] = "Enabled"
	MCM_Strings[9] = "Add Spell"
	MCM_Strings[10] = "Remove Spell"
	MCM_Strings[11] = "Default Message"
	MCM_Strings[12] = "Simple Notification"
	MCM_Strings[13] = "Access"
	MCM_Strings[14] = "<font color='#2b6320'>Authorised</font>"
	MCM_Strings[15] = "Enter Password"
	MCM_Strings[16] = "Load Preset"
	MCM_Strings[17] = "FISS Not Found"
	MCM_Strings[18] = "Save Preset"
	MCM_Strings[19] = "Reload MCM"
	MCM_Strings[20] = "Show"
	MCM_Strings[21] = "Locked"
	MCM_Strings[22] = "Requires Perk"
	MCM_Strings[23] = "Setting Up"
	MCM_Strings[24] = "Update Figures Now"
	MCM_Strings[25] = "<font color='#2b6320'>Installed</font>"
	MCM_Strings[26] = "Restore"
EndEvent

		;;<font color='COLORHERE'>
		
		;;</font>
		
		;;#2b6320 - Green
		;;#750e0e - Red
	
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Settings Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
Event AddSettingsPage()

	if CurrentPage == "General Settings"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("Notification Settings:")	
		AddTextOptionST("iRelicMuseumNotifications", "Museum Notifications:", self.GetMuseumNotificationsString(), 0)
		AddTextOptionST("iRelicArmoryNotifications", "Armory Notifications:", self.GetArmoryNotificationsString(), 0)	
		
		if RN_SupportedModCount.GetValue() > 0
			AddTextOptionST("iRelicModsNotifications", "Supported Mods Notifications:", self.GetModsNotificationsString(), 0)
		else
			AddTextOptionST("iRelicModsNotifications", "Supported Mods Notifications:", "No Patches Found", 1)
		endIF
		
		AddTextOptionST("iRelicListenerNotifications", "Museum Display Notifications:", self.GetListenerString(), 0)
		AddTextOptionST("iRelicSetCompleteNotifications", "Set Completion Notifications:", self.GetCompleteNotificationsString(), 0)
		AddEmptyOption()		
		AddHeaderOption("General Settings:")
		AddTextOptionST("iRelicSimpleNotifications", "Notification Style:", self.GetNotificationsString(), 0)
			

			
		AddTextOptionST("RefreshMCM", "Something not working?", MCM_Strings[19], 0)
		
		SetCursorPosition(1)			
		AddHeaderOption("Mod Info:")
		AddTextOption("Thanks for using The Curators Companion, a full", "", 0)
		AddTextOption("featured add-on for Legacy of the Dragonborn.", "", 0)
		AddEmptyOption()
		AddTextOption("", MCM_Strings[0], 0)
		AddTextOption("", MCM_Strings[1], 0)		
		AddEmptyOption()
		AddHeaderOption("Profile Settings:")
		AddTextOptionST("Config_Save", "FISS - User Profile", self.GetConfigSaveString(), 0)
		AddTextOptionST("Config_Load", "FISS - User Profile", self.GetConfigLoadString(), 0)
		AddTextOptionST("Config_Author", "Developers Preset", self.GetConfigAuthorString(), 0)
		AddTextOptionST("Config_Default", "Restore Defaults", self.GetConfigDefaultString(), 0)	
			
	endif
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Settings Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
Event AddAdvancedPage()

	if CurrentPage == "Scan & Advanced"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("moreHUD Settings:")
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017 || SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
			AddMenuOptionST("moreHUDOptions", "moreHUD Icon Settings:", moreHUDChoiceList[IndexmoreHUD])	
		else
			AddtextOption("moreHUD Icon Settings:", MCM_Strings[3])
		endif
		AddTextOptionST("ReplicaTagging", "moreHUD Advanced Tagging:", self.GetReplicaTaggingOptions(), 0)
		
		AddEmptyOption()
		
		AddHeaderOption("Museum Scan:")
		AddTextOptionST("ScanAll", "Scan Displays (All Displays)", MCM_Strings[5], 0)
		AddTextOptionST("ScanMuseum", "Scan Displays (Museum)", MCM_Strings[5], 0)
		AddTextOptionST("ScanArmory", "Scan Displays (Armory)", MCM_Strings[5], 0)
		
		if RN_SupportedModCount.GetValue() > 0
			AddTextOptionST("ScanMods", "Scan Displays (Mods)", MCM_Strings[5], 0)
		else
			AddTextOptionST("ScanMods", "Scan Displays (Mods)", "No Patches Found", 1)
		endIf
								
		SetCursorPosition(1)
		
		AddHeaderOption("General Settings:")
		AddTextOptionST("PrepStationTransfer", "Prep Station Settings:", self.GetPrepStationOptions(), 0)
		AddTextOptionST("iRelicShowStartup", "Startup Notifications:", self.GetShowStartup(), 0)		
		
		AddEmptyOption()
		
		AddHeaderOption("Scan Info:")
		AddTextOption("You can run these scans to update the info and figures", "", 0)
		AddTextOption("within the MCM, the mod will automatically update all", "", 0)
		AddTextOption("the required information during the scan and check for", "", 0)
		AddTextOption("any completed sets or Museum sections.", "", 0)	
			
	endif
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Settings Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
Event AddRelicStoragePage()

	if CurrentPage == "Relic Storage"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		
		AddHeaderOption("Relic Storage Settings:")
		
			if Game.GetPlayer().HasPerk(DBM_ArcPerkRelicHunter) || ShowStorageSpellOverideVal
				AddTextOptionST("iRelicStorageOptions", "Relic Storage Container:", self.GetStorageOptions(), 0)
			else
				AddTextOptionST("iRelicStorageOptions", "Relic Storage Container:", self.GetStorageOptions(), 1)
			endIf
			
			if StorageSpellVal
				AddTextOptionST("iRelicStorageTransfer", "Auto Relic Storage:", self.GetTransferOptions(), 0)
			else
				AddTextOptionST("iRelicStorageTransfer", "Auto Relic Storage:", self.GetTransferOptions(), 1)
			endIf
		
		
		AddEmptyOption()
		AddHeaderOption("Auto Storage Options:")
			if !StorageSpellVal || !AutoTransferRelics
				AddToggleOptionST("Transfer_Weapon", "Weapons", AllowWeapon, 1)
				AddToggleOptionST("Transfer_Armor", "Armor", AllowArmor, 1)
				AddToggleOptionST("Transfer_Book", "Books", AllowBook, 1)
				AddToggleOptionST("Transfer_Gems", "Gems & Soul Gems", AllowGems, 1)
				AddToggleOptionST("Transfer_Potion", "Potions", AllowPotion, 1)
				AddToggleOptionST("Transfer_Key", "Keys", AllowKey, 1)
				AddToggleOptionST("Transfer_Misc", "Misc Items", AllowMisc, 1)
			else
				AddToggleOptionST("Transfer_Weapon", "Weapons", AllowWeapon, 0)
				AddToggleOptionST("Transfer_Armor", "Armor", AllowArmor, 0)
				AddToggleOptionST("Transfer_Book", "Books", AllowBook, 0)
				AddToggleOptionST("Transfer_Gems", "Gems & Soul Gems", AllowGems, 0)
				AddToggleOptionST("Transfer_Potion", "Potions", AllowPotion, 0)
				AddToggleOptionST("Transfer_Key", "Keys", AllowKey, 0)	
				AddToggleOptionST("Transfer_Misc", "Misc Items", AllowMisc, 0)
			endIf
		
		SetCursorPosition(1)
		AddHeaderOption("Custom Storage Containers: (" + CustomContainer.GetValue() as int + "/6)")
		
		Int _IndexOpt = 0
		ObjectReference _Container
		String _ContainerLocation
		
		Int _Index = RN_TokenFormlist_NoShipment.GetSize()
		While _Index
			_Index -= 1
			_Container = RN_TokenFormlist_NoShipment.GetAt(_Index) as ObjectReference				
			_ContainerLocation = _Container.GetCurrentLocation().GetName()
				if !_ContainerLocation
					_ContainerLocation = _Container.GetparentCell().GetName()
					if !_ContainerLocation
						_ContainerLocation = "Unknown Location"
					endIf
				endIf

			_IndexOpt = AddTextOption(_Container.GetDisplayName(), _ContainerLocation, 0)
		endWhile
		
		AddEmptyOption()
		AddTextOptionST("ShowCustomContainerInfo", "Custom Storage Info:", "Show Information", 0)
		
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Museum Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddMuseumSetsPage()

	if CurrentPage == "Museum Sections"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		if (DBM_SortWait.GetValue())
			AddHeaderOption("Information:")
			AddTextOption("This Page is currently unavailable due to an on-going", "", 0)
			AddTextOption("process, this could include:", "", 0)
			AddEmptyOption()
			AddTextOption("-Mod Setup.", "", 0)
			AddTextOption("-Display Scanning features.", "", 0)
			AddTextOption("-Sorting via Prep Station.", "", 0)
			AddTextOption("-Sorting via Display Drop-Off.", "", 0)
			AddEmptyOption()
			AddTextOption("Please exit the MCM and wait for the current operation", "", 0)
			AddTextOption("to finish.", "", 0)			
			SetCursorPosition(1)
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddTextOption("'Patience is the calm acceptance that things can happen", "", 0)
			AddTextOption("in a different order than the one you have in your mind'", "", 0)
			AddTextOption("                                   -David G. Allen", "", 0)		
		else		
			AddHeaderOption("Museum Sections:")	

			if (DBM_GV_SectionDragonbornHall.GetValue()) == 1
				AddTextOption("Dragonborn Hall:", MCM_Strings[4], 1)
			else
				AddTextOption("Dragonborn Hall:", self.GetCurrentCount(GV_SectionDragonbornHall_Count, GV_SectionDragonbornHall), 0)
			endIf

			if (DBM_GV_SectionHallOfHeroes.GetValue()) == 1
				AddTextOption("Hall of Heroes:", MCM_Strings[4], 1)
			else
				AddTextOption("Hall of Heroes:", self.GetCurrentCount(GV_SectionHallOfHeroes_Count, GV_SectionHallofHeroes), 0)
			endIf
			
			if (DBM_GV_SectionLibrary.GetValue()) == 1
				AddTextOption("Library:", MCM_Strings[4], 1)
			else
				AddTextOption("Library:", self.GetCurrentCount(GV_SectionLibrary_Count, GV_SectionLibrary), 0)
			endIf			
			
			if (DBM_GV_SectionDaedricGallery.GetValue()) == 1
				AddTextOption("Daedric Gallery:", MCM_Strings[4], 1)
			else
				AddTextOption("Daedric Gallery:", self.GetCurrentCount(GV_SectionDaedricGallery_Count, GV_SectionDaedricGallery), 0)
			endIf			

			if (DBM_GV_SectionNaturalScience.GetValue()) == 1
				AddTextOption("Natural Science:", MCM_Strings[4], 1)
			else
				AddTextOption("Natural Science:", self.GetCurrentCount(GV_SectionNaturalScience_Count, GV_SectionNaturalScience), 0)
			endIf
			
			if (DBM_GV_SectionHOLE.GetValue()) == 1
				AddTextOption("Hall of Lost Empires:", MCM_Strings[4], 1)
			else
				AddTextOption("Hall of Lost Empires:", self.GetCurrentCount(GV_SectionHOLE_Count, GV_SectionHOLE), 0)
			endIf

			if (DBM_GV_SectionHallOfOddities.GetValue()) == 1
				AddTextOption("Hall of Oddities:", MCM_Strings[4], 1)
			else
				AddTextOption("Hall of Oddities:", self.GetCurrentCount(GV_SectionHallOfOddities_Count, GV_SectionHallOfOddities), 0)
			endIf

			if (DBM_GV_SectionHallOfSecrets.GetValue()) == 1
				AddTextOption("Hall of Secrets:", MCM_Strings[4], 1)
			else
				AddTextOption("Hall of Secrets:", self.GetCurrentCount(GV_SectionHallOfSecrets_Count, GV_SectionHallOfSecrets), 0)
			endIf
			
			if (DBM_GV_SectionGuildhouse.GetValue()) == 1
				AddTextOption("Guildhouse:", MCM_Strings[4], 1)
			else
				AddTextOption("Guildhouse:", self.GetCurrentCount(GV_SectionGuildhouse_Count, GV_SectionGuildhouse), 0)
			endIf			

			if (DBM_GV_SectionStoreroom.GetValue()) == 1
				AddTextOption("Storeroom:", MCM_Strings[4], 1)
			else
				AddTextOption("Storeroom:", self.GetCurrentCount(GV_SectionStoreroom_Count, GV_SectionStoreroom), 0)
			endIf
			
			AddEmptyOption()
			AddHeaderOption("Museum Displays:")
			
			if (RN_Quest_Listener_Complete.GetValue()) == 1
				AddTextOption("Quest Displays:", MCM_Strings[4], 1)
			else
				AddTextOption("Quest Displays:", self.GetCurrentCount(RN_Quest_Listener_Count, RN_Quest_Listener_Total), 0)
			endIf			

			if (RN_Exploration_Listener_Complete.GetValue()) == 1
				AddTextOption("Exploration Displays:", MCM_Strings[4], 1)
			else
				AddTextOption("Exploration Displays:", self.GetCurrentCount(RN_Exploration_Listener_Count, RN_Exploration_Listener_Total), 0)
			endIf

			if (RN_Skills_Listener_Complete.GetValue()) == 1
				AddTextOption("Skills Displays:", MCM_Strings[4], 1)
			else
				AddTextOption("Skills Displays:", self.GetCurrentCount(RN_Skills_Listener_Count, RN_Skills_Listener_Total), 0)
			endIf

			if (RN_Thane_Listener_Complete.GetValue()) == 1
				AddTextOption("Thane of the Holds:", MCM_Strings[4], 1)
			else
				AddTextOption("Thane of the Holds:", self.GetCurrentCount(RN_Thane_Listener_Count, RN_Thane_Listener_Total), 0)
			endIf
			
			AddEmptyOption()
			AddHeaderOption("Player Wealth:")
			AddTextOption("Safehouse Treasury Value:", RN_Treasury_Count.GetValue() as Int, 0)
			AddTextOption("Deepholme Treasury Value:", Self.GetTreasuryCountString2(), 0)
			AddTextOption("Karagas' Tower Treasury Value:", Self.GetTreasuryCountString3(), 0)
			
			SetCursorPosition(1)
			AddHeaderOption("Page Information:")
			AddTextOption("This page lists all Museum sections that can be completed.", "", 0)
			AddEmptyOption()
			AddTextOption("As you collect and display your items, the page will keep", "", 0)
			AddTextOption("track of your progess.", "", 0)
			AddEmptyOption()
			AddTextOption("Run the Museum Scan from the MCM or Prep station to", "", 0)
			AddTextOption("update the current figures.", "", 0)
			AddEmptyOption()
			AddEmptyOption()
			AddTextOption("Completed:", self.GetCurrentMuseumCount(iMuseumSets), 0)
			AddEmptyOption()
			AddHeaderOption("Display Information:")
			AddTextOption("This section automatically updates and tracks the", "", 0)
			AddTextOption("displays being added to the Museum as a result of", "", 0)
			AddTextOption("quest completion, Exploration and skill levelling.", "", 0)
			AddTextOption("Completed:", self.GetDisplaySectionCount(iDisplaySectionComplete), 0)
			AddEmptyOption()
			AddHeaderOption("Wealth Information:")
			AddTextOption("This section tracks the amount of Gold within the treasury", "", 0)
			AddTextOption("rooms, the figures update after adding / removing Gold.", "", 0)
			AddTextOption("Total value:", self.GetTotalTreasuryValue(RN_Treasury_Count, RN_Treasury_Count2, RN_Treasury_Count3), 0)
		endIf
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------ Armory Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Event AddArmorySetsPage()

	if CurrentPage == "Armory Sections"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)				
		if (DBM_SortWait.GetValue())
			AddHeaderOption("Information:")
			AddTextOption("This Page is currently unavailable due to an on-going", "", 0)
			AddTextOption("process, this could include:", "", 0)
			AddEmptyOption()
			AddTextOption("-Mod Setup.", "", 0)
			AddTextOption("-Display Scanning features.", "", 0)
			AddTextOption("-Sorting via Prep Station.", "", 0)
			AddTextOption("-Sorting via Display Drop-Off.", "", 0)
			AddEmptyOption()
			AddTextOption("Please exit the MCM and wait for the current operation", "", 0)
			AddTextOption("to finish.", "", 0)			
			SetCursorPosition(1)
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddTextOption("'Patience is the calm acceptance that things can happen", "", 0)
			AddTextOption("in a different order than the one you have in your mind'", "", 0)
			AddTextOption("                                   -David G. Allen", "", 0)			
		else
			
			AddHeaderOption("Armory Sets:")
			if (DBM_GV_SectionArmoryAncientNord.GetValue()) == 1
				AddTextOption("Ancient Nord Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Ancient Nord Set:", self.GetCurrentCount(GV_ArmoryAncientNord_Count, GV_ArmoryAncientNord), 0)
			endIf	
		
			if (DBM_GV_SectionArmoryBlades.GetValue()) == 1
				AddTextOption("Blades Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Blades Set:", self.GetCurrentCount(GV_ArmoryBlades_Count, GV_ArmoryBlades), 0)
			endIf			
			
			if (DBM_GV_SectionArmoryDaedric.GetValue()) == 1
				AddTextOption("Daedric Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Daedric Set:", self.GetCurrentCount(GV_ArmoryDaedric_Count, GV_ArmoryDaedric), 0)
			endIf	
		
			if (DBM_GV_SectionArmoryDawnguard.GetValue()) == 1
				AddTextOption("Dawnguard Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Dawnguard Set:", self.GetCurrentCount(GV_ArmoryDawnguard_Count, GV_ArmoryDawnguard), 0)
			endIf				
			
			if (DBM_GV_SectionArmoryDragon.GetValue()) == 1
				AddTextOption("Dragon Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Dragon Set:", self.GetCurrentCount(GV_ArmoryDragon_Count, GV_ArmoryDragon), 0)
			endIf	
		
			if (DBM_GV_SectionArmoryDwarven.GetValue()) == 1
				AddTextOption("Dwarven Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Dwarven Set:", self.GetCurrentCount(GV_ArmoryDwarven_Count, GV_ArmoryDwarven), 0)
			endIf			
			
			if (DBM_GV_SectionArmoryEbony.GetValue()) == 1
				AddTextOption("Ebony Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Ebony Set:", self.GetCurrentCount(GV_ArmoryEbony_Count, GV_ArmoryEbony), 0)
			endIf	
		
			if (DBM_GV_SectionArmoryElven.GetValue()) == 1
				AddTextOption("Elven Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Elven Set:", self.GetCurrentCount(GV_ArmoryElven_Count, GV_ArmoryElven), 0)
			endIf				

			if (DBM_GV_SectionArmoryFalmer.GetValue()) == 1
				AddTextOption("Falmer Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Falmer Set:", self.GetCurrentCount(GV_ArmoryFalmer_Count, GV_ArmoryFalmer), 0)
			endIf	
		
			if (DBM_GV_SectionArmoryForsworn.GetValue()) == 1
				AddTextOption("Forsworn Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Forsworn Set:", self.GetCurrentCount(GV_ArmoryForsworn_Count, GV_ArmoryForsworn), 0)
			endIf			
			
			AddTextOptionST("ScanArmory", "", MCM_Strings[24], 0)
			AddEmptyOption()
		
			if (RN_Mod.XX_HeavyArmL)		
				AddHeaderOption("Heavy Armory Sets:")

				if (DBM_GV_SectionArmoryHAAncientNordic.GetValue()) == 1
					AddTextOption("Ancient Nord Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Ancient Nord Set:", self.GetCurrentCount(GV_SectionArmoryHAAncientNordic_Count, GV_SectionArmoryHAAncientNordic), 0)
				endIf	

				if (DBM_GV_SectionArmoryHABlades.GetValue()) == 1
					AddTextOption("Blades Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Blades Set:", self.GetCurrentCount(GV_SectionArmoryHABlades_Count, GV_SectionArmoryHABlades), 0)
				endIf			
				
				if (DBM_GV_SectionArmoryHADaedric.GetValue()) == 1
					AddTextOption("Daedric Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Daedric Set:", self.GetCurrentCount(GV_SectionArmoryHADaedric_Count, GV_SectionArmoryHADaedric), 0)
				endIf	
			
				if (DBM_GV_SectionArmoryHADawnguard.GetValue()) == 1
					AddTextOption("Dawnguard Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Dawnguard Set:", self.GetCurrentCount(GV_SectionArmoryHADawnguard_Count, GV_SectionArmoryHADaedric), 0)
				endIf				
				
				if (DBM_GV_SectionArmoryHADragon.GetValue()) == 1
					AddTextOption("Dragon Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Dragon Set:", self.GetCurrentCount(GV_SectionArmoryHADragon_Count, GV_SectionArmoryHADragon), 0)
				endIf	
			
				if (DBM_GV_SectionArmoryHADwarven.GetValue()) == 1
					AddTextOption("Dwarven Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Dwarven Set:", self.GetCurrentCount(GV_SectionArmoryHADwarven_Count, GV_SectionArmoryHADwarven), 0)
				endIf			
				
				if (DBM_GV_SectionArmoryHAEbony.GetValue()) == 1
					AddTextOption("Ebony Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Ebony Set:", self.GetCurrentCount(GV_SectionArmoryHAEbony_Count, GV_SectionArmoryHAEbony), 0)
				endIf	
			
				if (DBM_GV_SectionArmoryHAElven.GetValue()) == 1
					AddTextOption("Elven Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Elven Set:", self.GetCurrentCount(GV_SectionArmoryHAElven_Count, GV_SectionArmoryHAElven), 0)
				endIf				

				if (DBM_GV_SectionArmoryHAFalmer.GetValue()) == 1
					AddTextOption("Falmer Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Falmer Set:", self.GetCurrentCount(GV_SectionArmoryHAFalmer_Count, GV_SectionArmoryHAFalmer), 0)
				endIf	
			
				if (DBM_GV_SectionArmoryHAForsworn.GetValue()) == 1
					AddTextOption("Forsworn Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Forsworn Set:", self.GetCurrentCount(GV_SectionArmoryHAForsworn_Count, GV_SectionArmoryHAForsworn), 0)
				endIf	
								
				AddTextOptionST("ScanHeavyArm", "", MCM_Strings[24], 0)
				AddEmptyOption()
			endIf
			
			if (RN_Mod.XX_ImmWeapL)			
				AddHeaderOption("Immersive Weapons Sets:")

				if (DBM_GV_ImmersiveWeaponsAncientNordic.GetValue()) == 1
					AddTextOption("Ancient Nord Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Ancient Nord Set:", self.GetCurrentCount(GV_ImmersiveWeaponsAncientNordic_Count, GV_ImmersiveWeaponsAncientNordic), 0)
				endIf	
			
				if (DBM_GV_ImmersiveWeaponsBlades.GetValue()) == 1
					AddTextOption("Blades Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Blades Set:", self.GetCurrentCount(GV_ImmersiveWeaponsBlades_Count, GV_ImmersiveWeaponsBlades), 0)
				endIf			
				
				if (DBM_GV_ImmersiveWeaponsDaedric.GetValue()) == 1
					AddTextOption("Daedric Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Daedric Set:", self.GetCurrentCount(GV_ImmersiveWeaponsDaedric_Count, GV_ImmersiveWeaponsDaedric), 0)
				endIf	
			
				if (DBM_GV_ImmersiveWeaponsDawnguard.GetValue()) == 1
					AddTextOption("Dawnguard Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Dawnguard Set:", self.GetCurrentCount(GV_ImmersiveWeaponsDawnguard_Count, GV_ImmersiveWeaponsDawnguard), 0)
				endIf				
				
				if (DBM_GV_ImmersiveWeaponsDragon.GetValue()) == 1
					AddTextOption("Dragon Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Dragon Set:", self.GetCurrentCount(GV_ImmersiveWeaponsDragon_Count, GV_ImmersiveWeaponsDragon), 0)
				endIf	
			
				if (DBM_GV_ImmersiveWeaponsDwarven.GetValue()) == 1
					AddTextOption("Dwarven Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Dwarven Set:", self.GetCurrentCount(GV_ImmersiveWeaponsDwarven_Count, GV_ImmersiveWeaponsDwarven), 0)
				endIf			
				
				if (DBM_GV_ImmersiveWeaponsEbony.GetValue()) == 1
					AddTextOption("Ebony Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Ebony Set:", self.GetCurrentCount(GV_ImmersiveWeaponsEbony_Count, GV_ImmersiveWeaponsEbony), 0)
				endIf	
			
				if (DBM_GV_ImmersiveWeaponsElven.GetValue()) == 1
					AddTextOption("Elven Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Elven Set:", self.GetCurrentCount(GV_ImmersiveWeaponsElven_Count, GV_ImmersiveWeaponsElven), 0)
				endIf
				
				
				AddTextOptionST("ScanImmWeap", "", MCM_Strings[24], 0)
				AddEmptyOption()
			endIf
		
			SetCursorPosition(1)
			
			AddHeaderOption("")
			
			if (DBM_GV_SectionArmoryGlass.GetValue()) == 1
				AddTextOption("Glass Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Glass Set:", self.GetCurrentCount(GV_ArmoryGlass_Count, GV_ArmoryGlass), 0)
			endIf	
		
			if (DBM_GV_SectionArmoryGuardArmorDisplay.GetValue()) == 1
				AddTextOption("Guard Armor Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Guard Armor Set:", self.GetCurrentCount(GV_ArmoryGuardArmor_Count, GV_ArmoryGuardArmor), 0)
			endIf				
			
			if (DBM_GV_SectionArmoryIron.GetValue()) == 1
				AddTextOption("Iron Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Iron Set:", self.GetCurrentCount(GV_ArmoryIron_Count, GV_ArmoryIron), 0)
			endIf	

			if (DBM_GV_SectionArmoryExtraDisplays.GetValue()) == 1
				AddTextOption("Misc Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Misc Set:", self.GetCurrentCount(GV_ArmoryExtraDisplays_Count, GV_ArmoryExtraDisplays), 0)
			endIf	
			
			if (DBM_GV_SectionArmoryNordic.GetValue()) == 1
				AddTextOption("Nordic Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Nordic Set:", self.GetCurrentCount(GV_ArmoryNordic_Count, GV_ArmoryNordic), 0)
			endIf			
			
			if (DBM_GV_SectionArmoryOrcish.GetValue()) == 1
				AddTextOption("Orcish Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Orcish Set:", self.GetCurrentCount(GV_ArmoryOrcish_Count, GV_ArmoryOrcish), 0)
			endIf	
		
			if (DBM_GV_SectionArmorySnowElf.GetValue()) == 1
				AddTextOption("Snow Elf Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Snow Elf Set:", self.GetCurrentCount(GV_ArmorySnowElf_Count, GV_ArmorySnowElf), 0)
			endIf
			
			if (DBM_GV_SectionArmoryStalhrim.GetValue()) == 1
				AddTextOption("Stalhrim Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Stalhrim Set:", self.GetCurrentCount(GV_ArmoryStalhrim_Count, GV_ArmoryStalhrim), 0)
			endIf			
			
			if (DBM_GV_SectionArmorySteel.GetValue()) == 1
				AddTextOption("Steel Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Steel Set:", self.GetCurrentCount(GV_ArmorySteel_Count, GV_ArmorySteel), 0)
			endIf	
		
			if (DBM_GV_SectionArmoryThaneWeapons.GetValue()) == 1
				AddTextOption("Thane Weapons Set:", MCM_Strings[4], 1)
			else
				AddTextOption("Thane Weapons Set:", self.GetCurrentCount(GV_ArmoryThane_Count, GV_ArmoryThane), 0)
			endIf
						
			AddTextOption("Completed:", self.GetCurrentArmoryCount(iArmorySets), 0)
			AddEmptyOption()
			
			if (RN_Mod.XX_HeavyArmL)
				AddHeaderOption("")
				
				if (DBM_GV_SectionArmoryHAGlass.GetValue()) == 1
					AddTextOption("Glass Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Glass Set:", self.GetCurrentCount(GV_SectionArmoryHAGlass_Count, GV_SectionArmoryHAGlass), 0)
				endIf	
			
				if (DBM_GV_SectionArmoryHAImperial.GetValue()) == 1
					AddTextOption("Imperial Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Imperial Set:", self.GetCurrentCount(GV_SectionArmoryHAImperial_Count, GV_SectionArmoryHAImperial), 0)
				endIf				
				
				if (DBM_GV_SectionArmoryHAIron.GetValue()) == 1
					AddTextOption("Iron Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Iron Set:", self.GetCurrentCount(GV_SectionArmoryHAIron_Count, GV_SectionArmoryHAIron), 0)
				endIf	

				if (DBM_GV_SectionArmoryHANordHero.GetValue()) == 1
					AddTextOption("Nord Hero Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Nord Hero Set:", self.GetCurrentCount(GV_SectionArmoryHANordHero_Count, GV_SectionArmoryHANordHero), 0)
				endIf	
				
				if (DBM_GV_SectionArmoryHANordic.GetValue()) == 1
					AddTextOption("Nordic Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Nordic Set:", self.GetCurrentCount(GV_SectionArmoryHANordic_Count, GV_SectionArmoryHANordic), 0)
				endIf			
				
				if (DBM_GV_SectionArmoryHAOrcish.GetValue()) == 1
					AddTextOption("Orcish Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Orcish Set:", self.GetCurrentCount(GV_SectionArmoryHAOrcish_Count, GV_SectionArmoryHAOrcish), 0)
				endIf	
			
				if (DBM_GV_SectionArmoryHASilver.GetValue()) == 1
					AddTextOption("Silver Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Silver Set:", self.GetCurrentCount(GV_SectionArmoryHASilver_Count, GV_SectionArmoryHASilver), 0)
				endIf
				
				if (DBM_GV_SectionArmoryHAStalhrim.GetValue()) == 1
					AddTextOption("Stalhrim Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Stalhrim Set:", self.GetCurrentCount(GV_SectionArmoryHAStalhrim_Count, GV_SectionArmoryHAStalhrim), 0)
				endIf			
				
				if (DBM_GV_SectionArmoryHASteel.GetValue()) == 1
					AddTextOption("Steel Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Steel Set:", self.GetCurrentCount(GV_SectionArmoryHASteel_Count, GV_SectionArmoryHASteel), 0)
				endIf
				
				AddEmptyOption()
				AddTextOption("Completed:", self.GetCurrentHACount(iHeavyArmSets) + " Sets", 0)
				AddEmptyOption()
			endIf
			
			if RN_Mod.XX_ImmWeapL
				AddHeaderOption("")
				
				if (DBM_GV_ImmersiveWeaponsFalmer.GetValue()) == 1
					AddTextOption("Falmer Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Falmer Set:", self.GetCurrentCount(GV_ImmersiveWeaponsFalmer_Count, GV_ImmersiveWeaponsFalmer), 0)
				endIf				
				
				if (DBM_GV_ImmersiveWeaponsGlass.GetValue()) == 1
					AddTextOption("Glass Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Glass Set:", self.GetCurrentCount(GV_ImmersiveWeaponsGlass_Count, GV_ImmersiveWeaponsGlass), 0)
				endIf				
							
				if (DBM_GV_ImmersiveWeaponsIron.GetValue()) == 1
					AddTextOption("Iron Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Iron Set:", self.GetCurrentCount(GV_ImmersiveWeaponsIron_Count, GV_ImmersiveWeaponsIron), 0)
				endIf	

				if (DBM_GV_ImmersiveWeaponsOrcish.GetValue()) == 1
					AddTextOption("Orcish Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Orcish Set:", self.GetCurrentCount(GV_ImmersiveWeaponsOrcish_Count, GV_ImmersiveWeaponsOrcish), 0)
				endIf	

				if (DBM_GV_ImmersiveWeaponsSteel.GetValue()) == 1
					AddTextOption("Steel Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Steel Set:", self.GetCurrentCount(GV_ImmersiveWeaponsSteel_Count, GV_ImmersiveWeaponsSteel), 0)
				endIf	

				if (DBM_GV_ImmersiveWeaponsWolf.GetValue()) == 1
					AddTextOption("Wolf Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Wolf Set:", self.GetCurrentCount(GV_ImmersiveWeaponsWolf_Count, GV_ImmersiveWeaponsWolf), 0)
				endIf	
				
				if (DBM_GV_DaedricGalleryImmersiveWeapons.GetValue()) == 1
					AddTextOption("Daedric Gallery Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Daedric Gallery Set:", self.GetCurrentCount(GV_DaedricGalleryImmersiveWeapons_Count, GV_DaedricGalleryImmersiveWeapons), 0)
				endIf			
				
				if (DBM_GV_SectionHOHImmersiveWeapons.GetValue()) == 1
					AddTextOption("Hall Of Heroes Set:", MCM_Strings[4], 1)
				else
					AddTextOption("Hall Of Heroes Set:", self.GetCurrentCount(GV_SectionHOHImmersiveWeapons_Count, GV_SectionHOHImmersiveWeapons), 0)
				endIf
											
				AddTextOption("Completed:", self.GetCurrentIWCount(iImmWeapSets) + " Sets", 0)
				AddEmptyOption()
			endIf				
		endif
	endIf
endEvent		

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------Mods Page -------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddCompletedModsPage()

	if CurrentPage == "Supported Mods"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)		
		if (DBM_SortWait.GetValue())
			AddHeaderOption("Information:")
			AddTextOption("This Page is currently unavailable due to an on-going", "", 0)
			AddTextOption("process, this could include:", "", 0)
			AddEmptyOption()
			AddTextOption("-Mod Setup.", "", 0)
			AddTextOption("-Display Scanning features.", "", 0)
			AddTextOption("-Sorting via Prep Station.", "", 0)
			AddTextOption("-Sorting via Display Drop-Off.", "", 0)
			AddEmptyOption()
			AddTextOption("Please exit the MCM and wait for the current operation", "", 0)
			AddTextOption("to finish.", "", 0)			
			SetCursorPosition(1)
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddEmptyOption()
			AddTextOption("'Patience is the calm acceptance that things can happen", "", 0)
			AddTextOption("in a different order than the one you have in your mind'", "", 0)
			AddTextOption("                                   -David G. Allen", "", 0)			
		else
			AddHeaderOption("Installed Mods:")
			
			if RN_SupportedModCount.GetValue() > 0
				if (RN_Mod.XX_AetheriumL)	
					if (DBM_MC_GV_Aetherium.GetValue()) == 1
						AddTextOption("Aetherium Armor and Weapons:", MCM_Strings[4], 1)
					else
						AddTextOption("Aetherium Armor and Weapons:", self.GetCurrentCount(GV_SectionHOLEAetherium_Count, GV_SectionHOLEAetherium), 0)
					endIf
				endIf

				if (RN_Mod.XX_AmuletsSkyrimL)			
					if (DBM_MC_GV_Amulets.GetValue()) == 1
						AddTextOption("Amulets of Skyrim", MCM_Strings[4], 1)
					else
						AddTextOption("Amulets of Skyrim", self.GetCurrentCount(GV_AmuletsDisplay_Count, GV_AmuletsDisplay), 0)
					endIf
				endIf

				if (RN_Mod.XX_BoethiahL)
					if (DBM_MC_GV_Boethiah.GetValue()) == 1
						AddTextOption("Artifacts of Boethiah", MCM_Strings[4], 1)
					else
						AddTextOption("Artifacts of Boethiah", self.GetCurrentCount(GV_AOB_Count, GV_AOB), 0)
					endIf
				endIf	

				if (RN_Mod.XX_ArtifactsSkyrimL)			
					if (DBM_MC_GV_AOS.GetValue()) == 1
						AddTextOption("Artifacts of Skyrim", MCM_Strings[4], 1)
					else
						AddTextOption("Artifacts of Skyrim", self.GetCurrentCount(GV_Artifacts_Skyrim_Count, GV_Artifacts_Skyrim), 0)
					endIf
				endIf
					
				if (RN_Mod.XX_BadGremlinL)
					if (DBM_MC_GV_BG.GetValue()) == 1
						AddTextOption("Bad Gremlins Collectables", MCM_Strings[4], 1)
					else
						AddTextOption("Bad Gremlins Collectables", self.GetCurrentCount(GV_BadGremlin_Count, GV_BadGremlin), 0)
					endIf
				endIf	

				if (RN_Mod.XX_CloaksL)			
					if (DBM_MC_GV_Cloaks.GetValue()) == 1
						AddTextOption("Cloaks of Skyrim", MCM_Strings[4], 1)
					else
						AddTextOption("Cloaks of Skyrim", self.GetCurrentCount(GV_Cloaks_Count, GV_Cloaks), 0)
					endIf
				endIf

				if (RN_Mod.XX_ClockworkL)
					if (DBM_MC_GV_Clockwork.GetValue()) == 1
						AddTextOption("Clockwork", MCM_Strings[4], 1)
					else
						AddTextOption("Clockwork", self.GetCurrentCount(GV_Clockwork_Count, GV_Clockwork), 0)
					endIf
				endIf	

				if (RN_Mod.XX_DawnguardArsenalL)			
					if (DBM_MC_GV_DA.GetValue()) == 1
						AddTextOption("Dawnguard Arsenal", MCM_Strings[4], 1)
					else
						AddTextOption("Dawnguard Arsenal", self.GetCurrentCount(GV_DGA_Count, GV_DGA), 0)
					endIf
				endIf
					
				if (RN_Mod.XX_FalskaarL)	
					if (DBM_MC_GV_Falskaar.GetValue()) == 1
						AddTextOption("Falskaar", MCM_Strings[4], 1)
					else
						AddTextOption("Falskaar", self.GetCurrentCount(GV_Falskaar_Count, GV_Falskaar), 0)
					endIf
				endIf

				if (RN_Mod.XX_FossilsL)			
					if (DBM_MC_GV_Fossils.GetValue()) == 1
						AddTextOption("Fossil Mining", MCM_Strings[4], 1)
					else
						AddTextOption("Fossil Mining", self.GetCurrentCount(GV_Fossils_Count, GV_Fossils), 0)
					endIf
				endIf

				if (RN_Mod.XX_GrayCowlL)
					if (DBM_MC_GV_GrayCowl.GetValue()) == 1
						AddTextOption("The Gray Cowl Of Nocturnal", MCM_Strings[4], 1)
					else
						AddTextOption("The Gray Cowl Of Nocturnal", self.GetCurrentCount(GV_GCON_Count, GV_GCON), 0)
					endIf
				endIf	

				if (RN_Mod.XX_GuardArmL)			
					if (DBM_MC_GV_GAR.GetValue()) == 1
						AddTextOption("Guard Armor Replacer", MCM_Strings[4], 1)
					else
						AddTextOption("Guard Armor Replacer", self.GetCurrentCount(GV_GAR_Count, GV_GAR), 0)
					endIf
				endIf
					
				if (RN_Mod.XX_HeavyArmL)
					if (DBM_MC_GV_HA.GetValue()) == 1
						AddTextOption("Heavy Armory", MCM_Strings[4], 1)
					else
						AddTextOption("Heavy Armory", self.GetCurrentCount(GV_Heavy_Count, GV_Heavy), 0)
					endIf
				endIf	

				if (RN_Mod.XX_HelgenL)			
					if (DBM_MC_GV_Helgen.GetValue()) == 1
						AddTextOption("Helgen Reborn", MCM_Strings[4], 1)
					else
						AddTextOption("Helgen Reborn", self.GetCurrentCount(GV_Helgen_Count, GV_Helgen), 0)
					endIf
				endIf

				if (RN_Mod.XX_IceBladeL)
					if (DBM_MC_GV_IceBlade.GetValue()) == 1
						AddTextOption("Ice Blade of the Monarch", MCM_Strings[4], 1)
					else
						AddTextOption("Ice Blade of the Monarch", self.GetCurrentCount(GV_IBOM_Count, GV_IBOM), 0)
					endIf
				endIf	

				if (RN_Mod.XX_ImmersiveL)			
					if (DBM_MC_GV_ICOW.GetValue()) == 1
						AddTextOption("Immersive College Of Winterhold", MCM_Strings[4], 1)
					else
						AddTextOption("Immersive College Of Winterhold", self.GetCurrentCount(GV_ICOW_Count, GV_ICOW), 0)
					endIf
				endIf
				
				if (RN_Mod.XX_ImmArmL)	
					if (DBM_MC_GV_IA.GetValue()) == 1
						AddTextOption("Immersive Armors", MCM_Strings[4], 1)
					else
						AddTextOption("Immersive Armors", self.GetCurrentCount(GV_IA_Count, GV_IA), 0)
					endIf
				endIf

				if (RN_Mod.XX_ImmWeapL)			
					if (DBM_MC_GV_IW.GetValue()) == 1
						AddTextOption("Immersive Weapons", MCM_Strings[4], 1)
					else
						AddTextOption("Immersive Weapons", self.GetCurrentCount(GV_IW_Count, GV_IW), 0)
					endIf
				endIf

				if (RN_Mod.XX_3DNPC)			
					if (DBM_MC_GV_3DNPC.GetValue()) == 1
						AddTextOption("Interesting NPC's", MCM_Strings[4], 1)
					else
						AddTextOption("Interesting NPC's", self.GetCurrentCount(GV_3DNPC_Count, GV_3DNPC), 0)
					endIf
				endIf



				if (RN_Mod.XX_JaysusL) || (RN_Mod.XX_JaysusCraftL)
					if (DBM_MC_GV_Jaysus.GetValue()) == 1
						AddTextOption("Jaysus Swords", MCM_Strings[4], 1)
					else
						AddTextOption("Jaysus Swords", self.GetCurrentCount(GV_Jaysus_Count, GV_Jaysus), 0)
					endIf
				endIf	

				if (RN_Mod.XX_KonahrikL)			
					if (DBM_MC_GV_KA.GetValue()) == 1
						AddTextOption("konahrik's accoutrements", MCM_Strings[4], 1)
					else
						AddTextOption("konahrik's accoutrements", self.GetCurrentCount(GV_KA_Count, GV_KA), 0)
					endIf
				endIf
					
				if (RN_Mod.XX_KagrenacL)
					if (DBM_MC_GV_TOK.GetValue()) == 1
						AddTextOption("Tools of Kagrenac", MCM_Strings[4], 1)
					else
						AddTextOption("Tools of Kagrenac", self.GetCurrentCount(GV_Kagrenac_Count, GV_Kagrenac), 0)
					endIf
				endIf	

				if (RN_Mod.XX_KthoniaL)			
					if (DBM_MC_GV_KW.GetValue()) == 1
						AddTextOption("Kthonia's Weapon Pack", MCM_Strings[4], 1)
					else
						AddTextOption("Kthonia's Weapon Pack", self.GetCurrentCount(GV_Kthonia_Count, GV_Kthonia), 0)
					endIf
				endIf

				if (RN_Mod.XX_MoonpathL)
					if (DBM_MC_GV_Moonpath.GetValue()) == 1
						AddTextOption("Moonpath to Elsweyr", MCM_Strings[4], 1)
					else
						AddTextOption("Moonpath to Elsweyr", self.GetCurrentCount(GV_MoonPath_Count, GV_MoonPath), 0)
					endIf
				endIf	

				if (RN_Mod.XX_MoonStarL)			
					if (DBM_MC_GV_MoonStar.GetValue()) == 1
						AddTextOption("Moon and Star", MCM_Strings[4], 1)
					else
						AddTextOption("Moon and Star", self.GetCurrentCount(GV_MoonStar_Count, GV_MoonStar), 0)
					endIf
				endIf
					
				if (RN_Mod.XX_NTHunterL) || (RN_Mod.XX_NTHunterESLL)
					if (DBM_MC_GV_NTH.GetValue()) == 1
						AddTextOption("New Treasure Hunt", MCM_Strings[4], 1)
					else
						AddTextOption("New Treasure Hunt", self.GetCurrentCount(GV_NTHunter_Count, GV_NTHunter), 0)
					endIf
				endIf

				if (RN_Mod.XX_OblivionArtL)			
					if (DBM_MC_GV_OA.GetValue()) == 1
						AddTextOption("Oblivion Artifacts", MCM_Strings[4], 1)
					else
						AddTextOption("Oblivion Artifacts", self.GetCurrentCount(GV_OA_Count, GV_OA), 0)
					endIf
				endIf

				if (RN_Mod.XX_PathRevL)
					if (DBM_MC_GV_PathRev.GetValue()) == 1
						AddTextOption("Path of the Revanant", MCM_Strings[4], 1)
					else
						AddTextOption("Path of the Revanant", self.GetCurrentCount(GV_PathRev_Count, GV_PathRev), 0)
					endIf
				endIf	

				if (RN_Mod.XX_ProjectAHOL)			
					if (DBM_MC_GV_PAHO.GetValue()) == 1
						AddTextOption("Project AHO", MCM_Strings[4], 1)
					else
						AddTextOption("Project AHO", self.GetCurrentCount(GV_AHO_Count, GV_AHO), 0)
					endIf
				endIf
					
				if (RN_Mod.XX_RoyalL)
					if (DBM_MC_GV_RA.GetValue()) == 1
						AddTextOption("Royal Armory", MCM_Strings[4], 1)
					else
						AddTextOption("Royal Armory", self.GetCurrentCount(GV_Royal_Count, GV_Royal), 0)
					endIf
				endIf	

				if (RN_Mod.XX_RuinsEdgeL)			
					if (DBM_MC_GV_Ruins.GetValue()) == 1
						AddTextOption("Ruins Edge", MCM_Strings[4], 1)
					else
						AddTextOption("Ruins Edge", self.GetCurrentCount(GV_Ruins_Count, GV_Ruins), 0)
					endIf
				endIf

				if (RN_Mod.XX_SheoStaffL)
					if (DBM_MC_GV_Sheo.GetValue()) == 1
						AddTextOption("Staff of Sheogorath", MCM_Strings[4], 1)
					else
						AddTextOption("Staff of Sheogorath", self.GetCurrentCount(GV_Sheo_Count, GV_Sheo), 0)
					endIf
				endIf	

				if (RN_Mod.XX_SoapsL) || (RN_Mod.XX_SoapsKICL)			
					if (DBM_MC_GV_Soaps.GetValue()) == 1
						AddTextOption("Inn Soaps", MCM_Strings[4], 1)
					else
						AddTextOption("Inn Soaps", self.GetCurrentCount(GV_Soaps_Count, GV_Soaps), 0)
					endIf
				endIf

				if (RN_Mod.XX_SkyrimSewers)
					if (DBM_MC_GV_Sewers.GetValue()) == 1
						AddTextOption("Skyrim Sewers", MCM_Strings[4], 1)
					else
						AddTextOption("Skyrim Sewers", self.GetCurrentCount(GV_Sewers_Count, GV_Sewers), 0)
					endIf
				endIf	
				
				if (RN_Mod.XX_SUTL)
					if (DBM_MC_GV_SUT.GetValue()) == 1
						AddTextOption("Skyrim Unique Treasures", MCM_Strings[4], 1)
					else
						AddTextOption("Skyrim Unique Treasures", self.GetCurrentCount(GV_SUT_Count, GV_SUT), 0)
					endIf
				endIf	

				if (RN_Mod.XX_ForgottenL)			
					if (DBM_MC_GV_TFC.GetValue()) == 1
						AddTextOption("The Forgotten City", MCM_Strings[4], 1)
					else
						AddTextOption("The Forgotten City", self.GetCurrentCount(GV_TFC_Count, GV_TFC), 0)
					endIf
				endIf

				if (RN_Mod.XX_TreasureHuntL)
					if (DBM_MC_GV_TH.GetValue()) == 1
						AddTextOption("Treasure Hunter", MCM_Strings[4], 1)
					else
						AddTextOption("Treasure Hunter", self.GetCurrentCount(GV_TH_Count, GV_TH), 0)
					endIf
				endIf	

				if (RN_Mod.XX_UndeathL)			
					if (DBM_MC_GV_Undeath.GetValue()) == 1
						AddTextOption("Undeath", MCM_Strings[4], 1)
					else
						AddTextOption("Undeath", self.GetCurrentCount(GV_Undeath_Count, GV_Undeath), 0)
					endIf
				endIf

				if (RN_Mod.XX_UndergroundL) || (RN_Mod.XX_UndergroundESPL)
					if (DBM_MC_GV_SU.GetValue()) == 1
						AddTextOption("Skyrim Underground", MCM_Strings[4], 1)
					else
						AddTextOption("Skyrim Underground", self.GetCurrentCount(GV_SU_Count, GV_SU), 0)
					endIf
				endIf	

				if (RN_Mod.XX_VigilantL)		
					if (DBM_MC_GV_Vig.GetValue()) == 1
						AddTextOption("Vigilant.", MCM_Strings[4], 1)
					else
						AddTextOption("Vigilant.", self.GetCurrentCount(GV_Vig_Count, GV_Vig), 0)
					endIf
				endIf

				if (RN_Mod.XX_VolkiharL)		
					if (DBM_MC_GV_Volk.GetValue()) == 1
						AddTextOption("Volkihar Knight", MCM_Strings[4], 1)
					else
						AddTextOption("Volkihar Knight", self.GetCurrentCount(GV_Volk_Count, GV_Volk), 0)
					endIf
				endIf

				if (RN_Mod.XX_WheelsOfLullL)
					if (DBM_MC_GV_WOL.GetValue()) == 1
						AddTextOption("The Wheels of Lull", MCM_Strings[4], 1)
					else
						AddTextOption("The Wheels of Lull", self.GetCurrentCount(GV_Wheels_Count, GV_Wheels), 0)
					endIf
				endIf	

				if (RN_Mod.XX_WintersunL)			
					if (DBM_MC_GV_Winter.GetValue()) == 1
						AddTextOption("Wintersun", MCM_Strings[4], 1)
					else
						AddTextOption("Wintersun", self.GetCurrentCount(GV_Wintersun_Count, GV_Wintersun), 0)
					endIf
				endIf

				if (RN_Mod.XX_WyrmstoothL)
					if (DBM_MC_GV_Wyrms.GetValue()) == 1
						AddTextOption("Wyrmstooth", MCM_Strings[4], 1)
					else
						AddTextOption("Wyrmstooth", self.GetCurrentCount(GV_Wyrmstooth_Count, GV_Wyrmstooth), 0)
					endIf
				endIf	

				if (RN_Mod.XX_ZimThaneL) || (RN_Mod.XX_ZimThaneOnlyL)			
					if (DBM_MC_GV_ZTW.GetValue()) == 1
						AddTextOption("Zim's Thane Weapons", MCM_Strings[4], 1)
					else
						AddTextOption("Zim's Thane Weapons", self.GetCurrentCount(GV_ZIA_Count, GV_ZIA), 0)
					endIf
				endIf
			else
				AddTextOption("No Patches Installed", "", 1)
			endIf

			SetCursorPosition(1)
			AddHeaderOption("Page Information:")
			AddTextOption("This page lists all the installed and supported mods.", "", 0)
			AddEmptyOption()
			AddTextOption("As you collect and display your items, the page will", "", 0)
			AddTextOption("keep track of your progess.", "", 0)
			AddEmptyOption()			
			AddTextOption("Run the Mods Scan from the MCM or Prep station to", "", 0)
			AddTextOption("update the current figures.", "", 0)
			AddEmptyOption()
			AddTextOption("Completed ", self.GetCurrentCount(iModComplete, RN_SupportedModCount) + " Supported Mods", 0)			
		endIf
	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------- Debug Page ------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event AddDebugPage()

	if CurrentPage == "Debug Options"
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		AddHeaderOption("Debug Options:")
		
		inputOID_I = AddInputOption("Debug Options:", InputBox)
		AddEmptyOption()
		
		if (RN_Debug_Access.GetValue()) == (RN_Debug_Randomiser.GetValue())
			
			AddToggleOptionST("iRelicLocationDebug", "Disable Location Checks", ShowLocationOverrideVal)
			AddToggleOptionST("iRelicSpellDebug", "Disable Spell Requirements", ShowStorageSpellOverideVal)
			AddToggleOptionST("Dev_Alerts", "Developer Debugging", DevDebugVal)
			
			AddEmptyOption()
			AddHeaderOption("moreHUD Debug:")
			AddTextOption("moreHUD new count:", dbmNew.GetSize() As Int, 0)
			AddTextOption("moreHUD found count:", dbmFound.GetSize() As Int, 0)
			AddTextOption("moreHUD Displayed count:", dbmDisp.GetSize() As Int, 0)
			AddTextOption("moreHUD total Count:", dbmMaster.GetSize() As Int, 0)
			AddEmptyOption()
			AddTextOptionST("RevertLists", "Reset moreHUD Lists", "", 0)
			AddTextOptionST("RebuildLists", "Rebuild moreHUD Items", "", 0)
			AddEmptyOption()
			AddHeaderOption("Items Debug:")
			AddTextOption("Supported Mods Merged count:", Supported_Items_Merged.GetSize() As Int, 0)
			AddTextOption("Supported Mods Found count:", Supported_Items_Found.GetSize() As Int, 0)			
			
		else
		
			AddTextOption("This mods debug options have been password protected", "", 0)
			AddTextOption("due to the nature of the tasks they perform.", "", 0)
			AddEmptyOption()
			AddTextOption("Users should have absolutely no reason to use them", "", 0)
			AddTextOption("so they have been locked, if you require support or", "", 0)
			AddTextOption("help with an issue please reach out to me on Nexus.", "", 0)	
		endIf
		
		SetCursorPosition(1)
		
		AddHeaderOption("Mod Requirements:")

		if SKSE.GetPluginVersion("fisses") > 0
		
			AddTextOption("FISSES:", MCM_Strings[25] + " [" + SKSE.GetPluginVersion("fisses") + "]", 0)
			
		else
		
			AddTextOption("FISSES:", MCM_Strings[3], 0)
			
		endIf

		if SKSE.GetVersion() > 0
			Int fSKSE = SKSE.GetVersion() * 10000 + SKSE.GetVersionMinor() * 100 + SKSE.GetVersionBeta()
			AddTextOption("SKSE:", MCM_Strings[25] + " [" + fSKSE + "]", 0)
			
		else
		
			AddTextOption("SKSE:", MCM_Strings[3], 0)
			
		endIf

		if (RN_Mod.XX_SkyUI)
		
			AddTextOption("SkyUI:", MCM_Strings[25] + " [5.2SE]", 0)
			
		else
		
			AddTextOption("SkyUI:", MCM_Strings[3], 0)
			
		endIf	
		
		AddEmptyOption()
		AddHeaderOption("Icon Support:")
		
		;;<font color='COLORHERE'>$FF_Sandbox</font>
		
		;;#2b6320 - Green
		;;#750e0e - Red
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
		
			AddTextOption("moreHUD:", MCM_Strings[25] + " [" + SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") + "]", 0)
			
		elseif SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") < 30800
		
			AddTextOption("moreHUD:", MCM_Strings[2], 0)
		
		else
			
			AddTextOption("moreHUD:", MCM_Strings[3], 0)
			
		endIf
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017
		
			AddTextOption("moreHUD Inventory Edition:", MCM_Strings[25] + " [" + SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") + "]", 0)
			
		elseif SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") < 10017
		
			AddTextOption("moreHUD Inventory Edition:", MCM_Strings[2], 0)
		
		else
		
			AddTextOption("moreHUD Inventory Edition:", MCM_Strings[3], 0)
			
		endIf

	endIf
endEvent

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- General States------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state RefreshMCM

	function OnSelectST()
	
			ShowMessage("Please exit MCM and re-enter again to see changes", false, "Ok")
			SetTitleText("===PLEASE WAIT===")
			AddDynamicPagesList()
			ForcePageReset()
	endFunction

	function OnHighlightST()

		self.SetInfoText("Force refresh Mod list and reload the MCM - use if installed mods don't automatically show up.")
	endFunction
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------ Config Save / Load -------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state Config_Save

	Event OnSelectST()
	
		Begin_Config_Save()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Save current settings to Config File (Requires FISS)")
	EndEvent
endState

String function GetConfigSaveString()
	
		if (RN_Mod.XX_FissL)
			Status_Return = MCM_Strings[18]
		else
			Status_Return = MCM_Strings[17]
		endIf
	return Status_Return
endFunction	

;-- Save States / Function --------------------------------

Function Begin_Config_Save()
FISSInterface fiss = FISSFactory.getFISS()

	If !fiss
		self.ShowMessage("FISS not installed, unable to save user settings to config file", false, "Ok")
			return
	endIf
	
	fiss.beginSave("TheCuratorsCompanion_Config.xml", "LOTD:The Curators Companion")
		
	fiss.saveBool("Museum Notifications", ShowMuseumVal)
	fiss.saveBool("Armory Notifications", ShowArmoryVal)
	fiss.saveBool("Supported Mods Notifications", ShowModsVal)
	fiss.saveBool("Show Section/Set Complete Notifications", ShowSetCompleteVal)
	fiss.saveBool("Show Basic Notifications", ShowSimpleNotificationVal)
	fiss.saveBool("Museum Display Listener", ShowListenerVal)
	
	fiss.saveBool("Show startup notifications", ShowStartup)
	
	fiss.saveBool("Safe Storage Spell", StorageSpellVal)
	fiss.saveBool("Relic Transfer", AutoTransferRelics)
	fiss.saveInt("Prep Station Transfer", PrepTransfer) 
	
	fiss.saveBool("AllowWeapon", AllowWeapon)
	fiss.saveBool("AllowArmor", AllowArmor)
	fiss.saveBool("AllowBook", AllowBook)
	fiss.saveBool("AllowPotion", AllowPotion)
	fiss.saveBool("AllowKey", AllowKey)
	fiss.saveBool("AllowGems", AllowGems)	
	fiss.saveBool("AllowMisc", AllowMisc)	
	
	if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017 || SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800	
		fiss.saveInt("moreHUDOption", IndexmoreHUD)		
	endIf
	
	fiss.saveBool("Show Spoilers", RN_Tracker._bSpoilers)
	fiss.saveBool("Hide Incomplete", RN_Tracker._HideIncomplete)
	
	fiss.saveInt("Helgen Option", RN_Tracker._Helgen_Index)
	fiss.saveInt("Legacy Option", RN_Tracker._Legacy_Index)
	
	string saveResult = fiss.endSave()
		If (saveResult != "")
			self.ShowMessage("Fiss Save Error - Please check the log", false, "Ok")
		else
			self.ShowMessage("User settings saved successfully to Config file", false, "Ok")
		endIf
EndFunction

;-- Load States / Function --------------------------------

state Config_Load

	Event OnSelectST()
		
		Begin_Config_Load()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Load user settings from Config File (Requires FISS)")
	EndEvent
endState

String function GetConfigLoadString()

		if (RN_Mod.XX_FissL)
			Status_Return = MCM_Strings[16]
		else
			Status_Return = MCM_Strings[17]
		endIf
	return Status_Return
endFunction	

;-- Load States / Function --------------------------------

state Config_Default

	Event OnSelectST()
	
		 if self.ShowMessage("This will Restore all MCM options back to default including moreHUD icons... do you want to Restore now?", true, "Restore", "Cancel")
			Begin_Config_Default()
		endIf
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Restore MCM Options To Default")
	EndEvent
endState

String function GetConfigDefaultString()

	return MCM_Strings[26]
endFunction	

;-- Load States / Function --------------------------------

state Config_Author

	Event OnSelectST()
	
		 if self.ShowMessage("This will set all MCM options to the Developers preferred setup, limited notifications, full moreHUD support and a less invasive but still full featured preset... do you want to configure now?", true, "Configure", "Cancel")
			Begin_Config_Author()
		endIf
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Configuration profile for the Developers personal and preferred setup")
	EndEvent
endState

String function GetConfigAuthorString()

	return MCM_Strings[16]
endFunction	

;-- Load States / Function --------------------------------

Function Begin_Config_Load()
FISSInterface fiss = FISSFactory.getFISS()
	
	_UserSettings = false
	
	If !fiss && IsInMenuMode()
		self.ShowMessage("FISS not installed, unable to load user settings from config file", false, "Ok")
			return
	endIf
	
	fiss.beginLoad("TheCuratorsCompanion_Config.xml")	
	
	ShowMuseumVal = fiss.loadBool("Museum Notifications")
	ShowArmoryVal = fiss.loadBool("Armory Notifications")
	ShowModsVal = fiss.loadBool("Supported Mods Notifications")
	ShowSetCompleteVal = fiss.loadBool("Show Section/Set Complete Notifications")
	ShowSimpleNotificationVal = fiss.loadBool("Show Basic Notifications")
	ShowListenerVal = fiss.loadBool("Museum Display Listener")
	ShowStartup = fiss.loadBool("Show startup notifications")	

	StorageSpellVal= fiss.loadBool("Safe Storage Spell")
		if !StorageSpellVal
			if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
				(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
			endIf
			
		elseif StorageSpellVal
			if (!Game.GetPlayer().HasSpell(RN_Storage_Spell))
				(Game.GetPlayer().AddSpell(RN_Storage_Spell))
			endif	
		endIf
			
	AutoTransferRelics = fiss.loadBool("Relic Transfer")
		if AutoTransferRelics
			RN_Transfer.GoToState("")
			
		else
			RN_Transfer.GoToState("Disabled")
		endIf
	
	PrepTransfer = fiss.loadInt("Prep Station Transfer") 	
	AllowWeapon = fiss.loadBool("AllowWeapon")
	AllowArmor = fiss.loadBool("AllowArmor")
	AllowBook = fiss.loadBool("AllowBook")
	AllowPotion = fiss.loadBool("AllowPotion")
	AllowKey = fiss.loadBool("AllowKey")
	AllowGems = fiss.loadBool("AllowGems")
	AllowMisc = fiss.loadBool("AllowMisc")
	
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017
		
			IndexmoreHUD = fiss.loadInt("moreHUDOption")
	
			if IndexmoreHUD == 0
				RN_moreHUD_Option.SetValue(1)
				AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
				AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
				AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif IndexmoreHUD == 1
				RN_moreHUD_Option.SetValue(2)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)

			elseif IndexmoreHUD == 2
				RN_moreHUD_Option.SetValue(3)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
				AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif IndexmoreHUD == 3
				RN_moreHUD_Option.SetValue(4)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
				AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)	

			elseif IndexmoreHUD == 4
				RN_moreHUD_Option.SetValue(5)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
				
			endIf	
				
		endif

		if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
		
			IndexmoreHUD = fiss.loadInt("moreHUDOption")
	
			if IndexmoreHUD == 0
				RN_moreHUD_Option.SetValue(1)
				AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
				AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
				AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif IndexmoreHUD == 1
				RN_moreHUD_Option.SetValue(2)
				AhzmoreHUD.UnRegisterIconFormList("dbmFound")
				AhzmoreHUD.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)

			elseif IndexmoreHUD == 2
				RN_moreHUD_Option.SetValue(3)
				AhzmoreHUD.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUD.UnRegisterIconFormList("dbmNew")
				AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif IndexmoreHUD == 3
				RN_moreHUD_Option.SetValue(4)
				AhzmoreHUD.UnRegisterIconFormList("dbmNew")
				AhzmoreHUD.UnRegisterIconFormList("dbmFound")
				AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)

			elseif IndexmoreHUD == 4
				RN_moreHUD_Option.SetValue(5)
				AhzmoreHUD.UnRegisterIconFormList("dbmNew")
				AhzmoreHUD.UnRegisterIconFormList("dbmDisp")
				AhzmoreHUD.UnRegisterIconFormList("dbmFound")
				
			endIf	
				
		endif
	
	RN_Tracker._bSpoilers = fiss.loadBool("Show Spoilers")
	RN_Tracker._HideIncomplete = fiss.loadBool("Hide Incomplete")
	
	RN_Tracker._Helgen_Index = fiss.loadInt("Helgen Option")
	RN_Tracker._Legacy_Index = fiss.loadInt("Legacy Option")
	
	string loadResult = fiss.endLoad()
		If (loadResult != "")
			if IsInMenuMode()
				self.ShowMessage("Fiss Load Error - No config file found", false, "Ok")
			endIf
			_UserSettings = false
			Begin_Config_Default()
		else
			if IsInMenuMode()
				self.ShowMessage("User settings loaded successfully from Config file", false, "Ok")
				ForcePageReset()
			endIF
			_UserSettings = true
		endIf
EndFunction	

;-- Load States / Function --------------------------------

Function Begin_Config_Default()

	ShowMuseumVal = True
	ShowArmoryVal = True
	ShowModsVal = True
	ShowSetCompleteVal = True
	ShowSimpleNotificationVal = True
	ShowListenerVal = True
	ShowLocationOverrideVal = False
	ShowStorageSpellOverideVal = False
	DevDebugVal = False
	ShowStartup = True
	PrepTransfer = 1
	
	StorageSpellVal = False
	if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
		(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
	endIf
	
	IndexmoreHUD = 0
	
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
			AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
			AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
			AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
		endIf
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017	
			AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
			AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
			AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
		endIf
	
	AutoTransferRelics = False
	RN_Transfer.GoToState("Disabled")
	
	AllowWeapon = False
	AllowArmor = False
	AllowBook = False
	AllowPotion = False
	AllowKey = False
	AllowGems = False
	AllowMisc = False
	
	RN_Tracker._bSpoilers = false
	RN_Tracker._HideIncomplete = false
	
	RN_Tracker._Helgen_Index = 0
	RN_Tracker._Legacy_Index = 0
	
	if IsInMenuMode()
		ForcePageReset()
	endIf
endFunction

;-- Load States / Function --------------------------------

Function Begin_Config_Author()

	ShowMuseumVal = False
	ShowArmoryVal = False
	ShowModsVal = False
	ShowSetCompleteVal = True
	ShowSimpleNotificationVal = True
	ShowListenerVal = True
	ShowLocationOverrideVal = False
	ShowStorageSpellOverideVal = False
	DevDebugVal = False
	ShowStartup = False
	PrepTransfer = 1
	
	IndexmoreHUD = 0
	
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
			AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
			AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
			AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
		endIf
		
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017	
			AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
			AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
			AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
		endIf
	
	if Game.GetPlayer().HasPerk(DBM_ArcPerkRelicHunter)
		AutoTransferRelics = True
		RN_Transfer.GoToState("")
		AllowWeapon = True
		AllowArmor = True
		AllowBook = True
		AllowPotion = True
		AllowKey = True
		AllowGems = True
		AllowMisc = True
		StorageSpellVal = True
		if !(Game.GetPlayer().HasSpell(RN_Storage_Spell))
			(Game.GetPlayer().AddSpell(RN_Storage_Spell))
		endIf
	else
		AutoTransferRelics = False
		RN_Transfer.GoToState("Disabled")
		AllowWeapon = False
		AllowArmor = False
		AllowBook = False
		AllowPotion = False
		AllowKey = False
		AllowGems = False
		AllowMisc = False
		StorageSpellVal = False
		if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
			(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
		endIf
	endIf
	
	RN_Tracker._bSpoilers = True
	RN_Tracker._HideIncomplete = false
	
	if IsInMenuMode()
		ForcePageReset()
	endIf
endFunction

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Museum Scan Options--------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state ScanAll

	function OnSelectST()	
	
	PlayerRef.GetCurrentLocation()	
		if (PlayerRef.IsInLocation(DBM_DragonbornGalleryLocation)) || (PlayerRef.IsInLocation(DBM_GuildHouseSolitudeLocation)) && (PlayerRef.IsInInterior()) || ShowLocationOverrideVal	
		
			if ShowMessage("This will start the process of Scanning all available sections for completed sets... do you want to scan now?", true, "Scan", "Cancel")
				ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")
				RN_Utility.ScanAll()
			endIf
		else	
			ShowMessage("You must be inside the Museum to carry out this operation.", false, "OK")
				return
		endIf
	endFunction

	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum for all displayed items from the Museum, Armory add-on and any installed mods then update the listings within this mod.")
	endFunction
endState

;;------------------------------

state ScanMuseum

	function OnSelectST()
	
	PlayerRef.GetCurrentLocation()	
		if (PlayerRef.IsInLocation(DBM_DragonbornGalleryLocation)) || (PlayerRef.IsInLocation(DBM_GuildHouseSolitudeLocation)) && (PlayerRef.IsInInterior()) || ShowLocationOverrideVal		
			if ShowMessage("This will start the process of Scanning the Museum for completed sets... do you want to scan now?", true, "Scan", "Cancel")
				ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")
				RN_Utility.ScanMuseum()
			endIf
		else	
			ShowMessage("You must be inside the Museum to carry out this operation.", false, "OK")
				return
		endIf
	endFunction

	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum for all displayed items and update the listings within this mod.")
	endFunction
endState

;;------------------------------

state ScanArmory

	function OnSelectST()		
	
	PlayerRef.GetCurrentLocation()	
		if (PlayerRef.IsInLocation(DBM_DragonbornGalleryLocation)) || (PlayerRef.IsInLocation(DBM_GuildHouseSolitudeLocation)) && (PlayerRef.IsInInterior()) || ShowLocationOverrideVal
		
			if ShowMessage("This will start the process of Scanning the Armory for completed sets... do you want to scan now?", true, "Scan", "Cancel")
				ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")
				RN_Utility.ScanArmory()
			endIf
		else	
			ShowMessage("You must be inside the Museum to carry out this operation.", false, "OK")
				return
		endIf
	endFunction

	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Armory for all displayed items and update the listings within this mod.")
	endFunction
endState

;;-------------------------------

state ScanMods

	function OnSelectST()	
	
	PlayerRef.GetCurrentLocation()	
		if (PlayerRef.IsInLocation(DBM_DragonbornGalleryLocation)) || (PlayerRef.IsInLocation(DBM_GuildHouseSolitudeLocation)) && (PlayerRef.IsInInterior()) || ShowLocationOverrideVal
		
			if ShowMessage("This will start the process of Scanning the Museum for completed sets from supported mods... do you want to scan now?", true, "Scan", "Cancel")
				ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")
				RN_Utility.ScanMods()
			endIf
		else	
			ShowMessage("You must be inside the Museum to carry out this operation.", false, "OK")
				return
		endIf
	endFunction


	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum for all displayed items from supported mods and update the listings within this mod.")
	endFunction
endState

;;-------------------------------

state ScanHeavyArm

	function OnSelectST()	
	
	PlayerRef.GetCurrentLocation()	
		if (PlayerRef.IsInLocation(DBM_DragonbornGalleryLocation)) || (PlayerRef.IsInLocation(DBM_GuildHouseSolitudeLocation)) && (PlayerRef.IsInInterior()) || ShowLocationOverrideVal
		
			if ShowMessage("This will scan and update the figures for Heavy Armory... do you want to scan now?", true, "Scan", "Cancel")
							
				bScanning = True
				DBM_SortWait.SetValue(1)
				SendModEvent("RunHADisplayCheck")
				RN_Scan_Sent.Mod(1)
				ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")

				while bScanning	
					if RN_Scan_Done.GetValue() == RN_Scan_Sent.GetValue()			
						bScanning = False
						
						RN_Scan_Done.SetValue(0)
						RN_Scan_Sent.SetValue(0)
						DBM_SortWait.SetValue(0)
						DBM_ScanMuseum_Finished_Message.Show()		
					endIf		
				endWhile
			endIf
			
		else	
			ShowMessage("You must be inside the Museum to carry out this operation.", false, "OK")
				return
		endIf
	endFunction


	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum for all displayed items from Heavy Armory and update the current figures.")
	endFunction
endState

;;-------------------------------

state ScanImmWeap

	function OnSelectST()	
	
	PlayerRef.GetCurrentLocation()	
		if (PlayerRef.IsInLocation(DBM_DragonbornGalleryLocation)) || (PlayerRef.IsInLocation(DBM_GuildHouseSolitudeLocation)) && (PlayerRef.IsInInterior()) || ShowLocationOverrideVal
		
			if ShowMessage("This will scan and update the figures for Immersive Weapons... do you want to scan now?", true, "Scan", "Cancel")
			
				bScanning = True
				DBM_SortWait.SetValue(1)
				SendModEvent("RunIWDisplayCheck")
				RN_Scan_Sent.Mod(1)
				ShowMessage("Please exit MCM and wait for the scan to complete", false, "Ok")

				while bScanning	
					if RN_Scan_Done.GetValue() == RN_Scan_Sent.GetValue()			
						bScanning = False
						
						RN_Scan_Done.SetValue(0)
						RN_Scan_Sent.SetValue(0)
						DBM_SortWait.SetValue(0)
						DBM_ScanMuseum_Finished_Message.Show()		
					endIf		
				endWhile
			endIf
			
		else	
			ShowMessage("You must be inside the Museum to carry out this operation.", false, "OK")
				return
		endIf
	endFunction


	function OnHighlightST()

		SetInfoText("Selecting this option will scan the Museum for all displayed items from Immersive Weapons and update the current figures.")
	endFunction
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Debug Options -------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state iRelicLocationDebug ;;Debug Options

	Event OnSelectST()
	
		ShowLocationOverrideVal = !ShowLocationOverrideVal
		SetToggleOptionValueST(ShowLocationOverrideVal)
		ForcePageReset()		
	EndEvent
	
	Event OnDefaultST()
	
		ShowLocationOverrideVal = false
		SetToggleOptionValueST(ShowLocationOverrideVal)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Disables Museum Scanner Location / Cell restrictions -- NOT FOR PLAYER USE\n Default: OFF")
	EndEvent
endState

;;-------------------------------

state iRelicSpellDebug ;;Debug Options

	Event OnSelectST()
	
		ShowStorageSpellOverideVal = !ShowStorageSpellOverideVal
		SetToggleOptionValueST(ShowStorageSpellOverideVal)
			
		if !ShowStorageSpellOverideVal && !Game.GetPlayer().HasPerk(DBM_ArcPerkRelicHunter)
			if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
				(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
				if AutoTransferRelics
					AutoTransferRelics = FALSE
					RN_Transfer.GoToState("Disabled")	
					AllowWeapon = FALSE
					AllowArmor = FALSE
					AllowBook = FALSE
					AllowGems = FALSE
					AllowKey = FALSE
					AllowPotion = FALSE
					AllowMisc= FALSE
				endIf
			endIf
		endIf	

		ForcePageReset()
	EndEvent
	
	Event OnDefaultST()
	
		ShowStorageSpellOverideVal = false
		SetToggleOptionValueST(ShowStorageSpellOverideVal)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Disables storage spell restrictions -- NOT FOR PLAYER USE\n Default: OFF")
	EndEvent
endState

state Dev_Alerts ;;Debug Options

	Event OnSelectST()
	
		DevDebugVal = !DevDebugVal
		SetToggleOptionValueST(DevDebugVal)	
	EndEvent
	
	Event OnDefaultST()
	
		DevDebugVal = false
		SetToggleOptionValueST(DevDebugVal)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Enables Developer Debugging Alerts -- NOT FOR PLAYER USE\n Default: OFF")
	EndEvent
endState

;;-------------------------------

event OnOptionInputOpen(int option)
	if (option == inputOID_I)
		;SetInputDialogStartText(InputBox)
	endIf
endEvent

;;-------------------------------

event OnOptionInputAccept(int option, string value)
	if (option == inputOID_I)
		InputBox = value
		SetInputOptionValue(inputOID_I, value)
		self.CheckPassword()
	endIf
endEvent

;;-------------------------------

event CheckPassword()
	if InputBox == MCM_Strings[13] as string
		InputBox = MCM_Strings[14]
		EnableDebugAccess()
		ForcePageReset()
	else
		self.ShowMessage("Incorrect Password, Please try again.", false, "Ok")
		InputBox = MCM_Strings[15]
		DisableDebugAccess()
		ForcePageReset()
	endIf
endEvent

;;-------------------------------

function EnableDebugAccess()
	
	RN_Debug_Access.SetValue(RN_Debug_Randomiser.GetValue())
endFunction

;;-------------------------------
		
function DisableDebugAccess()

	RN_Debug_Access.SetValue(Utility.RandomInt(0, 250))
	RN_Debug_Randomiser.SetValue(Utility.RandomInt(251, 500))
endFunction

;;-------------------------------

state RevertLists

	Event OnSelectST()
		
		if self.ShowMessage("This will revert the moreHUD new / found / displayed formlists to 0, do you want to revert now?", true, "Revert", "Cancel")
		
			dbmNew.revert()
			dbmFound.revert()
			dbmDisp.revert()
			forcepagereset()
			
		endIf
		
	EndEvent

	Event OnHighlightST()

		SetInfoText("This option will revert the dbmNew / dbmFound / dbmDisp formlists -- NOT FOR PLAYER USE")
	EndEvent
endState

;;-------------------------------

state RebuildLists

	Event OnSelectST()
		
		if self.ShowMessage("This will rebuild and update the moreHUD lists for all new / found / displayed items, do you want to rebuild now?", true, "Rebuild", "Cancel")
			ShowMessage("Please exit the MCM and wait for a completion message", false, "Ok")
			
			DBM_SortWait.SetValue(1)
			
			Int _Index = dbmMaster.GetSize()
			While _Index > 0
				_Index -= 1
				form _item = dbmMaster.GetAt(_Index) as form
				dbmNew.AddForm(_item)
			endWhile
				
			RN_Utility.CreateMoreHudLists()
			
			moreHUDListRebuilt.Show()
			
			DBM_SortWait.SetValue(0)
		endIf
		
	EndEvent

	Event OnHighlightST()

		SetInfoText("This option will rebuild the moreHUD lists -- NOT FOR PLAYER USE")
	EndEvent
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Mod Toggle Options --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state iRelicSetCompleteNotifications

	Event OnSelectST()
		ShowSetCompleteVal = !ShowSetCompleteVal 
		
		self.SetTextOptionValueST(Self.SetCompleteNotificationsString(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("This option will display notifications when the player collects all displayable items from a given Set or Museum Section.\n Includes Armory Add-on if installed as well as any installed supported mods.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetCompleteNotificationsString()

		if !ShowSetCompleteVal		
			Status_Return = MCM_Strings[7]
		elseif ShowSetCompleteVal	
			Status_Return = MCM_Strings[8]
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetCompleteNotificationsString()

	if !ShowSetCompleteVal
		Status_Return = MCM_Strings[7]
	elseif ShowSetCompleteVal	
		Status_Return = MCM_Strings[8]
	endIf
	return Status_Return
endFunction	

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Notifications Options -----------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state iRelicSimpleNotifications ;;Simple Notifications


	Event OnSelectST()
		ShowSimpleNotificationVal = !ShowSimpleNotificationVal 
		
		self.SetTextOptionValueST(Self.SetNotificationsString(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Display a basic notification in the corner of the screen instead of the default pop-up message box.\n Default: Simple")
	EndEvent
endState

;;-------------------------------

String function SetNotificationsString()

		if !ShowSimpleNotificationVal		
			Status_Return = MCM_Strings[11]
		elseif ShowSimpleNotificationVal	
			Status_Return = MCM_Strings[12]
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetNotificationsString()

	if !ShowSimpleNotificationVal
		Status_Return = MCM_Strings[11]
	elseif ShowSimpleNotificationVal	
		Status_Return = MCM_Strings[12]
	endIf
	return Status_Return
endFunction	

;;-------------------------------

state iRelicShowStartup ;;Show Startup Notifications


	Event OnSelectST()
		ShowStartup = !ShowStartup 
		
		self.SetTextOptionValueST(Self.SetShowStartup(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Hides the startup notifications when loading in.\n Default: Shown")
	EndEvent
endState

;;-------------------------------

String function SetShowStartup()

		if !ShowStartup		
			Status_Return = MCM_Strings[20]
		elseif ShowStartup	
			Status_Return = MCM_Strings[6]
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetShowStartup()

	if !ShowStartup
		Status_Return = MCM_Strings[20]
	elseif ShowStartup	
		Status_Return = MCM_Strings[6]
	endIf
	return Status_Return
endFunction	

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------------- Storage Options -----------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
state iRelicStorageOptions ;;Storage Spell
	
	Event OnSelectST()
		StorageSpellVal = !StorageSpellVal 
			
		self.SetTextOptionValueST(Self.SetStorageOptions(), false, "")
		ForcePagereset()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Adds the spell for the Relic Storage Container to the player.\n The container is inaccessible until the player has acquired the 'Relic Hunter' perk from the Excavation Perk Tree")
	EndEvent
endState		

;;-------------------------------
	
String function SetStorageOptions()	

		if !StorageSpellVal
			if (Game.GetPlayer().HasSpell(RN_Storage_Spell))
				(Game.GetPlayer().RemoveSpell(RN_Storage_Spell))
					if AutoTransferRelics
						AutoTransferRelics = FALSE
						RN_Transfer.GoToState("Disabled")
						AllowWeapon = FALSE
						AllowArmor = FALSE
						AllowBook = FALSE
						AllowGems = FALSE
						AllowKey = FALSE
						AllowPotion = FALSE
						AllowMisc= FALSE
					endIf
				Status_Return = MCM_Strings[9]
			endIf
			
		elseif StorageSpellVal
			if (!Game.GetPlayer().HasSpell(RN_Storage_Spell))
				(Game.GetPlayer().AddSpell(RN_Storage_Spell))
				Status_Return = MCM_Strings[10]
			endif	
		endIf	
	return Status_Return 
endFunction

;;-------------------------------
	
String function GetStorageOptions()
	if !Game.GetPlayer().HasPerk(DBM_ArcPerkRelicHunter) && !ShowStorageSpellOverideVal
		Status_Return = MCM_Strings[21]
		StorageSpellVal = FALSE
	elseif !StorageSpellVal
		Status_Return = MCM_Strings[9]		
	elseif StorageSpellVal
		Status_Return = MCM_Strings[10]
	endIf
		return Status_Return
endFunction	

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------------- Storage Transfer Options ---------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
state iRelicStorageTransfer ;;Storage Transfer
	
	Event OnSelectST()
		AutoTransferRelics = !AutoTransferRelics 
			
		if AutoTransferRelics
			RN_Transfer.GoToState("")
			
		else
			RN_Transfer.GoToState("Disabled")
		endIf
		
		self.SetTextOptionValueST(Self.SetTransferOptions(), false, "")
		ForcePagereset()
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically moves displayable items from the player inventory to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState	

;;-------------------------------

state PrepStationTransfer ;;Prep Station Storage Transfer
	
	Event OnSelectST()
	
		if PrepTransfer == 0
		
			PrepTransfer = 1
			
		elseif PrepTransfer == 1
		
			PrepTransfer = 2
			
		elseif PrepTransfer == 2
		
			PrepTransfer = 0
		endif

		self.SetTextOptionValueST(Self.SetPrepStationOptions(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Choose which container(s) to check for displayable items when using the 'Transfer Relics' option at the Prep station.\n Default: All Custom Storage")
	EndEvent
endState

;;-------------------------------
	
String function SetPrepStationOptions()	

	if PrepTransfer == 0
		Status_Return = "Custom Storage"
		
	elseif PrepTransfer == 1
		Status_Return = "Custom Storage & Player"

	elseif PrepTransfer == 2
		Status_Return = "Relic Storage Container"
		
	endIf	
	
return Status_Return 
endFunction
	
;;-------------------------------
	
String function GetPrepStationOptions()
	
	if PrepTransfer == 0
		Status_Return = "Custom Storage"
		
	elseif PrepTransfer == 1
		Status_Return = "Custom Storage & Player"

	elseif PrepTransfer == 2
		Status_Return = "Relic Storage Container"
		
	endIf	
	
return Status_Return 
endFunction	

;;-------------------------------
	
String function SetTransferOptions()	

	if !AutoTransferRelics
		Status_Return = MCM_Strings[7]
	elseif AutoTransferRelics
		Status_Return = MCM_Strings[8]				
	endIf	
return Status_Return 
endFunction
	
;;-------------------------------
	
String function GetTransferOptions()
	
	if !StorageSpellVal
		Status_Return = MCM_Strings[21]
		AutoTransferRelics = FALSE
	elseif !AutoTransferRelics
		Status_Return = MCM_Strings[7]			
	elseif AutoTransferRelics
		Status_Return = MCM_Strings[8]				
	endIf	
return Status_Return 
endFunction	

;;-------------------------------

state ShowCustomContainerInfo ;;Storage Transfer
	
	Event OnSelectST()
		
		ShowMessage("Custom Storage Info" + "\n" + "\n The 'Curators Storage Token' can be crafted from the forges located around Skyrim, drop the token into any container or follower to add them to the custom storage list, drop another token into the container or follower to remove them from the list.", false, "Ok")
	EndEvent
endState

;;-------------------------------

state Transfer_Weapon

	Event OnSelectST()
		AllowWeapon = !AllowWeapon
			SetToggleOptionValueST(AllowWeapon)
	EndEvent
	
	Event OnDefaultST()
		AllowWeapon = false
		SetToggleOptionValueST(AllowWeapon)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable weapons to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Armor

	Event OnSelectST()
		AllowArmor = !AllowArmor
			SetToggleOptionValueST(AllowArmor)
	EndEvent
	
	Event OnDefaultST()
		AllowArmor = false
		SetToggleOptionValueST(AllowArmor)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable armor to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Book

	Event OnSelectST()
		AllowBook = !AllowBook
			SetToggleOptionValueST(AllowBook)
	EndEvent
	
	Event OnDefaultST()
		AllowBook = false
		SetToggleOptionValueST(AllowBook)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable books to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Key

	Event OnSelectST()
		AllowKey = !AllowKey
			SetToggleOptionValueST(AllowKey)
	EndEvent
	
	Event OnDefaultST()
		AllowKey = false
		SetToggleOptionValueST(AllowKey)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable keys to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Potion

	Event OnSelectST()
		AllowPotion = !AllowPotion
			SetToggleOptionValueST(AllowPotion)
	EndEvent
	
	Event OnDefaultST()
		AllowPotion = false
		SetToggleOptionValueST(AllowPotion)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable potions to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Gems

	Event OnSelectST()
		AllowGems = !AllowGems
			SetToggleOptionValueST(AllowGems)
	EndEvent
	
	Event OnDefaultST()
		AllowGems = false
		SetToggleOptionValueST(AllowGems)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable gems and soul gems to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;-------------------------------

state Transfer_Misc

	Event OnSelectST()
		AllowMisc = !AllowMisc
			SetToggleOptionValueST(AllowMisc)
	EndEvent
	
	Event OnDefaultST()
		AllowMisc = false
		SetToggleOptionValueST(AllowMisc)
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Automatically transfer displayable Misc Items to the Relic Storage Container when picked up.\n Default: Disabled")
	EndEvent
endState

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Section Toggles------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state iRelicMuseumNotifications

	Event OnSelectST()
		ShowMuseumVal = !ShowMuseumVal 
		
		self.SetTextOptionValueST(Self.SetMuseumNotificationsString(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Show Notifications when picking up a displayable item for the Museum.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetMuseumNotificationsString()

	if !ShowMuseumVal		
		Status_Return = MCM_Strings[7]
	elseif ShowMuseumVal	
		Status_Return = MCM_Strings[8]
	endIf
	return Status_Return
endfunction

;;-------------------------------
			
String function GetMuseumNotificationsString()

	if !ShowMuseumVal
		Status_Return = MCM_Strings[7]
	elseif ShowMuseumVal	
		Status_Return = MCM_Strings[8]
	endIf
	return Status_Return
endFunction	

;;-------------------------------

state iRelicArmoryNotifications

	Event OnSelectST()
		ShowArmoryVal = !ShowArmoryVal 
		
		self.SetTextOptionValueST(Self.SetArmoryNotificationsString(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Show Notifications when picking up a displayable item for the Armory.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetArmoryNotificationsString()

	if !ShowArmoryVal		
		Status_Return = MCM_Strings[7]
	elseif ShowArmoryVal	
		Status_Return = MCM_Strings[8]
	endIf
		return Status_Return
endfunction

;;-------------------------------
		
String function GetArmoryNotificationsString()

	if !ShowArmoryVal		
		Status_Return = MCM_Strings[7]
	elseif ShowArmoryVal	
		Status_Return = MCM_Strings[8]
	endIf
		return Status_Return
endFunction	

;;-------------------------------

state iRelicModsNotifications

	Event OnSelectST()
		ShowModsVal = !ShowModsVal 
		
		self.SetTextOptionValueST(self.SetModsNotificationsString(), false, "")
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("Show Notifications when picking up a displayable item from any installed & Supported Mods.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetModsNotificationsString()

	if !ShowModsVal		
		Status_Return = MCM_Strings[7]
	elseif ShowModsVal	
		Status_Return = MCM_Strings[8]
	endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetModsNotificationsString()

	if !ShowModsVal
		Status_Return = MCM_Strings[7]
	elseif ShowModsVal	
		Status_Return = MCM_Strings[8]
	endIf
		return Status_Return
endFunction	

;;-------------------------------

state iRelicListenerNotifications
	
	function OnSelectST()
	
		ShowListenerVal = !ShowListenerVal 
		self.SetTextOptionValueST(self.SetListenerString(), false, "")			
	EndFunction

	Event OnHighlightST()

		self.SetInfoText("Enable to show notifications for quest, skills and exploration displays in the Museum.\n Default: Enabled")
	EndEvent
endState

;;-------------------------------

String function SetListenerString()

	if !ShowListenerVal		
		Status_Return = MCM_Strings[7]
	elseif ShowListenerVal	
		Status_Return = MCM_Strings[8]
	endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetListenerString()

	if !ShowListenerVal
		Status_Return = MCM_Strings[7]
	elseif ShowListenerVal	
		Status_Return = MCM_Strings[8]
	endIf
		return Status_Return
endFunction	

;;-------------------------------

state moreHUDOptions

	event OnMenuOpenST()
		SetMenuDialogStartIndex(IndexmoreHUD)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(moreHUDChoiceList)
	endEvent

	event OnMenuAcceptST(int index)
		IndexmoreHUD = Index
		SetMenuOptionValueST(moreHUDOptions, moreHUDChoiceList[IndexmoreHUD])
			
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Inventory Plugin") >= 10017
			if Index == 0
				RN_moreHUD_Option.SetValue(1)
				AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)
				AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)
				AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif Index == 1
				RN_moreHUD_Option.SetValue(2)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUDIE.RegisterIconFormList("dbmNew", dbmNew)

			elseif Index == 2
				RN_moreHUD_Option.SetValue(3)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
				AhzmoreHUDIE.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif Index == 3
				RN_moreHUD_Option.SetValue(4)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")
				AhzmoreHUDIE.RegisterIconFormList("dbmDisp", dbmDisp)		

			elseif Index == 4
				RN_moreHUD_Option.SetValue(5)
				AhzmoreHUDIE.UnRegisterIconFormList("dbmNew")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmDisp")
				AhzmoreHUDIE.UnRegisterIconFormList("dbmFound")				
				
			endIf
		endIf
			
		if SKSE.GetPluginVersion("Ahzaab's moreHUD Plugin") >= 30800
			if Index == 0
				RN_moreHUD_Option.SetValue(1)
				AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)
				AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)
				AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif Index == 1
				RN_moreHUD_Option.SetValue(2)
				AhzmoreHUD.UnRegisterIconFormList("dbmFound")
				AhzmoreHUD.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUD.RegisterIconFormList("dbmNew", dbmNew)

			elseif Index == 2
				RN_moreHUD_Option.SetValue(3)
				AhzmoreHUD.UnRegisterIconFormList("dbmDisp")		
				AhzmoreHUD.UnRegisterIconFormList("dbmNew")
				AhzmoreHUD.RegisterIconFormList("dbmFound", dbmFound)
				
			elseif Index == 3
				RN_moreHUD_Option.SetValue(4)
				AhzmoreHUD.UnRegisterIconFormList("dbmNew")
				AhzmoreHUD.UnRegisterIconFormList("dbmFound")
				AhzmoreHUD.RegisterIconFormList("dbmDisp", dbmDisp)		

			elseif Index == 4
				RN_moreHUD_Option.SetValue(5)
				AhzmoreHUD.UnRegisterIconFormList("dbmNew")
				AhzmoreHUD.UnRegisterIconFormList("dbmDisp")
				AhzmoreHUD.UnRegisterIconFormList("dbmFound")				
				
			endIf
		endIf
			
		ForcePageReset()
	endEvent

	event OnDefaultST()
		IndexmoreHUD = 0
		SetMenuOptionValueST(moreHUDChoiceList[IndexmoreHUD])
	endEvent

	event OnHighlightST()
		SetInfoText("Use this menu to customize which icons are displayed in the UI.\n Default: New & Displayed")
	endEvent
endState

;;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Advanced tagging ----------------------------------------------------------------------------------------------
;;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

state ReplicaTagging ;;Replica Tagging

	Event OnSelectST()
		ReplicaTag = !ReplicaTag
		
		
		if self.ShowMessage("=== The Curators Companion ===" + "\n" + "\nEnabling Advanced Tagging will cause a noticeable increase in the amount of time it takes for icons to update, it is also not recommended to use 'Take All' on a large number of items" + "\n" + "\nEnabling / Disabling this feature may take a while, you will receive a message when the process has completed", true, "Ok", "Cancel")
			self.SetTextOptionValueST(Self.SetReplicaTaggingOptions(), false, "")
			ShowMessage("Please exit the MCM and wait for the process to complete", false, "Ok")
			
			if ReplicaTag
				
				dbmDisp.Revert()
				
				Int _Index = RN_Array._MuseumContainerArray.length	;;Check museum containers for displayed items.	
				While _Index 
					_Index -= 1
					Int _Index2 = RN_Array._MuseumContainerArray[_Index].GetNumItems()
					while _Index2
						_Index2 -= 1		
						Form _ItemRelic = RN_Array._MuseumContainerArray[_Index].GetNthForm(_Index2)
						if dbmMaster.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
							dbmDisp.AddForm(_ItemRelic)
							processForm(_ItemRelic, true)
						endIf
					endWhile
				endWhile
				
				dbmFound.Revert()

				_Index = RN_TokenFormlist.GetSize() ;; Check player and custom storage for found items.
				While _Index
					_Index -= 1
					ObjectReference _Container = RN_TokenFormlist.GetAt(_Index) as ObjectReference		
					Int _Index2 = _Container.GetNumItems()
					While _Index2
						_Index2 -= 1
						Form _ItemRelic = _Container.GetNthForm(_Index2)
						if !dbmNew.HasForm(_ItemRelic) && dbmMaster.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
							dbmFound.AddForm(_ItemRelic)
							processForm(_ItemRelic, false)
						endIf
					endWhile
				endWhile	
				
			elseif !ReplicaTag
				
				dbmDisp.Revert()
				
				Int _Index = RN_Array._MuseumContainerArray.length	;;Check museum containers for displayed items.	
				While _Index 
					_Index -= 1
					Int _Index2 = RN_Array._MuseumContainerArray[_Index].GetNumItems()
					while _Index2
						_Index2 -= 1		
						Form _ItemRelic = RN_Array._MuseumContainerArray[_Index].GetNthForm(_Index2)
						if dbmMaster.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
							dbmDisp.AddForm(_ItemRelic)
						endIf
					endWhile
				endWhile			

				dbmFound.Revert()
				
				_Index = RN_TokenFormlist.GetSize() ;; Check player and custom storage for found items.
				While _Index
					_Index -= 1
					ObjectReference _Container = RN_TokenFormlist.GetAt(_Index) as ObjectReference		
					Int _Index2 = _Container.GetNumItems()
					While _Index2
						_Index2 -= 1
						Form _ItemRelic = _Container.GetNthForm(_Index2)
						if !dbmNew.HasForm(_ItemRelic) && dbmMaster.HasForm(_ItemRelic) && !dbmDisp.HasForm(_ItemRelic)
							dbmFound.AddForm(_ItemRelic)
						endIf
					endWhile
				endWhile	
				
			endIf
			
			if ReplicaTag
				Debug.MessageBox("=== The Curators Companion ===" + "\n" + "\nAdvanced Tagging Enabled")
			else
				Debug.MessageBox("=== The Curators Companion ===" + "\n" + "\nAdvanced Tagging Disabled")
			endIf
		endIf	
	EndEvent

	Event OnHighlightST()

		self.SetInfoText("EXPERIMENTAL FEATURE\nWhen an item is found or displayed with Advanced Tagging Enabled, the scripts will attempt to update the Icons for both the Base Item and the Replica\n Default: Disabled")
	EndEvent
endState


;;-- Functions ---------------------------------------

function processForm(form _ItemRelic, bool _Displayed)
	
	if _Displayed
	
		if DBM_ReplicaBaseItems.HasForm(_ItemRelic)
			dbmDisp.AddForm(ReplicaHandler.GetReplica(_ItemRelic))
		elseif DBM_ReplicaItems.HasForm(_ItemRelic)
			dbmDisp.AddForm(ReplicaHandler.GetOriginal(_ItemRelic))
		endIf
		
	else
	
		if DBM_ReplicaBaseItems.HasForm(_ItemRelic)
			dbmFound.AddForm(ReplicaHandler.GetReplica(_ItemRelic))
		elseif DBM_ReplicaItems.HasForm(_ItemRelic)
			dbmFound.AddForm(ReplicaHandler.GetOriginal(_ItemRelic))
		endIf
		
	endIf
endFunction

;;-------------------------------

String function SetReplicaTaggingOptions()

		if !ReplicaTag		
			Status_Return = MCM_Strings[7]	
		elseif ReplicaTag	
			Status_Return = MCM_Strings[8]
		endIf
		return Status_Return
endfunction

;;-------------------------------
			
String function GetReplicaTaggingOptions()

	if !ReplicaTag
		Status_Return = MCM_Strings[7]
	elseif ReplicaTag	
		Status_Return = MCM_Strings[8]
	endIf
	return Status_Return
endFunction	

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Return Strings --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

string function GetCurrentCount(GlobalVariable akVariable, GlobalVariable akVariableB)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	Int Total_Count = (akVariableB.GetValue()) as Int
	
		Status_Return = (Current_Count + "/" + Total_Count)
	return Status_Return
endFunction

;;-------------------------------

string function GetCurrentMuseumCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/10 Sections")
	return Status_Return
endFunction

;;-------------------------------

string function GetDisplaySectionCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/4 Sections")
	return Status_Return
endFunction

;;-------------------------------

string function GetCurrentArmoryCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/20 Sets")
	return Status_Return
endFunction

;;-------------------------------

string function GetCurrentIWCount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/16")
	return Status_Return
endFunction	

;;-------------------------------

string function GetCurrentHACount(GlobalVariable akVariable)
	
	Int Current_Count = (akVariable.GetValue()) as Int	
	
		Status_Return = (Current_Count + "/19")
	return Status_Return
endFunction	

;;-------------------------------

String function GetTreasuryCountString2()

	if DBM_DHQuest.IsCompleted()
		Status_Return = RN_Treasury_Count2.GetValue() As Int
		return Status_Return
	else
		Status_Return = MCM_Strings[21]
		return Status_Return 
	endIf
endFunction

;;-------------------------------

String function GetTreasuryCountString3()
	
	if DBM_Excavation02.IsCompleted()
		Status_Return = RN_Treasury_Count3.GetValue() As Int
		return Status_Return
	else
		Status_Return = MCM_Strings[21]
		return Status_Return 
	endIf
endFunction

;;-------------------------------

String function GetTotalTreasuryValue(GlobalVariable akvariable1, GlobalVariable akvariable2, GlobalVariable akvariable3)

	RN_Total_Value.SetValue(0)
	RN_Total_Value.Mod(akvariable1.GetValue() As Int)
		if DBM_DHQuest.IsCompleted()
			RN_Total_Value.Mod(akvariable2.GetValue() As Int)
		endIf
		
		if DBM_Excavation02.IsCompleted()
			RN_Total_Value.Mod(akvariable3.GetValue() As Int)	
		endIf
			Status_Return = RN_Total_Value.GetValue() As Int
		return Status_Return
endFunction

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script End ------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
