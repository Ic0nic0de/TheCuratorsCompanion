Scriptname RN_Utility_Mods extends Quest

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------Get Form From File --------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RN_Utility_MCM property RN_MCM auto

RN_Utility_Script property RN_Utility auto

message property _PatchError auto
;;(Is the Supported Mod Installed?)

globalvariable property RN_Installed_SaintsL auto
globalvariable property RN_Installed_RareCuriosL auto
globalvariable property RN_Installed_EliteCross auto
globalvariable property RN_Installed_ExpandedCross auto
globalvariable property RN_Installed_Camping auto
globalvariable property RN_Installed_AADwarvenMail auto
globalvariable property RN_Installed_AADaedricMail auto
globalvariable property RN_Installed_AADragonscale auto
globalvariable property RN_Installed_AAEbonyPlate auto
globalvariable property RN_Installed_AAElvenHunter auto
globalvariable property RN_Installed_AAStalhrimFur auto
globalvariable property RN_Installed_AASteelSoldier auto
globalvariable property RN_Installed_ArcaneAccessories auto
globalvariable property RN_Installed_ArcaneArcher auto
globalvariable property RN_Installed_BoneWolf auto
globalvariable property RN_Installed_Plague auto
globalvariable property RN_Installed_Seasons auto
globalvariable property RN_Installed_Goblins auto
globalvariable property RN_Installed_Backpack auto
globalvariable property RN_Installed_Pets auto
globalvariable property RN_Installed_Holiday auto
globalvariable property RN_Installed_Horses auto
globalvariable property RN_Installed_ArmsofChaos auto
globalvariable property RN_Installed_NetchLeatherArmor auto
globalvariable property RN_Installed_NordicJewelry auto
globalvariable property RN_Installed_SpellKnightArmor auto
globalvariable property RN_Installed_StaffofHasedoki auto
globalvariable property RN_Installed_StendarrsHammer auto
globalvariable property RN_Installed_Umbra auto
globalvariable property RN_Installed_VigilEnforcerArmorSet auto
globalvariable property RN_Installed_DawnfangDuskfang auto
globalvariable property RN_Installed_CivilWarChampions auto
globalvariable property RN_Installed_DeadMansDread auto	
globalvariable property RN_Installed_DivineCrusader auto
globalvariable property RN_Installed_Shadowrend auto
globalvariable property RN_Installed_Shadowrend_Boethiah auto
globalvariable property RN_Installed_RuinsEdgeCC auto
globalvariable property RN_Installed_StaffofSheoCC auto
globalvariable property RN_Installed_TheGrayCowlReturns auto
globalvariable property RN_Installed_DwarvenMudcrab auto
globalvariable property RN_Installed_NixHound auto

globalvariable property RN_Installed_3DNPC auto
globalvariable property RN_Installed_Aetherium auto
globalvariable property RN_Installed_Amulets auto
globalvariable property RN_Installed_AnimatedArmory auto
globalvariable property RN_Installed_ArtifactsSkyrim auto
globalvariable property RN_Installed_Boethiah auto
globalvariable property RN_Installed_Bruma auto
globalvariable property RN_Installed_Cloaks auto
globalvariable property RN_Installed_Clockwork auto
globalvariable property RN_Installed_DawnguardArsenal auto
globalvariable property RN_Installed_DwemerSpectres auto
globalvariable property RN_Installed_Falskaar auto
globalvariable property RN_Installed_Follower_Auri auto
globalvariable property RN_Installed_Follower_Inigo auto
globalvariable property RN_Installed_Follower_Kaidan auto
globalvariable property RN_Installed_Follower_Mrissi auto
globalvariable property RN_Installed_Fossils auto
globalvariable property RN_Installed_GrayCowl auto
globalvariable property RN_Installed_Gremlins auto
globalvariable property RN_Installed_GuardArm auto
globalvariable property RN_Installed_HeavyArm auto
globalvariable property RN_Installed_Helgen auto
globalvariable property RN_Installed_ICOW auto
globalvariable property RN_Installed_IceBlade auto
globalvariable property RN_Installed_IdentityCrisis auto
globalvariable property RN_Installed_ImmArm auto
globalvariable property RN_Installed_ImmWeap auto
globalvariable property RN_Installed_Jaysus auto
globalvariable property RN_Installed_KA auto
globalvariable property RN_Installed_Kagrenac auto
globalvariable property RN_Installed_Kthonia auto
globalvariable property RN_Installed_MAS auto
globalvariable property RN_Installed_Moonpath auto
globalvariable property RN_Installed_NTHunter auto
globalvariable property RN_Installed_OblivionArt auto
globalvariable property RN_Installed_PathRev auto
globalvariable property RN_Installed_ProjectAHO auto
globalvariable property RN_Installed_RoM auto
globalvariable property RN_Installed_Royal auto
globalvariable property RN_Installed_RuinsEdge auto
globalvariable property RN_Installed_SUT auto
globalvariable property RN_Installed_SafehouseGeneral auto
globalvariable property RN_Installed_SafehousePlus auto
globalvariable property RN_Installed_SheoStaff auto
globalvariable property RN_Installed_SkyrimSewers auto
globalvariable property RN_Installed_Soaps auto
globalvariable property RN_Installed_Teldryn auto
globalvariable property RN_Installed_Brotherhood auto
globalvariable property RN_Installed_TFC auto
globalvariable property RN_Installed_TreasureHunter auto
globalvariable property RN_Installed_Undeath auto
globalvariable property RN_Installed_Underground auto
globalvariable property RN_Installed_Vigilant auto
globalvariable property RN_Installed_Volkihar auto
globalvariable property RN_Installed_WheelsOfLull auto
globalvariable property RN_Installed_Wintersun auto
globalvariable property RN_Installed_Wyrmstooth auto
globalvariable property RN_Installed_ZimThane auto

globalvariable property RN_Installed_ASLAL auto
globalvariable property RN_Installed_Fiss auto
globalvariable property RN_Installed_RelicHunter auto
globalvariable property RN_Installed_SkyUI auto

objectreference property DBM_CloaksStorage auto

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event Oninit()

	CheckSupportedMods()
endEvent

;-- Events --------------------------------

Event SendError(globalvariable akvariable)

	If RN_MCM.DevDebugVal
		DBMDebug.Log(Self, "The Curators Companion - Patch Install Error: " + akvariable)
	endIf
endEvent

;-- Events --------------------------------

Event CheckSupportedMods()

	;;Museum
	if Game.GetModByName("LOTD_TCC_Aetherium.esp") != 255
		RN_Installed_Aetherium.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Aetherium.esp") == 255 && RN_Installed_Aetherium.GetValue()
		SendError(RN_Installed_Aetherium)
		_PatchError.Show()
		
	else
		RN_Installed_Aetherium.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Amulets.esp") != 255
		RN_Installed_Amulets.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Amulets.esp") == 255 && RN_Installed_Amulets.GetValue()
		SendError(RN_Installed_Amulets)
		_PatchError.Show()
		
	else
		RN_Installed_Amulets.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_ArtifactsSkyrim.esp") != 255
		RN_Installed_ArtifactsSkyrim.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_ArtifactsSkyrim.esp") == 255 && RN_Installed_ArtifactsSkyrim.GetValue()
		SendError(RN_Installed_ArtifactsSkyrim)
		_PatchError.Show()
		
	else
		RN_Installed_ArtifactsSkyrim.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Gremlins.esp") != 255
		RN_Installed_Gremlins.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Gremlins.esp") == 255 && RN_Installed_Gremlins.GetValue()
		SendError(RN_Installed_Gremlins)
		_PatchError.Show()
		
	else
		RN_Installed_Gremlins.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Boethiah.esp") != 255
		RN_Installed_Boethiah.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Boethiah.esp") == 255 && RN_Installed_Boethiah.GetValue()
		SendError(RN_Installed_Boethiah)
		_PatchError.Show()
		
	else
		RN_Installed_Boethiah.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Bruma.esp") != 255
		RN_Installed_Bruma.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Bruma.esp") == 255 && RN_Installed_Bruma.GetValue()
		SendError(RN_Installed_Bruma)
		_PatchError.Show()
		
	else
		RN_Installed_Bruma.SetValue(0)
	endIf
	
;--------------------------
	
	if Game.GetModByName("LOTD_TCC_Cloaks.esp") != 255
		RN_Installed_Cloaks.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
		DBM_CloaksStorage = Game.GetFormFromFile(2122, "DBM_CloaksofSkyrim_Patch.esp") as objectreference
		
	elseif Game.GetModByName("LOTD_TCC_Cloaks.esp") == 255 && RN_Installed_Cloaks.GetValue()
		SendError(RN_Installed_Cloaks)
		_PatchError.Show()
		
	else
		RN_Installed_Cloaks.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Clockwork.esp") != 255
		RN_Installed_Clockwork.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Clockwork.esp") == 255 && RN_Installed_Clockwork.GetValue()
		SendError(RN_Installed_Clockwork)
		_PatchError.Show()
		
	else
		RN_Installed_Clockwork.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_DwemerSpectres.esp") != 255
		RN_Installed_DwemerSpectres.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_DwemerSpectres.esp") == 255 && RN_Installed_DwemerSpectres.GetValue()
		SendError(RN_Installed_DwemerSpectres)
		_PatchError.Show()
		
	else
		RN_Installed_DwemerSpectres.SetValue(0)
	endIf
	
;--------------------------

	if Game.GetModByName("LOTD_TCC_Falskaar.esp") != 255
		RN_Installed_Falskaar.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Falskaar.esp") == 255 && RN_Installed_Falskaar.GetValue()
		SendError(RN_Installed_Falskaar)
		_PatchError.Show()
		
	else
		RN_Installed_Falskaar.SetValue(0)
	endIf
	
;--------------------------

	if Game.GetModByName("LOTD_TCC_Fossils.esp") != 255
		RN_Installed_Fossils.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Fossils.esp") == 255 && RN_Installed_Fossils.GetValue()
		SendError(RN_Installed_Fossils)
		_PatchError.Show()
		
	else
		RN_Installed_Fossils.SetValue(0)
	endIf
	
;--------------------------

	if Game.GetModByName("LOTD_TCC_GrayCowl.esp") != 255
		RN_Installed_GrayCowl.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_GrayCowl.esp") == 255 && RN_Installed_GrayCowl.GetValue()
		SendError(RN_Installed_GrayCowl)
		_PatchError.Show()
		
	else
		RN_Installed_GrayCowl.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Helgen.esp") != 255
		RN_Installed_Helgen.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Helgen.esp") == 255 && RN_Installed_Helgen.GetValue()
		SendError(RN_Installed_Helgen)
		_PatchError.Show()
		
	else
		RN_Installed_Helgen.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_IceBlade.esp") != 255
		RN_Installed_IceBlade.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_IceBlade.esp") == 255 && RN_Installed_IceBlade.GetValue()
		SendError(RN_Installed_IceBlade)
		_PatchError.Show()
		
	else
		RN_Installed_IceBlade.SetValue(0)
	endIf
	
;--------------------------

	if Game.GetModByName("LOTD_TCC_ICOW.esp") != 255
		RN_Installed_ICOW.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_ICOW.esp") == 255 && RN_Installed_ICOW.GetValue()
		SendError(RN_Installed_ICOW)
		_PatchError.Show()
		
	else
		RN_Installed_ICOW.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_KA.esp") != 255
		RN_Installed_KA.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_KA.esp") == 255 && RN_Installed_KA.GetValue()
		SendError(RN_Installed_KA)
		_PatchError.Show()
		
	else
		RN_Installed_KA.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_Kagrenac.esp") != 255
		RN_Installed_Kagrenac.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Kagrenac.esp") == 255 && RN_Installed_Kagrenac.GetValue()
		SendError(RN_Installed_Kagrenac)
		_PatchError.Show()
		
	else
		RN_Installed_Kagrenac.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Kthonia.esp") != 255
		RN_Installed_Kthonia.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Kthonia.esp") == 255 && RN_Installed_Kthonia.GetValue()
		SendError(RN_Installed_Kthonia)
		_PatchError.Show()
		
	else
		RN_Installed_Kthonia.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Moonpath.esp") != 255
		RN_Installed_Moonpath.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Moonpath.esp") == 255 && RN_Installed_Moonpath.GetValue()
		SendError(RN_Installed_Moonpath)
		_PatchError.Show()
		
	else
		RN_Installed_Moonpath.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_MAS.esp") != 255
		RN_Installed_MAS.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_MAS.esp") == 255 && RN_Installed_MAS.GetValue()
		SendError(RN_Installed_MAS)
		_PatchError.Show()
		
	else
		RN_Installed_MAS.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_OblivionArt.esp") != 255
		RN_Installed_OblivionArt.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_OblivionArt.esp") == 255 && RN_Installed_OblivionArt.GetValue()
		SendError(RN_Installed_OblivionArt)
		_PatchError.Show()
		
	else
		RN_Installed_OblivionArt.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_PathRev.esp") != 255
		RN_Installed_PathRev.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_PathRev.esp") == 255 && RN_Installed_PathRev.GetValue()
		SendError(RN_Installed_PathRev)
		_PatchError.Show()
		
	else
		RN_Installed_PathRev.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_ProjectAHO.esp") != 255
		RN_Installed_ProjectAHO.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_ProjectAHO.esp") == 255 && RN_Installed_ProjectAHO.GetValue()
		SendError(RN_Installed_ProjectAHO)
		_PatchError.Show()
		
	else
		RN_Installed_ProjectAHO.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_SkyrimSewers.esp") != 255
		RN_Installed_SkyrimSewers.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_SkyrimSewers.esp") == 255 && RN_Installed_SkyrimSewers.GetValue()
		SendError(RN_Installed_SkyrimSewers)
		_PatchError.Show()
		
	else
		RN_Installed_SkyrimSewers.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_SUT.esp") != 255
		RN_Installed_SUT.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_SUT.esp") == 255 && RN_Installed_SUT.GetValue()
		SendError(RN_Installed_SUT)
		_PatchError.Show()
		
	else
		RN_Installed_SUT.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_TFC.esp") != 255
		RN_Installed_TFC.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_TFC.esp") == 255 && RN_Installed_TFC.GetValue()
		SendError(RN_Installed_TFC)
		_PatchError.Show()
		
	else
		RN_Installed_TFC.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Royal.esp") != 255
		RN_Installed_Royal.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Royal.esp") == 255 && RN_Installed_Royal.GetValue()
		SendError(RN_Installed_Royal)
		_PatchError.Show()
		
	else
		RN_Installed_Royal.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_RoM.esp") != 255
		RN_Installed_RoM.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_RoM.esp") == 255 && RN_Installed_RoM.GetValue()
		SendError(RN_Installed_RoM)
		_PatchError.Show()
		
	else
		RN_Installed_RoM.SetValue(0)
	endIf
	
;--------------------------
	
	if Game.GetModByName("LOTD_TCC_RuinsEdge.esp") != 255
		RN_Installed_RuinsEdge.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_RuinsEdge.esp") == 255 && RN_Installed_RuinsEdge.GetValue()
		SendError(RN_Installed_RuinsEdge)
		_PatchError.Show()
		
	else
		RN_Installed_RuinsEdge.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_TreasureHunter.esp") != 255
		RN_Installed_TreasureHunter.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_TreasureHunter.esp") == 255 && RN_Installed_TreasureHunter.GetValue()
		SendError(RN_Installed_TreasureHunter)
		_PatchError.Show()
		
	else
		RN_Installed_TreasureHunter.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_NTHunter.esp") != 255
		RN_Installed_NTHunter.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_NTHunter.esp") == 255 && RN_Installed_NTHunter.GetValue()
		SendError(RN_Installed_NTHunter)
		_PatchError.Show()
		
	else
		RN_Installed_NTHunter.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_SheoStaff.esp") != 255
		RN_Installed_SheoStaff.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_SheoStaff.esp") == 255 && RN_Installed_SheoStaff.GetValue()
		SendError(RN_Installed_SheoStaff)
		_PatchError.Show()
		
	else
		RN_Installed_SheoStaff.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Soaps.esp") != 255 || Game.GetModByName("LOTD_TCC_Soaps_KIC.esp") != 255
		RN_Installed_Soaps.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Soaps.esp") == 255 && RN_Installed_Soaps.GetValue() || !Game.GetModByName("LOTD_TCC_Soaps_KIC.esp") == 255 && RN_Installed_Soaps.GetValue()
		SendError(RN_Installed_Soaps)
		_PatchError.Show()
		
	else
		RN_Installed_Soaps.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Undeath.esp") != 255
		RN_Installed_Undeath.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Undeath.esp") == 255 && RN_Installed_Undeath.GetValue()
		SendError(RN_Installed_Undeath)
		_PatchError.Show()
		
	else
		RN_Installed_Undeath.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Vigilant.esp") != 255
		RN_Installed_Vigilant.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Vigilant.esp") == 255 && RN_Installed_Vigilant.GetValue()
		SendError(RN_Installed_Vigilant)
		_PatchError.Show()
		
	else
		RN_Installed_Vigilant.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Volkihar.esp") != 255
		RN_Installed_Volkihar.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Volkihar.esp") == 255 && RN_Installed_Volkihar.GetValue()
		SendError(RN_Installed_Volkihar)
		_PatchError.Show()
		
	else
		RN_Installed_Volkihar.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_WheelsOfLull.esp") != 255
		RN_Installed_WheelsOfLull.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_WheelsOfLull.esp") == 255 && RN_Installed_WheelsOfLull.GetValue()
		SendError(RN_Installed_WheelsOfLull)
		_PatchError.Show()
		
	else
		RN_Installed_WheelsOfLull.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Wintersun.esp") != 255
		RN_Installed_Wintersun.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Wintersun.esp") == 255 && RN_Installed_Wintersun.GetValue()
		SendError(RN_Installed_Wintersun)
		_PatchError.Show()
		
	else
		RN_Installed_Wintersun.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Wyrmstooth.esp") != 255
		RN_Installed_Wyrmstooth.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Wyrmstooth.esp") == 255 && RN_Installed_Wyrmstooth.GetValue()
		SendError(RN_Installed_Wyrmstooth)
		_PatchError.Show()
		
	else
		RN_Installed_Wyrmstooth.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Underground.esp") != 255
		RN_Installed_Underground.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_RuinsEdge.esp") == 255 && RN_Installed_Underground.GetValue()
		SendError(RN_Installed_Underground)
		_PatchError.Show()
		
	else
		RN_Installed_Underground.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_3DNPC.esp") != 255
		RN_Installed_3DNPC.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_3DNPC.esp") == 255 && RN_Installed_3DNPC.GetValue()
		SendError(RN_Installed_3DNPC)
		_PatchError.Show()
		
	else
		RN_Installed_3DNPC.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_AnimatedArmory.esp") != 255
		RN_Installed_AnimatedArmory.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_AnimatedArmory.esp") == 255 && RN_Installed_AnimatedArmory.GetValue()
		SendError(RN_Installed_AnimatedArmory)
		_PatchError.Show()
		
	else
		RN_Installed_AnimatedArmory.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Follower_Auri.esp") != 255
		RN_Installed_Follower_Auri.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Follower_Auri.esp") == 255 && RN_Installed_Follower_Auri.GetValue()
		SendError(RN_Installed_Follower_Auri)
		_PatchError.Show()
		
	else
		RN_Installed_Follower_Auri.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Follower_Inigo.esp") != 255
		RN_Installed_Follower_Inigo.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Follower_Inigo.esp") == 255 && RN_Installed_Follower_Inigo.GetValue()
		SendError(RN_Installed_Follower_Inigo)
		_PatchError.Show()
		
	else
		RN_Installed_Follower_Inigo.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Follower_Kaidan.esp") != 255
		RN_Installed_Follower_Kaidan.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Follower_Kaidan.esp") == 255 && RN_Installed_Follower_Kaidan.GetValue()
		SendError(RN_Installed_Follower_Kaidan)
		_PatchError.Show()
		
	else
		RN_Installed_Follower_Kaidan.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Follower_Mrissi.esp") != 255
		RN_Installed_Follower_Mrissi.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Follower_Mrissi.esp") == 255 && RN_Installed_Follower_Mrissi.GetValue()
		SendError(RN_Installed_Follower_Mrissi)
		_PatchError.Show()
		
	else
		RN_Installed_Follower_Mrissi.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_SafehousePlus.esp") != 255
		RN_Installed_SafehousePlus.SetValue(1)
		RN_Installed_SafehouseGeneral.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_SafehousePlus.esp") == 255 && RN_Installed_SafehousePlus.GetValue()
		SendError(RN_Installed_SafehousePlus)
		_PatchError.Show()
		
	else
		RN_Installed_SafehousePlus.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_TeldrynSerious.esp") != 255
		RN_Installed_Teldryn.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_TeldrynSerious.esp") == 255 && RN_Installed_Teldryn.GetValue()
		SendError(RN_Installed_Teldryn)
		_PatchError.Show()
		
	else
		RN_Installed_Teldryn.SetValue(0)
	endIf
	
;--------------------------
	
	;;Generic
	if Game.GetModByName("Fiss.esp") != 255
		RN_Installed_Fiss.SetValue(1)
		
	elseif Game.GetModByName("Fiss.esp") == 255 && RN_Installed_Fiss.GetValue()
		SendError(RN_Installed_Fiss)
		_PatchError.Show()
		
	else
		RN_Installed_Fiss.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("SkyUI_SE.esp") != 255
		RN_Installed_SkyUI.SetValue(1)
		
	elseif Game.GetModByName("SkyUI_SE.esp") == 255 && RN_Installed_SkyUI.GetValue()
		SendError(RN_Installed_SkyUI)
		_PatchError.Show()
		
	else
		RN_Installed_SkyUI.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("Alternate Start - Live Another Life.esp") != 255
		RN_Installed_ASLAL.SetValue(1)
		
	elseif Game.GetModByName("Alternate Start - Live Another Life.esp") == 255 && RN_Installed_ASLAL.GetValue()
		SendError(RN_Installed_ASLAL)
		_PatchError.Show()
		
	else
		RN_Installed_ASLAL.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("DBM_RelicHunter.esp") != 255
		RN_Installed_RelicHunter.SetValue(1)
		
	elseif Game.GetModByName("DBM_RelicHunter.esp") == 255 && RN_Installed_RelicHunter.GetValue()
		SendError(RN_Installed_RelicHunter)
		_PatchError.Show()
		
	else
		RN_Installed_RelicHunter.SetValue(0)
	endIf

;--------------------------

	;Armory
	if Game.GetModByName("LOTD_TCC_DawnguardArsenal.esp") != 255
		RN_Installed_DawnguardArsenal.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_DawnguardArsenal.esp") == 255 && RN_Installed_DawnguardArsenal.GetValue()
		SendError(RN_Installed_DawnguardArsenal)
		_PatchError.Show()
		
	else
		RN_Installed_DawnguardArsenal.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_GuardArm.esp") != 255
		RN_Installed_GuardArm.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_GuardArm.esp") == 255 && RN_Installed_GuardArm.GetValue()
		SendError(RN_Installed_GuardArm)
		_PatchError.Show()
		
	else
		RN_Installed_GuardArm.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_HeavyArm.esp") != 255
		RN_Installed_HeavyArm.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_HeavyArm.esp") == 255 && RN_Installed_HeavyArm.GetValue()
		SendError(RN_Installed_HeavyArm)
		_PatchError.Show()
		
	else
		RN_Installed_HeavyArm.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_IdentityCrisis.esp") != 255
		RN_Installed_IdentityCrisis.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_IdentityCrisis.esp") == 255 && RN_Installed_IdentityCrisis.GetValue()
		SendError(RN_Installed_IdentityCrisis)
		_PatchError.Show()
		
	else
		RN_Installed_IdentityCrisis.SetValue(0)
	endIf
	
;--------------------------

	if Game.GetModByName("LOTD_TCC_ImmArm.esp") != 255
		RN_Installed_ImmArm.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_ImmArm.esp") == 255 && RN_Installed_ImmArm.GetValue()
		SendError(RN_Installed_ImmArm)
		_PatchError.Show()
		
	else
		RN_Installed_ImmArm.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_ImmWeap.esp") != 255
		RN_Installed_ImmWeap.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_ImmWeap.esp") == 255 && RN_Installed_ImmWeap.GetValue()
		SendError(RN_Installed_ImmWeap)
		_PatchError.Show()
		
	else
		RN_Installed_ImmWeap.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Jaysus.esp") != 255 || Game.GetModByName("LOTD_TCC_JaysusCraft.esp") != 255
		RN_Installed_Jaysus.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Jaysus.esp") == 255 && RN_Installed_Jaysus.GetValue() || !Game.GetModByName("LOTD_TCC_JaysusCraft.esp") == 255 && RN_Installed_Jaysus.GetValue()
		SendError(RN_Installed_Jaysus)
		_PatchError.Show()
		
	else
		RN_Installed_Jaysus.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_ZimThane.esp") != 255 || Game.GetModByName("LOTD_TCC_ZimThaneOnly.esp") != 255	
		RN_Installed_ZimThane.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_ZimThane.esp") == 255 && RN_Installed_ZimThane.GetValue() || !Game.GetModByName("LOTD_TCC_ZimThaneOnly.esp") == 255 && RN_Installed_ZimThane.GetValue()
		SendError(RN_Installed_ZimThane)
		_PatchError.Show()
		
	else
		RN_Installed_ZimThane.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_BrotherhoodofOld.esp") != 255 || Game.GetModByName("LOTD_TCC_BrotherhoodofOld_OAP.esp") != 255	
		RN_Installed_Brotherhood.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_BrotherhoodofOld.esp") == 255 && RN_Installed_Brotherhood.GetValue() || !Game.GetModByName("LOTD_TCC_BrotherhoodofOld_OAP.esp") == 255 && RN_Installed_Brotherhood.GetValue()
		SendError(RN_Installed_Brotherhood)
		_PatchError.Show()
		
	else
		RN_Installed_Brotherhood.SetValue(0)
	endIf
	
;--------------------------
	
	;Creations	
	if Game.GetModByName("LOTD_TCC_Saints.esp") != 255
		RN_Installed_SaintsL.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Saints.esp") == 255 && RN_Installed_SaintsL.GetValue()
		SendError(RN_Installed_SaintsL)
		_PatchError.Show()
		
	else
		RN_Installed_SaintsL.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_RareCurios.esp") != 255
		RN_Installed_RareCuriosL.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_RareCurios.esp") == 255 && RN_Installed_RareCuriosL.GetValue()
		SendError(RN_Installed_RareCuriosL)
		_PatchError.Show()
		
	else
		RN_Installed_RareCuriosL.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_EliteCross.esp") != 255 || Game.GetModByName("LOTD_TCC_EliteCrossBolt.esp") != 255
		RN_Installed_EliteCross.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_EliteCross.esp") == 255 && RN_Installed_EliteCross.GetValue() || !Game.GetModByName("LOTD_TCC_EliteCrossBolt.esp") == 255 && RN_Installed_EliteCross.GetValue()
		SendError(RN_Installed_EliteCross)
		_PatchError.Show()
		
	else
		RN_Installed_EliteCross.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_ExpandedCross.esp") != 255 || Game.GetModByName("LOTD_TCC_ExpandedCrossBolt.esp") != 255
		RN_Installed_ExpandedCross.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_ExpandedCross.esp") == 255 && RN_Installed_ExpandedCross.GetValue() || !Game.GetModByName("LOTD_TCC_ExpandedCrossBolt.esp") == 255 && RN_Installed_ExpandedCross.GetValue()
		SendError(RN_Installed_ExpandedCross)
		_PatchError.Show()
		
	else
		RN_Installed_ExpandedCross.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Camping.esp") != 255
		RN_Installed_Camping.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Camping.esp") == 255 && RN_Installed_Camping.GetValue()
		SendError(RN_Installed_Camping)
		_PatchError.Show()
		
	else
		RN_Installed_Camping.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_AADwarvenMail.esp") != 255
		RN_Installed_AADwarvenMail.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_AADwarvenMail.esp") == 255 && RN_Installed_AADwarvenMail.GetValue()
		SendError(RN_Installed_AADwarvenMail)
		_PatchError.Show()
		
	else
		RN_Installed_AADwarvenMail.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_AADaedricMail.esp") != 255
		RN_Installed_AADaedricMail.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_AADaedricMail.esp") == 255 && RN_Installed_AADaedricMail.GetValue()
		SendError(RN_Installed_AADaedricMail)
		_PatchError.Show()
		
	else
		RN_Installed_AADaedricMail.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_AADragonscale.esp") != 255
		RN_Installed_AADragonscale.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_AADragonscale.esp") == 255 && RN_Installed_AADragonscale.GetValue()
		SendError(RN_Installed_AADragonscale)
		_PatchError.Show()
		
	else
		RN_Installed_AADragonscale.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_AAEbonyPlate.esp") != 255
		RN_Installed_AAEbonyPlate.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_AAEbonyPlate.esp") == 255 && RN_Installed_AAEbonyPlate.GetValue()
		SendError(RN_Installed_AAEbonyPlate)
		_PatchError.Show()
		
	else
		RN_Installed_AAEbonyPlate.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_AAElvenHunter.esp") != 255
		RN_Installed_AAElvenHunter.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_AAElvenHunter.esp") == 255 && RN_Installed_AAElvenHunter.GetValue()
		SendError(RN_Installed_AAElvenHunter)
		_PatchError.Show()
		
	else
		RN_Installed_AAElvenHunter.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_AAStalhrimFur.esp") != 255
		RN_Installed_AAStalhrimFur.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_AAStalhrimFur.esp") == 255 && RN_Installed_AAStalhrimFur.GetValue()
		SendError(RN_Installed_AAStalhrimFur)
		_PatchError.Show()
		
	else
		RN_Installed_AAStalhrimFur.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_AASteelSoldier.esp") != 255
		RN_Installed_AASteelSoldier.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_AASteelSoldier.esp") == 255 && RN_Installed_AASteelSoldier.GetValue()
		SendError(RN_Installed_AASteelSoldier)
		_PatchError.Show()
		
	else
		RN_Installed_AASteelSoldier.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_ArcaneAccessories.esp") != 255
		RN_Installed_ArcaneAccessories.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_ArcaneAccessories.esp") == 255 && RN_Installed_ArcaneAccessories.GetValue()
		SendError(RN_Installed_ArcaneAccessories)
		_PatchError.Show()
		
	else
		RN_Installed_ArcaneAccessories.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_ArcaneArcher.esp") != 255
		RN_Installed_ArcaneArcher.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_ArcaneArcher.esp") == 255 && RN_Installed_ArcaneArcher.GetValue()
		SendError(RN_Installed_ArcaneArcher)
		_PatchError.Show()
		
	else
		RN_Installed_ArcaneArcher.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_BoneWolf.esp") != 255
		RN_Installed_BoneWolf.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_BoneWolf.esp") == 255 && RN_Installed_BoneWolf.GetValue()
		SendError(RN_Installed_BoneWolf)
		_PatchError.Show()
		
	else
		RN_Installed_BoneWolf.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_Plague.esp") != 255
		RN_Installed_Plague.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Plague.esp") == 255 && RN_Installed_Plague.GetValue()
		SendError(RN_Installed_Plague)
		_PatchError.Show()
		
	else
		RN_Installed_Plague.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_Seasons.esp") != 255
		RN_Installed_Seasons.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Seasons.esp") == 255 && RN_Installed_Seasons.GetValue()
		SendError(RN_Installed_Seasons)
		_PatchError.Show()
		
	else
		RN_Installed_Seasons.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_Goblins.esp") != 255
		RN_Installed_Goblins.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Goblins.esp") == 255 && RN_Installed_Goblins.GetValue()
		SendError(RN_Installed_Goblins)
		_PatchError.Show()
		
	else
		RN_Installed_Goblins.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_Backpack.esp") != 255
		RN_Installed_Backpack.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Backpack.esp") == 255 && RN_Installed_Backpack.GetValue()
		SendError(RN_Installed_Backpack)
		_PatchError.Show()
		
	else
		RN_Installed_Backpack.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Pets.esp") != 255
		RN_Installed_Pets.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Pets.esp") == 255 && RN_Installed_Pets.GetValue()
		SendError(RN_Installed_Pets)
		_PatchError.Show()
		
	else
		RN_Installed_Pets.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_Holiday.esp") != 255
		RN_Installed_Holiday.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Holiday.esp") == 255 && RN_Installed_Holiday.GetValue()
		SendError(RN_Installed_Holiday)
		_PatchError.Show()
		
	else
		RN_Installed_Holiday.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_Horses.esp") != 255
		RN_Installed_Horses.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Horses.esp") == 255 && RN_Installed_Horses.GetValue()
		SendError(RN_Installed_Horses)
		_PatchError.Show()
		
	else
		RN_Installed_Horses.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_ArmsofChaos.esp") != 255
		RN_Installed_ArmsofChaos.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_ArmsofChaos.esp") == 255 && RN_Installed_ArmsofChaos.GetValue()
		SendError(RN_Installed_ArmsofChaos)
		_PatchError.Show()
		
	else
		RN_Installed_ArmsofChaos.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_NetchLeatherArmor.esp") != 255
		RN_Installed_NetchLeatherArmor.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_NetchLeatherArmor.esp") == 255 && RN_Installed_NetchLeatherArmor.GetValue()
		SendError(RN_Installed_NetchLeatherArmor)
		_PatchError.Show()
		
	else
		RN_Installed_NetchLeatherArmor.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_NordicJewelry.esp") != 255
		RN_Installed_NordicJewelry.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_NordicJewelry.esp") == 255 && RN_Installed_NordicJewelry.GetValue()
		SendError(RN_Installed_NordicJewelry)
		_PatchError.Show()
		
	else
		RN_Installed_NordicJewelry.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_SpellKnightArmor.esp") != 255
		RN_Installed_SpellKnightArmor.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_SpellKnightArmor.esp") == 255 && RN_Installed_SpellKnightArmor.GetValue()
		SendError(RN_Installed_SpellKnightArmor)
		_PatchError.Show()
		
	else
		RN_Installed_SpellKnightArmor.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_StaffofHasedoki.esp") != 255
		RN_Installed_StaffofHasedoki.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_StaffofHasedoki.esp") == 255 && RN_Installed_StaffofHasedoki.GetValue()
		SendError(RN_Installed_StaffofHasedoki)
		_PatchError.Show()
		
	else
		RN_Installed_StaffofHasedoki.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_StendarrsHammer.esp") != 255
		RN_Installed_StendarrsHammer.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_StendarrsHammer.esp") == 255 && RN_Installed_StendarrsHammer.GetValue()
		SendError(RN_Installed_StendarrsHammer)
		_PatchError.Show()
		
	else
		RN_Installed_StendarrsHammer.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_Umbra.esp") != 255
		RN_Installed_Umbra.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Umbra.esp") == 255 && RN_Installed_Umbra.GetValue()
		SendError(RN_Installed_Umbra)
		_PatchError.Show()
		
	else
		RN_Installed_Umbra.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_VigilEnforcerArmorSet.esp") != 255
		RN_Installed_VigilEnforcerArmorSet.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_VigilEnforcerArmorSet.esp") == 255 && RN_Installed_VigilEnforcerArmorSet.GetValue()
		SendError(RN_Installed_VigilEnforcerArmorSet)
		_PatchError.Show()
		
	else
		RN_Installed_VigilEnforcerArmorSet.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_DawnfangDuskfang.esp") != 255
		RN_Installed_DawnfangDuskfang.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_DawnfangDuskfang.esp") == 255 && RN_Installed_DawnfangDuskfang.GetValue()
		SendError(RN_Installed_DawnfangDuskfang)
		_PatchError.Show()
		
	else
		RN_Installed_DawnfangDuskfang.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_CivilWarChampions_Standalone.esp") != 255 || Game.GetModByName("LOTD_TCC_CivilWarChampions_Individual.esp") != 255
		RN_Installed_CivilWarChampions.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_CivilWarChampions_Standalone.esp") == 255 && RN_Installed_CivilWarChampions.GetValue() || !Game.GetModByName("LOTD_TCC_CivilWarChampions_Individual.esp") == 255 && RN_Installed_CivilWarChampions.GetValue()
		SendError(RN_Installed_CivilWarChampions)
		_PatchError.Show()
		
	else
		RN_Installed_CivilWarChampions.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_DeadMansDread_Standalone.esp") != 255 || Game.GetModByName("LOTD_TCC_DeadMansDread_Oblivion.esp") != 255
		RN_Installed_DeadMansDread.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_DeadMansDread_Standalone.esp") == 255 && RN_Installed_DeadMansDread.GetValue() || Game.GetModByName("LOTD_TCC_DeadMansDread_Oblivion.esp") == 255 && RN_Installed_DeadMansDread.GetValue()
		SendError(RN_Installed_DeadMansDread)
		_PatchError.Show()
		
	else
		RN_Installed_DeadMansDread.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_DivineCrusader_Standalone.esp") != 255 || Game.GetModByName("LOTD_TCC_DivineCrusader_Individual.esp") != 255
		RN_Installed_DivineCrusader.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_DivineCrusader_Standalone.esp") == 255 && RN_Installed_DivineCrusader.GetValue() || !Game.GetModByName("LOTD_TCC_DivineCrusader_Individual.esp") == 255 && RN_Installed_DivineCrusader.GetValue()
		SendError(RN_Installed_DivineCrusader)
		_PatchError.Show()
		
	else
		RN_Installed_DivineCrusader.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_Shadowrend_Standalone.esp") != 255 || Game.GetModByName("LOTD_TCC_Shadowrend_Boethiah.esp") != 255
		RN_Installed_Shadowrend.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_Shadowrend_Standalone.esp") == 255 && RN_Installed_Shadowrend.GetValue() || Game.GetModByName("LOTD_TCC_Shadowrend_Boethiah.esp") == 255 && RN_Installed_Shadowrend.GetValue()
		SendError(RN_Installed_Shadowrend)
		_PatchError.Show()
		
	else
		RN_Installed_Shadowrend.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_RuinsEdgeCC.esp") != 255
		RN_Installed_RuinsEdgeCC.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_RuinsEdgeCC.esp") == 255 && RN_Installed_RuinsEdgeCC.GetValue()
		SendError(RN_Installed_RuinsEdgeCC)
		_PatchError.Show()
		
	else
		RN_Installed_RuinsEdgeCC.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_StaffofSheoCC_Standalone.esp") != 255 || Game.GetModByName("LOTD_TCC_StaffofSheoCC_Cheese.esp") != 255 || Game.GetModByName("LOTD_TCC_StaffofSheoCC_UCCCP.esp") != 255
		RN_Installed_StaffofSheoCC.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_StaffofSheoCC_Standalone.esp") == 255 && RN_Installed_StaffofSheoCC.GetValue() || !Game.GetModByName("LOTD_TCC_StaffofSheoCC_Cheese.esp") == 255 && RN_Installed_StaffofSheoCC.GetValue() || !Game.GetModByName("LOTD_TCC_StaffofSheoCC_UCCCP.esp") == 255 && RN_Installed_StaffofSheoCC.GetValue()
		SendError(RN_Installed_StaffofSheoCC)
		_PatchError.Show()
		
	else
		RN_Installed_StaffofSheoCC.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_TheGrayCowlReturns.esp") != 255
		RN_Installed_TheGrayCowlReturns.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_TheGrayCowlReturns.esp") == 255 && RN_Installed_TheGrayCowlReturns.GetValue()
		SendError(RN_Installed_TheGrayCowlReturns)
		_PatchError.Show()
		
	else
		RN_Installed_TheGrayCowlReturns.SetValue(0)
	endIf

;--------------------------
	
	if Game.GetModByName("LOTD_TCC_DwarvenMudcrab.esp") != 255
		RN_Installed_DwarvenMudcrab.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_DwarvenMudcrab.esp") == 255 && RN_Installed_DwarvenMudcrab.GetValue()
		SendError(RN_Installed_DwarvenMudcrab)
		_PatchError.Show()
		
	else
		RN_Installed_DwarvenMudcrab.SetValue(0)
	endIf

;--------------------------

	if Game.GetModByName("LOTD_TCC_NixHound.esp") != 255
		RN_Installed_NixHound.SetValue(1)
		
	elseif Game.GetModByName("LOTD_TCC_NixHound.esp") == 255 && RN_Installed_NixHound.GetValue()
		SendError(RN_Installed_NixHound)
		_PatchError.Show()
		
	else
		RN_Installed_NixHound.SetValue(0)
	endIf
EndEvent
