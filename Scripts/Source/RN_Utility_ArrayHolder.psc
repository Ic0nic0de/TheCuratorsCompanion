Scriptname RN_Utility_ArrayHolder extends Quest

RN_Utility_Mods Property RN_Mod Auto

;;Museum storage containers to check within several events.
ObjectReference[] property _MuseumContainerArray auto 		;; Used to check Museum containers for displayed items (Creating moreHUD lists).
ObjectReference[] property _MuseumContainerArray_WP auto	;; Used to check Museum containers & Player when updating found items lists by all patches.

;;Safehouse storage containers to check within several events.
ObjectReference[] property _SafehouseContainerArray auto 		;; Used to check Museum containers for displayed items (Creating moreHUD lists).
ObjectReference[] property _SafehouseContainerArray_WP auto	;; Used to check Museum containers & Player when updating found items lists by all patches.

Formlist property _SafehouseContainerList auto 		;; Used to check Museum containers for displayed items (Creating moreHUD lists).
Formlist property _SafehouseContainerList_WP auto		;; Used to check Museum containers & Player when updating found items lists by all patches.

;;Setup Events
String[] Property _ModSetup auto ;;Museum Setup
String[] Property _ModUpdate auto ;;Update Found Items

;;----- Museum
GlobalVariable[] Property _Museum_Global_Complete auto
GlobalVariable[] Property _Museum_Global_Count auto
GlobalVariable[] Property _Museum_Global_Total auto
Formlist[] Property _Museum_Formlist_Merged auto
Formlist[] Property _Museum_Formlist_Enabled auto
Message[] Property _Museum_Message_Default auto
Message[] Property _Museum_Message_Notification auto
String[] Property _Museum_Section_names auto
String[] Property _Museum_Scan_EventNames auto

;;----- Armory
ObjectReference[] Property _Armory_Helms_Displays auto
GlobalVariable[] Property _Armory_Global_Complete auto
GlobalVariable[] Property _Armory_Global_Count auto
GlobalVariable[] Property _Armory_Global_Total auto
Formlist[] Property _Armory_Formlist_Displays auto
Formlist[] Property _Armory_Formlist_Enabled auto
Message[] Property _Armory_Message_Default auto
Message[] Property _Armory_Message_Notification auto
String[] Property _Armory_Section_names auto

;;----- Heavy Armory
GlobalVariable[] Property _HeavyArmory_Global_Complete auto
GlobalVariable[] Property _HeavyArmory_Global_Count auto
GlobalVariable[] Property _HeavyArmory_Global_Total auto
String[] Property _HeavyArmory_Section_names auto

;;----- Immersive Weapons
GlobalVariable[] Property _ImmersiveWeapons_Global_Complete auto
GlobalVariable[] Property _ImmersiveWeapons_Global_Count auto
GlobalVariable[] Property _ImmersiveWeapons_Global_Total auto
String[] Property _ImmersiveWeapons_Section_names auto

;;----- Patches
GlobalVariable[] Property _GVComplete auto
GlobalVariable[] Property _PatchCount auto
GlobalVariable[] Property _PatchTotal auto
Bool[] Property _bPatches auto Hidden
String[] Property _PatchName auto
String[] Property _ModScan auto
String[] Property _Patches auto

;;----- Creation Club
GlobalVariable[] Property _GVCreationComplete auto
GlobalVariable[] Property _CreationCount auto
GlobalVariable[] Property _CreationTotal auto
Bool[] Property _bCreations auto Hidden
String[] Property _CreationName auto
String[] Property _CreationScan auto
String[] Property _Creations auto

;;-- Events ---------------------------------------

Event CreatePatchArray()

	_bPatches = new bool[50]
	_bPatches[0] = RN_Mod.XX_AetheriumL
	_bPatches[1] = RN_Mod.XX_AmuletsSkyrimL
	_bPatches[2] = RN_Mod.XX_AnimArm
	_bPatches[3] = RN_Mod.XX_BoethiahL
	_bPatches[4] = RN_Mod.XX_ArtifactsSkyrimL
	_bPatches[5] = RN_Mod.XX_BadGremlinL
	_bPatches[6] = RN_Mod.XX_CloaksL
	_bPatches[7] = RN_Mod.XX_ClockworkL
	_bPatches[8] = RN_Mod.XX_DawnguardArsenalL
	_bPatches[9] = RN_Mod.XX_FalskaarL
	_bPatches[10] = RN_Mod.XX_Follower_Auri
	_bPatches[11] = RN_Mod.XX_Follower_Inigo
	_bPatches[12] = RN_Mod.XX_Follower_Kaidan
	_bPatches[13] = RN_Mod.XX_Follower_Mrissi
	_bPatches[14] = RN_Mod.XX_FossilsL
	_bPatches[15] = RN_Mod.XX_GrayCowlL
	_bPatches[16] = RN_Mod.XX_GuardArmL
	_bPatches[17] = RN_Mod.XX_HeavyArmL
	_bPatches[18] = RN_Mod.XX_HelgenL
	_bPatches[19] = RN_Mod.XX_IceBladeL	
	_bPatches[20] = RN_Mod.XX_ImmersiveL
	_bPatches[21] = RN_Mod.XX_ImmArmL
	_bPatches[22] = RN_Mod.XX_ImmWeapL
	_bPatches[23] = RN_Mod.XX_SoapsKICL || RN_Mod.XX_SoapsL
	_bPatches[24] = RN_Mod.XX_3DNPC
	_bPatches[25] = RN_Mod.XX_JaysusCraftL || RN_Mod.XX_JaysusL
	_bPatches[26] = RN_Mod.XX_KonahrikL
	_bPatches[27] = RN_Mod.XX_KthoniaL
	_bPatches[28] = RN_Mod.XX_MoonpathL
	_bPatches[29] = RN_Mod.XX_MoonStarL
	_bPatches[30] = RN_Mod.XX_NTHunterESLL || RN_Mod.XX_NTHunterL
	_bPatches[31] = RN_Mod.XX_OblivionArtL
	_bPatches[32] = RN_Mod.XX_PathRevL
	_bPatches[33] = RN_Mod.XX_ProjectAHOL
	_bPatches[34] = RN_Mod.XX_RoyalL
	_bPatches[35] = RN_Mod.XX_RuinsEdgeL
	_bPatches[36] = RN_Mod.XX_SkyrimSewers
	_bPatches[37] = RN_Mod.XX_UndergroundESPL || RN_Mod.XX_UndergroundL
	_bPatches[38] = RN_Mod.XX_SUTL
	_bPatches[39] = RN_Mod.XX_SheoStaffL
	_bPatches[40] = RN_Mod.XX_ForgottenL
	_bPatches[41] = RN_Mod.XX_WheelsOfLullL
	_bPatches[42] = RN_Mod.XX_KagrenacL
	_bPatches[43] = RN_Mod.XX_TreasureHuntL
	_bPatches[44] = RN_Mod.XX_UndeathL
	_bPatches[45] = RN_Mod.XX_VigilantL
	_bPatches[46] = RN_Mod.XX_VolkiharL
	_bPatches[47] = RN_Mod.XX_WintersunL
	_bPatches[48] = RN_Mod.XX_WyrmstoothL
	_bPatches[49] = RN_Mod.XX_ZimThaneL || RN_Mod.XX_ZimThaneOnlyL
	
	_bCreations = new bool[42]
	_bCreations[0] = RN_Mod.XX_Backpack
	_bCreations[1] = RN_Mod.XX_AADaedricMail
	_bCreations[2] = RN_Mod.XX_AADragonscale
	_bCreations[3] = RN_Mod.XX_AADwarvenMail
	_bCreations[4] = RN_Mod.XX_AAEbonyPlate
	_bCreations[5] = RN_Mod.XX_AAElvenHunter
	_bCreations[6] = RN_Mod.XX_AAStalhrimFur
	_bCreations[7] = RN_Mod.XX_AASteelSoldier
	_bCreations[8] = RN_Mod.XX_ArcaneAccessories
	_bCreations[9] = RN_Mod.XX_ArcaneArcher	
	_bCreations[10] = RN_Mod.XX_ArmsofChaos	
	_bCreations[11] = RN_Mod.XX_BoneWolf	
	_bCreations[12] = RN_Mod.XX_Camping
	_bCreations[13] = RN_Mod.XX_Chrysamere
	_bCreations[14] = RN_Mod.XX_CivilWarChampions_Standalone || RN_Mod.XX_CivilWarChampions_Individual
	_bCreations[15] = RN_Mod.XX_DawnfangDuskfang
	_bCreations[16] = RN_Mod.XX_DeadMansDread_Standalone || RN_Mod.XX_DeadMansDread_Oblivion
	_bCreations[17] = RN_Mod.XX_DivineCrusader_Standalone || RN_Mod.XX_DivineCrusader_Individual
	_bCreations[18] = RN_Mod.XX_DwarvenMudcrab
	_bCreations[19] = RN_Mod.XX_EliteCross || RN_Mod.XX_EliteCrossBolt
	_bCreations[20] = RN_Mod.XX_ExpandedCross || RN_Mod.XX_ExpandedCrossBolt	
	_bCreations[21] = RN_Mod.XX_Seasons
	_bCreations[22] = RN_Mod.XX_Goblins
	_bCreations[23] = RN_Mod.XX_NetchLeatherArmor
	_bCreations[24] = RN_Mod.XX_NixHound
	_bCreations[25] = RN_Mod.XX_NordicJewelry
	_bCreations[26] = RN_Mod.XX_Pets
	_bCreations[27] = RN_Mod.XX_Plague
	_bCreations[28] = RN_Mod.XX_RareCuriosL
	_bCreations[29] = RN_Mod.XX_RuinsEdgeCC
	_bCreations[30] = RN_Mod.XX_SaintsL
	_bCreations[31] = RN_Mod.XX_Holiday
	_bCreations[32] = RN_Mod.XX_Shadowrend_Standalone || RN_Mod.XX_Shadowrend_Boethiah	
	_bCreations[33] = RN_Mod.XX_SpellKnightArmor
	_bCreations[34] = RN_Mod.XX_StaffofHasedoki
	_bCreations[35] = RN_Mod.XX_StaffofSheoCC_Standalone || RN_Mod.XX_StaffofSheoCC_Cheese || RN_Mod.XX_StaffofSheoCC_UCCCP	
	_bCreations[36] = RN_Mod.XX_StendarrsHammer
	_bCreations[37] = RN_Mod.XX_SunderWraithguard
	_bCreations[38] = RN_Mod.XX_TheGrayCowlReturns
	_bCreations[39] = RN_Mod.XX_Umbra
	_bCreations[40] = RN_Mod.XX_VigilEnforcerArmorSet
	_bCreations[41] = RN_Mod.XX_Horses
	
endEvent

