ScriptName RN_Utility_Setup2 extends Quest

Import RN_Utility_Global

RN_Utility_MCM property MCM auto
RN_Utility_Script property Util auto
RN_PatchAPI property APIScript auto

Import Debug

;;Formlists to control item lists.
formlist[] property _itemsArrayHallofHeroes auto ;;Museum List 1
formlist[] property _itemsArrayLibrary auto ;;Museum List 1
formlist[] property _itemsArrayReplica auto ;;Museum List 1

;;Formlists to control item lists. - Merged Formlist 1. (HOH, Lib)
formlist property TCC_ItemList_Museum_1 auto

;;Formlist to control item lists. - MoreHud.
formlist property dbmNew auto
formlist property dbmMaster auto

;;Replica Formlists
formlist property DBM_ReplicaBaseitems auto		
formlist property DBM_Replicaitems auto		
formlist property TCC_ReplicaBaseitems auto		
formlist property TCC_Replicaitems auto	

bool SetupDone
int Tracker
int count

;;-- Functions ---------------------------------------

Event OnInit()
	
	if !SetupDone
		TCCDebug.Log("Main Mod Setup Event Received On Script 2")
		
		Tracker = 1
		RegisterForSingleUpdate(0)
	endif			
endEvent

;;-- Functions ---------------------------------------

Event OnUpdate()
	
	if Tracker == 0
		if Count == 22
			Count = 0
			SetupDone = true
			Util.SetupDone2 = True		
			GoToState("SetupDone")
		else
			RegisterForSingleUpdate(0)
		endif
	
	elseif Tracker == 1
		Tracker = 2
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[0], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes")
		Count += 1

	elseif Tracker == 2
		Tracker = 3
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[1], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes1")
		Count += 1
		
	elseif	Tracker == 3
		Tracker = 4
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[2], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes2")
		Count += 1

	elseif	Tracker == 4
		Tracker = 5
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[3], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes3")
		Count += 1
		
	elseif	Tracker == 5
		Tracker = 6
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[4], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes4")
		Count += 1	

	elseif	Tracker == 6
		Tracker = 7
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[5], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes5")
		Count += 1
		
	elseif	Tracker == 7
		Tracker = 8
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[6], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes6")
		Count += 1

	elseif	Tracker == 8
		Tracker = 9
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[7], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes7")
		Count += 1
		
	elseif	Tracker == 9
		Tracker = 10
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[8], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes8")
		Count += 1
		
	elseif	Tracker == 10
		Tracker = 11
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[9], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes9")
		Count += 1
		
	elseif	Tracker == 11
		Tracker = 12
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[10], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes10")
		Count += 1

	elseif	Tracker == 12
		Tracker = 13
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayHallofHeroes[11], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes11")
		Count += 1

	elseif	Tracker == 13
		Tracker = 14
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayLibrary[0], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayHallofHeroes12")
		Count += 1

	elseif	Tracker == 14
		Tracker = 15
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayLibrary[1], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayLibrary1")
		Count += 1

	elseif	Tracker == 15
		Tracker = 16
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayLibrary[2], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayLibrary2")
		Count += 1

	elseif	Tracker == 16
		Tracker = 17
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayLibrary[3], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayLibrary3")
		Count += 1

	elseif	Tracker == 17
		Tracker = 18
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayLibrary[4], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayLibrary4")
		Count += 1

	elseif	Tracker == 18
		Tracker = 19
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayLibrary[5], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayLibrary5")
		Count += 1

	elseif	Tracker == 19
		Tracker = 20
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayLibrary[6], TCC_ItemList_Museum_1, dbmNew, dbmMaster)	
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayLibrary6")
		Count += 1	

	elseif	Tracker == 20
		Tracker = 21
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayReplica[0], TCC_ItemList_Museum_1, dbmNew, dbmMaster)
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayReplica0")
		Count += 1	

	elseif	Tracker == 21
		Tracker = 22
		RegisterForSingleUpdate(0)
		
		_onConsolidateItems(_itemsArrayReplica[1], TCC_ItemList_Museum_1, dbmNew, dbmMaster)
		TCCDebug.Log("Setup Script 2 - Finished setting up _itemsArrayReplica1")
		Count += 1
		
	elseif	Tracker == 22
		Tracker = 0
		
		Int OrigIndex
		Int ReplIndex
		
		Int Index = TCC_ReplicaBaseitems.GetSize()
		While Index 
			Index -= 1
			
			DBM_ReplicaBaseitems.AddForm(TCC_ReplicaBaseitems.GetAt(Index) as Form)
			DBM_Replicaitems.AddForm(TCC_Replicaitems.GetAt(Index) as Form)
			
			OrigIndex = DBM_ReplicaBaseitems.Find(TCC_ReplicaBaseitems.GetAt(Index) as Form)
			ReplIndex = DBM_Replicaitems.Find(TCC_Replicaitems.GetAt(Index) as Form)
			
			if (OrigIndex != ReplIndex)
				TCCDebug.Log("Setup Script 2 - Failed to add items to replica formlists - retrying...", 2)
				DBM_ReplicaBaseitems.RemoveAddedForm(TCC_ReplicaBaseitems.GetAt(Index) as Form)
				DBM_Replicaitems.RemoveAddedForm(TCC_Replicaitems.GetAt(Index) as Form)	
				Index += 1
			else
				TCCDebug.Log("Setup Script 2 - Found " + TCC_ReplicaBaseitems.GetAt(Index).GetName() + " and " + TCC_Replicaitems.GetAt(Index).GetName() + " at positions " +  OrigIndex + " & " + ReplIndex)
			endif
		endWhile

		TCCDebug.Log("Setup Script 2 - Finished setting up replica lists")		

		Count += 1	
		RegisterForSingleUpdate(0)
	endif
endEvent
