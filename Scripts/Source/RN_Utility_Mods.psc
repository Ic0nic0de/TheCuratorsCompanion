Scriptname RN_Utility_Mods extends Quest

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------Get Form From File --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RN_Utility_Script Property RN_Utility Auto

;;(Is the Supported Mod Installed?)
Bool Property XX_AetheriumL Auto
Bool Property XX_AmuletsSkyrimL Auto
Bool Property XX_ArtifactsSkyrimL Auto
Bool Property XX_BadGremlinL Auto
Bool Property XX_BoethiahL Auto
Bool Property XX_CloaksL Auto
Bool Property XX_ClockworkL Auto
Bool Property XX_DawnguardArsenalL Auto
Bool Property XX_FalskaarL Auto
Bool Property XX_FossilsL Auto
Bool Property XX_GrayCowlL Auto
Bool Property XX_GuardArmL Auto
Bool Property XX_HeavyArmL Auto
Bool Property XX_ImmArmL Auto
Bool Property XX_ImmWeapL Auto
Bool Property XX_HelgenL Auto
Bool Property XX_IceBladeL Auto
Bool Property XX_ImmersiveL Auto
Bool Property XX_JaysusL Auto
Bool Property XX_JaysusCraftL Auto
Bool Property XX_KonahrikL Auto
Bool Property XX_KagrenacL Auto
Bool Property XX_KthoniaL Auto
Bool Property XX_MoonpathL Auto
Bool Property XX_MoonStarL Auto
Bool Property XX_OblivionArtL Auto
Bool Property XX_PathRevL Auto
Bool Property XX_ProjectAHOL Auto
Bool Property XX_SUTL Auto
Bool Property XX_ForgottenL Auto
Bool Property XX_NTHunterL Auto
Bool Property XX_NTHunterESLL Auto
Bool Property XX_RoyalL Auto
Bool Property XX_RuinsEdgeL Auto
Bool Property XX_TreasureHuntL Auto
Bool Property XX_SheoStaffL Auto
Bool Property XX_SoapsL Auto
Bool Property XX_SoapsKICL Auto
Bool Property XX_UndeathL Auto
Bool Property XX_VigilantL Auto
Bool Property XX_VolkiharL Auto
Bool Property XX_WheelsOfLullL Auto
Bool Property XX_WintersunL Auto
Bool Property XX_WyrmstoothL Auto
Bool Property XX_UndergroundL Auto
Bool Property XX_UndergroundESPL Auto
Bool Property XX_ZimThaneL Auto
Bool Property XX_ZimThaneOnlyL Auto
Bool Property XX_FissL Auto
Bool Property XX_SkyUI Auto
Bool Property XX_LAL Auto
Bool Property XX_RelicHunterL Auto
Bool Property XX_SkyrimSewers Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;-- Events --------------------------------

Event CheckSupportedMods()

	;;Museum	
	XX_AetheriumL = Game.GetModByName("LOTD_TCC_Aetherium.esp") != 255
	XX_AmuletsSkyrimL = Game.GetModByName("LOTD_TCC_Amulets.esp") != 255
	XX_ArtifactsSkyrimL = Game.GetModByName("LOTD_TCC_ArtifactsSkyrim.esp") != 255
	XX_BadGremlinL = Game.GetModByName("LOTD_TCC_Gremlins.esp") != 255
	XX_BoethiahL = Game.GetModByName("LOTD_TCC_Boethiah.esp") != 255
	XX_CloaksL = Game.GetModByName("LOTD_TCC_Cloaks.esp") != 255
	XX_ClockworkL = Game.GetModByName("LOTD_TCC_Clockwork.esp") != 255
	XX_FalskaarL = Game.GetModByName("LOTD_TCC_Falskaar.esp") != 255
	XX_FossilsL = Game.GetModByName("LOTD_TCC_Fossils.esp") != 255
	XX_GrayCowlL = Game.GetModByName("LOTD_TCC_GrayCowl.esp") != 255
	XX_HelgenL = Game.GetModByName("LOTD_TCC_Helgen.esp") != 255
	XX_IceBladeL = Game.GetModByName("LOTD_TCC_IceBlade.esp") != 255
	XX_ImmersiveL = Game.GetModByName("LOTD_TCC_ICOW.esp") != 255
	XX_KonahrikL = Game.GetModByName("LOTD_TCC_KA.esp") != 255
	XX_KagrenacL = Game.GetModByName("LOTD_TCC_Kagrenac.esp") != 255
	XX_KthoniaL = Game.GetModByName("LOTD_TCC_Kthonia.esp") != 255
	XX_MoonpathL = Game.GetModByName("LOTD_TCC_Moonpath.esp") != 255
	XX_MoonStarL = Game.GetModByName("LOTD_TCC_MAS.esp") != 255
	XX_OblivionArtL = Game.GetModByName("LOTD_TCC_OblivionArt.esp") != 255	
	XX_PathRevL = Game.GetModByName("LOTD_TCC_PathRev.esp") != 255
	XX_ProjectAHOL = Game.GetModByName("LOTD_TCC_ProjectAHO.esp") != 255
	XX_SkyrimSewers = Game.GetModByName("LOTD_TCC_SkyrimSewers.esp") != 255
	XX_SUTL = Game.GetModByName("LOTD_TCC_SUT.esp") != 255
	XX_ForgottenL = Game.GetModByName("LOTD_TCC_TFC.esp") != 255
	XX_RoyalL = Game.GetModByName("LOTD_TCC_Royal.esp") != 255
	XX_RuinsEdgeL = Game.GetModByName("LOTD_TCC_RuinsEdge.esp") != 255
	XX_TreasureHuntL = Game.GetModByName("LOTD_TCC_TreasureHunter.esp") != 255
	XX_NTHunterL = Game.GetModByName("LOTD_TCC_NTHunter.esp") != 255
	XX_NTHunterESLL = Game.GetModByName("LOTD_TCC_NTHunterESL.esp") != 255
	XX_SheoStaffL = Game.GetModByName("LOTD_TCC_SheoStaff.esp") != 255
	XX_SoapsL = Game.GetModByName("LOTD_TCC_Soaps.esp") != 255
	XX_SoapsKICL = Game.GetModByName("LOTD_TCC_Soaps_KIC.esp") != 255
	XX_UndeathL = Game.GetModByName("LOTD_TCC_Undeath.esp") != 255
	XX_VigilantL = Game.GetModByName("LOTD_TCC_Vigilant.esp") != 255
	XX_VolkiharL = Game.GetModByName("LOTD_TCC_Volkihar.esp") != 255
	XX_WheelsOfLullL = Game.GetModByName("LOTD_TCC_WheelsOfLull.esp") != 255
	XX_WintersunL = Game.GetModByName("LOTD_TCC_Wintersun.esp") != 255
	XX_WyrmstoothL = Game.GetModByName("LOTD_TCC_Wyrmstooth.esp") != 255
	XX_UndergroundL = Game.GetModByName("LOTD_TCC_Underground.esp") != 255
	XX_UndergroundESPL = Game.GetModByName("LOTD_TCC_UndergroundESP.esp") != 255
	
	
	XX_FissL = Game.GetModByName("Fiss.esp") != 255
	XX_SkyUI = Game.GetModByName("SkyUI_SE.esp") != 255	
	XX_LAL = Game.GetModByName("Alternate Start - Live Another Life.esp") != 255
	XX_RelicHunterL = Game.GetModByName("DBM_RelicHunter.esp") != 255	
	
	;Armory
	XX_DawnguardArsenalL = Game.GetModByName("LOTD_TCC_DawnguardArsenal.esp") != 255
	XX_GuardArmL = Game.GetModByName("LOTD_TCC_GuardArm.esp") != 255
	XX_HeavyArmL = Game.GetModByName("LOTD_TCC_HeavyArm.esp") != 255
	XX_ImmArmL = Game.GetModByName("LOTD_TCC_ImmArm.esp") != 255
	XX_ImmWeapL = Game.GetModByName("LOTD_TCC_ImmWeap.esp") != 255
	XX_JaysusL = Game.GetModByName("LOTD_TCC_Jaysus.esp") != 255
	XX_JaysusCraftL = Game.GetModByName("LOTD_TCC_JaysusCraft.esp") != 255				
	XX_ZimThaneL = Game.GetModByName("LOTD_TCC_ZimThane.esp") != 255
	XX_ZimThaneOnlyL = Game.GetModByName("LOTD_TCC_ZimThaneOnly.esp") != 255
	
EndEvent
