scriptname RN_Utility_QuestTracker_Quests extends quest

RN_Utility_QuestTracker_MCM property MCM auto

RN_Utility_QuestTracker_Arrays property Array auto

GlobalVariable Property RN_Installed_Moonpath Auto

;-- Events --------------------------------------

Event _Build_Quests()
			
	if MCM._MCM_Page == Array.page[0] ;---------------COMPLETE (10) - Museum Quests			
	
		If MCM._Legacy_Index == 1
		
			MCM._Add_Quest_Data(Array.Museum_Radiant[0], Array.Museum_First[0], Array.Museum_Final[0], Array.Museum_ID[0], Array.Museum_Name[0], Array.page[0], Array.Museum_Giver[0], Array.Museum_Reqs[0], Array.Museum_Notes[0])	
			
		ElseIf MCM._Legacy_Index == 2
		
			MCM._Add_Quest_Data(Array.Museum_Radiant[1], Array.Museum_First[1], Array.Museum_Final[1], Array.Museum_ID[1], Array.Museum_Name[1], Array.page[0], Array.Museum_Giver[1], Array.Museum_Reqs[1], Array.Museum_Notes[1])
			
		ElseIf MCM._Legacy_Index == 3
		
			MCM._Add_Quest_Data(Array.Museum_Radiant[2], 	Array.Museum_First[2], Array.Museum_Final[2], Array.Museum_ID[2], Array.Museum_Name[2], Array.page[0], Array.Museum_Giver[2], Array.Museum_Reqs[2], Array.Museum_Notes[2])		
			MCM._Add_Quest_Data(Array.Museum_Radiant[3], 	Array.Museum_First[3], Array.Museum_Final[3], Array.Museum_ID[3], Array.Museum_Name[3], Array.page[0], Array.Museum_Giver[3], Array.Museum_Reqs[3], Array.Museum_Notes[3])		
			MCM._Add_Quest_Data(Array.Museum_Radiant[4], 	Array.Museum_First[4], Array.Museum_Final[4], Array.Museum_ID[4], Array.Museum_Name[4], Array.page[0], Array.Museum_Giver[4], Array.Museum_Reqs[4], Array.Museum_Notes[4])
			
		endIf
		
			MCM._Add_Quest_Data(Array.Museum_Radiant[5], 	Array.Museum_First[5], Array.Museum_Final[5], Array.Museum_ID[5], Array.Museum_Name[5], Array.page[0], Array.Museum_Giver[5], Array.Museum_Reqs[5], Array.Museum_Notes[5])		
			MCM._Add_Quest_Data(Array.Museum_Radiant[6], 	Array.Museum_First[6], Array.Museum_Final[6], Array.Museum_ID[6], Array.Museum_Name[6], Array.page[0], Array.Museum_Giver[6], Array.Museum_Reqs[6], Array.Museum_Notes[6])		
			MCM._Add_Quest_Data(Array.Museum_Radiant[7], 	Array.Museum_First[7], Array.Museum_Final[7], Array.Museum_ID[7], Array.Museum_Name[7], Array.page[0], Array.Museum_Giver[7], Array.Museum_Reqs[7], Array.Museum_Notes[7])		
			MCM._Add_Quest_Data(Array.Museum_Radiant[8], 	Array.Museum_First[8], Array.Museum_Final[8], Array.Museum_ID[8], Array.Museum_Name[8], Array.page[0], Array.Museum_Giver[8], Array.Museum_Reqs[8], Array.Museum_Notes[8])		
		
		if RN_Installed_Moonpath.GetValue()
			MCM._Add_Quest_Data(Array.Museum_Radiant[9],	Array.Museum_First[9], Array.Museum_Final[9], Array.Museum_ID[9], Array.Museum_Name[9], Array.page[0], Array.Museum_Giver[9], Array.Museum_Reqs[9], Array.Museum_Notes[9])		
		else
			MCM._Add_Quest_Data(Array.Museum_Radiant[10], 	Array.Museum_First[10], Array.Museum_Final[10], Array.Museum_ID[10], Array.Museum_Name[10], Array.page[0], Array.Museum_Giver[10], Array.Museum_Reqs[10], Array.Museum_Notes[10])		
		EndIf
		
		if MCM._bSpoilers == 1
			MCM._Add_Quest_Data(Array.Museum_Radiant[11], 	Array.Museum_First[11], Array.Museum_Final[11], Array.Museum_ID[11], Array.Museum_Name[11], Array.page[0], Array.Museum_Giver[11], Array.Museum_Reqs[11], Array.Museum_Notes[11])		
		endIf
					
			MCM._Add_Quest_Data(Array.Museum_Radiant[12], 	Array.Museum_First[12], Array.Museum_Final[12], Array.Museum_ID[12], Array.Museum_Name[12], Array.page[0], Array.Museum_Giver[12], Array.Museum_Reqs[12], Array.Museum_Notes[12])		
			MCM._Add_Quest_Data(Array.Museum_Radiant[13], 	Array.Museum_First[13], Array.Museum_Final[13], Array.Museum_ID[13], Array.Museum_Name[13], Array.page[0], Array.Museum_Giver[13], Array.Museum_Reqs[13], Array.Museum_Notes[13])		
		
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	
		
	elseIf MCM._MCM_Page == Array.page[1] ;---------------COMPLETE (16) - Explorers Guild

		Int _Index = 0
		Int _length = Array.Explorer_First.length
		While _Index < _length
		
			if !Array.Explorer_Radiant[_Index]	
				if Array.Explorer_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Explorer_Radiant[_Index], Array.Explorer_First[_Index], Array.Explorer_Final[_Index], Array.Explorer_ID[_Index], Array.Explorer_Name[_Index], Array.page[1], Array.Explorer_Giver[_Index], Array.Explorer_Reqs[_Index], Array.Explorer_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Explorer_Radiant[_Index], 	Array.Explorer_First[_Index], Array.Explorer_Final[_Index], Array.Explorer_ID[_Index], Array.Explorer_Name[_Index], Array.page[1], Array.Explorer_Giver[_Index], Array.Explorer_Reqs[_Index], Array.Explorer_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Explorer_Radiant[_Index], 		Array.Explorer_First[_Index], Array.Explorer_Final[_Index], Array.Explorer_ID[_Index], Array.Explorer_Name[_Index], Array.page[1], Array.Explorer_Giver[_Index], Array.Explorer_Reqs[_Index], Array.Explorer_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[2] ;---------------COMPLETE (8) - Misc Quests

		Int _Index = 0
		Int _length = Array.Misc_First.length
		While _Index < _length
		
			if !Array.Misc_Radiant[_Index]	
				if Array.Misc_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Misc_Radiant[_Index], Array.Misc_First[_Index], Array.Misc_Final[_Index], Array.Misc_ID[_Index], Array.Misc_Name[_Index], Array.page[2], Array.Misc_Giver[_Index], Array.Misc_Reqs[_Index], Array.Misc_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Misc_Radiant[_Index], Array.Misc_First[_Index], Array.Misc_Final[_Index], Array.Misc_ID[_Index], Array.Misc_Name[_Index], Array.page[2], Array.Misc_Giver[_Index], Array.Misc_Reqs[_Index], Array.Misc_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Misc_Radiant[_Index], Array.Misc_First[_Index], Array.Misc_Final[_Index], Array.Misc_ID[_Index], Array.Misc_Name[_Index], Array.page[2], Array.Misc_Giver[_Index], Array.Misc_Reqs[_Index], Array.Misc_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[3] ;---------------COMPLETE (10) - Auryens Notes

		Int _Index = 0
		Int _length = Array.Notes_First.length
		While _Index < _length
		
			if !Array.Notes_Radiant[_Index]	
				if Array.Notes_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Notes_Radiant[_Index], Array.Notes_First[_Index], Array.Notes_Final[_Index], Array.Notes_ID[_Index], Array.Notes_Name[_Index], Array.page[3], Array.Notes_Giver[_Index], Array.Notes_Reqs[_Index], Array.Notes_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Notes_Radiant[_Index], Array.Notes_First[_Index], Array.Notes_Final[_Index], Array.Notes_ID[_Index], Array.Notes_Name[_Index], Array.page[3], Array.Notes_Giver[_Index], Array.Notes_Reqs[_Index], Array.Notes_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Notes_Radiant[_Index], Array.Notes_First[_Index], Array.Notes_Final[_Index], Array.Notes_ID[_Index], Array.Notes_Name[_Index], Array.page[3], Array.Notes_Giver[_Index], Array.Notes_Reqs[_Index], Array.Notes_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[4] ;---------------COMPLETE (6) - Sanamia's Journals

		Int _Index = 0
		Int _length = Array.Journals_First.length
		While _Index < _length
		
			if !Array.Journals_Radiant[_Index]	
				if Array.Journals_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Journals_Radiant[_Index], Array.Journals_First[_Index], Array.Journals_Final[_Index], Array.Journals_ID[_Index], Array.Journals_Name[_Index], Array.page[4], Array.Journals_Giver[_Index], Array.Journals_Reqs[_Index], Array.Journals_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Journals_Radiant[_Index], Array.Journals_First[_Index], Array.Journals_Final[_Index], Array.Journals_ID[_Index], Array.Journals_Name[_Index], Array.page[4], Array.Journals_Giver[_Index], Array.Journals_Reqs[_Index], Array.Journals_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Journals_Radiant[_Index], Array.Journals_First[_Index], Array.Journals_Final[_Index], Array.Journals_ID[_Index], Array.Journals_Name[_Index], Array.page[4], Array.Journals_Giver[_Index], Array.Journals_Reqs[_Index], Array.Journals_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[5] ;---------------COMPLETE (26) - Falskaar

		Int _Index = 0
		Int _length = Array.Falskaar_First.length
		While _Index < _length
		
			if !Array.Falskaar_Radiant[_Index]	
				if Array.Falskaar_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Falskaar_Radiant[_Index], Array.Falskaar_First[_Index], Array.Falskaar_Final[_Index], Array.Falskaar_ID[_Index], Array.Falskaar_Name[_Index], Array.page[5], Array.Falskaar_Giver[_Index], Array.Falskaar_Reqs[_Index], Array.Falskaar_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Falskaar_Radiant[_Index], Array.Falskaar_First[_Index], Array.Falskaar_Final[_Index], Array.Falskaar_ID[_Index], Array.Falskaar_Name[_Index], Array.page[5], Array.Falskaar_Giver[_Index], Array.Falskaar_Reqs[_Index], Array.Falskaar_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Falskaar_Radiant[_Index], Array.Falskaar_First[_Index], Array.Falskaar_Final[_Index], Array.Falskaar_ID[_Index], Array.Falskaar_Name[_Index], Array.page[5], Array.Falskaar_Giver[_Index], Array.Falskaar_Reqs[_Index], Array.Falskaar_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[6] ;---------------COMPLETE (25) - Helgen Reborn

		Int _Index = 0
		Int _length = 6
		While _Index < _length
		
			if !Array.Helgen_Radiant[_Index]	
				if Array.Helgen_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Helgen_Radiant[_Index], Array.Helgen_First[_Index], Array.Helgen_Final[_Index], Array.Helgen_ID[_Index], Array.Helgen_Name[_Index], Array.page[6], Array.Helgen_Giver[_Index], Array.Helgen_Reqs[_Index], Array.Helgen_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Helgen_Radiant[_Index], Array.Helgen_First[_Index], Array.Helgen_Final[_Index], Array.Helgen_ID[_Index], Array.Helgen_Name[_Index], Array.page[6], Array.Helgen_Giver[_Index], Array.Helgen_Reqs[_Index], Array.Helgen_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Helgen_Radiant[_Index], Array.Helgen_First[_Index], Array.Helgen_Final[_Index], Array.Helgen_ID[_Index], Array.Helgen_Name[_Index], Array.page[6], Array.Helgen_Giver[_Index], Array.Helgen_Reqs[_Index], Array.Helgen_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile
		
		If MCM._Helgen_Index == 1
			MCM._Add_Quest_Data(Array.Helgen_Radiant[7],  Array.Helgen_First[7],  Array.Helgen_Final[7],  Array.Helgen_ID[7],  Array.Helgen_Name[7],  Array.page[6], Array.Helgen_Giver[7],  Array.Helgen_Reqs[7],  Array.Helgen_Notes[7])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[8],  Array.Helgen_First[8],  Array.Helgen_Final[8],  Array.Helgen_ID[8],  Array.Helgen_Name[8],  Array.page[6], Array.Helgen_Giver[8],  Array.Helgen_Reqs[8],  Array.Helgen_Notes[8])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[9],  Array.Helgen_First[9],  Array.Helgen_Final[9],  Array.Helgen_ID[9],  Array.Helgen_Name[9],  Array.page[6], Array.Helgen_Giver[9],  Array.Helgen_Reqs[9],  Array.Helgen_Notes[9])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[10], Array.Helgen_First[10], Array.Helgen_Final[10], Array.Helgen_ID[10], Array.Helgen_Name[10], Array.page[6], Array.Helgen_Giver[10], Array.Helgen_Reqs[10], Array.Helgen_Notes[10])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[11], Array.Helgen_First[11], Array.Helgen_Final[11], Array.Helgen_ID[11], Array.Helgen_Name[11], Array.page[6], Array.Helgen_Giver[11], Array.Helgen_Reqs[11], Array.Helgen_Notes[11])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[12], Array.Helgen_First[12], Array.Helgen_Final[12], Array.Helgen_ID[12], Array.Helgen_Name[12], Array.page[6], Array.Helgen_Giver[12], Array.Helgen_Reqs[12], Array.Helgen_Notes[12])
		elseif MCM._Helgen_Index == 2
			MCM._Add_Quest_Data(Array.Helgen_Radiant[13], Array.Helgen_First[13], Array.Helgen_Final[13], Array.Helgen_ID[13], Array.Helgen_Name[13], Array.page[6], Array.Helgen_Giver[13], Array.Helgen_Reqs[13], Array.Helgen_Notes[13])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[14], Array.Helgen_First[14], Array.Helgen_Final[14], Array.Helgen_ID[14], Array.Helgen_Name[14], Array.page[6], Array.Helgen_Giver[14], Array.Helgen_Reqs[14], Array.Helgen_Notes[14])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[15], Array.Helgen_First[15], Array.Helgen_Final[15], Array.Helgen_ID[15], Array.Helgen_Name[15], Array.page[6], Array.Helgen_Giver[15], Array.Helgen_Reqs[15], Array.Helgen_Notes[15])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[16], Array.Helgen_First[16], Array.Helgen_Final[16], Array.Helgen_ID[16], Array.Helgen_Name[16], Array.page[6], Array.Helgen_Giver[16], Array.Helgen_Reqs[16], Array.Helgen_Notes[16])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[17], Array.Helgen_First[17], Array.Helgen_Final[17], Array.Helgen_ID[17], Array.Helgen_Name[17], Array.page[6], Array.Helgen_Giver[17], Array.Helgen_Reqs[17], Array.Helgen_Notes[17])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[18], Array.Helgen_First[18], Array.Helgen_Final[18], Array.Helgen_ID[18], Array.Helgen_Name[18], Array.page[6], Array.Helgen_Giver[18], Array.Helgen_Reqs[18], Array.Helgen_Notes[18])
		elseif MCM._Helgen_Index == 3
			MCM._Add_Quest_Data(Array.Helgen_Radiant[19], Array.Helgen_First[19], Array.Helgen_Final[19], Array.Helgen_ID[19], Array.Helgen_Name[19], Array.page[6], Array.Helgen_Giver[19], Array.Helgen_Reqs[19], Array.Helgen_Notes[19])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[20], Array.Helgen_First[20], Array.Helgen_Final[20], Array.Helgen_ID[20], Array.Helgen_Name[20], Array.page[6], Array.Helgen_Giver[20], Array.Helgen_Reqs[20], Array.Helgen_Notes[20])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[21], Array.Helgen_First[21], Array.Helgen_Final[21], Array.Helgen_ID[21], Array.Helgen_Name[21], Array.page[6], Array.Helgen_Giver[21], Array.Helgen_Reqs[21], Array.Helgen_Notes[21])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[22], Array.Helgen_First[22], Array.Helgen_Final[22], Array.Helgen_ID[22], Array.Helgen_Name[22], Array.page[6], Array.Helgen_Giver[22], Array.Helgen_Reqs[22], Array.Helgen_Notes[22])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[23], Array.Helgen_First[23], Array.Helgen_Final[23], Array.Helgen_ID[23], Array.Helgen_Name[23], Array.page[6], Array.Helgen_Giver[23], Array.Helgen_Reqs[23], Array.Helgen_Notes[23])
			MCM._Add_Quest_Data(Array.Helgen_Radiant[24], Array.Helgen_First[24], Array.Helgen_Final[24], Array.Helgen_ID[24], Array.Helgen_Name[24], Array.page[6], Array.Helgen_Giver[24], Array.Helgen_Reqs[24], Array.Helgen_Notes[24])
		endIf
				
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[7] ;---------------COMPLETE (7) - Moonpath to Elsweyr

		Int _Index = 0
		Int _length = Array.Moonpath_First.length
		While _Index < _length
		
			if !Array.Moonpath_Radiant[_Index]	
				if Array.Moonpath_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Moonpath_Radiant[_Index], Array.Moonpath_First[_Index], Array.Moonpath_Final[_Index], Array.Moonpath_ID[_Index], Array.Moonpath_Name[_Index], Array.page[7], Array.Moonpath_Giver[_Index], Array.Moonpath_Reqs[_Index], Array.Moonpath_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Moonpath_Radiant[_Index], Array.Moonpath_First[_Index], Array.Moonpath_Final[_Index], Array.Moonpath_ID[_Index], Array.Moonpath_Name[_Index], Array.page[7], Array.Moonpath_Giver[_Index], Array.Moonpath_Reqs[_Index], Array.Moonpath_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Moonpath_Radiant[_Index], Array.Moonpath_First[_Index], Array.Moonpath_Final[_Index], Array.Moonpath_ID[_Index], Array.Moonpath_Name[_Index], Array.page[7], Array.Moonpath_Giver[_Index], Array.Moonpath_Reqs[_Index], Array.Moonpath_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[8] ;---------------COMPLETE (7) - Clockwork

		Int _Index = 0
		Int _length = Array.Clockwork_First.length
		While _Index < _length
		
			if !Array.Clockwork_Radiant[_Index]	
				if Array.Clockwork_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Clockwork_Radiant[_Index], Array.Clockwork_First[_Index], Array.Clockwork_Final[_Index], Array.Clockwork_ID[_Index], Array.Clockwork_Name[_Index], Array.page[8], Array.Clockwork_Giver[_Index], Array.Clockwork_Reqs[_Index], Array.Clockwork_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Clockwork_Radiant[_Index], Array.Clockwork_First[_Index], Array.Clockwork_Final[_Index], Array.Clockwork_ID[_Index], Array.Clockwork_Name[_Index], Array.page[8], Array.Clockwork_Giver[_Index], Array.Clockwork_Reqs[_Index], Array.Clockwork_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Clockwork_Radiant[_Index], Array.Clockwork_First[_Index], Array.Clockwork_Final[_Index], Array.Clockwork_ID[_Index], Array.Clockwork_Name[_Index], Array.page[8], Array.Clockwork_Giver[_Index], Array.Clockwork_Reqs[_Index], Array.Clockwork_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[9] ;---------------COMPLETE (6) - MoonStar

		Int _Index = 0
		Int _length = Array.MoonStar_First.length
		While _Index < _length
		
			if !Array.MoonStar_Radiant[_Index]	
				if Array.MoonStar_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.MoonStar_Radiant[_Index], Array.MoonStar_First[_Index], Array.MoonStar_Final[_Index], Array.MoonStar_ID[_Index], Array.MoonStar_Name[_Index], Array.page[9], Array.MoonStar_Giver[_Index], Array.MoonStar_Reqs[_Index], Array.MoonStar_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.MoonStar_Radiant[_Index], Array.MoonStar_First[_Index], Array.MoonStar_Final[_Index], Array.MoonStar_ID[_Index], Array.MoonStar_Name[_Index], Array.page[9], Array.MoonStar_Giver[_Index], Array.MoonStar_Reqs[_Index], Array.MoonStar_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.MoonStar_Radiant[_Index], Array.MoonStar_First[_Index], Array.MoonStar_Final[_Index], Array.MoonStar_ID[_Index], Array.MoonStar_Name[_Index], Array.page[9], Array.MoonStar_Giver[_Index], Array.MoonStar_Reqs[_Index], Array.MoonStar_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[10] ;---------------COMPLETE (16) - Project AHO

		Int _Index = 0
		Int _length = Array.ProjectAHO_First.length
		While _Index < _length
		
			if !Array.ProjectAHO_Radiant[_Index]	
				if Array.ProjectAHO_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.ProjectAHO_Radiant[_Index], Array.ProjectAHO_First[_Index], Array.ProjectAHO_Final[_Index], Array.ProjectAHO_ID[_Index], Array.ProjectAHO_Name[_Index], Array.page[10], Array.ProjectAHO_Giver[_Index], Array.ProjectAHO_Reqs[_Index], Array.ProjectAHO_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.ProjectAHO_Radiant[_Index], Array.ProjectAHO_First[_Index], Array.ProjectAHO_Final[_Index], Array.ProjectAHO_ID[_Index], Array.ProjectAHO_Name[_Index], Array.page[10], Array.ProjectAHO_Giver[_Index], Array.ProjectAHO_Reqs[_Index], Array.ProjectAHO_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.ProjectAHO_Radiant[_Index], Array.ProjectAHO_First[_Index], Array.ProjectAHO_Final[_Index], Array.ProjectAHO_ID[_Index], Array.ProjectAHO_Name[_Index], Array.page[10], Array.ProjectAHO_Giver[_Index], Array.ProjectAHO_Reqs[_Index], Array.ProjectAHO_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[11] ;---------------COMPLETE (8) - Skyrim Underground

		Int _Index = 0
		Int _length = Array.Underground_First.length
		While _Index < _length
		
			if !Array.Underground_Radiant[_Index]	
				if Array.Underground_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Underground_Radiant[_Index], Array.Underground_First[_Index], Array.Underground_Final[_Index], Array.Underground_ID[_Index], Array.Underground_Name[_Index], Array.page[11], Array.Underground_Giver[_Index], Array.Underground_Reqs[_Index], Array.Underground_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Underground_Radiant[_Index], Array.Underground_First[_Index], Array.Underground_Final[_Index], Array.Underground_ID[_Index], Array.Underground_Name[_Index], Array.page[11], Array.Underground_Giver[_Index], Array.Underground_Reqs[_Index], Array.Underground_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Underground_Radiant[_Index], Array.Underground_First[_Index], Array.Underground_Final[_Index], Array.Underground_ID[_Index], Array.Underground_Name[_Index], Array.page[11], Array.Underground_Giver[_Index], Array.Underground_Reqs[_Index], Array.Underground_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[12] ;---------------COMPLETE (10) - The Gray Cowl of Nocturnal

		Int _Index = 0
		Int _length = Array.Nocturnal_First.length
		While _Index < _length
		
			if !Array.Nocturnal_Radiant[_Index]	
				if Array.Nocturnal_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Nocturnal_Radiant[_Index], Array.Nocturnal_First[_Index], Array.Nocturnal_Final[_Index], Array.Nocturnal_ID[_Index], Array.Nocturnal_Name[_Index], Array.page[12], Array.Nocturnal_Giver[_Index], Array.Nocturnal_Reqs[_Index], Array.Nocturnal_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Nocturnal_Radiant[_Index], Array.Nocturnal_First[_Index], Array.Nocturnal_Final[_Index], Array.Nocturnal_ID[_Index], Array.Nocturnal_Name[_Index], Array.page[12], Array.Nocturnal_Giver[_Index], Array.Nocturnal_Reqs[_Index], Array.Nocturnal_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Nocturnal_Radiant[_Index], Array.Nocturnal_First[_Index], Array.Nocturnal_Final[_Index], Array.Nocturnal_ID[_Index], Array.Nocturnal_Name[_Index], Array.page[12], Array.Nocturnal_Giver[_Index], Array.Nocturnal_Reqs[_Index], Array.Nocturnal_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[13] ;---------------COMPLETE (16) - The Wheels of Lull

		Int _Index = 0
		Int _length = Array.Wheels_First.length
		While _Index < _length
		
			if !Array.Wheels_Radiant[_Index]	
				if Array.Wheels_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Wheels_Radiant[_Index], Array.Wheels_First[_Index], Array.Wheels_Final[_Index], Array.Wheels_ID[_Index], Array.Wheels_Name[_Index], Array.page[13], Array.Wheels_Giver[_Index], Array.Wheels_Reqs[_Index], Array.Wheels_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Wheels_Radiant[_Index], Array.Wheels_First[_Index], Array.Wheels_Final[_Index], Array.Wheels_ID[_Index], Array.Wheels_Name[_Index], Array.page[13], Array.Wheels_Giver[_Index], Array.Wheels_Reqs[_Index], Array.Wheels_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Wheels_Radiant[_Index], Array.Wheels_First[_Index], Array.Wheels_Final[_Index], Array.Wheels_ID[_Index], Array.Wheels_Name[_Index], Array.page[13], Array.Wheels_Giver[_Index], Array.Wheels_Reqs[_Index], Array.Wheels_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[14] ;---------------COMPLETE (7) - Undeath

		Int _Index = 0
		Int _length = Array.Undeath_First.length
		While _Index < _length
		
			if !Array.Undeath_Radiant[_Index]	
				if Array.Undeath_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Undeath_Radiant[_Index], Array.Undeath_First[_Index], Array.Undeath_Final[_Index], Array.Undeath_ID[_Index], Array.Undeath_Name[_Index], Array.page[14], Array.Undeath_Giver[_Index], Array.Undeath_Reqs[_Index], Array.Undeath_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Undeath_Radiant[_Index], Array.Undeath_First[_Index], Array.Undeath_Final[_Index], Array.Undeath_ID[_Index], Array.Undeath_Name[_Index], Array.page[14], Array.Undeath_Giver[_Index], Array.Undeath_Reqs[_Index], Array.Undeath_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Undeath_Radiant[_Index], Array.Undeath_First[_Index], Array.Undeath_Final[_Index], Array.Undeath_ID[_Index], Array.Undeath_Name[_Index], Array.page[14], Array.Undeath_Giver[_Index], Array.Undeath_Reqs[_Index], Array.Undeath_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[15] ;---------------COMPLETE (17) - Wyrmstooth

		Int _Index = 0
		Int _length = Array.Wyrmstooth_First.length
		While _Index < _length
		
			if !Array.Wyrmstooth_Radiant[_Index]	
				if Array.Wyrmstooth_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.Wyrmstooth_Radiant[_Index], Array.Wyrmstooth_First[_Index], Array.Wyrmstooth_Final[_Index], Array.Wyrmstooth_ID[_Index], Array.Wyrmstooth_Name[_Index], Array.page[15], Array.Wyrmstooth_Giver[_Index], Array.Wyrmstooth_Reqs[_Index], Array.Wyrmstooth_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.Wyrmstooth_Radiant[_Index], Array.Wyrmstooth_First[_Index], Array.Wyrmstooth_Final[_Index], Array.Wyrmstooth_ID[_Index], Array.Wyrmstooth_Name[_Index], Array.page[15], Array.Wyrmstooth_Giver[_Index], Array.Wyrmstooth_Reqs[_Index], Array.Wyrmstooth_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.Wyrmstooth_Radiant[_Index], Array.Wyrmstooth_First[_Index], Array.Wyrmstooth_Final[_Index], Array.Wyrmstooth_ID[_Index], Array.Wyrmstooth_Name[_Index], Array.page[15], Array.Wyrmstooth_Giver[_Index], Array.Wyrmstooth_Reqs[_Index], Array.Wyrmstooth_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[16] ;---------------COMPLETE (20) - Vigilant Main Quests

		Int _Index = 0
		Int _length = Array.VigilantMain_First.length
		While _Index < _length
		
			if !Array.VigilantMain_Radiant[_Index]	
				if Array.VigilantMain_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.VigilantMain_Radiant[_Index], Array.VigilantMain_First[_Index], Array.VigilantMain_Final[_Index], Array.VigilantMain_ID[_Index], Array.VigilantMain_Name[_Index], Array.page[16], Array.VigilantMain_Giver[_Index], Array.VigilantMain_Reqs[_Index], Array.VigilantMain_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.VigilantMain_Radiant[_Index], Array.VigilantMain_First[_Index], Array.VigilantMain_Final[_Index], Array.VigilantMain_ID[_Index], Array.VigilantMain_Name[_Index], Array.page[16], Array.VigilantMain_Giver[_Index], Array.VigilantMain_Reqs[_Index], Array.VigilantMain_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.VigilantMain_Radiant[_Index], Array.VigilantMain_First[_Index], Array.VigilantMain_Final[_Index], Array.VigilantMain_ID[_Index], Array.VigilantMain_Name[_Index], Array.page[16], Array.VigilantMain_Giver[_Index], Array.VigilantMain_Reqs[_Index], Array.VigilantMain_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[17] ;---------------COMPLETE (18) - Vigilant Side Quests

		Int _Index = 0
		Int _length = Array.VigilantSide_First.length
		While _Index < _length
		
			if !Array.VigilantSide_Radiant[_Index]	
				if Array.VigilantSide_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.VigilantSide_Radiant[_Index], Array.VigilantSide_First[_Index], Array.VigilantSide_Final[_Index], Array.VigilantSide_ID[_Index], Array.VigilantSide_Name[_Index], Array.page[17], Array.VigilantSide_Giver[_Index], Array.VigilantSide_Reqs[_Index], Array.VigilantSide_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.VigilantSide_Radiant[_Index], Array.VigilantSide_First[_Index], Array.VigilantSide_Final[_Index], Array.VigilantSide_ID[_Index], Array.VigilantSide_Name[_Index], Array.page[17], Array.VigilantSide_Giver[_Index], Array.VigilantSide_Reqs[_Index], Array.VigilantSide_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.VigilantSide_Radiant[_Index], Array.VigilantSide_First[_Index], Array.VigilantSide_Final[_Index], Array.VigilantSide_ID[_Index], Array.VigilantSide_Name[_Index], Array.page[17], Array.VigilantSide_Giver[_Index], Array.VigilantSide_Reqs[_Index], Array.VigilantSide_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[18] ;---------------COMPLETE (12) - Vigilant Memory Quests

		Int _Index = 0
		Int _length = Array.VigilantMem_First.length
		While _Index < _length
		
			if !Array.VigilantMem_Radiant[_Index]	
				if Array.VigilantMem_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.VigilantMem_Radiant[_Index], Array.VigilantMem_First[_Index], Array.VigilantMem_Final[_Index], Array.VigilantMem_ID[_Index], Array.VigilantMem_Name[_Index], Array.page[18], Array.VigilantMem_Giver[_Index], Array.VigilantMem_Reqs[_Index], Array.VigilantMem_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.VigilantMem_Radiant[_Index], Array.VigilantMem_First[_Index], Array.VigilantMem_Final[_Index], Array.VigilantMem_ID[_Index], Array.VigilantMem_Name[_Index], Array.page[18], Array.VigilantMem_Giver[_Index], Array.VigilantMem_Reqs[_Index], Array.VigilantMem_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.VigilantMem_Radiant[_Index], Array.VigilantMem_First[_Index], Array.VigilantMem_Final[_Index], Array.VigilantMem_ID[_Index], Array.VigilantMem_Name[_Index], Array.page[18], Array.VigilantMem_Giver[_Index], Array.VigilantMem_Reqs[_Index], Array.VigilantMem_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[19] ;---------------COMPLETE (24) - Interesting NPC's - Main Quests

		Int _Index = 0
		Int _length = Array.InterestingNPCMain_First.length
		While _Index < _length
		
			if !Array.InterestingNPCMain_Radiant[_Index]	
				if Array.InterestingNPCMain_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.InterestingNPCMain_Radiant[_Index], Array.InterestingNPCMain_First[_Index], Array.InterestingNPCMain_Final[_Index], Array.InterestingNPCMain_ID[_Index], Array.InterestingNPCMain_Name[_Index], Array.page[19], Array.InterestingNPCMain_Giver[_Index], Array.InterestingNPCMain_Reqs[_Index], Array.InterestingNPCMain_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.InterestingNPCMain_Radiant[_Index], Array.InterestingNPCMain_First[_Index], Array.InterestingNPCMain_Final[_Index], Array.InterestingNPCMain_ID[_Index], Array.InterestingNPCMain_Name[_Index], Array.page[19], Array.InterestingNPCMain_Giver[_Index], Array.InterestingNPCMain_Reqs[_Index], Array.InterestingNPCMain_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.InterestingNPCMain_Radiant[_Index], Array.InterestingNPCMain_First[_Index], Array.InterestingNPCMain_Final[_Index], Array.InterestingNPCMain_ID[_Index], Array.InterestingNPCMain_Name[_Index], Array.page[19], Array.InterestingNPCMain_Giver[_Index], Array.InterestingNPCMain_Reqs[_Index], Array.InterestingNPCMain_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[20] ;---------------COMPLETE (7) - Interesting NPC's - Blood of Kings 

		Int _Index = 0
		Int _length = Array.InterestingNPCBOK_First.length
		While _Index < _length
		
			if !Array.InterestingNPCBOK_Radiant[_Index]	
				if Array.InterestingNPCBOK_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.InterestingNPCBOK_Radiant[_Index], Array.InterestingNPCBOK_First[_Index], Array.InterestingNPCBOK_Final[_Index], Array.InterestingNPCBOK_ID[_Index], Array.InterestingNPCBOK_Name[_Index], Array.page[20], Array.InterestingNPCBOK_Giver[_Index], Array.InterestingNPCBOK_Reqs[_Index], Array.InterestingNPCBOK_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.InterestingNPCBOK_Radiant[_Index], Array.InterestingNPCBOK_First[_Index], Array.InterestingNPCBOK_Final[_Index], Array.InterestingNPCBOK_ID[_Index], Array.InterestingNPCBOK_Name[_Index], Array.page[20], Array.InterestingNPCBOK_Giver[_Index], Array.InterestingNPCBOK_Reqs[_Index], Array.InterestingNPCBOK_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.InterestingNPCBOK_Radiant[_Index], Array.InterestingNPCBOK_First[_Index], Array.InterestingNPCBOK_Final[_Index], Array.InterestingNPCBOK_ID[_Index], Array.InterestingNPCBOK_Name[_Index], Array.page[20], Array.InterestingNPCBOK_Giver[_Index], Array.InterestingNPCBOK_Reqs[_Index], Array.InterestingNPCBOK_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[21] ;---------------COMPLETE (6) - Interesting NPC's - Darkened Steel

		Int _Index = 0
		Int _length = Array.InterestingNPCDS_First.length
		While _Index < _length
		
			if !Array.InterestingNPCDS_Radiant[_Index]	
				if Array.InterestingNPCDS_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.InterestingNPCDS_Radiant[_Index], Array.InterestingNPCDS_First[_Index], Array.InterestingNPCDS_Final[_Index], Array.InterestingNPCDS_ID[_Index], Array.InterestingNPCDS_Name[_Index], Array.page[21], Array.InterestingNPCDS_Giver[_Index], Array.InterestingNPCDS_Reqs[_Index], Array.InterestingNPCDS_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.InterestingNPCDS_Radiant[_Index], Array.InterestingNPCDS_First[_Index], Array.InterestingNPCDS_Final[_Index], Array.InterestingNPCDS_ID[_Index], Array.InterestingNPCDS_Name[_Index], Array.page[21], Array.InterestingNPCDS_Giver[_Index], Array.InterestingNPCDS_Reqs[_Index], Array.InterestingNPCDS_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.InterestingNPCDS_Radiant[_Index], Array.InterestingNPCDS_First[_Index], Array.InterestingNPCDS_Final[_Index], Array.InterestingNPCDS_ID[_Index], Array.InterestingNPCDS_Name[_Index], Array.page[21], Array.InterestingNPCDS_Giver[_Index], Array.InterestingNPCDS_Reqs[_Index], Array.InterestingNPCDS_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------
;;------------------------------------------------------------------------------------------------------------------------------------------------	

	elseIf MCM._MCM_Page == Array.page[22] ;---------------COMPLETE (6) - Interesting NPC's - Misc Quests

		Int _Index = 0
		Int _length = Array.InterestingNPCMisc_First.length
		While _Index < _length
		
			if !Array.InterestingNPCMisc_Radiant[_Index]	
				if Array.InterestingNPCMisc_Spoiler[_Index]
					if	MCM._bSpoilers == 1
						MCM._Add_Quest_Data(Array.InterestingNPCMisc_Radiant[_Index], Array.InterestingNPCMisc_First[_Index], Array.InterestingNPCMisc_Final[_Index], Array.InterestingNPCMisc_ID[_Index], Array.InterestingNPCMisc_Name[_Index], Array.page[22], Array.InterestingNPCMisc_Giver[_Index], Array.InterestingNPCMisc_Reqs[_Index], Array.InterestingNPCMisc_Notes[_Index])
					endIf
				else
					MCM._Add_Quest_Data(Array.InterestingNPCMisc_Radiant[_Index], Array.InterestingNPCMisc_First[_Index], Array.InterestingNPCMisc_Final[_Index], Array.InterestingNPCMisc_ID[_Index], Array.InterestingNPCMisc_Name[_Index], Array.page[22], Array.InterestingNPCMisc_Giver[_Index], Array.InterestingNPCMisc_Reqs[_Index], Array.InterestingNPCMisc_Notes[_Index])
				endIf
			else
				MCM._Add_Quest_Data(Array.InterestingNPCMisc_Radiant[_Index], Array.InterestingNPCMisc_First[_Index], Array.InterestingNPCMisc_Final[_Index], Array.InterestingNPCMisc_ID[_Index], Array.InterestingNPCMisc_Name[_Index], Array.page[22], Array.InterestingNPCMisc_Giver[_Index], Array.InterestingNPCMisc_Reqs[_Index], Array.InterestingNPCMisc_Notes[_Index])
			endIf
			
			_Index += 1
		endWhile		
	endIf
endEvent
