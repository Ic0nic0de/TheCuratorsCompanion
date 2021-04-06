scriptname RN_Utility_PropManager extends quest 

bool property UpdateReq auto hidden

globalvariable property TCC_RoomEditCount_None auto
globalvariable property TCC_RoomEditCount_Armory auto
globalvariable property TCC_RoomEditCount_DaedricGallery auto
globalvariable property TCC_RoomEditCount_DragonbornHall auto
globalvariable property TCC_RoomEditCount_Guildhouse auto
globalvariable property TCC_RoomEditCount_HallofHeroes auto
globalvariable property TCC_RoomEditCount_HallofLostEmpires auto
globalvariable property TCC_RoomEditCount_HallofOddities auto
globalvariable property TCC_RoomEditCount_HallofSecrets auto
globalvariable property TCC_RoomEditCount_HallofWonders auto
globalvariable property TCC_RoomEditCount_Library auto
globalvariable property TCC_RoomEditCount_NaturalScience auto
globalvariable property TCC_RoomEditCount_Safehouse auto
globalvariable property TCC_RoomEditCount_Storeroom auto

globalvariable property RN_CreationClubContent_Installed auto

formlist property TCC_DisplayList_None auto
formlist property TCC_DisplayList_Armory auto
formlist property TCC_DisplayList_DaedricGallery auto
formlist property TCC_DisplayList_DragonbornHall auto
formlist property TCC_DisplayList_Guildhouse auto
formlist property TCC_DisplayList_HallofHeroes auto
formlist property TCC_DisplayList_HallofLostEmpires auto
formlist property TCC_DisplayList_HallofOddities auto
formlist property TCC_DisplayList_HallofSecrets auto
formlist property TCC_DisplayList_HallofWonders auto
formlist property TCC_DisplayList_Library auto
formlist property TCC_DisplayList_NaturalScience auto
formlist property TCC_DisplayList_Safehouse auto
formlist property TCC_DisplayList_Storeroom auto

;;-------------------------------

GlobalVariable Function _getDisplayTotal(String _RoomName)
	
	if (_RoomName == "Armory")
		return TCC_RoomEditCount_Armory
	
	elseif (_RoomName == "Daedric Gallery")
		return TCC_RoomEditCount_DaedricGallery
		
	elseif (_RoomName == "Dragonborn Hall")
		return TCC_RoomEditCount_DragonbornHall

	elseif (_RoomName == "Guildhouse")
		return TCC_RoomEditCount_Guildhouse

	elseif (_RoomName == "Hall of Heroes")
		return TCC_RoomEditCount_HallofHeroes

	elseif (_RoomName == "Hall of Lost Empires")
		return TCC_RoomEditCount_HallofLostEmpires

	elseif (_RoomName == "Hall of Oddities")
		return TCC_RoomEditCount_HallofOddities

	elseif (_RoomName == "Hall of Secrets")
		return TCC_RoomEditCount_HallofSecrets

	elseif (_RoomName == "Hall of Wonders")
		return TCC_RoomEditCount_HallofWonders

	elseif (_RoomName == "Gallery Library")
		return TCC_RoomEditCount_Library

	elseif (_RoomName == "Natural Science")
		return TCC_RoomEditCount_NaturalScience

	elseif (_RoomName == "Safehouse")
		return TCC_RoomEditCount_Safehouse

	elseif (_RoomName == "Museum Storeroom")
		return TCC_RoomEditCount_Storeroom
	endif
	
	Return TCC_RoomEditCount_None
endFunction

;;-------------------------------

Formlist Function _getDisplayRoom(String _RoomName)
	
	if (_RoomName == "Armory")
		return TCC_DisplayList_Armory
	
	elseif (_RoomName == "Daedric Gallery")
		return TCC_DisplayList_DaedricGallery
		
	elseif (_RoomName == "Dragonborn Hall")
		return TCC_DisplayList_DragonbornHall

	elseif (_RoomName == "Guildhouse")
		return TCC_DisplayList_Guildhouse

	elseif (_RoomName == "Hall of Heroes")
		return TCC_DisplayList_HallofHeroes

	elseif (_RoomName == "Hall of Lost Empires")
		return TCC_DisplayList_HallofLostEmpires

	elseif (_RoomName == "Hall of Oddities")
		return TCC_DisplayList_HallofOddities

	elseif (_RoomName == "Hall of Secrets")
		return TCC_DisplayList_HallofSecrets

	elseif (_RoomName == "Hall of Wonders")
		RN_CreationClubContent_Installed.setvalue(1)
		return TCC_DisplayList_HallofWonders

	elseif (_RoomName == "Gallery Library")
		return TCC_DisplayList_Library

	elseif (_RoomName == "Natural Science")
		return TCC_DisplayList_NaturalScience

	elseif (_RoomName == "Safehouse")
		return TCC_DisplayList_Safehouse

	elseif (_RoomName == "Museum Storeroom")
		return TCC_DisplayList_Storeroom
	endif
	
	Return TCC_DisplayList_None
endFunction