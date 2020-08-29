Scriptname RN_Utility_ArrayHolder extends Quest

RN_Utility_Mods Property RN_Mod Auto

;;Museum storage containers to check within several events.
ObjectReference[] property _MuseumContainerArray auto 		;; Used to check Museum containers for displayed items (Creating moreHUD lists).
ObjectReference[] property _MuseumContainerArray_WP auto	;; Used to check Museum containers & Player when updating found items lists by all patches.

;;Setup Events
String[] Property _ModSetup auto
String[] Property _Patches auto
Bool[] Property _bPatches auto Hidden

;;Scan Events
String[] Property _ModScan auto
GlobalVariable[] Property _GVComplete auto

;;Update Events
String[] Property _ModUpdate auto

;;-- Events ---------------------------------------

Event CreatePatchArray()

	_bPatches = new bool[45]
	_bPatches[0] = RN_Mod.XX_AetheriumL
	_bPatches[1] = RN_Mod.XX_AmuletsSkyrimL
	_bPatches[2] = RN_Mod.XX_ArtifactsSkyrimL
	_bPatches[3] = RN_Mod.XX_BoethiahL
	_bPatches[4] = RN_Mod.XX_BadGremlinL
	_bPatches[5] = RN_Mod.XX_CloaksL
	_bPatches[6] = RN_Mod.XX_ClockworkL
	_bPatches[7] = RN_Mod.XX_DawnguardArsenalL
	_bPatches[8] = RN_Mod.XX_FalskaarL
	_bPatches[9] = RN_Mod.XX_ForgottenL
	_bPatches[10] = RN_Mod.XX_FossilsL
	_bPatches[11] = RN_Mod.XX_GrayCowlL
	_bPatches[12] = RN_Mod.XX_GuardArmL
	_bPatches[13] = RN_Mod.XX_HeavyArmL
	_bPatches[14] = RN_Mod.XX_HelgenL
	_bPatches[15] = RN_Mod.XX_IceBladeL
	_bPatches[16] = RN_Mod.XX_ImmArmL
	_bPatches[17] = RN_Mod.XX_ImmWeapL
	_bPatches[18] = RN_Mod.XX_ImmersiveL
	_bPatches[19] = RN_Mod.XX_JaysusCraftL || RN_Mod.XX_JaysusL
	_bPatches[20] = RN_Mod.XX_KagrenacL
	_bPatches[21] = RN_Mod.XX_KonahrikL
	_bPatches[22] = RN_Mod.XX_KthoniaL
	_bPatches[23] = RN_Mod.XX_MoonStarL
	_bPatches[24] = RN_Mod.XX_MoonpathL
	_bPatches[25] = RN_Mod.XX_NTHunterESLL || RN_Mod.XX_NTHunterL
	_bPatches[26] = RN_Mod.XX_OblivionArtL
	_bPatches[27] = RN_Mod.XX_PathRevL
	_bPatches[28] = RN_Mod.XX_ProjectAHOL
	_bPatches[29] = RN_Mod.XX_RoyalL
	_bPatches[30] = RN_Mod.XX_RuinsEdgeL
	_bPatches[31] = RN_Mod.XX_SUTL
	_bPatches[32] = RN_Mod.XX_SheoStaffL
	_bPatches[33] = RN_Mod.XX_SkyrimSewers
	_bPatches[34] = RN_Mod.XX_SoapsKICL || RN_Mod.XX_SoapsL
	_bPatches[35] = RN_Mod.XX_TreasureHuntL
	_bPatches[36] = RN_Mod.XX_UndeathL
	_bPatches[37] = RN_Mod.XX_UndergroundESPL || RN_Mod.XX_UndergroundL
	_bPatches[38] = RN_Mod.XX_VigilantL
	_bPatches[39] = RN_Mod.XX_VolkiharL
	_bPatches[40] = RN_Mod.XX_WheelsOfLullL
	_bPatches[41] = RN_Mod.XX_WintersunL
	_bPatches[42] = RN_Mod.XX_WyrmstoothL
	_bPatches[43] = RN_Mod.XX_ZimThaneL || RN_Mod.XX_ZimThaneOnlyL
	_bPatches[44] = RN_Mod.XX_3DNPC
endEvent
