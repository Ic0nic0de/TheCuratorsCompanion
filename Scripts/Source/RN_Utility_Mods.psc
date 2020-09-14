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
Bool Property XX_3DNPC Auto
Bool Property XX_SaintsL Auto
Bool Property XX_RareCuriosL Auto
Bool Property XX_EliteCross Auto
Bool Property XX_EliteCrossBolt Auto
Bool Property XX_ExpandedCross Auto
Bool Property XX_ExpandedCrossBolt Auto
Bool Property XX_Camping Auto
Bool Property XX_AADwarvenMail Auto
Bool Property XX_AADaedricMail Auto
Bool Property XX_AADragonscale Auto
Bool Property XX_AAEbonyPlate Auto
Bool Property XX_AAElvenHunter Auto
Bool Property XX_AAStalhrimFur Auto
Bool Property XX_AASteelSoldier Auto
Bool Property XX_ArcaneAccessories Auto
Bool Property XX_ArcaneArcher Auto
Bool Property XX_BoneWolf Auto
Bool Property XX_Plague Auto
Bool Property XX_Seasons Auto
Bool Property XX_Goblins Auto
Bool Property XX_Backpack Auto
Bool Property XX_Pets Auto
Bool Property XX_Holiday Auto
Bool Property XX_Horses Auto
Bool Property XX_ArmsofChaos Auto
Bool Property XX_Chrysamere Auto
Bool Property XX_NetchLeatherArmor Auto
Bool Property XX_NordicJewelry Auto
Bool Property XX_SpellKnightArmor Auto
Bool Property XX_StaffofHasedoki Auto
Bool Property XX_StendarrsHammer Auto
Bool Property XX_Umbra Auto
Bool Property XX_VigilEnforcerArmorSet Auto
Bool Property XX_DawnfangDuskfang Auto
Bool Property XX_CivilWarChampions_Standalone Auto
Bool Property XX_CivilWarChampions_Individual Auto
Bool Property XX_DeadMansDread_Standalone Auto
Bool Property XX_DeadMansDread_Oblivion Auto	
Bool Property XX_DivineCrusader_Standalone Auto
Bool Property XX_DivineCrusader_Individual Auto	
Bool Property XX_Shadowrend_Standalone Auto
Bool Property XX_Shadowrend_Boethiah Auto
Bool Property XX_RuinsEdgeCC Auto
Bool Property XX_StaffofSheoCC_Standalone Auto
Bool Property XX_StaffofSheoCC_Cheese Auto
Bool Property XX_StaffofSheoCC_UCCCP Auto
Bool Property XX_TheGrayCowlReturns Auto
Bool Property XX_SunderWraithguard Auto
Bool Property XX_DwarvenMudcrab Auto
Bool Property XX_NixHound Auto
Bool Property XX_AnimArm Auto

Bool Property XX_SafehouseL Auto

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
	XX_3DNPC = Game.GetModByName("LOTD_TCC_3DNPC.esp") != 255
	
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
	
	;Creations
	XX_SaintsL = Game.GetModByName("LOTD_TCC_Saints.esp") != 255
	XX_RareCuriosL = Game.GetModByName("LOTD_TCC_RareCurios.esp") != 255	
	XX_EliteCross = Game.GetModByName("LOTD_TCC_EliteCross.esp") != 255
	XX_EliteCrossBolt = Game.GetModByName("LOTD_TCC_EliteCrossBolt.esp") != 255	
	XX_ExpandedCross = Game.GetModByName("LOTD_TCC_ExpandedCross.esp") != 255
	XX_ExpandedCrossBolt = Game.GetModByName("LOTD_TCC_ExpandedCrossBolt.esp") != 255
	XX_Camping = Game.GetModByName("LOTD_TCC_Camping.esp") != 255
	XX_AADwarvenMail = Game.GetModByName("LOTD_TCC_AADwarvenMail.esp") != 255
	XX_AADaedricMail = Game.GetModByName("LOTD_TCC_AADaedricMail.esp") != 255
	XX_AADragonscale = Game.GetModByName("LOTD_TCC_AADragonscale.esp") != 255
	XX_AAEbonyPlate = Game.GetModByName("LOTD_TCC_AAEbonyPlate.esp") != 255
	XX_AAElvenHunter = Game.GetModByName("LOTD_TCC_AAElvenHunter.esp") != 255
	XX_AAStalhrimFur = Game.GetModByName("LOTD_TCC_AAStalhrimFur.esp") != 255
	XX_AASteelSoldier = Game.GetModByName("LOTD_TCC_AASteelSoldier.esp") != 255
	XX_ArcaneAccessories = Game.GetModByName("LOTD_TCC_ArcaneAccessories.esp") != 255
	XX_ArcaneArcher = Game.GetModByName("LOTD_TCC_ArcaneArcher.esp") != 255
	XX_BoneWolf = Game.GetModByName("LOTD_TCC_BoneWolf.esp") != 255
	XX_Plague = Game.GetModByName("LOTD_TCC_Plague.esp") != 255
	XX_Seasons = Game.GetModByName("LOTD_TCC_Seasons.esp") != 255
	XX_Goblins = Game.GetModByName("LOTD_TCC_Goblins.esp") != 255
	XX_Backpack = Game.GetModByName("LOTD_TCC_Backpack.esp") != 255
	XX_Pets = Game.GetModByName("LOTD_TCC_Pets.esp") != 255
	XX_Holiday = Game.GetModByName("LOTD_TCC_Holiday.esp") != 255
	XX_Horses = Game.GetModByName("LOTD_TCC_Horses.esp") != 255
	XX_ArmsofChaos = Game.GetModByName("LOTD_TCC_ArmsofChaos.esp") != 255
	XX_Chrysamere = Game.GetModByName("LOTD_TCC_Chrysamere.esp") != 255
	XX_NetchLeatherArmor = Game.GetModByName("LOTD_TCC_NetchLeatherArmor.esp") != 255
	XX_NordicJewelry = Game.GetModByName("LOTD_TCC_NordicJewelry.esp") != 255
	XX_SpellKnightArmor = Game.GetModByName("LOTD_TCC_SpellKnightArmor.esp") != 255
	XX_StaffofHasedoki = Game.GetModByName("LOTD_TCC_StaffofHasedoki.esp") != 255
	XX_StendarrsHammer = Game.GetModByName("LOTD_TCC_StendarrsHammer.esp") != 255
	XX_Umbra = Game.GetModByName("LOTD_TCC_Umbra.esp") != 255
	XX_VigilEnforcerArmorSet = Game.GetModByName("LOTD_TCC_VigilEnforcerArmorSet.esp") != 255
	XX_DawnfangDuskfang = Game.GetModByName("LOTD_TCC_DawnfangDuskfang.esp") != 255	
	XX_CivilWarChampions_Standalone = Game.GetModByName("LOTD_TCC_CivilWarChampions_Standalone.esp") != 255
	XX_CivilWarChampions_Individual = Game.GetModByName("LOTD_TCC_CivilWarChampions_Individual.esp") != 255
	XX_DeadMansDread_Standalone = Game.GetModByName("LOTD_TCC_DeadMansDread_Standalone.esp") != 255
	XX_DeadMansDread_Oblivion = Game.GetModByName("LOTD_TCC_DeadMansDread_Oblivion.esp") != 255
	XX_DivineCrusader_Standalone = Game.GetModByName("LOTD_TCC_DivineCrusader_Standalone.esp") != 255
	XX_DivineCrusader_Individual = Game.GetModByName("LOTD_TCC_DivineCrusader_Individual.esp") != 255
	XX_Shadowrend_Standalone = Game.GetModByName("LOTD_TCC_Shadowrend_Standalone.esp") != 255
	XX_Shadowrend_Boethiah = Game.GetModByName("LOTD_TCC_Shadowrend_Boethiah.esp") != 255
	XX_RuinsEdgeCC = Game.GetModByName("LOTD_TCC_RuinsEdgeCC.esp") != 255
	XX_StaffofSheoCC_Standalone = Game.GetModByName("LOTD_TCC_StaffofSheoCC_Standalone.esp") != 255
	XX_StaffofSheoCC_Cheese = Game.GetModByName("LOTD_TCC_StaffofSheoCC_Cheese.esp") != 255
	XX_StaffofSheoCC_UCCCP = Game.GetModByName("LOTD_TCC_StaffofSheoCC_UCCCP.esp") != 255
	XX_TheGrayCowlReturns = Game.GetModByName("LOTD_TCC_TheGrayCowlReturns.esp") != 255
	XX_SunderWraithguard = Game.GetModByName("LOTD_TCC_SunderWraithguard.esp") != 255
	XX_DwarvenMudcrab = Game.GetModByName("LOTD_TCC_DwarvenMudcrab.esp") != 255
	XX_NixHound = Game.GetModByName("LOTD_TCC_NixHound.esp") != 255
	XX_AnimArm = Game.GetModByName("LOTD_TCC_AnimatedArmory.esp") != 255
	XX_SafehouseL = XX_CloaksL || XX_SoapsL || XX_SoapsKICL
	
EndEvent
