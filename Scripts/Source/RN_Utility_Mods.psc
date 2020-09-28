Scriptname RN_Utility_Mods extends Quest

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------Get Form From File --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RN_Utility_MCM Property RN_MCM Auto

RN_Utility_Script Property RN_Utility Auto

;;(Is the Supported Mod Installed?)

GlobalVariable Property RN_Installed_SaintsL Auto
GlobalVariable Property RN_Installed_RareCuriosL Auto
GlobalVariable Property RN_Installed_EliteCross Auto
GlobalVariable Property RN_Installed_ExpandedCross Auto
GlobalVariable Property RN_Installed_Camping Auto
GlobalVariable Property RN_Installed_AADwarvenMail Auto
GlobalVariable Property RN_Installed_AADaedricMail Auto
GlobalVariable Property RN_Installed_AADragonscale Auto
GlobalVariable Property RN_Installed_AAEbonyPlate Auto
GlobalVariable Property RN_Installed_AAElvenHunter Auto
GlobalVariable Property RN_Installed_AAStalhrimFur Auto
GlobalVariable Property RN_Installed_AASteelSoldier Auto
GlobalVariable Property RN_Installed_ArcaneAccessories Auto
GlobalVariable Property RN_Installed_ArcaneArcher Auto
GlobalVariable Property RN_Installed_BoneWolf Auto
GlobalVariable Property RN_Installed_Plague Auto
GlobalVariable Property RN_Installed_Seasons Auto
GlobalVariable Property RN_Installed_Goblins Auto
GlobalVariable Property RN_Installed_Backpack Auto
GlobalVariable Property RN_Installed_Pets Auto
GlobalVariable Property RN_Installed_Holiday Auto
GlobalVariable Property RN_Installed_Horses Auto
GlobalVariable Property RN_Installed_ArmsofChaos Auto
GlobalVariable Property RN_Installed_Chrysamere Auto
GlobalVariable Property RN_Installed_NetchLeatherArmor Auto
GlobalVariable Property RN_Installed_NordicJewelry Auto
GlobalVariable Property RN_Installed_SpellKnightArmor Auto
GlobalVariable Property RN_Installed_StaffofHasedoki Auto
GlobalVariable Property RN_Installed_StendarrsHammer Auto
GlobalVariable Property RN_Installed_Umbra Auto
GlobalVariable Property RN_Installed_VigilEnforcerArmorSet Auto
GlobalVariable Property RN_Installed_DawnfangDuskfang Auto
GlobalVariable Property RN_Installed_CivilWarChampions Auto
GlobalVariable Property RN_Installed_DeadMansDread Auto
GlobalVariable Property RN_Installed_DeadMansDread_Standalone Auto
GlobalVariable Property RN_Installed_DeadMansDread_Oblivion Auto	
GlobalVariable Property RN_Installed_DivineCrusader Auto
GlobalVariable Property RN_Installed_Shadowrend Auto
GlobalVariable Property RN_Installed_Shadowrend_Boethiah Auto
GlobalVariable Property RN_Installed_RuinsEdgeCC Auto
GlobalVariable Property RN_Installed_StaffofSheoCC Auto
GlobalVariable Property RN_Installed_TheGrayCowlReturns Auto
GlobalVariable Property RN_Installed_SunderWraithguard Auto
GlobalVariable Property RN_Installed_DwarvenMudcrab Auto
GlobalVariable Property RN_Installed_NixHound Auto

GlobalVariable Property RN_Installed_3DNPC Auto
GlobalVariable Property RN_Installed_Aetherium Auto
GlobalVariable Property RN_Installed_Amulets Auto
GlobalVariable Property RN_Installed_AnimatedArmory Auto
GlobalVariable Property RN_Installed_ArtifactsSkyrim Auto
GlobalVariable Property RN_Installed_Boethiah Auto
GlobalVariable Property RN_Installed_Cloaks Auto
GlobalVariable Property RN_Installed_Clockwork Auto
GlobalVariable Property RN_Installed_DawnguardArsenal Auto
GlobalVariable Property RN_Installed_Falskaar Auto
GlobalVariable Property RN_Installed_Follower_Auri Auto
GlobalVariable Property RN_Installed_Follower_Inigo Auto
GlobalVariable Property RN_Installed_Follower_Kaidan Auto
GlobalVariable Property RN_Installed_Follower_Mrissi Auto
GlobalVariable Property RN_Installed_Fossils Auto
GlobalVariable Property RN_Installed_GrayCowl Auto
GlobalVariable Property RN_Installed_Gremlins Auto
GlobalVariable Property RN_Installed_GuardArm Auto
GlobalVariable Property RN_Installed_HeavyArm Auto
GlobalVariable Property RN_Installed_Helgen Auto
GlobalVariable Property RN_Installed_ICOW Auto
GlobalVariable Property RN_Installed_IceBlade Auto
GlobalVariable Property RN_Installed_ImmArm Auto
GlobalVariable Property RN_Installed_ImmWeap Auto
GlobalVariable Property RN_Installed_Jaysus Auto
GlobalVariable Property RN_Installed_KA Auto
GlobalVariable Property RN_Installed_Kagrenac Auto
GlobalVariable Property RN_Installed_Kthonia Auto
GlobalVariable Property RN_Installed_MAS Auto
GlobalVariable Property RN_Installed_Moonpath Auto
GlobalVariable Property RN_Installed_NTHunter Auto
GlobalVariable Property RN_Installed_OblivionArt Auto
GlobalVariable Property RN_Installed_PathRev Auto
GlobalVariable Property RN_Installed_ProjectAHO Auto
GlobalVariable Property RN_Installed_Royal Auto
GlobalVariable Property RN_Installed_RuinsEdge Auto
GlobalVariable Property RN_Installed_SUT Auto
GlobalVariable Property RN_Installed_SafehouseGeneral Auto
GlobalVariable Property RN_Installed_SafehousePlus Auto
GlobalVariable Property RN_Installed_SheoStaff Auto
GlobalVariable Property RN_Installed_SkyrimSewers Auto
GlobalVariable Property RN_Installed_Soaps Auto
GlobalVariable Property RN_Installed_TFC Auto
GlobalVariable Property RN_Installed_TreasureHunter Auto
GlobalVariable Property RN_Installed_Undeath Auto
GlobalVariable Property RN_Installed_Underground Auto
GlobalVariable Property RN_Installed_Vigilant Auto
GlobalVariable Property RN_Installed_Volkihar Auto
GlobalVariable Property RN_Installed_WheelsOfLull Auto
GlobalVariable Property RN_Installed_Wintersun Auto
GlobalVariable Property RN_Installed_Wyrmstooth Auto
GlobalVariable Property RN_Installed_ZimThane Auto

GlobalVariable Property RN_Installed_ASLAL Auto
GlobalVariable Property RN_Installed_Fiss Auto
GlobalVariable Property RN_Installed_RelicHunter Auto
GlobalVariable Property RN_Installed_SkyUI Auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event Oninit()

	CheckSupportedMods()
endEvent

;-- Events --------------------------------

Event CheckSupportedMods()

	;;Museum	
	if Game.GetModByName("LOTD_TCC_Aetherium.esp") != 255
		RN_Installed_Aetherium.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Amulets.esp") != 255
		RN_Installed_Amulets.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_ArtifactsSkyrim.esp") != 255
		RN_Installed_ArtifactsSkyrim.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Gremlins.esp") != 255
		RN_Installed_Gremlins.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Boethiah.esp") != 255
		RN_Installed_Boethiah.SetValue(1)
	endIf	
	
	if Game.GetModByName("LOTD_TCC_Cloaks.esp") != 255
		RN_Installed_Cloaks.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Clockwork.esp") != 255
		RN_Installed_Clockwork.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Falskaar.esp") != 255
		RN_Installed_Falskaar.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Fossils.esp") != 255
		RN_Installed_Fossils.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_GrayCowl.esp") != 255
		RN_Installed_GrayCowl.SetValue(1)
	endIf	

	if Game.GetModByName("LOTD_TCC_Helgen.esp") != 255
		RN_Installed_Helgen.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_IceBlade.esp") != 255
		RN_Installed_IceBlade.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_ICOW.esp") != 255
		RN_Installed_ICOW.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_KA.esp") != 255
		RN_Installed_KA.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_Kagrenac.esp") != 255
		RN_Installed_Kagrenac.SetValue(1)
	endIf	

	if Game.GetModByName("LOTD_TCC_Kthonia.esp") != 255
		RN_Installed_Kthonia.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Moonpath.esp") != 255
		RN_Installed_Moonpath.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_MAS.esp") != 255
		RN_Installed_MAS.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_OblivionArt.esp") != 255	
		RN_Installed_OblivionArt.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_PathRev.esp") != 255
		RN_Installed_PathRev.SetValue(1)
	endIf	

	if Game.GetModByName("LOTD_TCC_ProjectAHO.esp") != 255
		RN_Installed_ProjectAHO.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_SkyrimSewers.esp") != 255
		RN_Installed_SkyrimSewers.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_SUT.esp") != 255
		RN_Installed_SUT.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_TFC.esp") != 255
		RN_Installed_TFC.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Royal.esp") != 255
		RN_Installed_Royal.SetValue(1)
	endIf		
	
	if Game.GetModByName("LOTD_TCC_RuinsEdge.esp") != 255
		RN_Installed_RuinsEdge.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_TreasureHunter.esp") != 255
		RN_Installed_TreasureHunter.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_NTHunter.esp") != 255 || Game.GetModByName("LOTD_TCC_NTHunterESL.esp") != 255
		RN_Installed_NTHunter.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_SheoStaff.esp") != 255
		RN_Installed_SheoStaff.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Soaps.esp") != 255 || Game.GetModByName("LOTD_TCC_Soaps_KIC.esp") != 255
		RN_Installed_Soaps.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Undeath.esp") != 255
		RN_Installed_Undeath.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Vigilant.esp") != 255
		RN_Installed_Vigilant.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Volkihar.esp") != 255
		RN_Installed_Volkihar.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_WheelsOfLull.esp") != 255
		RN_Installed_WheelsOfLull.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Wintersun.esp") != 255
		RN_Installed_Wintersun.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Wyrmstooth.esp") != 255
		RN_Installed_Wyrmstooth.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Underground.esp") != 255 || Game.GetModByName("LOTD_TCC_UndergroundESP.esp") != 255
		RN_Installed_Underground.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_3DNPC.esp") != 255
		RN_Installed_3DNPC.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_AnimatedArmory.esp") != 255
		RN_Installed_AnimatedArmory.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Follower_Auri.esp") != 255
		RN_Installed_Follower_Auri.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Follower_Inigo.esp") != 255
		RN_Installed_Follower_Inigo.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Follower_Kaidan.esp") != 255
		RN_Installed_Follower_Kaidan.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Follower_Mrissi.esp") != 255	
		RN_Installed_Follower_Mrissi.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_SafehousePlus.esp") != 255
		RN_Installed_SafehousePlus.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
	endIf
	
	
	;;Generic
	if Game.GetModByName("Fiss.esp") != 255
		RN_Installed_Fiss.SetValue(1)
	endIf
	
	if Game.GetModByName("SkyUI_SE.esp") != 255	
		RN_Installed_SkyUI.SetValue(1)
	endIf
	
	if Game.GetModByName("Alternate Start - Live Another Life.esp") != 255
		RN_Installed_ASLAL.SetValue(1)
	endIf
	
	if Game.GetModByName("DBM_RelicHunter.esp") != 255	
		RN_Installed_RelicHunter.SetValue(1)
	endIf


	;Armory
	if Game.GetModByName("LOTD_TCC_DawnguardArsenal.esp") != 255
		RN_Installed_DawnguardArsenal.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_GuardArm.esp") != 255
		RN_Installed_GuardArm.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_HeavyArm.esp") != 255
		RN_Installed_HeavyArm.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_ImmArm.esp") != 255
		RN_Installed_ImmArm.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_ImmWeap.esp") != 255
		RN_Installed_ImmWeap.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Jaysus.esp") != 255 || Game.GetModByName("LOTD_TCC_JaysusCraft.esp") != 255		
		RN_Installed_Jaysus.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_ZimThane.esp") != 255 || Game.GetModByName("LOTD_TCC_ZimThaneOnly.esp") != 255
		RN_Installed_ZimThane.SetValue(1)
	endIf

	
	;Creations	
	if Game.GetModByName("LOTD_TCC_Saints.esp") != 255
		RN_Installed_SaintsL.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_RareCurios.esp") != 255	
		RN_Installed_RareCuriosL.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_EliteCross.esp") != 255 || Game.GetModByName("LOTD_TCC_EliteCrossBolt.esp") != 255	
		RN_Installed_EliteCross.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_ExpandedCross.esp") != 255 || Game.GetModByName("LOTD_TCC_ExpandedCrossBolt.esp") != 255
		RN_Installed_ExpandedCross.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Camping.esp") != 255
		RN_Installed_Camping.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_AADwarvenMail.esp") != 255
		RN_Installed_AADwarvenMail.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_AADaedricMail.esp") != 255
		RN_Installed_AADaedricMail.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_AADragonscale.esp") != 255
		RN_Installed_AADragonscale.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_AAEbonyPlate.esp") != 255
		RN_Installed_AAEbonyPlate.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_AAElvenHunter.esp") != 255
		RN_Installed_AAElvenHunter.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_AAStalhrimFur.esp") != 255
		RN_Installed_AAStalhrimFur.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_AASteelSoldier.esp") != 255
		RN_Installed_AASteelSoldier.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_ArcaneAccessories.esp") != 255
		RN_Installed_ArcaneAccessories.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_ArcaneArcher.esp") != 255
		RN_Installed_ArcaneArcher.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_BoneWolf.esp") != 255
		RN_Installed_BoneWolf.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_Plague.esp") != 255
		RN_Installed_Plague.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_Seasons.esp") != 255
		RN_Installed_Seasons.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_Goblins.esp") != 255
		RN_Installed_Goblins.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_Backpack.esp") != 255
		RN_Installed_Backpack.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Pets.esp") != 255
		RN_Installed_Pets.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_Holiday.esp") != 255
		RN_Installed_Holiday.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_Horses.esp") != 255
		RN_Installed_Horses.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_ArmsofChaos.esp") != 255
		RN_Installed_ArmsofChaos.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_Chrysamere.esp") != 255
		RN_Installed_Chrysamere.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_NetchLeatherArmor.esp") != 255
		RN_Installed_NetchLeatherArmor.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_NordicJewelry.esp") != 255
		RN_Installed_NordicJewelry.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_SpellKnightArmor.esp") != 255
		RN_Installed_SpellKnightArmor.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_StaffofHasedoki.esp") != 255
		RN_Installed_StaffofHasedoki.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_StendarrsHammer.esp") != 255
		RN_Installed_StendarrsHammer.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Umbra.esp") != 255
		RN_Installed_Umbra.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_VigilEnforcerArmorSet.esp") != 255
		RN_Installed_VigilEnforcerArmorSet.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_DawnfangDuskfang.esp") != 255	
		RN_Installed_DawnfangDuskfang.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_CivilWarChampions_Standalone.esp") != 255 || Game.GetModByName("LOTD_TCC_CivilWarChampions_Individual.esp") != 255
		RN_Installed_CivilWarChampions.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_DeadMansDread_Standalone.esp") != 255
		RN_Installed_DeadMansDread.SetValue(1)
		RN_Installed_DeadMansDread_Standalone.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_DeadMansDread_Oblivion.esp") != 255
		RN_Installed_DeadMansDread.SetValue(1)
		RN_Installed_DeadMansDread_Oblivion.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_DivineCrusader_Standalone.esp") != 255 || Game.GetModByName("LOTD_TCC_DivineCrusader_Individual.esp") != 255
		RN_Installed_DivineCrusader.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_Shadowrend_Standalone.esp") != 255
		RN_Installed_Shadowrend.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_Shadowrend_Boethiah.esp") != 255
		RN_Installed_Shadowrend.SetValue(1)
		RN_Installed_Shadowrend_Boethiah.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_RuinsEdgeCC.esp") != 255
		RN_Installed_RuinsEdgeCC.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_StaffofSheoCC_Standalone.esp") != 255 || Game.GetModByName("LOTD_TCC_StaffofSheoCC_Cheese.esp") != 255 || Game.GetModByName("LOTD_TCC_StaffofSheoCC_UCCCP.esp") != 255
		RN_Installed_StaffofSheoCC.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_TheGrayCowlReturns.esp") != 255
		RN_Installed_TheGrayCowlReturns.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_SunderWraithguard.esp") != 255
		RN_Installed_SunderWraithguard.SetValue(1)
	endIf
	
	if Game.GetModByName("LOTD_TCC_DwarvenMudcrab.esp") != 255
		RN_Installed_DwarvenMudcrab.SetValue(1)
	endIf

	if Game.GetModByName("LOTD_TCC_NixHound.esp") != 255
		RN_Installed_NixHound.SetValue(1)
	endIf
	
EndEvent
