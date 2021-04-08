ScriptName RN_Utility_Setup extends Quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_Script property Util auto
RN_PatchAPI property APIScript auto

Import Debug

;;Formlists to control item lists.
formlist[] property _itemsArray01 auto ;;Museum List 1
formlist[] property _itemsArray02 auto ;;Museum List 1
formlist[] property _itemsArray03 auto ;;Armory
formlist[] property _itemsArray04 auto ;;Museum List 2
formlist[] property _itemsArray05 auto ;;Museum List 2

formlist[] property _DisplaysArray01 auto ;;Library
formlist[] property _DisplaysArray02 auto ;;Library
formlist[] property _DisplaysArray03 auto ;;Natural Science
formlist[] property _DisplaysArray04 auto ;;Hall of Heroes
formlist[] property _DisplaysArray05 auto ;;Hall of Lost Empires
formlist[] property _DisplaysArray06 auto ;;Misc Rooms
formlist[] property _DisplaysArray07 auto ;;Armory
formlist[] property _DisplaysArray08 auto ;;Armory

;;Formlists to control item lists. - Merged Formlist 1. (HOH, Lib)
formlist property TCC_ItemList_Museum_1 auto

;;Formlists to control item lists - Merged Formlist 2. (DAE, HOLE, HOO, NS, GH, HOS)
formlist property TCC_ItemList_Museum_2 auto

;;Formlists to control item lists - Merged Formlist (Armory)
formlist property TCC_ItemList_Armory auto

;;Formlist to control item lists. - MoreHud.
formlist property dbmNew auto
formlist property dbmMaster auto

;;Formlists to control Display Reference lists - Misc Rooms
formlist property TCC_DisplayList_Armory auto
formlist property TCC_DisplayList_Library auto
formlist property TCC_DisplayList_NaturalScience auto
formlist property TCC_DisplayList_HallofHeroes auto
formlist property TCC_DisplayList_HallofLostEmpires auto
formlist property TCC_DisplayList_HallofSecrets auto
formlist property TCC_DisplayList_Guildhouse auto
formlist property TCC_DisplayList_Storeroom auto
formlist property TCC_DisplayList_DaedricGallery auto
formlist property TCC_DisplayList_HallofOddities auto
formlist property TCC_DisplayList_DragonbornHall auto

;;Globals to control Display Counts
globalvariable property TCC_RoomEditCount_Armory auto
globalvariable property TCC_RoomEditCount_Library auto
globalvariable property TCC_RoomEditCount_NaturalScience auto
globalvariable property TCC_RoomEditCount_HallofHeroes auto
globalvariable property TCC_RoomEditCount_HallofLostEmpires auto
globalvariable property TCC_RoomEditCount_DragonbornHall auto
globalvariable property TCC_RoomEditCount_DaedricGallery auto
globalvariable property TCC_RoomEditCount_HallofOddities auto
globalvariable property TCC_RoomEditCount_HallofSecrets auto
globalvariable property TCC_RoomEditCount_Guildhouse auto
globalvariable property TCC_RoomEditCount_Storeroom auto

bool SetupDone
int Tracker
int count

;;-- Functions ---------------------------------------

Event OnInit()
	
	if !SetupDone
		TCCDebug.Log("Main Mod Setup Event Received")
		
		Tracker = 1
		RegisterForSingleUpdate(0)
	endif			
endEvent

;;-- Functions ---------------------------------------

Event OnUpdate()
	
	if Tracker == 0
		if Count == 18
			Count = 0
			SetupDone = true
			Util.SetupMainDone = True
			
			TCCDebug.Log("Main Mod Setup Event Completed")
			GoToState("SetupDone")
			
		else
			RegisterForSingleUpdate(0)
		endif
	
	elseif Tracker == 1
		Tracker = 2
		RegisterForSingleUpdate(0)
		
		Int x = _itemsArray01.length		
		While x
			x -= 1
			Formlist _List = _itemsArray01[x]
			_onConsolidateItems(_List, TCC_ItemList_Museum_1, dbmNew, dbmMaster)			
		endWhile
		Count += 1
		
	elseif	Tracker == 2
		Tracker = 3
		RegisterForSingleUpdate(0)
		
		Int x = _itemsArray02.length		
		While x
			x -= 1
			Formlist _List = _itemsArray02[x]
			_onConsolidateItems(_List, TCC_ItemList_Museum_1, dbmNew, dbmMaster)			
		endWhile
		Count += 1

	elseif	Tracker == 3
		Tracker = 4
		RegisterForSingleUpdate(0)
		
		Int x = _itemsArray03.length		
		While x
			x -= 1
			Formlist _List = _itemsArray03[x]
			_onConsolidateItems(_List, TCC_ItemList_Armory, dbmNew, dbmMaster)			
		endWhile
		Count += 1		
		
	elseif	Tracker == 4
		Tracker = 5
		RegisterForSingleUpdate(0)
		
		Int x = _itemsArray04.length		
		While x
			x -= 1
			Formlist _List = _itemsArray04[x]
			_onConsolidateItems(_List, TCC_ItemList_Museum_2, dbmNew, dbmMaster)			
		endWhile
		Count += 1

	elseif	Tracker == 5
		Tracker = 6
		RegisterForSingleUpdate(0)
		
		Int x = _itemsArray05.length		
		While x
			x -= 1
			Formlist _List = _itemsArray05[x]
			_onConsolidateItems(_List, TCC_ItemList_Museum_2, dbmNew, dbmMaster)			
		endWhile
		Count += 1

	elseif	Tracker == 6
		Tracker = 7
		RegisterForSingleUpdate(0)
		
		Int x = _DisplaysArray01.length		
		While x
			x -= 1
			Formlist _List = _DisplaysArray01[x]
			_onConsolidateDisplaysAll(_List, TCC_DisplayList_Library, TCC_RoomEditCount_Library)		
		endWhile
		Count += 1

	elseif	Tracker == 7
		Tracker = 8
		RegisterForSingleUpdate(0)
		
		Int x = _DisplaysArray02.length		
		While x
			x -= 1
			Formlist _List = _DisplaysArray02[x]
			_onConsolidateDisplaysAll(_List, TCC_DisplayList_Library, TCC_RoomEditCount_Library)		
		endWhile
		Count += 1

	elseif	Tracker == 8 
		Tracker = 9
		RegisterForSingleUpdate(0)
		
		Int x = _DisplaysArray03.length		
		While x
			x -= 1
			Formlist _List = _DisplaysArray03[x]
			_onConsolidateDisplaysAll(_List, TCC_DisplayList_NaturalScience, TCC_RoomEditCount_NaturalScience)		
		endWhile
		Count += 1

	elseif	Tracker == 9 
		Tracker = 10
		RegisterForSingleUpdate(0)
		
		Int x = _DisplaysArray04.length		
		While x
			x -= 1
			Formlist _List = _DisplaysArray04[x]
			_onConsolidateDisplaysAll(_List, TCC_DisplayList_HallofHeroes, TCC_RoomEditCount_HallofHeroes)		
		endWhile
		Count += 1
		
	elseif	Tracker == 10
		Tracker = 11
		RegisterForSingleUpdate(0)
		
		Int x = _DisplaysArray05.length		
		While x
			x -= 1
			Formlist _List = _DisplaysArray05[x]
			_onConsolidateDisplaysAll(_List, TCC_DisplayList_HallofLostEmpires, TCC_RoomEditCount_HallofLostEmpires) 		
		endWhile
		Count += 1

	elseif	Tracker == 11
		Tracker = 12
		RegisterForSingleUpdate(0)
		
		Int x = _DisplaysArray07.length		
		While x
			x -= 1
			Formlist _List = _DisplaysArray07[x]
			_onConsolidateDisplaysAll(_List, TCC_DisplayList_Armory, TCC_RoomEditCount_Armory)
		endWhile
		Count += 1

	elseif	Tracker == 12
		Tracker = 13
		RegisterForSingleUpdate(0)
		
		Int x = _DisplaysArray08.length		
		While x
			x -= 1
			Formlist _List = _DisplaysArray08[x]
			_onConsolidateDisplaysAll(_List, TCC_DisplayList_Armory, TCC_RoomEditCount_Armory)
		endWhile
		Count += 1
		
	elseif	Tracker == 13
		Tracker = 14
		RegisterForSingleUpdate(0)
		
		_onConsolidateDisplaysAll(_DisplaysArray06[0], TCC_DisplayList_DragonbornHall, TCC_RoomEditCount_DragonbornHall)	
		Count += 1

	elseif	Tracker == 14
		Tracker = 15
		RegisterForSingleUpdate(0)
		
		_onConsolidateDisplaysAll(_DisplaysArray06[1], TCC_DisplayList_DaedricGallery, TCC_RoomEditCount_DaedricGallery)
		Count += 1
		
	elseif	Tracker == 15
		Tracker = 16
		RegisterForSingleUpdate(0)
		
		_onConsolidateDisplaysAll(_DisplaysArray06[2], TCC_DisplayList_HallofOddities, TCC_RoomEditCount_HallofOddities)
		Count += 1

	elseif	Tracker == 16
		Tracker = 17
		RegisterForSingleUpdate(0)
		
		_onConsolidateDisplaysAll(_DisplaysArray06[3], TCC_DisplayList_HallofSecrets, TCC_RoomEditCount_HallofSecrets)
		Count += 1
		
	elseif	Tracker == 17
		Tracker = 18
		RegisterForSingleUpdate(0)
		
		_onConsolidateDisplaysAll(_DisplaysArray06[4], TCC_DisplayList_Guildhouse, TCC_RoomEditCount_Guildhouse)
		Count += 1
		
	elseif	Tracker == 18
		Tracker = 0
		RegisterForSingleUpdate(0)
	
		_onConsolidateDisplaysAll(_DisplaysArray06[5], TCC_DisplayList_Storeroom, TCC_RoomEditCount_Storeroom)	
		Count += 1
	endif
endEvent
		